class CreateProductPackings < ActiveRecord::Migration
  def change
    create_table :product_packings do |t|
      t.string :name, null: false, unique: true

      t.timestamps null: false
    end
  end
end
