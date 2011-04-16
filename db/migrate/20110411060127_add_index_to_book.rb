class AddIndexToBook < ActiveRecord::Migration
  def self.up
    add_index :books, :asin, :unique => true
  end

  def self.down
    remove_index :books, :asin
  end
end
