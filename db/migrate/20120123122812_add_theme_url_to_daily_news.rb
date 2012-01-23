class AddThemeUrlToDailyNews < ActiveRecord::Migration
  def self.up
    add_column :daily_news, :theme_url, :string
  end

  def self.down
    remove_column :daily_news, :theme_url
  end
end
