class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.string :slug
      t.boolean :published, :default => true
      t.text :description

      t.timestamps null: false
    end
  end
end
