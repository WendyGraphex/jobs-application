{if $tpl=='default'}    
<div class="wpb_column vc_column_container td-pb-span8">
                            {foreach $pager as $item_i18n}
                                {component name="/customers_blog/articleDisplay" item_i18n=$item_i18n}            
                            {/foreach}   
                        </div>
          
{else}   
   <div class="td_block_wrap td_block_8 td_block_widget td_uid_24_5f84626a6d184_rand td-pb-border-top">
    <div class="td-block-title-wrap">
        <h4 class="block-title">
            <a href="{$node->getI18n()->getUrl()}">{$node->getI18n()->getFormatter()->getMetaTitle()->ucfirst()}</a></h4></div>
    <div id="td_uid_24_5f84626a6d184" class="td_block_inner">
        
          {foreach $pager as $item_i18n}
                                {component name="/customers_blog/articleDisplay" item_i18n=$item_i18n tpl="success"}            
                            {/foreach}   
                        </div>
        
       {* <div class="td-block-span12">
            <div class="td_module_7 td_module_wrap td-animation-stack">
                <div class="td-module-thumb"><a href="" rel="bookmark" title="Graphex’s 72-Hour Short Film Contest: Behind the Scenes with Cameron Schiller"><img class="entry-thumb td-animation-stack-type0-2" src="https://blog.fiverr.com/wp-content/uploads/15_Peter_McKinnon_-1-100x70.jpg" srcset="" sizes="(max-width: 100px) 100vw, 100px" alt="" title="Graphex’s 72-Hour Short Film Contest: Behind the Scenes with Cameron Schiller" width="100" height="70"></a></div>
                <div class="item-details">
                    <h3 class="entry-title td-module-title"><a href="" rel="bookmark" title="Graphex’s 72-Hour Short Film Contest: Behind the Scenes with Cameron Schiller">Graphex’s 72-Hour Short Film Contest: Behind the Scenes with Cameron Schiller</a></h3>
                    <div class="td-module-meta-info">
                        <span class="td-post-date"><time class="entry-date updated td-module-date" datetime="2020-08-28T13:17:00+00:00">August 28, 2020</time></span>                            </div>
                </div>
            </div>  
        </div> *}
    </div>
</div>  
{/if}    