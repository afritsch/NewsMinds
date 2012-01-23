class CreateTopStories < ActiveRecord::Migration
  def self.up
    create_table :top_stories do |t|
      t.string :title
      t.text :description
      t.string :pubDate
      t.integer :chosen

      t.timestamps
    end	
  end

  def self.down
    drop_table :top_stories
  end
end
