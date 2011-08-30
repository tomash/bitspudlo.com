(function($){
  $(document).ready(function(){
    $('.adr#addr3').hide();

    $('#show_images_link').click(function() {
      $('#line-items a.product_image').replaceWith(function() {
        return '<br /><img src="'+$(this).attr('href')+'" />';
      });
      return false;
    });

    $('#show_addr3_link').click(function() {
      $('.adr#addr3').show();
      return false;
    });
  });
})(jQuery);
