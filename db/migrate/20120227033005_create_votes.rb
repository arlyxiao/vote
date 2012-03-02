# -*- encoding : utf-8 -*-
class CreateVotes < ActiveRecord::Migration
  def up
    create_table :votes do |t|
      t.integer :creator_id
      t.string :title
      
      t.timestamps
    end
  end

  def down
    drop_table :votes
  end
end
