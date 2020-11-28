{if !$node->getChildren()->isEmpty()}
    <div class="divCategories">
        <div class="row rowCategories">
            <div class="carousel-categories owl-carousel owl-theme">
                {foreach $node->getChildren() as $item}
                    <div class="item">                  
                        <div class="media services d-block categoriesClasses">
                            <a href="{$item->getI18n()->getUrl()}">
                                <div class="icon">                                                            
                                    {if $item->hasPicture()}
                                        <img src="{$item->getPicture()->getSmall()->getUrl()}"/>                                 
                                    {else} 
                                        <img src="/web/pictures/translation11.png"/>
                                    {/if}
                                </div>
                                <div class="categorieText">
                                    <label class="heading">{$item->getI18n()->getFormatter()->getTitle()->ucfirst()}</label>
                                </div>
                            </a>
                        </div>                        
                    </div>
                {/foreach}    
            </div>
        </div>
    </div>
{else}
    
{/if}
