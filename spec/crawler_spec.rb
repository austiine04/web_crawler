require 'net/http'
require_relative 'spec_helper'

describe 'Crawler' do
  
  describe '#crawler_given_url' do
    
    it 'should return the html of the website at the given uri ' do
      uri = URI('http://www.someurl.com')
      http_client = double()
      allow(http_client).to receive(:get).and_return("<html><body></body></html>")
      
      crawler = Crawler.new(uri, http_client)
      html = crawler.crawl_given_url
      
      html.should eql "<html><body></body></html>"
    end
  end
end