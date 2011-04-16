class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.string :title
      t.string :url
      t.string :thumbnail
      t.string :price
      t.string :author
      t.string :date
      t.string :publisher
      t.string :isbn

      t.timestamps
    end
  end

  def self.down
    drop_table :books
  end
end
