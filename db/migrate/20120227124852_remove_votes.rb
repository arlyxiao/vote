# -*- encoding : utf-8 -*-
class RemoveVotes < ActiveRecord::Migration
  def up
    drop_table :votes
  end
end
