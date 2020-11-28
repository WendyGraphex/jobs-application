{if $tpl=="top"}
    <div class="navbar nav-bottom row">  
        <nav class="navbar-nav navbar-expand-lg navbar-light bg-light">
            <button class="navbar-toggler" type="button">
                <span class="navbar-toggler-icon">&#9776;</span>
            </button>           
            {if $children}
                <div  class="navbar-collapse" id="navbarSupportedContent">
                    {component name="/medica_appweb/MenuItemFavorites"}
                    {foreach $children as $child}    
                        {*  {$child@last} bug smarty *}
                    
                        {include file="./menu/_top_node.tpl" class=$node->get('name') node=$child levelStart=$child->getCmsMenu()->get('level') first_level=true}
                    {/foreach}
                </div>    
            {/if}
        </nav>
    </div>
{elseif $tpl=="left"}
      <div class="col-md-2 col-xs-11 menu">
        {if $children}
            
                {foreach $children as $child}    
                    {*  {$child@last} bug smarty *}
                    
                    {include file="./menu/_left_node.tpl" class=$node->get('name') node=$child levelStart=$child->getCmsMenu()->get('level') first_level=true}
                {/foreach}
                
          {*  <script type="text/javascript"> 
            {JqueryScriptsReady}       
                    $("#jMenu-{$node->get('name')}{if $menu_id}-{$menu_id}{/if}").jMenu();        
            {/JqueryScriptsReady} 
            </script> *}
        {/if}
      </div>
{/if}