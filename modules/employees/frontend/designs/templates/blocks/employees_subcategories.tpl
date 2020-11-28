{if !$node->getChildren()->isEmpty()}
    <div class="divCategories">
        <div class="row rowCategories">
            <div class="carousel-categories owl-carousel owl-theme">
                {foreach $node->getChildren() as $item}
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
        <div id="categoriesChildrenInside" class="rowCategories row" style="opacity: 0;{*display: none;*}position: absolute;background-color: #fff;width: 100%;z-index: 2;border: 1px solid #d7d5d5;left: 15px;border-radius: 15px;padding: 10px;z-index: 3;">
            <div class="carousel-categories-children owl-carousel owl-theme">
                {foreach $node->getChildren() as $item}
                    <div class="item">                  
                        <div class="media services d-block categoriesClasses">
                            <div class="icon">                                                            
                                {if $item->hasIcon()}
                                    <img src="{$item->getIcon()->getSmall()->getUrl()}"/>                                 
                                {else} 
                                    <img src="/web/pictures/translation11.png"/>
                                {/if}
                            </div>
                            <div class="categorieText">
                                <label class="heading"><a href="{$item->getI18n()->getUrl()}">{$item->getI18n()->getFormatter()->getTitle()->ucfirst()}</a></label>
                            </div>
                        </div>                        
                    </div>
                {/foreach}    
            </div>
        </div>
    </div>
{else}

{/if}
