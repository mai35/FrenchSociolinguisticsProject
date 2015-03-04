import scrapy
import sys, re, codecs, shutil

from scrapy.contrib.linkextractors.sgml import SgmlLinkExtractor
from scrapy.contrib.spiders import CrawlSpider, Rule
from scrapy.selector import Selector

class MySpider(CrawlSpider):
    name = "buzzfeed"
    allowed_domains = [r"www.buzzfeed.com"]
    start_urls = [
        r"http://www.buzzfeed.com/?country=fr"
    ]
    # for testing, let's only download pages with two digits in name
    # in vivo, \d\d should be replaced with .+, so as to allow all links
    rules = (Rule(SgmlLinkExtractor(allow=[r'.+']),
                  callback='parse_item', follow=True),)
    
    def parse_item(self, response):
        filename = response.url.split("/")[-1]
        filename = filename[:20] + ".html"
        lang = Selector(response).xpath(str('//html/@lang'))
        # file name is the first 20 characters. 
        
        #with open(filename, 'wb') as f:
        if lang=="fr":
            with open(filename, 'wb') as f:
                f.write(response.body)
