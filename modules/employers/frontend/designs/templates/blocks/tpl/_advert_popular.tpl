<div class="item">
    <div class="blog-entry align-self-stretch">
        <div class="OwlPopularSecond classOwl-dote-margin owl-carousel owl-theme" style="opacity: 1; display: block;">
               {if $item_i18n->getAdvert()->getDocuments()->isEmpty()}   
                        <div class="item">
                            <a class="block-20" href="{$item_i18n->getUrl()}">
                                <img src="/web/pictures/555.jpg"/>
                            </a>  
                        </div>                                
                    {else}                      
                        {foreach $item_i18n->getAdvert()->getDocuments() as $document}
                            <div class="item">
                              {* <a href="#" class="block-20" style="background-image: url('{$document->getFile()->getImages()->getSmall()->getUrl()}');"></a> *}
                                <a class="block-20" href="{$item_i18n->getUrl()}">
                                    <img src="{$document->getFile()->getImages()->getSmall()->getUrl()}"/>
                                </a>
                                {*<p id="copyMe" style="display: none;">{$item_i18n->getUrl()}</p>
                                <input class="copied" type="text" id="Link" aria-hidden="true" style="position: absolute;left: -999em;"/>*}
                            </div>
                        {/foreach} 
                    {/if}   
                    
           {* <div class="item">
                <a href="{$item_i18n->getUrl()}" class="block-20" style="background-image: url('/web/pictures/image_1.jpg');"></a>
            </div>
            <div class="item">
                <a href="{$item_i18n->getUrl()}" class="block-20" style="background-image: url('/web/pictures/image_2.jpg');"></a>
            </div>
            <div class="item">
                <a href="{$item_i18n->getUrl()}" class="block-20" style="background-image: url('/web/pictures/image_1.jpg');"></a>
            </div> *}
        </div>
       
        <div class="text mt-3">
            <div class="meta mb-2">
                <div><a href="{$item_i18n->getUrl()}">{$item_i18n->getAdvert()->getFormatter()->getPublishedAt()->getDateFormatter()->getText('P')}</a></div>
                <div><a href="{$item_i18n->getAdvert()->getEmployerUser()->getUrl()}">{$item_i18n->getAdvert()->getEmployerUser()->getFormatter()->getUsername()->ucfirst()}</a></div>
                <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
            </div>
            <h3 class="heading"><a href="{$item_i18n->getUrl()}">{$item_i18n->getFormatter()->getTitle()->ucfirst()|truncate:40}</a></h3>
            <p>{$item_i18n->getFormatter()->getShortDescription()->ucfirst()|truncate:80}</p>
        </div>
    </div>
</div>
