# -*- encoding : utf-8 -*-
class CreateVoteResultItems < ActiveRecord::Migration
  def up
    create_table :vote_result_items do |t|
      t.integer :user_id
      t.integer :vote_id
      t.integer :vote_type
      t.integer :vote_item_id
      
      t.timestamps
    end
  end

  def down
    drop_table :vote_result_items
  end
end
