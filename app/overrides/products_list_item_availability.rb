Deface::Override.new(:virtual_path  => "shared/_products",
         :insert_bottom => "[data-hook='products_list_item']",
         #:text => '<div class="availability"><%= product.on_hand %> in stock</div>',
         :text => '<div class="availability"><%= product.on_hand %> in stock</div>',
         :name    => "products_list_item_availability",
         :sequence => {:after => "tweak_product_list_item"})