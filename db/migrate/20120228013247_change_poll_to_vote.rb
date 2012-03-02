# -*- encoding : utf-8 -*-
class ChangePollToVote < ActiveRecord::Migration
  def up
    drop_table :polls if ActiveRecord::Base.connection.table_exists? 'polls'

    unless ActiveRecord::Base.connection.table_exists? 'votes' then
      create_table :votes do |t|
				t.integer :creator_id
				t.string :title
				t.integer :select_limit
				t.integer :poll_type
				
				t.timestamps
      end
    end
    
    if ActiveRecord::Base.connection.table_exists? 'poll_items' then
      rename_table :poll_items, :vote_items
    end
    
    if ActiveRecord::Base.connection.table_exists? 'poll_result_items' then
      rename_table :poll_result_items, :vote_result_items
    end
    
    
    rename_column :vote_items, :poll_id, :vote_id
    rename_column :vote_result_items, :poll_id, :vote_id
    rename_column :vote_result_items, :poll_type, :vote_type
    rename_column :vote_result_items, :poll_item_id, :vote_item_id
    rename_column :votes, :poll_type, :vote_type
  end
end
