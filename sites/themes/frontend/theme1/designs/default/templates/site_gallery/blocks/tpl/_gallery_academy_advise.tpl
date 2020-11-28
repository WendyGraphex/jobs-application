<section class="ftco-section ftco-counter" style="padding-top: 0px;padding-bottom: 0px;">
    <div id="owlCarouselAcademy" class="classOwl-dote-margin owl-demo-same-item owl-carousel owl-theme" style="opacity: 1; display: block;">   
        {foreach $gallery->getPictures() as $picture}
            <a href="#"><img style="width: 100%;" src="{$picture->getPictureManager()->getURL()}" alt="{$picture->getI18n()->get('title')|escape}"></a>
        {/foreach}
    </div>
</section>    
