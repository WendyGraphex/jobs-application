<section class="ftco-section bg-light">
               <div class="container">
                   <div class="row justify-content-center mb-5 pb-3">
                       <div class="col-md-7 heading-section text-center ftco-animate">
                           <h2>{$gallery->getI18n()->get('title')}</h2>
                       </div>
                   </div>
                   <div id="SectionPartners" class="classOwl-dote-margin owl-carousel owl-theme" style="opacity: 1; display: block;">  
                       {foreach $gallery->getPictures() as $picture}
                        <div class="item">
                           <div class="blog-entry align-self-stretch">
                                <a href="{if $picture->getI18n()->hasLink()}{$picture->getI18n()->get('link')}{else}#{/if}" title="{$picture->getI18n()->get('title')|escape}" class="block-20" style="background-image: url('{$picture->getPictureManager()->getURL()}');">
                                </a>                                
                           </div>
                        </div>
                       {/foreach}                         
                   </div>
               </div>
            </section>
            
    <script type="text/javascript">
     {JqueryScriptsReady}     
         
    $("#SectionPartners").owlCarousel({
                loop: false,
                autoPlay: 3000,
                autoplay: false,
                items: 4,
                nav: true,
                dots: true,
                margin: 30,
                navText : ["<img src='/web/pictures/previous1.png'>","<img src='/web/pictures/next1.png'>"],
                responsive: {
                    0: {
                        items: 1
                    },
                    857: {
                        items: 2
                    },
                    1000: {
                        items: 3
                    },
                    1020: {
                        items: 4
                    }
                },
            });
            
    {/JqueryScriptsReady}        
</script>                   
