{foreach $pages as $page_block}
    {if $page->get('id')==$page_block->get('id')}
        <span><strong>{$page_block->get('meta_title')}</strong></span>
    {else}
    <a href='{if $page_block->isExtern()||$page_block->isLink()}{$page_block->get("url")}{else}{url("cms/`$page_block->get("url")`.html")}{/if}'
       {if $page_block->get('target')}target="{$page_block->get('target')}"{/if}
       {if $page_block->get('meta_title')}title="{$page_block->get('meta_title')}"{/if}
       >
       <span>{$page_block->get('meta_title')}</span></a>    
    {/if}
    {if !$page_block@last}|{/if}
{/foreach}