class AddSpeakerIdToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :speaker_id, :integer
    add_index :topics, :speaker_id
  end
end
