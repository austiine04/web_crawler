require 'net/http'
require 'nokogiri'

uri = URI('http://search.knightfrank.ug/property-for-sale/uganda?buyrent=buy&viewall=true')
html = Net::HTTP.get(uri)
document = Nokogiri::HTML(html)

document.css('div.gridHolder')[1,1].each do |div|
  location = div.css('h2.locationTop').text()
  image_url = URI(div.css('img')[0].get_attribute(:src))
  image = Net::HTTP.get(image_url) #downloading the image, this will take some time
  picture_file = File.open("#{location.delete(' ')}_photo.jpeg", 'wb')
  picture_file.write(image)
  picture_file.close()
  price = div.css('div.priceTop').text()
end