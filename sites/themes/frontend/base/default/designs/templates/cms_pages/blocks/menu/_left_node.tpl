{if $node->hasCmsPageI18n() && $node->getCmsPageI18n()->get('url')} 
    <div class="vl"></div>
    <div class="menu-item">
        <a style="color: black;" {if $node->hasCmsMenuI18n()}
            target="{$node->getCmsMenuI18n()->get('target')}"
            {/if}  
            href="{$node->getCmsPageI18n()->getURL()}">
            <img style="" src="{url('pictures/icons/check.png','web','frontend')}">
            {$node->getCmsPageI18n()->get('meta_title')}
            <img class="btn-right2" src="{url('pictures/icons/button.png','web','frontend')}">
        </a>
    </div>
    <div class="hl"></div>
{/if}