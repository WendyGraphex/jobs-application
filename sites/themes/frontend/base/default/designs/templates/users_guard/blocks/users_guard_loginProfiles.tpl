{messages class="login-account-errors"} 
{if $user->hasProfiles()}    
    <div>
    {foreach $user->getProfiles() as $profile}
        <div>
        {if $profile->getClass()=='CustomerUser'}
            <a href="#" class="Profiles" id="private">{__('Private')}</a>
        {else}
            <a href="#" class="Profiles" id="professional">{__('Professional')}</a>
        {/if}   
        </div>
    {/foreach} 
    </div>
    <script type="text/javascript">
    {*JqueryScriptsReady*}    
      $(".Profiles").click(function() { 
             var params = { LoginProfile: {                 
                                profile: $(this).attr('id'),
                                token: '{mfForm::getToken('LoginProfileForm')}'  } };                   
             return $.ajax2({ data : params,
                              url : "{url_to('users_guard_ajax',['action'=>'LoginProfile'])}",     
                              errorTarget: ".login-account-errors",
                              success: function (resp)  
                                       {
                                           
                                       }
                  }); 
      });
    {*/JqueryScriptsReady*}
</script>
{else}    
    <div class="col-md-6 account">
        <div class="account-title">{__('Connexion')}</div>
<div class="form-group">
            <div class="error-log">{$form.email->getError()}</div>
            <label>{__("Email")}</label>
            <input type="text" class="LoginProfiles Input form-control" name="email" value="{$form.email}"/>
</div>
<div class="form-group">
   <div class="error-log"> {$form.password->getError()} </div>                
   <label>{__("Password")}</label>
   <input type="password" class="LoginProfiles Input  form-control" name="password"/>
</div>
             <label style="display:inline;"> {__("Remember me")}</label>
                                <input type="checkbox" class="LoginProfiles Checkbox" name="remember" {if $form.remember->getValue()}checked="checked"{/if}/>                                                        
    
                                <a href="javascript:void(0);" id="LoginProfiles" class="pull-right enter btn btn-primary">{__('Login')}
              <i class="fa fa-chevron-right" style="margin-left: 10px;"></i></a>        
       </div>       
<script type="text/javascript">
    {*JqueryScriptsReady*}
        
     $('#LoginProfiles').click(function(){  
             var params = { LoginProfiles: {                               
                                token: '{$form->getCSRFToken()}'  } };
             $(".LoginProfiles.Input").each(function () { params.LoginProfiles[$(this).attr('name')]=$(this).val(); });
             $(".LoginProfiles.Checkbox:checked").each(function () { params.LoginProfiles[$(this).attr('name')]=true; });            
             return $.ajax2({ data : params,
                              url : "{url_to('users_guard_ajax',['action'=>'LoginProfiles'])}",     
                              errorTarget: ".login-account-errors",
                              target: "#account-ctn" }); 
      });
             
    {*/JqueryScriptsReady*}
</script>              
{/if}