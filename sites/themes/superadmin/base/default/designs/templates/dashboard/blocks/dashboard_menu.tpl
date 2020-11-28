<div id="menu_dashboard"> 
    {messages class="menu-dashboard-errors"}
{if $menu} 
    <ul class="menu-admin" >     
     {foreach $menu as $name=>$item_0}
        {if $user->hasCredential($item_0->get('credentials'))}       
            {component name=$item_0.component}        
        {/if}    
     {/foreach}  
      </ul>   
{/if}
</div>    
 <script type="text/javascript">
     
      {JqueryScriptsReady}         
        
        $(".items").click(function(){          
           return  $.ajax2({ url: $(this).attr('href'),
                             loading: "#tab-dashboard-superadmin-loading", 
                             errorTarget: ".menu-dashboard-errors",
                             target: "#tab-dashboard-superadmin-content"});                      
        });
        
       {/JqueryScriptsReady} 
</script>