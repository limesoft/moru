class AddOauthTokenToAuthenticataions < ActiveRecord::Migration
  def change
    add_column :authentications, :oauth_token, :string
    add_column :authentications, :oauth_expires_at, :datetime
  end
end
