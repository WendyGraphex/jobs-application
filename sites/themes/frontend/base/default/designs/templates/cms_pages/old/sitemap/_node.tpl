{if $node->getCmsI18nPage()->isUrl()}    
    <li id="{$node->getCmsMenu()->get('id')}" class="tree_node">           
            <a {if $node->hasCmsI18nMenu()}target="{$node->getCmsI18nMenu()->get('target')}"{/if} href="{$node->getCmsI18nPage()->getURL()}" id="{$node->getCmsMenu()->get('id')}" class="tree_page {if $levelStart==$node->getCmsMenu()->get('level')}fNiv{/if}">               
                <span>{$node->getCmsI18nPage()->get('meta_title')}</span> 
            </a> 
            {if $node->getCmsMenu()->hasChildren()}
                <ul>
                    {foreach $node->getCmsMenu()->getChildren() as $child}             
                       {include file="./sitemap/_node.tpl" node=$child}     
                    {/foreach}
                </ul>
            {/if} 
    </li> 
{else}
    {if $node->getCmsMenu()->hasChildren()}               
        {foreach $node->getCmsMenu()->getChildren() as $child}             
           {include file="./sitemap/_node.tpl" node=$child}     
        {/foreach}                
    {/if}  
{/if}
