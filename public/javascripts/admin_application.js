(function($){
  $(document).ready(function(){
    $('#show_images_link').click(function() {
      $('#line-items a.product_image').replaceWith(function() {
        return '<img src="'+$(this).attr('href')+'" />';
      });
      return false;
    });
  });
})(jQuery);
