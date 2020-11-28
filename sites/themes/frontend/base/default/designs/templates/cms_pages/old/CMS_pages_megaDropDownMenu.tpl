{if $children}
    {stylesheets}
 
    <script type="text/javascript"> 
    {JqueryScriptsReady}       
           {* $("#jMenu-{$node->get('name')}{if $menu_id}-{$menu_id}{/if}").jMenu();         *}
    {/JqueryScriptsReady} 
    </script>
{/if}