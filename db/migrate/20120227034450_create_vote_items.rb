# -*- encoding : utf-8 -*-
class CreateVoteItems < ActiveRecord::Migration
  def up
    create_table :vote_items do |t|
      t.integer :vote_id
      t.string :item_title
      t.integer :vote_type
      
      t.timestamps
    end
  end

  def down
    drop_table :vote_items
  end
end
