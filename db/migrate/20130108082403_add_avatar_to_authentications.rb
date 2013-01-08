class AddAvatarToAuthentications < ActiveRecord::Migration
  def change
    add_column :authentications, :avatar, :string
  end
end
