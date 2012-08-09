Deface::Override.new(:virtual_path => "layouts/spree_application",
                     :insert_before => "div#content",
                     :partial => 'shared/social_fb_left',
                     :name => 'facebook_right')
