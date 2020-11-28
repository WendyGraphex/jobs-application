<div id="cms_pages_menu_node-{$node->get('name')}{if $menu_id}-{$menu_id}{/if}">   
{if $children}
    {stylesheets}
    <ul id="jMenu-{$node->get('name')}{if $menu_id}-{$menu_id}{/if}">
        {foreach $children as $child}    
            {*  {$child@last} bug smarty *}
            {include file="./menu/_node.tpl" class=$node->get('name') node=$child levelStart=$child->getCmsMenu()->get('level') first_level=true}
        {/foreach}
    </ul>    
    <script type="text/javascript"> 
    {JqueryScriptsReady}       
            $("#jMenu-{$node->get('name')}{if $menu_id}-{$menu_id}{/if}").jMenu();        
    {/JqueryScriptsReady} 
    </script>
{/if}
</div>