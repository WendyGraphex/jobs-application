{if $node->hasCmsI18nPage() && $node->getCmsI18nPage()->get('url')}
    <li id="{$node->getCmsMenu()->get('id')}" class="tree_node tree_node-{$class}">                  
            <a {if $node->hasCmsI18nMenu()}target="{$node->getCmsI18nMenu()->get('target')}"{/if} href="{$node->getCmsI18nPage()->getURL()}" id="{$node->getCmsMenu()->get('id')}" class="tree_page {if $levelStart==$node->getCmsMenu()->get('level')}fNiv{/if}">
               {if $node->hasCmsI18nMenu() && $node->getCmsI18nMenu()->get('icon')}<img src='{$node->getCmsI18nMenu()->getIcon()->getUrl()}' alt="'{$node->getCmsI18nPage()->get('meta_title')}"/>{/if}
                <span>{$node->getCmsI18nPage()->get('meta_title')}</span> 
                {if $separator && !$child@last && $first_level}<span>{$separator}</span>{/if} {* separator only on first level *}
            </a>                       
            {if $node->getCmsMenu()->hasChildren()}
                <ul>
                    {foreach $node->getCmsMenu()->getChildren() as $child}             
                       {include file="./menu/_node.tpl" node=$child}     
                    {/foreach}
                </ul>
            {/if}           
    </li> 
{/if}
