<div class="vc_row wpb_row td-pb-row divImagesBlog">
    <div class="wpb_column vc_column_container td-pb-span12">
        <div class="vc_column-inner ">
            <div class="wpb_wrapper">
                <div class="td_block_wrap td_block_big_grid_3 td_uid_21_5f84697b39ad1_rand td-grid-style-1 td-hover-1 td-pb-border-top" data-td-block-uid="td_uid_21_5f84697b39ad1">
                    <div id="td_uid_21_5f84697b39ad1" class="td_block_inner">
                        <div class="td-big-grid-wrapper">
                            {foreach $gallery->getPictures() as $picture}
                                {if $picture@index == 0}
                                    <div class="td_module_mx5 td-animation-stack td-big-grid-post-0 td-big-grid-post td-big-thumb">
                                        <div class="td-module-thumb">
                                            <a href="" rel="bookmark" title="">
                                                <img class="entry-thumb td-animation-stack-type0-2" src="{$picture->getPictureManager()->getURL()}" alt="{$picture->getI18n()->get('title')|escape}" width="534" height="462">
                                            </a>
                                        </div>            
                                        <div class="td-meta-info-container">
                                            <div class="td-meta-align">
                                                <div class="td-big-grid-meta">
                                                    <a href="" class="td-post-category">Promote Your Business</a>
                                                    <h3 class="entry-title td-module-title">
                                                        <a href="" rel="bookmark" title="">{$picture->getI18n()->get('title')|escape}</a>
                                                    </h3>                    
                                                </div>
                                                <div class="td-module-meta-info">
                                                    <span class="td-post-author-name">
                                                        <a href="">Graphex Team</a> 
                                                        <span>-</span>
                                                    </span>                        
                                                    <span class="td-post-date">
                                                        <time class="entry-date updated td-module-date" datetime="">October 9, 2020</time>
                                                    </span>                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                {elseif $picture@index > 0}
                                    <div class="td-big-grid-scroll">
                                        {if $picture@index == 1}
                                            <div class="td_module_mx11 td-animation-stack td-big-grid-post-1 td-big-grid-post td-medium-thumb">
                                                <div class="td-module-thumb">
                                                    <a href="" rel="bookmark" title="">
                                                        <img class="entry-thumb td-animation-stack-type0-2" src="{$picture->getPictureManager()->getURL()}" alt="{$picture->getI18n()->get('title')|escape}" sizes="(max-width: 533px) 100vw, 533px" width="533" height="261">
                                                    </a>
                                                </div>
                                                <div class="td-meta-info-container">
                                                    <div class="td-meta-align">
                                                        <div class="td-big-grid-meta">
                                                            <a href="" class="td-post-category">Community</a>
                                                            <h3 class="entry-title td-module-title">
                                                                <a href="" rel="bookmark" title="">{$picture->getI18n()->get('title')|escape}</a>
                                                            </h3>                    
                                                        </div>
                                                    </div>
                                                </div>
                                            </div> 
                                        {/if}
                                        {if $picture@index == 2}
                                            <div class="td_module_mx6 td-animation-stack td-big-grid-post-2 td-big-grid-post td-small-thumb">
                                                <div class="td-module-thumb">
                                                    <a href="" rel="bookmark" title="">
                                                        <img class="entry-thumb td-animation-stack-type0-2" src="{$picture->getPictureManager()->getURL()}" alt="{$picture->getI18n()->get('title')|escape}" sizes="(max-width: 265px) 100vw, 265px" width="265" height="198">
                                                    </a>
                                                </div>            
                                                <div class="td-meta-info-container">
                                                    <div class="td-meta-align">
                                                        <div class="td-big-grid-meta">
                                                            <a href="" class="td-post-category">Tips &amp; Tricks</a>
                                                            <h3 class="entry-title td-module-title">
                                                                <a href="" rel="bookmark" title="">{$picture->getI18n()->get('title')|escape}</a>
                                                            </h3>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        {/if}
                                        {if $picture@index == 3}
                                            <div class="td_module_mx6 td-animation-stack td-big-grid-post-3 td-big-grid-post td-small-thumb">
                                                <div class="td-module-thumb">
                                                    <a href="" rel="bookmark">
                                                        <img class="entry-thumb td-animation-stack-type0-2" src="{$picture->getPictureManager()->getURL()}" alt="{$picture->getI18n()->get('title')|escape}" sizes="(max-width: 265px) 100vw, 265px" width="265" height="198">
                                                    </a>
                                                </div>            
                                                <div class="td-meta-info-container">
                                                    <div class="td-meta-align">
                                                        <div class="td-big-grid-meta">
                                                            <a href="" class="td-post-category">Community</a>
                                                            <h3 class="entry-title td-module-title">
                                                                <a href="" rel="bookmark" title="">{$picture->getI18n()->get('title')|escape}</a>
                                                            </h3>                    
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        {/if}
                                    </div>
                                {/if}
                            {/foreach} 
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>                                      
        </div>
    </div>
</div>


{*<section class="ftco-section bg-light">
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
 </section>*}
