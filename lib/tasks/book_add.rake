require 'nokogiri'
require 'open-uri'
require 'sucker'
#require 'anynewbooks/app/models/book'
#require 'config/environment'
desc "Fetch Books from amazon- Programming"
task :book_add => :environment do 
  
  url = "http://www.amazon.com/gp/new-releases/books/3839/ref=zg_bsnr_nav"
  doc = Nokogiri::HTML(open(url))
  r = /(.*?)[a-zA-Z0-9]\/dp\/(.*?)([a-zA-Z0-9]{10})(?:[\/?]|$)/
  
  @worker = Sucker.new(
    :key    => 'AKIAI4PEL5DS5GSSPITA',
    :secret => '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',
    :associate_tag => 'whicnewbook-20',
    :locale => :us)
  
  asin = doc.css("div.zg_item").map { |e| 
    @worker << {
      :operation => 'ItemLookup',
      :id_type   => 'ASIN',
      :item_id   => e["asin"],
      :ResponseGroup => 'Medium' }

    @response = @worker.get

    item = @response['Item'].first

    asin = item['ASIN']
    url = item['DetailPageURL']
    thumbnail = (item['MediumImage'] == nil ? "No Image" : item['MediumImage']['URL'] ) #75 X 57
    #author =  (item['ItemAttributes']['Author'].respond_to?('each') ? item['ItemAttributes']['Author'].join(", ") : item['ItemAttributes']['Author'])
    author =  (item['ItemAttributes']['Author'].respond_to?('each') ? item['ItemAttributes']['Author'] : item['ItemAttributes']['Author'])
    publisher =  item['ItemAttributes']['Manufacturer']
    date = item['ItemAttributes']['PublicationDate']
    isbn = item['ItemAttributes']['ISBN']

    title =  item['ItemAttributes']['Title']
   # puts "The price is " + item['ItemAttributes']['ListPrice']['FormattedPrice']
    if item['OfferSummary']
      price = item['OfferSummary']['LowestNewPrice']['FormattedPrice']
    else
      price = item['ItemAttributes']['ListPrice']['FormattedPrice']
    end

    Book.create(:title => title , :url => url, :thumbnail => thumbnail, :price => price, :author => author, :date => date, :publisher => publisher, :isbn => isbn, :asin => asin)
   }
end