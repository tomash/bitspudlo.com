Deface::Override.new(:virtual_path  => "layouts/spree_application",
         :insert_bottom => "[data-hook='inside_head']",
         :text => '<link rel="shortcut icon" href="/favicon.ico" />',
         :name    => "header_favicon")