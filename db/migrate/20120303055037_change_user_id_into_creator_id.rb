class ChangeUserIdIntoCreatorId < ActiveRecord::Migration
  def up
    rename_column :votes, :user_id, :creator_id
  end

  def down
  end
end
