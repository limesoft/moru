class CommentableEvent < ActiveRecord::Migration

  def up
    remove_column :comments, :event_id

    change_table :comments do |t|
      t.references :commentable, polymorphic: true
    end
  end

  def down
    add_column :comments, :event_id, :integer

    remove_column :comments, :commentable_id
    remove_column :comments, :commentable_type
  end
end
