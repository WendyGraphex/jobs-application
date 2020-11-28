<div id="cms_pages_menu_node-{$node->get('name')}">   
{if $children}
    {stylesheets}
    <ul id="jMenu-{$node->get('name')}">
        {foreach $children as $child}           
            {include file="./menu/_node.tpl" class=$node->get('name') node=$child levelStart=$child->getCmsMenu()->get('level')}         
        {/foreach}
    </ul>    
    <script type="text/javascript"> 
    {JqueryScriptsReady}       
            $("#jMenu-{$node->get('name')}").jMenu();        
    {/JqueryScriptsReady} 
    </script>
{/if}
</div>