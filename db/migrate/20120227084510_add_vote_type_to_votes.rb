# -*- encoding : utf-8 -*-
class AddVoteTypeToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :vote_type, :integer
  end
end
