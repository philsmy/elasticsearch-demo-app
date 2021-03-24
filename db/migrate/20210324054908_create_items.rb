class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :sku
      t.string :title
      t.string :nickname
      t.float :price, precision: 8, scale: 2, default: "0.0"
      t.integer :inventory, default: 0
      t.float :fulfillment_fee, precision: 8, scale: 2, default: "0.0"
      t.float :unit_cost, precision: 8, scale: 2, default: "0.0"

      t.timestamps
    end
  end
end
