{* ->getCmsMenu() ->getCmsPage()  ->getCmsI18nMenu()  ->getCmsI18nPage() *}

<li id="{$node->getCmsMenu()->get('id')}" class="tree_node">
        <a href="#" id="{$node->getCmsMenu()->get('id')}" name="{if $node->hasCmsPageI18n()}{$node->getCmsPageI18n()->get('id')}{/if}" class="tree_page" 
          title="menu_i18n_id:{if $node->hasCmsMenuI18n()}{$node->getCmsMenuI18n()->get('id')}{/if}&#13menu_id:{$node->getCmsMenu()->get('id')}&#13page_id:{if $node->hasCmsPage()}{$node->getCmsPage()->get('id')}{/if}&#13URL:{if $node->hasCmsPageI18n()}{$node->getCmsPageI18n()->getURL()}{/if}&#13Name:{if $node->hasCmsPage()}{$node->getCmsPage()->get('name')}{/if}&#13page_i18n_id:{if $node->hasCmsPageI18n()}{$node->getCmsPageI18n()->get('id')}{/if}" >         
        {if $node->hasCmsPageI18n()}
            <img id="status" src='{url("/icons/pages/pages`$node->getCmsPageI18n()->getPageStatus()`.gif","picture")}' alt='{__("page`$node->getCmsPageI18n()->getPageStatus()`")}'/>
        {else}
            <img id="status" src='{url("/icons/pages/pages_inactive.gif","picture")}' alt='{__("page_inactive")}'/>
        {/if}
        {* <span id="nodeName">[{$node.page->get('name')}]</span> *}
        
        <span id="title">{if $node->hasCmsPageI18n()}{$node->getCmsPageI18n()->get('meta_title')}{else}{__("No title")}{/if}</span>  
        
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
    {else}
        <ul></ul>
    {/if}   
</li>

