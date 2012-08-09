Deface::Override.new(:virtual_path => "layouts/spree_application",
                     :insert_after => "div#content",
                     :partial => 'shared/social_fb_right',
                     :name => 'facebook_left')
