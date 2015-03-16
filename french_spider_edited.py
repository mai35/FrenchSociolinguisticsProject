import scrapy
import sys, re, codecs, shutil

from scrapy.contrib.linkextractors.sgml import SgmlLinkExtractor
from scrapy.contrib.spiders import CrawlSpider, Rule
#from scrapy.http.request import Request  Don't need this anymore if not able to get fb comments
from scrapy.selector import Selector
from scrapy.selector import HtmlXPathSelector

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
        filename = filename[:20] + ".xml" # file name is the first 20 characters. 
        lang = HtmlXPathSelector(response).select('//html/@lang').extract()[0]       
        title = HtmlXPathSelector(response).select("//h1[@id='post-title']/text()").extract()[0] 
        title = title.encode('utf-8') #was getting encoding error; this seems to fix that
        #this should get the description of the article. Will account for any extraneous linking or anything. 
        descriptions = HtmlXPathSelector(response).select("//div[@id='buzz_header']/hgroup/p[@class='description']/descendant-or-self::text()").extract()
        description = ""
        for d in descriptions:
                description = description + d.encode('utf-8')
        description.strip()
        author = HtmlXPathSelector(response).select('//a[@class="byline__author"]/text()').extract()[0]
        author = author.encode('utf-8')
        affiliation = HtmlXPathSelector(response).select('//div[@class="byline__title"]/text()').extract()[0]
        affiliation = affiliation.encode('utf-8')
        #we want to treat captions one at a time, so don't concat them as is done with description (only done to counteract any possible
        #extra tags within the description <p>, not really different objects philosophically)
        
        #final remaining problem: string will only return one; but if I do descendant-or-self::text() I can get several
        #which are treated seperately in loop later. Don't want to concat them, because it's a whole list, and I only
        #want to join the number to their corresponding text. might need to get the whole list and then concat afterwards
        #using python stuff rather than pure xpath.
        captionHeaders = HtmlXPathSelector(response).select('//div[@data-print="body"]/div/div/h2')
        captions = list()
        commentaires = dict()
        for captionHeader in captionHeaders:
            caption = captionHeader.xpath('string(.)').extract()[0]
            captions.append(caption)
            if captionHeader.xpath("../p"):
                commentaires[caption] = captionHeader.xpath("../p").extract()[0]
                
        #info will be the dict that we pass as the meta param to the next request for the Facebook plugin
        info = {"filename": filename, "title": title, "description": description, "author": author, "affiliation": affiliation, "captions": captions}        
        #this is what we'll use to crawl to the next page to get comments, if any exist.

############
#Attempts to get the Facebook comments. Either of these *should/would* work, if the whole section was not generated
#with javascript, but it seems that since that is the case, the only way to get these comments would be to bring
#in a whole different package called Selenium.
#        
#       commentsPage = HtmlXPathSelector(response).select('//iframe[@class = "fb_ltr"]/@src').extract()[0]                           
#       commentsPage = commentsPage.encode('utf-8')
#            request = scrapy.Request("http://www.example.com/some_page.html",
#                            callback=self.parse_page2,
#                             meta=info)
#       comments = HtmlXPathSelector(response).select('//div[@class="postText"]/descendant-or-self::text()').extract()
#           return request
############

        if lang == 'fr': 
            with open("TEST.txt", 'ab') as f:
                f.write('<?xml version="1.0" encoding="UTF-8"?>')
                f.write('\n<?xml-model href="BuzzFeed_schema.rnc" type="application/relax-ng-compact-syntax"?>')
                f.write("<article>")
                f.write('<!-- unedited URL for getting comments:' + response.url + '-->')
                f.write("\n\t<header>")
                f.write("\n\t\t<titre>")
                f.write(title)
                f.write("\t\t</titre>")
                f.write("\n\t\t<st>")
                f.write(description)
                f.write("\t\t</st>")
                f.write('\n\t</header>')
                f.write("\n\t<auteur>")
                f.write("\n\t\t<nom>")
                f.write(author)
                f.write("\t\t</nom>")
                f.write("\n\t\t<association>")
                f.write(affiliation)
                f.write("\t\t</association>")
                f.write('\n\t</auteur>')
                f.write('\n\t<corps>')
                f.write("\n\t\t<ol>")
                for caption in captions:
                    caption = caption.encode('utf-8')
                    f.write("\n\t\t\t<li>")
                    f.write("\n\t\t\t\t<titre>")
                    f.write(caption)
                    f.write("\n\t\t\t\t</titre>")
                    if caption in commentaires:
                        f.write("\n\t\t\t\t<commentaire>")
                        commentaire = commentaires[caption].encode('utf-8')
                        f.write(commentaire)
                        f.write("\n\t\t\t\t</commentaire>")
                    f.write("\n\t\t\t</li>")
                f.write('\n\t</corps>')
                f.write("\n\t\t</ol>")
                f.write("\n\t<conversation>")
                f.write("\n\t\t<commentaire>")
                f.write("\n\t\t</commentaire>")
                f.write("\n\t</conversation>")
                f.write("</article>")

###############
#Meant to be the start of the now unnecessary method to parse fb comments from the plugin.                    
#   def parse_page2(self, response):
#        with open("TEST.txt", "ab") as f:
#            f.write(response.meta["filename"])
