# -*- encoding : utf-8 -*-
class CreatePolls < ActiveRecord::Migration
  def up
    create_table :polls do |t|
      t.integer :creator_id
      t.string :title
      t.integer :select_limit
      t.integer :poll_type
      
      t.timestamps
    end
  end

  def down
  end
end
