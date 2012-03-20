class ChangeKindTypeFromVotes < ActiveRecord::Migration
  def up
    change_column :votes, :kind, :string, :default => 'TEXT'
  end
end
