#!/usr/bin/python 
# -*- coding: utf-8 -*-
import scrapy
from scrapy.spider import BaseSpider
from pyquery import PyQuery as pq
import logging

#设置logger模块
logger = logging.getLogger('mylogger')
logger.setLevel(logging.DEBUG)
fh = logging.FileHandler('outlets.log')
fh.setLevel(logging.DEBUG)
formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
fh.setFormatter(formatter)
logger.addHandler(fh)

class OutletsSpider(BaseSpider):
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
        return [self.urls[1]]
    
    #定义解析outlet店铺首页的方法
    def parseShopHome(self, response):    
        if response.status != 200 :
            logger.error('{0} error code: {1}'.format(response.url, str(response.status)))
            return
        pqBody = pq(response.body)
        url = self.scrapyHost + pqBody('.side-nav').find('a').eq(0).attr('href')
        #返回url继续抓取商店的商品页面
        return [scrapy.Request(url, callback=self.parseShop)]
    
    
    #定义解析outlet店铺商品页面的方法
    def parseShop(self, response):
        if response.status != 200 :
            logger.error('{0} error code: {1}'.format(response.url, str(response.status)))
            return
        pqBody = pq(response.body)
        pqCenter = pqBody('.center_details').eq(0)
      
        #获得 店铺名称 地址 电话 文本
        tempAry = pqCenter.text().split('\n')
        tempAry = map(lambda x: x.strip(),tempAry)
        tempAry = filter(lambda x: x!='',tempAry)
        
        #去除最后一位C，获得店铺名称
        shopName = tempAry[0][:-1]
        address = '{0} {1}'.format(tempAry[1],tempAry[2])
        tel = tempAry[3]
       
        ##明天继续
        
        outletDict = {
            name : shopName,
            address : 1,
            tel:1,
            category:1,
            shops:[],
            pdf:1,
        }
        
        pass        
        
        
    def toDb(self, itemDict):
        pass
