class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :section_id
      t.boolean :published, :default => true
      t.boolean :available, :default => true
      t.string :slug
      t.float :price
      t.boolean :taxed, :default => false
      t.text :description
      t.integer :order
      
      t.timestamps null: false
    end
  end
end
