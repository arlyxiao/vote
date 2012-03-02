# -*- encoding : utf-8 -*-
class ConvertVoteItemIdIntoPollItemId < ActiveRecord::Migration
  def up
    rename_column :poll_result_items, :vote_item_id, :poll_item_id
  end
end
