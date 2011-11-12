class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :password
      t.integer :numberOfPosPosts
      t.integer :numberOfNegPosts
      t.integer :mind

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
