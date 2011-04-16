# == Schema Information
#
# Table name: books
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  url        :string(255)
#  thumbnail  :string(255)
#  price      :string(255)
#  author     :string(255)
#  date       :string(255)
#  publisher  :string(255)
#  isbn       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  asin       :string(255)
#


#:title => "test title", :url => "url", :thumbnail => "thumb picture", :price => "price",
#:author => "author test", :date => "date", :publisher => "tom..", :isbn => "101",
#:asin => "DP00"
class Book < ActiveRecord::Base
  
  #vlaidates of the fields
  validates :asin, :presence => true,
                   :uniqueness => {:case_sensitive => false }
                   
  validates :title, :presence => true
  validates :url, :presence => true
  validates :thumbnail, :presence => true
  validates :price, :presence => true
  validates :author, :presence => true
  validates :date, :presence => true
  validates :publisher, :presence => true
  validates :isbn, :presence => true
  

end


