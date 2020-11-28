{stylesheets}
<div id="SideBar-Manager">
     <span class="sidebar-btn"><i class="fa fa-chevron-left"></i></span>
     <div class="sidebar-content">
            <h1>{__('Notifications')}</h1>
            {foreach $notifications->getComponents() as $notification}                                
                {component name=$notification->get('component')}
            {/foreach}    
     </div>
</div>
<script type="text/javascript">
    
     {JqueryScriptsReady}                                        
     
        $( "#SideBar-Manager" ).slidebar({
               autoOpen : false,
               time : 5000
            
           });
     {/JqueryScriptsReady}
</script>      