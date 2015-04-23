class RenameProductColumns < ActiveRecord::Migration
  def change
    rename_column :products, :product_types_id, :product_type_id
    change_column :products, :product_type_id, :integer, null: false
    rename_column :products, :product_packings_id, :product_packing_id
    change_column :products, :product_packing_id, :integer, null: false
    rename_column :products, :categories_id, :category_id
    change_column :products, :category_id, :integer, null: false
  end
end
