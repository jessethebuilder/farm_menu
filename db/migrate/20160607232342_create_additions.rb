class CreateAdditions < ActiveRecord::Migration
  def change
    create_table :additions do |t|
      t.integer :add_on_id
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
