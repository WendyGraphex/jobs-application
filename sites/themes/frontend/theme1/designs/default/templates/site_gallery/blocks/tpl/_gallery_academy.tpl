<section class="ftco-section bg-light">
    <div class="container">
        <div id="SectionFooterGallery" class="classOwl-dote-margin owl-carousel owl-theme" style="opacity: 1; display: block;">   
        {foreach $gallery->getPictures() as $picture}
            <div class="item">
                <div class="SectionLastGellery-div">
                    <a href="{if $picture->getI18n()->hasLink()}{$picture->getI18n()->get('link')}{else}#{/if}" target="{$picture->getI18n()->get('target')}">
                        {if $picture->getI18n()->get('description')}
                        <h1>{$picture->getI18n()->get('description')|escape}</h1>
                        <div class="bigTitle">{$picture->getI18n()->get('title')|escape}</div>
                        {else}
                           <img style="width: 100%;" src="{$picture->getPictureManager()->getURL()}" alt="{$picture->getI18n()->get('title')|escape}">   
                        {/if}    
                    </a>
                </div>
            </div>
        {/foreach} 
        </div>
    </div>
 </section>
            
    <script type="text/javascript">
     {JqueryScriptsReady}     
         
     $('#SectionFooterGallery').owlCarousel({
                loop: false,
                autoPlay: 3000,
                autoplay: false,
                nav: true,
                items: 1,
                nav: true,
                dots: true,
                navText : ["<img src='/web/pictures/previous1.png'>","<img src='/web/pictures/next1.png'>"],
            });
            
    {/JqueryScriptsReady}        
</script>                   
 {*
<div id="banner">
   {foreach $gallery->getPictures() as $picture}
    <img style="width: 100%;" src="{$picture->getPictureManager()->getURL()}" alt="{$picture->getI18n()->get('title')|escape}">
{/foreach}  
</div> *}