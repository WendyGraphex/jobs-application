<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="{$_request->getCountry()}" xml:lang="{$_request->getCountry()}">
    <head>{header}        
          <link rel="stylesheet" type="text/css" href="web/css/FooTable-2/css/footable.core.css"/>
          <script src="web/js/FooTable-2/footable.js" type="text/javascript"></script>
          <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0"/>
        
    </head>
  
    <body>
        <!-- theme base superadmin -->
        <div id="body">   
            <div id="banner">{component name="/default/banner"}</div>
            <div id="top">
                
            </div>
            <div id="myProfile">
                 {component name="/dashboard/info"}{component name="/license_manager/display"}
                <ul class="profile-list">
                {component name="/users_guard/user"}
                </ul>
            </div> 
                <div class="tabs-home">    
            {component name="/dashboard/tabHome"}
            </div>
            <div id="bottom">{reference name="bottom"}</div>           
        </div>      
    </body>
</html>