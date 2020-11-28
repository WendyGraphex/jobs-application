<div id="cms_pages_menu">
{if $children}
    <ul id="jMenu">
        {foreach $children as $child}           
            {include file="./menu/_node.tpl" node=$child levelStart=$child->getCmsMenu()->get('level')}         
        {/foreach}
    </ul> 
    {stylesheets}   
    <script type="text/javascript"> 
    {JqueryScriptsReady}
        
        if ($(".tree_node").length)
            $("#jMenu").jMenu();

    {/JqueryScriptsReady} 
    </script>
{/if} 
</div>