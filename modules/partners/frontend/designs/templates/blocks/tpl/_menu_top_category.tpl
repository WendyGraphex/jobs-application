<section class="ftco-section">
    <div class="container">
        <div class="row">
        {foreach $node->getChildren() as $child}
            <div class="col-lg-3 col-md-4 ftco-animate fadeInUp ftco-animated col-categories-homePage">
                <a href="{$child->getCategory()->getI18n()->getUrl()}">
                    <div>
                        <div class="divCategories-homePage">
                            <div class="divImage-homePage">
                                {if $child->getCategory()->hasIcon()}
                                    <img src="{$child->getCategory()->getIcon()->getOriginal()->getUrl()}"/>
                                {else}
                                <img src="/web/pictures/translation11.png"/>
                                {/if}
                            </div>
                            <div class="descrCatgory-homePage">
                                <span>{$child->getI18n()}</span>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        {/foreach}   
        </div>
    </div>
</section>
 