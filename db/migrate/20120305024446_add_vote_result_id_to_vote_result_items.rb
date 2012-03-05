class AddVoteResultIdToVoteResultItems < ActiveRecord::Migration
  def change
    add_column :vote_result_items, :vote_result_id, :integer
  end
end
