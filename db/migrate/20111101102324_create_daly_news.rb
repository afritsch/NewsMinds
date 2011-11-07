class CreateDalyNews < ActiveRecord::Migration
  def self.up
    create_table :daly_news do |t|
      t.string :title
      t.text :description
      t.string :date
      t.integer :clicks

      t.timestamps
    end
  end

  def self.down
    drop_table :daly_news
  end
end
