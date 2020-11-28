<div class="row">
    {foreach $pager as $item_i18n}
        {component name="/employers/advertDisplay" advert_i18n=$item_i18n tpl='single'}       
    {/foreach}
</div>

  <script type="text/javascript">
      
    {JqueryScriptsReady}
 $('.carousel-profile').owlCarousel({
            margin:10,
            responsiveClass:true,
            autoHeight:true,
            items:1,
           // autoplay:true,
            autoplayTimeout:10000,
            autoplayHoverPause:true,
            nav : true,
            dots: true, //Make this true
            navText : ["<img src='/web/pictures/previous1.png'>","<img src='/web/pictures/next1.png'>"],          
        });
     {/JqueryScriptsReady}           
</script>        

