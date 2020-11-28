{if $node->hasCmsPageI18n() && $node->getCmsPageI18n()->get('url')}   
    <li id="{$node->getCmsMenu()->get('id')}" 
        class="tree_node tree_node-{$class} {if $node->getCmsMenu()->get('name') == 'more-info'}mor-info{/if}">                  
            <a {if $node->hasCmsMenuI18n()}target="{$node->getCmsMenuI18n()->get('target')}"{/if} 
                                           href="{$node->getCmsPageI18n()->getURL()}" 
                                           id="{$node->getCmsMenu()->get('id')}" 
                                           class="tree_page btn-model-raduis  {if $levelStart==$node->getCmsMenu()->get('level')}fNiv{/if}">
               {if $node->hasCmsMenuI18n() && $node->getCmsMenuI18n()->get('icon')}<img src='{$node->getCmsMenuI18n()->getIcon()->getUrl()}' alt="'{$node->getCmsPageI18n()->get('meta_title')}"/>{/if}
                <span>{$node->getCmsPageI18n()->get('meta_title')}</span> 
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
