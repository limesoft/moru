class MoveEmailToAuthentications < ActiveRecord::Migration

  def up
    remove_column :users, :email
    add_column :authentications, :email, :string, limit: 100
    add_column :authentications, :default, :boolean, default: false
  end

  def down
    remove_column :authentications, :email
    remove_column :authentications, :default
    add_column :users, :email, :string
  end
end
