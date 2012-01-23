class RemoveDateFromDailyNews < ActiveRecord::Migration
  def self.up
    remove_column :daily_news, :date
  end

  def self.down
    add_column :daily_news, :date, :string
  end
end
