class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.integer :user_id
      t.string :name
      t.string :url
      t.text   :description
      t.string :creator
      t.string :hash_tag
      t.string :repository_url
      t.boolean :scheduled_access
      t.boolean :please_design
      t.timestamps
    end
    add_index :sites, [:user_id]
  end
end
