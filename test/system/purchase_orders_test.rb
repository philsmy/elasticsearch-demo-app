require "application_system_test_case"

class PurchaseOrdersTest < ApplicationSystemTestCase
  setup do
    @purchase_order = purchase_orders(:one)
  end

  test "visiting the index" do
    visit purchase_orders_url
    assert_selector "h1", text: "Purchase Orders"
  end

  test "creating a Purchase order" do
    visit purchase_orders_url
    click_on "New Purchase Order"

    fill_in "Carrier", with: @purchase_order.carrier
    fill_in "Confirmed at", with: @purchase_order.confirmed_at
    fill_in "Estimated arrival date", with: @purchase_order.estimated_arrival_date
    fill_in "Fulfillment center", with: @purchase_order.fulfillment_center
    fill_in "Notes", with: @purchase_order.notes
    fill_in "Num items shipped", with: @purchase_order.num_items_shipped
    fill_in "Num items unshipped", with: @purchase_order.num_items_unshipped
    fill_in "Order num", with: @purchase_order.order_num
    fill_in "Order total", with: @purchase_order.order_total
    fill_in "Payment method", with: @purchase_order.payment_method
    fill_in "Purchase date", with: @purchase_order.purchase_date
    fill_in "Refunded at", with: @purchase_order.refunded_at
    fill_in "Return reason", with: @purchase_order.return_reason
    fill_in "Returned date", with: @purchase_order.returned_date
    fill_in "Sales channel", with: @purchase_order.sales_channel
    fill_in "Ship to address", with: @purchase_order.ship_to_address
    fill_in "Ship to name", with: @purchase_order.ship_to_name
    fill_in "Shipped at", with: @purchase_order.shipped_at
    fill_in "Shipping price", with: @purchase_order.shipping_price
    fill_in "Shipping tax", with: @purchase_order.shipping_tax
    fill_in "Status", with: @purchase_order.status
    fill_in "Tracking number", with: @purchase_order.tracking_number
    click_on "Create Purchase order"

    assert_text "Purchase order was successfully created"
    click_on "Back"
  end

  test "updating a Purchase order" do
    visit purchase_orders_url
    click_on "Edit", match: :first

    fill_in "Carrier", with: @purchase_order.carrier
    fill_in "Confirmed at", with: @purchase_order.confirmed_at
    fill_in "Estimated arrival date", with: @purchase_order.estimated_arrival_date
    fill_in "Fulfillment center", with: @purchase_order.fulfillment_center
    fill_in "Notes", with: @purchase_order.notes
    fill_in "Num items shipped", with: @purchase_order.num_items_shipped
    fill_in "Num items unshipped", with: @purchase_order.num_items_unshipped
    fill_in "Order num", with: @purchase_order.order_num
    fill_in "Order total", with: @purchase_order.order_total
    fill_in "Payment method", with: @purchase_order.payment_method
    fill_in "Purchase date", with: @purchase_order.purchase_date
    fill_in "Refunded at", with: @purchase_order.refunded_at
    fill_in "Return reason", with: @purchase_order.return_reason
    fill_in "Returned date", with: @purchase_order.returned_date
    fill_in "Sales channel", with: @purchase_order.sales_channel
    fill_in "Ship to address", with: @purchase_order.ship_to_address
    fill_in "Ship to name", with: @purchase_order.ship_to_name
    fill_in "Shipped at", with: @purchase_order.shipped_at
    fill_in "Shipping price", with: @purchase_order.shipping_price
    fill_in "Shipping tax", with: @purchase_order.shipping_tax
    fill_in "Status", with: @purchase_order.status
    fill_in "Tracking number", with: @purchase_order.tracking_number
    click_on "Update Purchase order"

    assert_text "Purchase order was successfully updated"
    click_on "Back"
  end

  test "destroying a Purchase order" do
    visit purchase_orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Purchase order was successfully destroyed"
  end
end
