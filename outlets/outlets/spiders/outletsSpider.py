#!/usr/bin/python 
# -*- coding: utf-8 -*-
import scrapy
import os
import urlparse
from scrapy.spider import BaseSpider
from pyquery import PyQuery as pq
import logging
import json
import urllib
import urllib2

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
            logger.error('www.premiumoutlets.com error code: {}'.format(str(response.status)))
            return
        
        #将响应转化为pq对象
        jq = pq(response.body)('select').eq(2)
        jq.find('option').each(self.getUrl)
        
        #print '#################'
        #print self.urls[0]
        #return [self.urls[4]]
        return self.urls
    
    #定义解析outlet店铺首页的方法，ex：http://www.premiumoutlets.com/outlets/outlet.asp?id=5
    def parseShopHome(self, response):    
        if response.status != 200 :
            logger.error('{} error code: {}'.format(response.url, str(response.status)))
            return
        pqBody = pq(response.body)
        url = self.scrapyHost + 'outlets/' + pqBody('.side-nav').find('a').eq(0).attr('href')

        #返回url继续抓取商店的商品页面
        return [scrapy.Request(url, callback=self.parseShop)]
    
    
    #定义解析outlet店铺商品页面的方法，ex：http://www.premiumoutlets.com/outlets/store_listing.asp?id=5
    def parseShop(self, response):
        if response.status != 200 :
            logger.error('{} error code: {}'.format(response.url, str(response.status)))
            return
        pqBody = pq(response.body)
        pqCenter = pqBody('.outlets').eq(0).find('p').eq(0)
        
        #获取shop的Id号
        parsed = urlparse.urlparse(response.url)
        shopId = str(urlparse.parse_qs(parsed.query)['id'][0]) or 'nan'
        
        #获得 店铺名称 地址 电话 文本        
        tempAry = pqCenter.text().strip().split('(')
         
        #去除最后一位C，获得店铺名称
        shopName = pqBody('h1.title').text().strip()
        shopName = shopName[0:-2]
        address = tempAry[0].replace(u'\xa0', u' ').strip()
        tel = '(' + tempAry[1]
        
        #正常情况下
        if pqBody('.CenterMap').eq(0).length > 0:
        
            mapUrl = pqBody('.CenterMap').eq(0).attr('onclick')
            mapUrl = self.scrapyHost+'outlets/' + mapUrl.split('(\'')[1].split('\')')[0]
            
            pdfUrl = pqBody('#Padder').find('a').eq(2).attr('href') 
            pdfUrl = urlparse.urljoin(self.scrapyHost+'outlets/', pdfUrl)
            
            #print '###############'
            #print shopName
            #print address
            #print tel
            #print mapUrl
            #print pdfUrl
            #print '###############'
                   
            outletDict = {
                'shopId':shopId,
                'name': shopName,
                'address' : address,
                'tel':tel,
                'pdfUrl':pdfUrl,
            }
            
            return [scrapy.Request(mapUrl, callback=self.parseMap, meta={'outletDict':outletDict})]
        
        #非正常情况1 url地址 http://www.premiumoutlets.com/outlets/store_listing.asp?id=112
        elif pqBody('.Module').length == 0:
            shopDict = {
                'id':shopId,
                'name': shopName,
                'address' : address,
                'tel':tel,
                'shopLIst':[]                 
            }         
            self.saveJsonFile(shopDict)
            pass
        
        #非正常情况2 url地址 http://www.premiumoutlets.com/outlets/store_listing.asp?id=111
        else:
            shopDict = {
                'id':shopId,
                'name': shopName,
                'address' : address,
                'tel':tel,
                'shopList':[]                 
            }
            
            def parseRow(i,row):
                pqRow = pq(row)
                category = pqRow.find('h2').find('span').text().strip()
                #定义jquery对象
                pqSuit = pqRow.find('.suite').find('li')
                pqStore = pqRow.find('.store').find('li')
                pqTelephone = pqRow.find('.telephone').find('li')
                rowLen = pqRow.find('.suite').find('li').length
                #循环解析存入数组,从1开始，0是cap跳过
                for i in range(1, rowLen):     
                    tempDict = {
                        'category':category,
                        'suit':pqSuit.eq(i).text().strip(),
                        'store':pqStore.eq(i).text().strip(),
                        'telephone':pqTelephone.eq(i).text().strip(),
                    }
                    shopDict['shopList'].append(tempDict)
            
            #each循环每行,获取店铺数据      
            pqBody('.Module').each(parseRow)
            #存入json
            self.saveJsonFile(shopDict)
            pass
        
        
    #解析地图页面，ex：http://www.premiumoutlets.com/outlets/store_listing_map.asp?id=5
    def parseMap(self, response):
        if response.status != 200 :
          logger.error('{} error code: {}'.format(response.url, str(response.status)))
          return
        
        #获得店铺id
        parsed = urlparse.urlparse(response.url)
       
        
        #根据meta获取上一步的字典
        outletDict = response.meta["outletDict"]
        shopId = outletDict['shopId']
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
                category = parentTable.find('tr').eq(0).find('td').eq(0).text().strip()
                suit = pqtd.eq(0).text().strip()
                store = pqtd.eq(1).text().strip()
                telephone = pqtd.eq(2).text().strip()
                
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
        
        #解析图片方法
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
        
        #print '$$$$$$$$$$$$$'
        #print outletDict['address']
        #print imgs
        #print shops
        #print outletDict
        #print shopId
        #print outletDict['pdfUrl']
        #print '$$$$$$$$$$$$$'
        
        #重组JSON文件之前，需要去google api 获取地理位置，经纬度，邮编，
    
        paramAddress = urllib.urlencode({
            'address':outletDict['address']
        })
        googleUrl = "http://maps.googleapis.com/maps/api/geocode/json?{}&sensor=true".format(paramAddress)
        googleReq = urllib2.Request(googleUrl)
        googleRes = urllib2.urlopen(googleReq)
        googleResJson = json.loads(googleRes.read())
        addressDict = googleResJson['results'][0]
        
        tempDict = {}
        for i in range(0, len(addressDict['address_components'])):
            resultDict = addressDict['address_components'][i]
            
            if('street_number' in resultDict['types']):
                 tempDict['streetNumber'] = resultDict['long_name']   #街道号
                 
            if('establishment' in resultDict['types']):
                 tempDict['establishment'] = resultDict['long_name']   #店名

            if('route' in resultDict['types']):
                 tempDict['route'] = resultDict['long_name']   #路名
                 
            if('locality' in resultDict['types']):
                 tempDict['locality'] = resultDict['long_name']   #地方名
                 
            if('administrative_area_level_2' in resultDict['types']):
                 tempDict['administrative_area_level_2'] = resultDict['long_name']   #行政区域级别2
                 
            if('administrative_area_level_1' in resultDict['types']):
                 tempDict['administrative_area_level_1'] = resultDict['long_name']   #行政区域级别1
                 
            if('country' in resultDict['types']):
                 tempDict['country'] = resultDict['long_name']   #国家
        
            if('postal_code' in resultDict['types']):
                tempDict['postal_code'] = resultDict['long_name']   #邮编       
        
        
        if 'streetNumber' not in tempDict:
            tempDict['streetNumber'] = ''
        if 'establishment' not in tempDict:
            tempDict['establishment'] = ''
        if 'route' not in tempDict:
            tempDict['route'] = ''
        if 'locality' not in tempDict:
            tempDict['locality'] = ''
        if 'administrative_area_level_2' not in tempDict:
            tempDict['administrative_area_level_2'] = ''
        if 'administrative_area_level_1' not in tempDict:
            tempDict['administrative_area_level_1'] = ''
        if 'country' not in tempDict:
            tempDict['country'] = ''
        if 'postal_code' not in tempDict:
            tempDict['postal_code'] = ''
     

        tempDict['lat'] = addressDict['geometry']['location']['lat'] #维度
        tempDict['lng'] = addressDict['geometry']['location']['lng'] #经度
                    
        #重组JSON文件
        shopDict = {
            'id':shopId,
            'name': outletDict['name'],
            'address' : outletDict['address'],
            'tel':outletDict['tel'],
            
            'streetNumber':tempDict['streetNumber'],
            'establishment':tempDict['establishment'],
            'route':tempDict['route'],
            'locality':tempDict['locality'],
            'administrative_area_level_2':tempDict['administrative_area_level_2'],
            'administrative_area_level_1':tempDict['administrative_area_level_1'],
            'country':tempDict['country'],
            'postal_code':tempDict['postal_code'],
            'lat':tempDict['lat'],
            'lng':tempDict['lng'],
            
            'shopLIst':shops,
        }
        
        self.saveJsonFile(shopDict)
        
        imgs.append(
            scrapy.Request(outletDict['pdfUrl'], callback=self.parsePdf, meta={'shopId':shopId})
            )
        
        #去下载图片和pdf
        return imgs
        
        
    #处理图片保存图片
    def parseImg(self,response):
        if response.status != 200 :
          logger.error('{} error code: {}'.format(response.url, response.status))
          return
        shopId = response.meta['shopId']
        
        #拼接保存图片的目录地址
        filename = self.curPath + os.sep + 'img' + os.sep + 'map_' + shopId + '.gif'
        with open(filename, 'wb') as f:
            f.write(response.body)
        pass
    
    #处理pdf文件保存文件
    def parsePdf(self,response):
        if response.status != 200 :
          logger.error('{} error code: {}'.format(response.url, response.status))
          return
        shopId = response.meta['shopId']
        
        #拼接保存pdf的目录地址
        filename = self.curPath + os.sep + 'pdf' + os.sep + 'pdf_' + shopId + '.pdf'
        with open(filename, 'wb') as f:
            f.write(response.body)
        pass
    
    def saveJsonFile(self, jsonDict):
        
         #拼接json文件的目录地址
        filename = self.curPath + os.sep + 'json' + os.sep + 'json_' + jsonDict['id'] + '.json'
        #将商店的字典写入json文件
        with open(filename, 'wb') as f:
            f.write(json.dumps(jsonDict))