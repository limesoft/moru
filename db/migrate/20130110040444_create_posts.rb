class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :comments_count, default: 0, null: false
      t.references :user

      t.timestamps
    end
  end
end
