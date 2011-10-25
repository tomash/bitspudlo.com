Deface::Override.new(:virtual_path  => "admin/orders/index",
         :insert_top => "[data-hook='admin_orders_index_search']",
         :text => '
<p>
  <%= link_to "complete", admin_orders_path({"search[state_equals]" => "complete"}) %> <br />
  <%= link_to "complete and balance due", admin_orders_path({"search[shipment_state_equals]" => "ready", "search[state_equals]" => "complete"}) %> <br />
  <%= link_to "complete and ready to ship", admin_orders_path({"search[shipment_state_equals]" => "ready", "search[state_equals]" => "complete"}) %>
</p>',
         :name    => "admin_orders_quick_search")