class SpreeSiteHooks < Spree::ThemeSupport::HookListener
  # custom hooks go here

  insert_before :admin_orders_index_search, 'shared/admin_orders_quick_links'
end
