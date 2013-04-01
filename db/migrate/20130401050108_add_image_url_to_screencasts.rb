class AddImageUrlToScreencasts < ActiveRecord::Migration
  def change
    add_column :screencasts, :image_url, :string
  end
end
