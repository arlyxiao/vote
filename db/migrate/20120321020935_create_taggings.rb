class CreateTaggings < ActiveRecord::Migration
  def change
    unless ActiveRecord::Base.connection.table_exists? 'taggings' then
		  create_table :taggings do |t|
		    t.integer :tag_id
		    t.integer :creator_id
		    t.integer :model_id
		    t.string :model_type
		    t.timestamps
		  end
    end
  end
end
