jQuery(document).ready(function() {
  /* lightbox */
  
  jQuery('ul#product-thumbnails li a').lightBox({
    overlayOpacity: 0.1,
    imageBlank: '/images/lightbox-blank.gif',
    imageLoading: '/images/lightbox-ico-loading.gif',
    imageBtnClose: '/images/lightbox-btn-close.gif',
    imageBtnPrev: '/images/lightbox-btn-prev.gif',
    imageBtnNext: '/images/lightbox-btn-next.gif'
  });
  
  jQuery('#main-image img').click(function() {
    jQuery('ul#product-thumbnails li a:first').click();
  });
  
});

