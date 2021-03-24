require "test_helper"

class PurchaseOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purchase_order = purchase_orders(:one)
  end

  test "should get index" do
    get purchase_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_purchase_order_url
    assert_response :success
  end

  test "should create purchase_order" do
    assert_difference('PurchaseOrder.count') do
      post purchase_orders_url, params: { purchase_order: { carrier: @purchase_order.carrier, confirmed_at: @purchase_order.confirmed_at, estimated_arrival_date: @purchase_order.estimated_arrival_date, fulfillment_center: @purchase_order.fulfillment_center, notes: @purchase_order.notes, num_items_shipped: @purchase_order.num_items_shipped, num_items_unshipped: @purchase_order.num_items_unshipped, order_num: @purchase_order.order_num, order_total: @purchase_order.order_total, payment_method: @purchase_order.payment_method, purchase_date: @purchase_order.purchase_date, refunded_at: @purchase_order.refunded_at, return_reason: @purchase_order.return_reason, returned_date: @purchase_order.returned_date, sales_channel: @purchase_order.sales_channel, ship_to_address: @purchase_order.ship_to_address, ship_to_name: @purchase_order.ship_to_name, shipped_at: @purchase_order.shipped_at, shipping_price: @purchase_order.shipping_price, shipping_tax: @purchase_order.shipping_tax, status: @purchase_order.status, tracking_number: @purchase_order.tracking_number } }
    end

    assert_redirected_to purchase_order_url(PurchaseOrder.last)
  end

  test "should show purchase_order" do
    get purchase_order_url(@purchase_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_purchase_order_url(@purchase_order)
    assert_response :success
  end

  test "should update purchase_order" do
    patch purchase_order_url(@purchase_order), params: { purchase_order: { carrier: @purchase_order.carrier, confirmed_at: @purchase_order.confirmed_at, estimated_arrival_date: @purchase_order.estimated_arrival_date, fulfillment_center: @purchase_order.fulfillment_center, notes: @purchase_order.notes, num_items_shipped: @purchase_order.num_items_shipped, num_items_unshipped: @purchase_order.num_items_unshipped, order_num: @purchase_order.order_num, order_total: @purchase_order.order_total, payment_method: @purchase_order.payment_method, purchase_date: @purchase_order.purchase_date, refunded_at: @purchase_order.refunded_at, return_reason: @purchase_order.return_reason, returned_date: @purchase_order.returned_date, sales_channel: @purchase_order.sales_channel, ship_to_address: @purchase_order.ship_to_address, ship_to_name: @purchase_order.ship_to_name, shipped_at: @purchase_order.shipped_at, shipping_price: @purchase_order.shipping_price, shipping_tax: @purchase_order.shipping_tax, status: @purchase_order.status, tracking_number: @purchase_order.tracking_number } }
    assert_redirected_to purchase_order_url(@purchase_order)
  end

  test "should destroy purchase_order" do
    assert_difference('PurchaseOrder.count', -1) do
      delete purchase_order_url(@purchase_order)
    end

    assert_redirected_to purchase_orders_url
  end
end
