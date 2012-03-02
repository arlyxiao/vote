# -*- encoding : utf-8 -*-
class ChangeVoteIntoPoll < ActiveRecord::Migration
  def up
    rename_table :vote_items, :poll_items
    rename_table :vote_result_items, :poll_result_items
  end

end
