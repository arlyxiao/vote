class CreateTags < ActiveRecord::Migration
  def change
    unless ActiveRecord::Base.connection.table_exists? 'tags' then
		  create_table :tags do |t|
		    t.string :name
		    t.timestamps
		  end
    end
  end
end
