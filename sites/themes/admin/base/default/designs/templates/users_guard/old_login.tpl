<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  lang="{$_request->getCountry()}">
    <head>
        
        {header} 
    {*    <link rel="stylesheet" type="text/css" href="http://www.ewebsolutionskech-dev.com/admin/web/css/main.css"/>
   <!--  <script type="text/javascript" src="http://www.ewebsolutionskech-dev.com/admin/web/js/jquery-1.7.min.js"></script> -->  *}
    
     <link rel="stylesheet" type="text/css" href="/web/css/font-awesome-4.1.0/css/font-awesome.min.css"/> 
    </head>  
    <body>
        <div  id="body" class="body-login Login-Container">
            <div id="middle" class="middle-login">
                 <div class="logo">                       
                         <img  src="/admin/web/pictures/logoLogin.png"/>                     
                 </div>
                <div class="login-p Login-Block">
                {messages class="errors"}
                <span class="tile-login">{__("login")}</span>
                {if $time_out>0}
                <div>
                    {__("The session has expired")}
                </div>
                {/if}
                <form  class="login-form" name="f_authent" id="f_authent" action="" method="post">
                    <div class="form-group">
                            {$form.username->getError()}          
                                <label>{__("Username")}</label>
                                <input type="text" id="f_login" name="Signin[username]" />
                    </div>      
           
                       <div class="form-group">    
                            {$form.password->getError()}
                                <label>{__("Password")}</label>
                                <input type="password" id="f_password" name="Signin[password]"/>
                       </div>
                        <div class="form-group">   
                            <div>
                                <label>{__("Remember me")}</label>
                                <input type="checkbox" name="Signin[remember]" {if $form.remember->getValue()}checked="checked"{/if}/>
                            </div>
                            
                               {*  <input type="submit" style="font-size: 6pt" value="."/>  *}
                        </div>
                    <center> <a href="#" class="enter">{__('Login')}<i class="fa fa-chevron-right" style="margin-left: 10px;"></i></a> </center>
                    <input type="hidden" class="site" name="Signin[token]"  value="{$form->getCSRFToken()}" />  
                </form>
                </div>
            </div>
            <div id="bottom">
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