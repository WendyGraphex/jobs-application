<div class="ct_page">
 {if sizeof($pages)>1}
    <ul>
        {foreach $pages as $page}
        <li>
            {if $page->get('lang')==$language_active}
               <img class="page_active" title="{format_country($page->get('lang'))}" src='{url("/flags/`$page->get("lang")`.png","picture")}' alt="{__($page->get('lang'))}"/> 
            {else}                    
                <a href="{$page->getURL()}">
                   <img class="page_noactive"  src='{url("/flags/`$page->get("lang")`.png","picture")}' alt="{__($page->get('lang'))}"/> 
                </a> 
            {/if}
        </li>
        {/foreach}
    </ul>
 {/if}
</div>