class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.integer :menu_id
      t.boolean :published, :default => true
      t.string :slug
      t.text :description
      t.integer :order
      
      t.timestamps null: false
    end
  end
end
