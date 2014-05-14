#!/usr/bin/python 
# -*- coding: utf-8 -*-
import scrapy
import os
import urlparse
from scrapy.spider import BaseSpider
from pyquery import PyQuery as pq
import logging
import json

#设置logger模块
logger = logging.getLogger('mylogger')
logger.setLevel(logging.DEBUG)
fh = logging.FileHandler('outlets.log')
fh.setLevel(logging.DEBUG)
formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
fh.setFormatter(formatter)
logger.addHandler(fh)



class OutletsSpider(BaseSpider):
    curPath = os.path.split(os.path.realpath(__file__))[0]
    name = "outlets"
    allowed_domains = ["premiumoutlets.com"]
    scrapyHost = 'http://www.premiumoutlets.com/'
    urls = []
    outlets = []
    start_urls = [
        "http://www.premiumoutlets.com/centers/index.asp"
    ]
    
    #循环遍历option对象存入urls数组中
    def getUrl(self, i, option):
        pqOption = pq(option)
        url = pqOption.attr('value')
        #判断如果option中的url不为None,则记录这些url进行下次继续抓取
        if url:
            self.urls.append(scrapy.Request(url, callback=self.parseShopHome))     
    
    #定义解析首页的方法
    def parse(self, response):
        #如果请求地址不返回200,记录错误日志
        if response.status != 200 :
            logger.error('www.premiumoutlets.com error code: {0}'.format(str(response.status)))
            return
        
        #将响应转化为pq对象
        jq = pq(response.body)('select').eq(2)
        jq.find('option').each(self.getUrl)
        
        #获得url之后,将分别对这些url进行过滤和继续抓取,请求地址获取每个outlets店铺的内容
        return [self.urls[0]]
    
    #定义解析outlet店铺首页的方法，ex：http://www.premiumoutlets.com/outlets/outlet.asp?id=5
    def parseShopHome(self, response):    
        if response.status != 200 :
            logger.error('{0} error code: {1}'.format(response.url, str(response.status)))
            return
        pqBody = pq(response.body)
        url = self.scrapyHost + 'outlets/' + pqBody('.side-nav').find('a').eq(0).attr('href')

        #返回url继续抓取商店的商品页面
        return [scrapy.Request(url, callback=self.parseShop)]
    
    
    #定义解析outlet店铺商品页面的方法，ex：http://www.premiumoutlets.com/outlets/store_listing.asp?id=5
    def parseShop(self, response):
        if response.status != 200 :
            logger.error('{0} error code: {1}'.format(response.url, str(response.status)))
            return
        pqBody = pq(response.body)
        pqCenter = pqBody('.outlets').eq(0).find('p').eq(0)
      
        #获得 店铺名称 地址 电话 文本        
        tempAry = pqCenter.text().encode('utf-8').strip().split('(')
         
        #去除最后一位C，获得店铺名称
        shopName = pqBody('h1.title').text().encode('utf-8').strip()
        shopName = shopName[0:-2]
        address = tempAry[0]
        tel = '(' + tempAry[1]
        
        mapUrl = pqBody('.CenterMap').eq(0).attr('onclick')
        mapUrl = self.scrapyHost+'outlets/' + mapUrl.split('(\'')[1].split('\')')[0]
        
        pdfUrl = pqBody('#Padder').find('a').eq(2).attr('href') 
        pdfUrl = urlparse.urljoin(self.scrapyHost+'outlets/', pdfUrl)
        
        print '###############'
        #print shopName
        #print address
        #print tel
        #print mapUrl
        # print pdfUrl
        # print '###############'
               
        outletDict = {
            'name': shopName,
            'address' : address,
            'tel':tel,
            'category':1,
            'pdfUrl':pdfUrl,
        }
        
        return [scrapy.Request(mapUrl, callback=self.parseMap, meta={'outletDict':outletDict})]        
        
        
    #解析地图页面，ex：http://www.premiumoutlets.com/outlets/store_listing_map.asp?id=5
    def parseMap(self, response):
        if response.status != 200 :
          logger.error('{0} error code: {1}'.format(response.url, str(response.status)))
          return
        
        #获得店铺id
        parsed = urlparse.urlparse(response.url)
        shopId = str(urlparse.parse_qs(parsed.query)['id'][0]) or 'nan'
        
        outletDict = response.meta["outletDict"]
        pqBody = pq(response.body)
        shops = []
        imgs = []
        
        #定义解析table的tr
        def parseTr(i,tr):
            pqtr = pq(tr)
            pqtd = pqtr.find('td')
            if i == 0:
                pass
            elif i == 1:
                pass
            else:
                #保存店铺类型，店铺编号，店铺名称，店铺电话
                parentTable = pqtr.parent()
                category = parentTable.find('tr').eq(0).find('td').eq(0).text().encode('utf-8').strip()
                suit = pqtd.eq(0).text().encode('utf-8').strip()
                store = pqtd.eq(0).text().encode('utf-8').strip()
                telephone = pqtd.eq(0).text().encode('utf-8').strip()
                
                shops.append({
                    'category':category,
                    'suit':suit,
                    'store':store,
                    'telephone':telephone
                })
            
        
        #循环遍历table
        def parseTable(i,table):
            pqTable = pq(table)
            pqTable.find('tr').each(parseTr)
        
        def parseImg(i, img):
            pqImg = pq(img)
            imgUrl = self.scrapyHost+'outlets/' + pqImg.attr('src')
            imgs.append(
                scrapy.Request(imgUrl, callback=self.parseImg, meta={'shopId':shopId, 'num':i})
            )
            
        #获取内容
        shopTableBox = pqBody('.BorderSet')
        #循环获取店铺内容
        shopTableBox.each(parseTable)
        #循环获取图片内容
        pqBody('.screenImg').each(parseImg)
        
        print '$$$$$$$$$$$$$'
        #print imgs
        #print shops
        print outletDict
        print shopId
        print outletDict['pdfUrl']
                
        filename = self.curPath + os.sep + 'json' + os.sep + 'json_' + shopId + '.json'
        with open(filename, 'wb') as f:
            f.write(json.dumps(shops))
          
        imgs.append(
            scrapy.Request(outletDict['pdfUrl'], callback=self.parsePdf, meta={'shopId':shopId})
            )
        
        #去下载图片和pdf
        return imgs
        
        
    #处理图片保存图片
    def parseImg(self,response):
        if response.status != 200 :
          logger.error('{0} error code: {1}'.format(response.url, str(response.status)))
          return
        shopId = response.meta['shopId']
        
        filename = self.curPath + os.sep + 'img' + os.sep + 'map_' + shopId + '.gif'
        with open(filename, 'wb') as f:
            f.write(response.body)
        pass
    
    #处理pdf文件保存文件
    def parsePdf(self,response):
        if response.status != 200 :
          logger.error('{0} error code: {1}'.format(response.url, str(response.status)))
          return
        shopId = response.meta['shopId']
        
        filename = self.curPath + os.sep + 'pdf' + os.sep + 'pdf_' + shopId + '.pdf'
        with open(filename, 'wb') as f:
            f.write(response.body)
        pass
    
    def toDb(self, itemDict):
        pass
