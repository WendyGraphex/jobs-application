<div class="sublinks">
{foreach $sublinks as $link}
    {if $link->hasCmsI18nPage() && $link->getCmsI18nPage()->get('url')}         
           {if $link@last}                          
                {if $link->hasCmsI18nMenu() && $link->getCmsI18nMenu()->get('icon')}  {* icon comes from menu *}    
                    <img src="{$link->getCmsI18nMenu()->getIcon()->getUrl()}" alt="{$link->getCmsI18nPage()->get('meta_title')}"/>
                {/if} 
                <span style="font-weight: bold">{$link->getCmsI18nPage()->get('meta_title')|escape}</span>  
            {else}
               <a href="{$link->getCmsI18nPage()->getURL()}" {if $link->hasCmsI18nMenu()}target="{$link->getCmsI18nMenu()->get('target')}"{/if} class="sublink_top">                          
                  {if $link->hasCmsI18nMenu() && $link->getCmsI18nMenu()->get('icon')}   {* icon comes from menu *} 
                      <img src="{$link->getCmsI18nMenu()->getIcon()->getUrl()}" alt="{$link->getCmsI18nPage()->get('meta_title')}"/>
                  {/if}
                  <span>{$link->getCmsI18nPage()->get('meta_title')|escape}</span> 
                </a>
                <span style="font-weight: bold">{mfConfig::get('view_sublink_separator','>')}</span>
            {/if}
    {/if}
{/foreach}
</div>
