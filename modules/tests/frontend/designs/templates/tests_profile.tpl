<!DOCTYPE html>
<html   lang="{$_request->getCountry()}">
    <head>{header}        
    </head>  
    <body>
        <div id="body" class="body-login">
            <div id="middle" class="middle-login">
                <div class="login-p">
                {messages}
                <h3>{__("Profile - Mobile")}</h3>              
                <div>
                <form  class="login-form" name="f_authent" id="f_authent" action="/mobile/users/guard/admin/profile" method="post">
                    {if $profiles->hasProfiles()}
                     {html_options name="profile" options=$profiles->getProfilesForSelect()}                       
                     {else}
                         <div>{__('No profile')}</div>
                     {/if}    
                        <center> <a href="#" class="enter">{__('Send profile')}<i class="fa fa-chevron-right" style="margin-left: 10px;"></i>{*<img src="{url('/icons/login.gif','picture')}" alt="login"/>*}</a> </center>                         
                    <input type="hidden" id="f_password" name="token" value="{mfFormMobile::getToken()}"/>
                </form>
                </div>
            </div>          
        </div>
        <script type="text/javascript">
          
            $(document).ready(function()
            {
                   $(".enter").click(function() {   
                       $('#f_authent').submit(); 
                   });
                   
                   $(document).keypress(function(event) {
                        if (event.keyCode==13)
                              $('#f_authent').submit();
                   }); 
            }); 
        </script>
        
       
    </body>
</html>