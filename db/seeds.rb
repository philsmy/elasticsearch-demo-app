25.times do
  Item.create sku: Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3),
              title: Faker::Commerce.product_name,
              nickname: Faker::Commerce.promotion_code,
              price: Faker::Commerce.price,
              inventory: (0..10).to_a.sample,
              fulfillment_fee: Faker::Commerce.price(range: 0..2.99),
              unit_cost: Faker::Commerce.price(range: 5..12.99)
end

5000.times do
  order_type = %w[confirmed shipped delivered].sample
  purchase_date = Faker::Time.backward(days: 30)
  shipped_at = %w[shipped delivered].include?(order_type) ? purchase_date + 3.days : nil
  estimated_arrival_date = shipped_at.present? ? shipped_at + 4.days : nil
  confirmed_at = purchase_date - 1.hour
  fulfillment_center = %w[5bs yg1 mej xqf 4wj].sample

  PurchaseOrder.create    order_num: "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 8)}-#{Faker::Number.number(digits: 8)}",
                          purchase_date: purchase_date,
                          status: order_type,
                          sales_channel: ['amazon.com', 'ebay.com', 'walmart.com', 'amazon.de'].sample,
                          order_total: Faker::Commerce.price(range: 10..20.99),
                          num_items_shipped: [0, 1].sample,
                          num_items_unshipped: [0, 1].sample,
                          payment_method: ['CC'],
                          shipped_at: shipped_at,
                          shipping_price: Faker::Commerce.price(range: 1.0..2.99),
                          carrier: %w[fedex ups dhl usps].sample,
                          tracking_number: Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3),
                          estimated_arrival_date: estimated_arrival_date,
                          fulfillment_center: fulfillment_center,
                          confirmed_at: confirmed_at,
                          ship_to_name: Faker::Name.name,
                          ship_to_address: Faker::Address.full_address
end

PurchaseOrder.all.find_each do |purchase_order|
  item = Item.all.sample
  quantity = purchase_order.num_items_shipped + purchase_order.num_items_unshipped

  purchase_order.order_items.create!(
    item: Item.all.sample,
    currency: %w[usd eur].sample,
    quantity_ordered: quantity,
    quantity_shipped: purchase_order.num_items_shipped,
    price: item.price * quantity,
    tax: item.price * quantity * 0.07,
    platform_fee: Faker::Commerce.price(range: 0.12..0.99)
  )
end
