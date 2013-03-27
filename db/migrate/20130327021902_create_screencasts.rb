class CreateScreencasts < ActiveRecord::Migration
  def change
    create_table :screencasts do |t|
      t.string :title
      t.text :content
      t.string :url
      t.datetime :starts_at

      t.timestamps
    end
  end
end
