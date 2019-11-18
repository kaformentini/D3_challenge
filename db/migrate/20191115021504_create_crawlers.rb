class CreateCrawlers < ActiveRecord::Migration[6.0]
  def change
    create_table :crawlers do |t|
      t.string :url

      t.timestamps
    end
  end
end
