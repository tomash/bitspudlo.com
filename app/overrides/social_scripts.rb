Deface::Override.new(:virtual_path => "layouts/spree_application",
         :insert_bottom => "[data-hook='inside_head']",
         :text => '<script type="text/javascript" src="http://apis.google.com/js/plusone.js"></script>
                    <script type="text/javascript" src="//platform.twitter.com/widgets.js"></script>',
         :name => "social_scripts")
