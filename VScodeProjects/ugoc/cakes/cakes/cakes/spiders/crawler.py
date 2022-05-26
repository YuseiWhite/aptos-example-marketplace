import scrapy


class CrawlerSpider(scrapy.Spider):
    name = 'crawler'
    allowed_domains = ['cakes.mu']
    start_urls = ['http://cakes.mu/']

    def parse(self, response):
        pass
