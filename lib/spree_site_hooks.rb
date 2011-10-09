class SpreeSiteHooks < Spree::ThemeSupport::HookListener
  # custom hooks go here
  replace :order_details_line_item_row, 'shared/order_table_item'

  insert_after :admin_order_show_addresses, 'shared/admin_order_extra_address'

  insert_after :admin_order_show_details, 'shared/admin_order_show_bottom'

  insert_before :admin_orders_index_search, 'shared/admin_orders_quick_links'

end
