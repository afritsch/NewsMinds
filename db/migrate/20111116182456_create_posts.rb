class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.integer :user_id
      t.integer :top_story_id
      t.string :title
      t.text :content
      t.integer :estimation

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
