class Crawler
  
  def initialize(uri, http_client)
    @uri = uri
    @http_client = http_client
  end
  
  def crawl_given_url
    @http_client.get(@uri)  
  end
end




#how to use the crawler class
require('net/http')

uri = URI('http://wwww.someurl.com')
http_request = Net::HTTP.Get.new()

crawler = Crawler.new(uri, http)
crawler.crawl_given_url