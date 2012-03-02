# -*- encoding : utf-8 -*-
class AddSelectLimitToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :select_limit, :integer
  end
end
