class RemovePubDateFromTopStories < ActiveRecord::Migration
  def self.up
    remove_column :top_stories, :pubDate
  end

  def self.down
    add_column :top_stories, :pubDate, :string
  end
end
