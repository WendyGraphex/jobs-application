(function ( $ ) {

$.fn.slidebar = function(options) 
{
        var settings = $.extend({
            // These are the defaults.
            autoOpen: true,
            time : 3400
        }, options );
      if($(this).hasClass('sidebar-content-ctn')){
         return $(this);
         //  
      }else{
          $(this).addClass('sidebar-content-ctn');
      }
        if ( typeof options === 'string') {
          if(options == "open"){
             $(this).addClass("sidebar-content-visible"); 
          }
          else {
          if(options == "close"){
               $(this).removeClass("sidebar-content-visible"); 
          }
}
}else{ 
    if(settings.autoOpen){
	$(this).addClass("sidebar-content-visible");
    }
    
    
            this.click(function() { 
                var Obj = $(this);
           Obj.toggleClass( "sidebar-content-visible");
           $( ".sidebar-btn i" ).toggleClass( "fa-chevron-left fa-chevron-right" ); 
           
           Obj.mouseleave(function() {
                setTimeout(function() {
               Obj.removeClass("sidebar-content-visible");
           }, settings.time);
          });     
   });     
}};
}( jQuery ));

