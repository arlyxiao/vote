class RemoveUserIdAndVoteIdColumnsOfVoteResultItems < ActiveRecord::Migration
  def up
    remove_column :vote_result_items, :user_id
    remove_column :vote_result_items, :vote_id
    remove_column :vote_result_items, :select_limit
  end

  def down
  end
end
