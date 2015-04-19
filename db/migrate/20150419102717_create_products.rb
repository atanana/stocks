class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.boolean :open, null: false
      t.belongs_to :product_types, index: true
      t.belongs_to :product_packings, index: true
      t.belongs_to :categories, index: true

      t.timestamps null: false
    end
  end
end
