require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

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

