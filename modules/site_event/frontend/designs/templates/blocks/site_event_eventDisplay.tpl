{if $tpl=='default'}
<div class="col-lg-3 col-md-4">
    <div class="blog-entry align-self-stretch eventImageSrc">
        <a href="{$item_i18n->getUrl()}" class="block-20">
            {if $item_i18n->getEvent()->hasPicture()}
                <img src="{$item_i18n->getEvent()->getPicture()->getUrl()}" style="max-width: 100%;max-height: 100%;margin: 0 auto;display: block;"/>
            {/if}
        </a>
        <div class="SectionEventDivInfo" style="height: auto;">
            <div class="titleAndDate">
                <h4>{$item_i18n->getFormatter()->getMetaTitle()->ucfirst()|truncate:30}</h4>
                {* <span class="ClassFloatRight">{$item_i18n->getFormatter()->getCreatedAt()->getDateFormatter()}</span> *}
            </div>
            <p>{$item_i18n->getFormatter()->getMetaDescription()->ucfirst()|truncate:50}</p>
            <div>
                <span class="icon-my_location"></span> <span>{$item_i18n->getEvent()->getPlace()->getFormatter()->getCountry()->ucfirst()} - {$item_i18n->getEvent()->getPlace()->getFormatter()->getCity()->ucfirst()}</span>
                <div class="{*ClassFloatRight*}" style="font-weight: bold;">{$item_i18n->getEvent()->getFormatter()->getRange()}</div>
                {component name="/site_event_cart/AddToCartBtn" event=$item_i18n->getEvent()}                  
            </div>
        </div>
    </div>
</div>
{elseif $tpl=='home'}
     <div class="item">
        <div class="blog-entry align-self-stretch">
            {if $item_i18n->getEvent()->hasPicture()}
                <a href="{$item_i18n->getUrl()}" class="block-20" style="background-image: url('{$item_i18n->getEvent()->getPicture()->getUrl()}');">
                </a>
            {/if}     
            <div class="SectionEventDivInfo">
                <div class="titleAndDate">
                    <h4> <a href="{$item_i18n->getUrl()}">{$item_i18n->getFormatter()->getMetaTitle()->ucfirst()|truncate:30}</a></h4>                  
                </div>
                <div>
                    <div class="{*ClassFloatRight*}" style="font-weight: bold;">{$item_i18n->getEvent()->getFormatter()->getRange()}</div>
                    <span class="icon-my_location"></span> 
                    <span>{$item_i18n->getEvent()->getPlace()->getFormatter()->getCountry()->ucfirst()} - {$item_i18n->getEvent()->getPlace()->getFormatter()->getCity()->ucfirst()}</span>
                        {component name="/site_event_cart/AddToCartBtn" event=$item_i18n->getEvent()}                
                </div>
            </div>
        </div>
    </div>
{/if}    
