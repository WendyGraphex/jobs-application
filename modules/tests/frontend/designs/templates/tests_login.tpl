<!DOCTYPE html>
<html   lang="{$_request->getCountry()}">
    <head>{header}        
    </head>  
    <body>
        <div id="body" class="body-login">
            <div id="middle" class="middle-login">
                <div class="login-p">
                {messages}
                <h3>{__("Login - Mobile")}</h3>              
                <form  class="login-form" name="f_authent" id="f_authent" action="/mobile/customers/admin/login" method="post">
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td></td>
                            <td>{$form.email->getError()}</td>
                        </tr>
                        <tr>
                            <td class="label">
                                <label>{__("Email")}</label>
                            </td>
                            <td>
                                <input type="text" id="f_login" name="email" />
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>{$form.password->getError()}</td>
                        </tr>
                        <tr>
                            <td class="label">
                                <label>{__("Password")}</label>
                            </td>
                            <td>
                                <input type="password" id="f_password" name="password"/>
                            </td>
                        </tr>                          
                        <tr>
                            <td class="btn-login">
                               {*  <input type="submit" style="font-size: 6pt" value="."/>  *}
                        <center> <a href="#" class="enter btn">{__('Login')}<i class="fa fa-chevron-right" style="margin-left: 10px;"></i>{*<img src="{url('/icons/login.gif','picture')}" alt="login"/>*}</a> </center>
                           <td>
                        </tr>
                    </table>                    
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