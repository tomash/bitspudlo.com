jQuery(document).ready(function() {
  /* lightbox */
  
  jQuery('ul#product-thumbnails li a').lightBox({
    overlayOpacity: 0.1,
    imageBlank:  "<%= asset_path('lightbox-blank.gif') %>",
    imageLoading: "<%= asset_path('lightbox-ico-loading.gif') %>",
    imageBtnClose: "<%= asset_path('lightbox-btn-close.gif') %>",
    imageBtnPrev: "<%= asset_path('lightbox-btn-prev.gif') %>",
    imageBtnNext: "<%= asset_path('lightbox-btn-next.gif') %>"
  });
  
  jQuery('#main-image img').click(function() {
    jQuery('ul#product-thumbnails li a:first').click();
  });
  
});

