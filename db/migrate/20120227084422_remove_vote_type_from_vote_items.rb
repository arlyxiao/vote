# -*- encoding : utf-8 -*-
class RemoveVoteTypeFromVoteItems < ActiveRecord::Migration
  def up
    remove_column :vote_items, :vote_type
  end

  def down
    add_column :vote_items, :vote_type, :integer
  end
end
