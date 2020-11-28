{if !$node->getChildren()->isEmpty()}
    <div class="collapse navbar-collapse bordred-nav" id="navbarSupportedContent">
        <ul class="navbar-nav">
            {foreach $node->getChildren() as $item}
                <li class="nav-item">
                    <a class="nav-link" href="{$item->getI18n()->getUrl()}">{$item->getI18n()->getFormatter()->getTitle()->ucfirst()}</a>
                </li>
            {/foreach}    
        </ul>
    </div>
{else}

{/if}

