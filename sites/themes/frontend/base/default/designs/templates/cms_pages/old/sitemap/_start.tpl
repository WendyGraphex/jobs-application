{if $children}   
    <ul>
        {foreach $children as $child}           
            {include file="./sitemap/_node.tpl" node=$child levelStart=$child->getCmsMenu()->get('level')}         
        {/foreach}     
    </ul>    
{/if} 
