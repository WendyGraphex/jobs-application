{if $tpl=='default'}
<div id="navCategories" class="navbar-nav ml-auto navbar-collapse collapse SecondUl classFlexHeader" style="">
    <ul style="list-style-type: none;padding-left: 0px;align-items: baseline;margin-bottom: 0px;">
        {foreach $node->getChildren() as $child}
            <li class="nav-item">
                <a href="{$child->getCategory()->getI18n()->getUrl()}" class="nav-link">{$child->getI18n()}</a>
            </li>
        {/foreach}   
        <li class="nav-item">
            <a href="{url_to("partners_categories")}" class="nav-link">{__('All categories')}</a>
        </li>
    </ul>
   {* <div class="divBtnEvent">
        {component name="/site_event/bookEvent"}
        {component name="/site_event/postEvent"}
    </div>*}
</div>
{else}
    {include file="./tpl/_menu_`$tpl`.tpl"}
{/if}    
 