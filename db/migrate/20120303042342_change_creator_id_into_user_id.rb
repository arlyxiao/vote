class ChangeCreatorIdIntoUserId < ActiveRecord::Migration
  def up
    rename_column :votes, :creator_id, :user_id
  end

  def down
    rename_column :votes, :user_id, :creator_id
  end
end
