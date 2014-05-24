require 'net/http'
require 'nokogiri'

uri = URI('http://search.knightfrank.ug/property-for-sale/uganda?buyrent=buy&viewall=true')
html = Net::HTTP.get(uri)
document = Nokogiri::HTML(html)

document.css('div.gridHolder').each do |div|
  location = div.css('h2.locationTop').text()
  image = Net::HTTP.get(div.xpath('//img')[0]['src']) #downloading the image, this will take some time
  price = div.css('div.priceTop').text()
end