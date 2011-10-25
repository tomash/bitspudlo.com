Deface::Override.new(:virtual_path  => "shared/_order_details",
         :insert_bottom => "[data-hook='order_details_line_item_row'] td:first",
         :text => '
<%= link_to "image", item.variant.product.images.first.attachment.url(:product), :class => "product_image" %>
<% if(item.variant.product.taxons.any?) %>
  <br />taxon: <i><%= item.variant.product.taxons.first.name %></i>
<% end %>',
         :name    => "admin_order_details_taxon")

Deface::Override.new(:virtual_path  => "admin/orders/show",
        :insert_after => "[data-hook='admin_order_show_addresses']",
        :text => '
<div class="adr" id="addr3">
  <h4>Contact Info</h4>
  <p>
    <%= link_to @order.email, "mailto:#{@order.email}" %><br />
    <%= link_to token_order_url(@order, @order.token), token_order_path(@order, @order.token) %>
  </p>
</div>',
        :name => "admin_order_show_extra")

Deface::Override.new(:virtual_path  => "admin/orders/show",
        :insert_after => "[data-hook='admin_order_show_details']", 
        :text =>'
<p>
  <%= link_to "show images", "#", :id => "show_images_link" %><br />
  <%= link_to "show email & token", "#", :id => "show_addr3_link" %>
</p>',
        :name => "admin_order_show_quicklinks")