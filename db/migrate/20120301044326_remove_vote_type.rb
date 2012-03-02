# -*- encoding : utf-8 -*-
class RemoveVoteType < ActiveRecord::Migration
  def up
    rename_column :vote_result_items, :vote_type, :select_limit
    remove_column :votes, :vote_type
  end
end
