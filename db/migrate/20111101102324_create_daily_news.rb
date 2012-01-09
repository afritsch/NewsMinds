class CreateDailyNews < ActiveRecord::Migration
  def self.up
    create_table :daily_news do |t|
      t.string :title
      t.text :description
      t.string :date
      t.integer :clicks

      t.timestamps
    end
  end

  def self.down
    drop_table :daily_news
  end
end
