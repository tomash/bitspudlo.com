# map-reduce

taxon = Taxon.find_by_name("Kromlech")
line_items = LineItem.includes(:order).where('orders.shipment_state' => "ready").all

relevant_items = line_items.select { |line_item| taxon.products.find_by_id(line_item.variant.product.id) }
