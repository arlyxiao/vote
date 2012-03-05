class CreateVoteResult < ActiveRecord::Migration
  def up
    create_table :vote_results do |t|
      t.integer :user_id
      t.integer :vote_id
      
      t.timestamps
    end
  end

  def down
  end
end
