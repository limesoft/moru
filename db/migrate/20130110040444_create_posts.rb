class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :comments_count
      t.references :user

      t.timestamps
    end
  end
end
