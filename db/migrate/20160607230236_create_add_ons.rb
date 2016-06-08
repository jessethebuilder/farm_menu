class CreateAddOns < ActiveRecord::Migration
  def change
    create_table :add_ons do |t|
      t.string :name
      t.float :price
      t.boolean :published, :default => true
      t.boolean :available, :default => true
      t.text :description

      t.timestamps null: false
    end
  end
end
