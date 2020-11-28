<div id="owlCarouselGallery" class="overlay owl-carousel owl-theme" style="opacity: 15;"> 
    {foreach $gallery->getPictures() as $picture}
        <a href="#"><img class="imges" style="width: 100%;" src="{$picture->getPictureManager()->getURL()}" alt="{$picture->getI18n()->get('title')|escape}"></a>
    {/foreach}    
</div>
 <script type="text/javascript">
     
    {JqueryScriptsReady}      
         
    /*$(".imges").each(function(i, e) {
        var url = $('.imges', e).attr('data-src');
        alert(url);
        $(e).append($('<img>', { 'src': url }));
    });*/
         
         
    $('#owlCarouselGallery').owlCarousel({
        loop: true,
        autoPlay: {$gallery->get('pauseTime',3000)},
        autoplay: true,             
        items: 1,
        nav: false,
        dots: false
    });
            
    {/JqueryScriptsReady}        
</script> 
