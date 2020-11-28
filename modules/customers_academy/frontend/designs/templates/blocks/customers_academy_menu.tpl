{if $tpl=='default'}

<ul class="navbar-nav ml-auto SecondUl">
    {foreach $node->getChildren() as $child}
            <li class="nav-item">
                <a href="{$child->getCategory()->getI18n()->getUrl()}" class="nav-link">{$child->getI18n()}</a>
            </li>
    {/foreach}       
</ul>

{else}
    {include file="./tpl/_menu_`$tpl`.tpl"}
{/if}    
    
  