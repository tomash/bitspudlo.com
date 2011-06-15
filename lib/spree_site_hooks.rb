class SpreeSiteHooks < Spree::ThemeSupport::HookListener
  # custom hooks go here
  replace :order_details_line_item_row, 'shared/order_table_item'
  insert_after :admin_order_show_details do
    '<%= link_to "show images", "#", :id => "show_images_link" %>
     <%= javascript_include_tag "admin_application" %>
    '
  end
end
