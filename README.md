# README

This repository is the one I created during my YouTube tutorial (find it here: )

Here's some basic steps from my notes:


- rails new elasticapp --database=mysql
- bundle add elasticsearch-rails elasticsearch-model elasticsearch-persistence
	- https://github.com/elastic/elasticsearch-rails
- config/initializers/elasticsearch.rb
	- require 'elasticsearch/model'
	- Elasticsearch::Model.client = Elasticsearch::Client.new log: true, transport_options: { request: { timeout: 5 } }
- rails g scaffold purchase_order order_num purchase_date:datetime status sales_channel order_total:float num_items_shipped:integer num_items_unshipped:integer payment_method shipped_at:datetime shipping_price:float shipping_tax:float carrier tracking_number estimated_arrival_date:datetime fulfillment_center confirmed_at:datetime returned_date:datetime return_reason notes:text refunded_at:datetime ship_to_name ship_to_address
- rails g scaffold item sku title nickname price:float inventory:integer fulfillment_fee:float unit_cost:float
- rails g resource order_item purchase_order:belongs_to item:belongs_to currency quantity_ordered:integer quantity_shipped:integer price:float discount:float tax:float platform_fee:float
- , precision: 8, scale: 2, default: "0.0"
- bundle add faker
	- https://github.com/faker-ruby/faker
- purchase_order:
	- has_many :order_items, dependent: :destroy
	- add ElasticSearch stuff
    - , format: :date_optional_time
	- PurchaseOrder.__elasticsearch__.delete_index!
	- PurchaseOrder.__elasticsearch__.create_index!
- import
- add custom importer
	- 
- kibana
	- create index
