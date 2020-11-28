<div id="cms_pages_menu_node-{$pageI18n->get('name')}">
{if $pageI18n->get('url')}               
    <a target="{$target}" href="{$pageI18n->getURL()}">       
        <span>{$pageI18n->get('meta_title')}</span> 
    </a>            
{/if}
</div>