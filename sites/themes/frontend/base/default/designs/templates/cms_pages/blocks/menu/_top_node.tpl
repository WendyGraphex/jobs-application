{if $node->hasCmsPageI18n() && $node->getCmsPageI18n()->get('url')} 
    <button id="{$node->getCmsMenu()->get('name')}" class="col-sm items">
        <a id="menu-gen" style="color: white; text-decoration: none;" {if $node->hasCmsMenuI18n()}
            target="{$node->getCmsMenuI18n()->get('target')}"
            {/if}  
            href="{$node->getCmsPageI18n()->getURL()}">
             {$node->getCmsPageI18n()->get('meta_title')}
        </a>
    </button>
{/if}
