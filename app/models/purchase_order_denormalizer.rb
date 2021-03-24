class PurchaseOrderDenormalizer
  attr_reader :purchase_order

  def initialize(purchase_order)
    @purchase_order = purchase_order
  end

  def to_hash
    %w[id
       purchase_date
       status
       sales_channel
       num_items_shipped
       num_items_unshipped
       payment_method
       shipped_at
       shipping_price
       shipping_tax
       carrier
       tracking_number
       estimated_arrival_date
       fulfillment_center
       confirmed_at
       returned_date
       return_reason
       notes
       refunded_at
       ship_to_name
       ship_to_address

       skus
       item_ids
       unique_products
       quantity_ordered
       quantity_shipped
       quantity_unshipped
       currency

       order_items_info]
      .map { |method_name| [method_name, send(method_name)] }.to_h
  end

  def id
    purchase_order.id
  end

  def purchase_date
    purchase_order.purchase_date
  end

  def status
    purchase_order.status
  end

  def sales_channel
    purchase_order.sales_channel
  end

  def num_items_shipped
    purchase_order.num_items_shipped
  end

  def num_items_unshipped
    purchase_order.num_items_unshipped
  end

  def payment_method
    purchase_order.payment_method
  end

  def shipped_at
    purchase_order.shipped_at
  end

  def shipping_price
    purchase_order.shipping_price
  end

  def shipping_tax
    purchase_order.shipping_tax
  end

  def carrier
    purchase_order.carrier
  end

  def tracking_number
    purchase_order.tracking_number
  end

  def estimated_arrival_date
    purchase_order.estimated_arrival_date
  end

  def fulfillment_center
    purchase_order.fulfillment_center
  end

  def confirmed_at
    purchase_order.confirmed_at
  end

  def returned_date
    purchase_order.returned_date
  end

  def return_reason
    purchase_order.return_reason
  end

  def notes
    purchase_order.notes
  end

  def refunded_at
    purchase_order.refunded_at
  end

  def ship_to_name
    purchase_order.ship_to_name
  end

  def ship_to_address
    purchase_order.ship_to_address
  end

  def skus
    purchase_order.order_items.map{ |oi| oi.item.sku}
  end

  def item_ids
    purchase_order.order_items.map(&:item_id)
  end

  def unique_products
    purchase_order.order_items.pluck(:item_id).uniq.size
  end

  def quantity_ordered
    purchase_order.order_items.sum(&:quantity_ordered)
  end

  def quantity_shipped
    purchase_order.order_items.sum(&:quantity_shipped)
  end

  def quantity_unshipped
    purchase_order.order_items.sum(&:quantity_ordered) - purchase_order.order_items.sum(&:quantity_shipped)
  end

  def currency
    purchase_order.order_items.pluck(:currency).uniq.first
  end

  def order_items_info
    items_info = []

    purchase_order.order_items.each do |order_item|
      fulfillment_fee = order_item.item.fulfillment_fee.to_f.abs * order_item.quantity_ordered
      info = {
        fulfillment_fee: fulfillment_fee,
        item_id: order_item.item_id,
        quantity_ordered: order_item.quantity_ordered,
        quantity_shipped: order_item.quantity_shipped,
        price: order_item.price,
        discount: order_item.discount,
        tax: order_item.tax,
        platform_fee: order_item.platform_fee,
        item_title: order_item.item.title,
        item_sku: order_item.item.sku,
        item_nickname: order_item.item.nickname
     }

      items_info << info
    end

    items_info
  end
end
