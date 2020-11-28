<!DOCTYPE html>
<html   lang="{$_request->getCountry()}">
    <head>{header}        
    </head>  
    <body>
        <div id="body" class="body-login">
            <div id="middle" class="middle-login">
                <div class="login-p">
                {messages}
                <h3>{__("Logout - Mobile")}</h3>              
                <form  class="login-form" name="f_authent" id="f_authent" action="/mobile/users/guard/admin/logout" method="post">
                    
                                <input type="hidden" id="f_password" name="token" value="{mfFormMobile::getToken()}"/>
                                                     
                        <center> <a href="#" class="enter">{__('Logout')}<i class="fa fa-chevron-right" style="margin-left: 10px;"></i>{*<img src="{url('/icons/login.gif','picture')}" alt="login"/>*}</a> </center>
                                           
                </form>
                </div>
            </div>          
        </div>
        <script type="text/javascript">
            // ID=login[d56b699830e77ba53855679cb1d252da] {* mandatory md5(login) for iframe upload files not remove *}
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