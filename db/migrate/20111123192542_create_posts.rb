class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.integer :user_id
      t.integer :top_story_id
      t.string :title
      t.text :content
      t.integer :estimation
      t.integer :score
      t.string :voted_usernames

      t.timestamps
    end

    add_index :posts, :top_story_id
    add_index :posts, :user_id
  end

  def self.down
    drop_table :posts
  end
end
