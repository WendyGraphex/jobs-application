<div class="col-lg-4 col-md-6 single-adverton-profile">
    <div class="blog-entry align-self-stretch">
        <div class="carousel-profile owl-carousel owl-theme">
            {if $item_i18n->getAdvert()->getDocuments()->isEmpty()}   
                <div class="item">
                    <a href="{$item_i18n->getUrl()}" class="block-20">
                        <img src="/web/pictures/555.jpg"/>
                    </a>  
                </div>                                
            {else}                      
                {foreach $item_i18n->getAdvert()->getDocuments() as $document}
                    <div class="item">
                        <a href="{$item_i18n->getUrl()}" class="block-20">
                            <img src="{$document->getFile()->getImages()->getSmall()->getUrl()}"/>
                        </a>
                    </div>
                {/foreach} 
            {/if}    
        </div>
        <div class="user-advert-onProfile">
            <span class="user-advertPic-onProfile">
                {if $item_i18n->hasAvatar()}
                    <img src="{$item_i18n->getAdvert()->getEmployeeUser()->getAvatar()->getThumb()->getUrl()}"/>
                {else}
                     <img src="/web/pictures/inconnu-profile.jpg">
                     {*<img src="/web/pictures/person_4.jpg" class="pict-img-onProfile" alt="indondesign"> *}
                {/if}
            </span>
            <span class="user-name-onProfile">
                <a href="{$item_i18n->getUrl()}">{$item_i18n->getFormatter()->getTitle()->ucfirst()|truncate:40}</a>
            </span>
        </div>
        <div class="user-text-onProfile" style="padding: 9px;">
            <a href="{$item_i18n->getUrl()}">
                <h5>{$item_i18n->getFormatter()->getShortDescription()->ucfirst()|truncate:80}</h5>
            </a>
        </div>
        <div class="user-notes-onProfile" style="padding: 9px;">
            <span>
              {*  <i class="mdi mdi-star-half"></i>(2.1k) *}
            </span>
        </div>
        <div class="footer-onProfile">
            <span class="save-onProfile">
                <i class="">&nbsp;</i>
            </span>
            <span class="starting starting-price">
                {__('Starting At')}<label class="workPrice">{$item_i18n->getAdvert()->getFormatter()->getBudget()->getAmount()}</label>
            </span>
        </div>
    </div>
</div>

