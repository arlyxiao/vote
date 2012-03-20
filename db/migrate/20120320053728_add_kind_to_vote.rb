class AddKindToVote < ActiveRecord::Migration
  def change
    add_column :votes, :kind, :integer
  end
end
