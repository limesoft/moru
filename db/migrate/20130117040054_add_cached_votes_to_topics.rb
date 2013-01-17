class AddCachedVotesToTopics < ActiveRecord::Migration

  def up
    add_column :topics, :cached_votes_total, :integer, :default => 0
    add_column :topics, :cached_votes_up, :integer, :default => 0
    add_column :topics, :cached_votes_down, :integer, :default => 0

    add_index  :topics, :cached_votes_total
    add_index  :topics, :cached_votes_up
    add_index  :topics, :cached_votes_down
  end

  def down
    remove_column :topics, :cached_votes_total
    remove_column :topics, :cached_votes_up
    remove_column :topics, :cached_votes_down
  end
end
