Deface::Override.new(:virtual_path => "layouts/admin",
                     :name => "timetracking_admin_tabs",
                     :insert_bottom => "[data-hook='admin_tabs'], #admin_tabs[data-hook]",
                     :text => "<%= tab(:timetrackings) %>",
                     :disabled => false,
                     :sequence => {:after => "promo_admin_tabs"})