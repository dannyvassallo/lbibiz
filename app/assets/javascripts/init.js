(function($){
  $(function(){

    $('.button-collapse').sideNav();


    setTimeout(function(){
      var $container = $('#masonry-grid');
      // initialize
      $container.masonry({
        columnWidth: '.col',
        itemSelector: '.col',
      });
    }, 500);

  }); // end of document ready
})(jQuery); // end of jQuery name space
