# -*- encoding : utf-8 -*-
class ChangeVoteIdIntoPollId < ActiveRecord::Migration
  def up
    rename_column :poll_items, :vote_id, :poll_id
    rename_column :poll_result_items, :vote_id, :poll_id
    rename_column :poll_result_items, :vote_type, :poll_type
  end

end
