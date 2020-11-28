{if !$node->isRoot()}
    {if !$node->getSiblings()->isEmpty()}
        <div class="divCategories">
            <div class="row rowCategories">
                <div class="carousel-categories owl-carousel owl-theme">
                    {foreach $node->getSiblings() as $item}
                        <div class="item">
                            {*<div class="col-md-2 align-self-stretch ftco-animate fadeInUp ftco-animated">*}
                            <div class="media services d-block categoriesClasses">
                                <a href="{$item->getI18n()->getUrl()}">
                                    <div class="icon">
                                        {if $item->hasIcon()}
                                            <img src="{$item->getIcon()->getOriginal()->getUrl()}"/>                                 
                                        {else}                                  
                                            <img src="/web/pictures/translation11.png"/>
                                        {/if}                                  
                                    </div>
                                    <div class="categorieText">
                                        <label class="heading">{$item->getI18n()->getFormatter()->getTitle()->ucfirst()}</label>
                                    </div>
                                </a>
                            </div>      
                            {*</div>*}
                        </div>
                    {/foreach}    
                </div>
            </div>       
        </div>
    {else}

    {/if}
{/if}