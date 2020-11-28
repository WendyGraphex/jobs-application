{if $tpl=='default'}
    <ul id="navActivities" class="navbar-nav ml-auto SecondUl navbar-collapse collapse" style="align-items: baseline;">
        {foreach $node->getChildren() as $child}
            <li class="nav-item showListInside">
                <a href="{$child->getActivity()->getI18n()->getUrl()}" class="nav-link">{$child->getI18n()}</a>
                {if !$child->getChildren()->isEmpty()}
                <ul class="ShowListInsideLiSign ShowListBlog">
                    {foreach $child->getChildren() as $sub_child}
                    <li> <a href="{$sub_child->getActivity()->getI18n()->getUrl()}" class="nav-link">{$sub_child->getI18n()}</a></li>                   
                    {/foreach}
                </ul>
                {/if}
            </li>
        {/foreach}   
        <li class="nav-item">
            <a href="{url_to("customers_blog_activities")}" class="nav-link">{__('All activities')}</a>
        </li>
    </ul>
{else}
    {include file="./tpl/_menu_`$tpl`.tpl"}
{/if}    