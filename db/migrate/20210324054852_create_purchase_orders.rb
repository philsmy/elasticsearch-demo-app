class CreatePurchaseOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :purchase_orders do |t|
      t.string :order_num
      t.datetime :purchase_date
      t.string :status
      t.string :sales_channel
      t.float :order_total, precision: 8, scale: 2, default: "0.0"
      t.integer :num_items_shipped, default: 0
      t.integer :num_items_unshipped, default: 0
      t.string :payment_method
      t.datetime :shipped_at
      t.float :shipping_price, precision: 8, scale: 2, default: "0.0"
      t.float :shipping_tax, precision: 8, scale: 2, default: "0.0"
      t.string :carrier
      t.string :tracking_number
      t.datetime :estimated_arrival_date
      t.string :fulfillment_center
      t.datetime :confirmed_at
      t.datetime :returned_date
      t.string :return_reason
      t.text :notes
      t.datetime :refunded_at
      t.string :ship_to_name
      t.string :ship_to_address

      t.timestamps
    end
  end
end
