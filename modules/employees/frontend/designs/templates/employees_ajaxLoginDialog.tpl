<div class="ModalLogin modal-dialog" style="width: 50%;">
    <div class="modal-content">
        <div class="modal-header">         
            <button type="button" class="ModalLogin-close close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
            <div class="FormCard card-container">
                <img id="profile-img" class="profile-img-card" src="/web/pictures/avatar_2.png" />
                <p id="profile-name" class="profile-name-card"></p>

                <span id="reauth-email" class="reauth-email"></span>
                <input type="email" id="inputEmail" class="form-control Input Login" name="username" placeholder="{__('Enter your email')}" required autofocus>
                <input type="password" id="inputPassword" class="form-control Input Login" name="password" placeholder="{__('Password')}" required>
                <div id="remember" class="checkbox">
                    <label>
                        <input type="checkbox" value="remember-me"> {__('Remember me')}
                    </label>
                </div>
                <button class="btn btn-lg btn-primary btn-block btn-signin" id="Login" type="submit" style="background-color: #d8c209;">{__('Login')}</button>
                <div style="text-align: center;border-bottom: 1px solid #b9b0b0;margin-bottom: 15px;color: #999;position: relative;height: 15px;margin-top: 15px;">
                    <span style="position: absolute;bottom: -10px;background-color: #fff;width: 40px;right: 45%;">{__('Or')}</span>
                </div>

                <div class="row" style="padding-top: 10px;padding-bottom: 10px;">
                    <div class="col-md-6">
                        {component name="/facebook_oauth/oauthBtnEmployee" target="_blank"}
                    </div>
                    <div class="col-md-6">
                        {component name="/google_oauth/oauthBtnEmployee" target="_blank"}
                    </div>
                </div>
                <div class="row">
                    {*<div class="col-md-6">
                        {component name="/linkedin_oauth/oauthBtnEmployee" target="_blank"}  
                    </div>*}
                    <div class="col-md-6">
                        {component name="/instagram_oauth/oauthBtnEmployee" target="_blank"}  
                    </div>
                </div>
                <div class="text-center mt-4 font-weight-light">
                    {__("Don't have an account?")} <a href="{link_i18n('employees_signin')}" target="_blank" class="text-primary">{__('Create')}</a>
                </div>
            </div>                     
        </div>
    </div>
</div>
 <script type="text/javascript">
        
   
    //$(".ModalLogin-close").click(function(){  $("#DialogEmployerMessage,#DialogEmployeeMakeOffer").modal('hide');  });
            
       
    $("#Login").click(function () { 
         var params = {  EmployeeLogin : {  token : '{mfForm::getToken('EmployeeUserGuardForm')}' } };
         $(".Login.Input").each(function () { params.EmployeeLogin[$(this).attr('name')]=$(this).val(); });
         return $.ajax2({ data : params,               
                          url :"{url_to('employees_ajax',['action'=>'Login'])}",   
                          success : function (resp) { 
                            if (resp.errors)
                            {
                                $('.Input').keyup(function () { 
                                    $(".Input").removeClass('intro');
                                });
                                $.each(resp.errors,function (name,error) { $(".Input[name="+name+"]").addClass('intro'); });
                                return ;
                            }
                            $("#DialogEmployerMessage,#DialogEmployeeMakeOffer").modal('hide');  
                            $("#Employee-login-link").css('display','block');
                          }                         
          }); 
     });
</script> 
