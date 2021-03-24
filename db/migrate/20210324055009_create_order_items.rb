class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.belongs_to :purchase_order, null: false, foreign_key: true
      t.belongs_to :item, null: false, foreign_key: true
      t.string :currency
      t.integer :quantity_ordered, default: 0
      t.integer :quantity_shipped, default: 0
      t.float :price, precision: 8, scale: 2, default: "0.0"
      t.float :discount, precision: 8, scale: 2, default: "0.0"
      t.float :tax, precision: 8, scale: 2, default: "0.0"
      t.float :platform_fee, precision: 8, scale: 2, default: "0.0"

      t.timestamps
    end
  end
end
