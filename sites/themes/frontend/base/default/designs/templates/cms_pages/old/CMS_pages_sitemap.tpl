<h3>{__('Pages')|capitalize}</h3>
<div id="cms_pages_menu">         
  {include file="./sitemap/_start.tpl" children=$children}                 
</div>

<h3>{__('Pages')|capitalize}</h3>
<div id="cms_pages_in_blocks">         
    {foreach $pages_in_blocks as $page}
        <div>
           <a target="_blank" href="{$page->getURL()}">               
                <span>{$page->get('meta_title')}</span> 
           </a> 
        </div>
    {/foreach}    
</div> 
<h3>{__('Orpholin Pages')|capitalize}</h3>
<div id="cms_pages_in_blocks">         
    {foreach $pages_alone as $page}
        <div>
           <a target="_blank" href="{$page->getURL()}">               
                <span>{$page->get('meta_title')}</span> 
           </a> 
        </div>
    {/foreach}    
</div> 