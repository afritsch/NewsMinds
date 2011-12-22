class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :password
      t.integer :numberOfPosVotedPosts
      t.integer :numberOfNegVotedPosts
      t.integer :numberOfPosCreatedPosts
      t.integer :numberOfNegCreatedPosts
      t.integer :mind
      t.integer :votePower
      t.string :facebookEmail

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
