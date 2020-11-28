{* ->getCmsMenu() ->getCmsPage()  ->getCmsI18nMenu()  ->getCmsI18nPage() *}

<li id="{$node->getCmsMenu()->get('id')}" class="tree_node">
        <a href="#" id="{$node->getCmsMenu()->get('id')}" name="{if $node->hasCmsI18nPage()}{$node->getCmsI18nPage()->get('id')}{/if}" class="tree_page" 
          title="menu_i18n_id:{if $node->hasCmsI18nMenu()}{$node->getCmsI18nMenu()->get('id')}{/if}&#13menu_id:{$node->getCmsMenu()->get('id')}&#13page_id:{if $node->hasCmsPage()}{$node->getCmsPage()->get('id')}{/if}&#13URL:{if $node->hasCmsI18nPage()}{$node->getCmsI18nPage()->getURL()}{/if}&#13Name:{if $node->hasCmsPage()}{$node->getCmsPage()->get('name')}{/if}&#13page_i18n_id:{if $node->hasCmsI18nPage()}{$node->getCmsI18nPage()->get('id')}{/if}" >
        {* <img id="status" src='{url("/icons/pages/pages`$node.page_i18n->getPageStatus()`.gif","picture")}' alt='{__("page`$node.page_i18n->getPageStatus()`")}'/>  *}
         
        {if $node->hasCmsI18nPage()}
            <img id="status" src='{url("/icons/pages/pages`$node->getCmsI18nPage()->getPageStatus()`.gif","picture")}' alt='{__("page`$node->getCmsI18nPage()->getPageStatus()`")}'/>
        {else}
            <img id="status" src='{url("/icons/pages/pages_inactive.gif","picture")}' alt='{__("page_inactive")}'/>
        {/if}
        {* <span id="nodeName">[{$node.page->get('name')}]</span> *}
        
        <span id="title">{if $node->hasCmsI18nPage()}{$node->getCmsI18nPage()->get('meta_title')}{else}{__("no title")}{/if}</span>  
        
       {* <span id="nodePageURL">{$node->getURL()|default:__("page doesn't exist in this country")}</span> *}
       {* <span>(id:{$node->get('id')})</span> *}
       {* <span>(menu_id:{$node->get('menu_id')},</span> *}
       {*  page_id:<span id="nodePageID">{$node->get('page_id')}</span>) *}
       {* <span>{if $node->get('is_active')}ACTIVE{else}INACTIVE{/if}</span>*}
       {* <span>[pages{$node->getPageStatus()}]</span> *}
    </a>
    {if $node->getCmsMenu()->hasChildren()}
        <ul>
            {foreach $node->getCmsMenu()->getChildren() as $child}
                  {include file="./tree/_menu_view_node.tpl" node=$child}     
            {/foreach} 
        </ul>
    {/if}
</li>

