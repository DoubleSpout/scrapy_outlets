from scrapy.spider import BaseSpider
from pyquery import PyQuery as pq

class OutletsSpider(BaseSpider):
    name = "outlets"
    allowed_domains = ["premiumoutlets.com"]
    start_urls = [
        "http://www.premiumoutlets.com/centers/index.asp"
    ]

    def parse(self, response):
        print "################"
        print response.body
        print response.status
        bodyStr = response.body
        if response.status != 200 :
            pass
        
        
        
        
        
        
        #filename = response.url.split("/")[-2]
        #open(filename, 'wb').write(response.body)
        
    def toDb(self, itemDict):
        pass
