<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="{$_request->getLanguage()}" xml:lang="{$_request->getLanguage()}">
    <head>
        
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <meta name="viewport" content="width=device-width" />
            <!-- plugins:css -->
            <link rel="stylesheet" href="{url('majestic/css/vendors/mdi/css/materialdesignicons.min.css','web')}">
            <link rel="stylesheet" href="{url('majestic/css/vendors/base/vendor.bundle.base.css','web')}">
            <!-- endinject -->
            <!-- plugin css for this page -->
            <!-- End plugin css for this page -->
            <!-- inject:css -->
            <!-- endinject -->
            <link rel="shortcut icon" href="../../images/favicon.png" />
            <link rel="stylesheet" href="{url('majestic/css/font-awesome/4.7.0/font-awesome.min.css','web')}">
            <!-- endinject -->
            <!-- plugin css for this page -->
            <!-- End plugin css for this page -->
            <!-- inject:css -->
            <link rel="stylesheet" media="all"  href="{url('css/style.css','web','frontend')}">
            <!-- endinject -->
            <link rel="shortcut icon" href="../../images/favicon.png" />
            
    
        {header}
    </head>
<body class="New_Password signInBody">    
 <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0" id="actions">
        <div class="row w-100 mx-0">
          <div class="col-lg-4 mx-auto">
            <div id="page-wrapper" class="auth-form-light text-center py-5 px-4 px-sm-5 classTopForgotPass">
                {alerts}
                <div class="New_Password-header text-center">
                    <img title="Logo" class="logo" src="{$_request->getSite()->getSite()->getPicture()->getUrl()}{*url("/pictures/logos/logo.png","web","frontend")*}" alt="Logo Signup" style="width: 150px;">              
                </div>
                <p class="mt-3" style="font-size: 21px;text-align: center;">{__('Please create a new password!')}</p>

                    <!--Error Empty field-->
               <div class="Errors row error center-block text-center" name="empty_field" style="display:none;">
                     
               </div>
              <!--Error -->
              <div class="Errors row error center-block text-center" name="password" style="display:none;">
               
              </div> 
            <div class="PaddingTop">
	       <div class="form-group size center-block">
    		    <div class="inner-addon left-addon center-block">
                     <div class="input-group" data-name="password">
                        <div class="input-group-prepend bg-transparent">
                            <span class="input-group-text bg-transparent border-right-0">
                              <i class="mdi mdi-lock-outline text-primary"></i>
                            </span>
                        </div>
    			<input  type="password" class="styleInputPassword form-control-s form-control-lg-s center-block user_password Fields Input" data-toggle="popover" data-html='true' data-placement="top" autocomplete="off" placeholder="{__('Nouveau mot de passe')}" name="password"/>
                        <a href="javascript:void();" id="SeePassword" class="SeePassword see-pw"><i id="eye" class="fa fa-eye-slash"></i></a>
  		     </div>
		  </div>
                </div>        
  		<div class="form-group size center-block">
    		  <div class="inner-addon left-addon center-block">
                    <div class="input-group" data-name="repassword">
                        <div class="input-group-prepend bg-transparent">
                            <span class="input-group-text bg-transparent border-right-0">
                              <i class="mdi mdi-lock-outline text-primary"></i>
                            </span>
                        </div> 
    			<input  type="password" class="styleInputPassword form-control-s form-control-lg-s center-block user_password  Fields Input" data-toggle="popover" data-html='true' data-placement="top" autocomplete="off" placeholder="{__('Confirm your password')}" name="repassword"/>
                        <a href="javascript:void();" id="" class="SeePassword see-pw" style="display: none;"><i id="eye" class="fa fa-eye-slash"></i></a>
  		    </div>
                   </div>
  		</div>
                    
                <div class="form-group btnSize center-block">
                      <center> <a href="#" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn btn-pw-forgot" id="Send" data-loading-text="{__('Send')}<i class='fa fa-spinner fa-spin'></i>">{__('Send')}</a> </center>
                </div>
            </div>
                

              {* <div class="form-group btnSize center-block text-center" style="display:none;">                        
                   <a href="{link_i18n('site_event_contact')}" class="btn btn-warning btn-lg btn-perspective btn-block btn-pw-Contact">{__('Contact')}</a>
               </div> *}
             </div>        
          </div>        
        </div>  
      </div> 
    </div>
 </div>  
  <script src="{url('js/jquery/2.2.4/jquery-2.2.4.min.js','web')}"></script>                  
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="{url('majestic/js/vendors/base/vendor.bundle.base.js','web')}"></script>
  <!-- endinject -->
  <!-- inject:js -->
  <script src="{url('majestic/js/off-canvas.js','web')}"></script> 

  <script src="{url('js/jquery.custom.js','web')}"></script> 
  <!-- endinject -->
  <script src="{url('majestic/js/hoverable-collapse.js','web')}"></script>
  <script src="{url('majestic/js/template.js','web')}"></script>
         
<script type="text/javascript">
       {JqueryScriptsReady}
           
       
           $(".SeePassword").click(function () {
                $(".user_password").attr('type',($(".user_password").attr('type')=='text'?'password':'text')); 
                $("#eye").toggleClass("fa-eye-slash").toggleClass("fa-eye");
                if($(".user_password").attr('type')=='text')
                {
                   setTimeout(function() { 
                    $(".user_password").attr('type',($(".user_password").attr('type')=='text'?'password':'text'));
                    $("#eye").toggleClass("fa-eye-slash").toggleClass("fa-eye");
                   }, 10000); 
                }                      
            }); 
            
           $(".Fields").click(function () { $("div[data-name='password'],div[data-name='repassword']").removeClass('intro');});
          
           $("#Send").click(function () { 
                            var params = { EmployerUserForgotPasswordChange :  { 
                                        key: '{$forgot->get('key')}',
                                        token : "{mfForm::getToken('SiteEventUserForgotPasswordChangeForm')}"
                                    } };
                          $(".Fields.Input").each(function () { params.EmployerUserForgotPasswordChange[$(this).attr('name')]=$(this).val(); });                            
                          //  alert('Params='+params.toSource());
                          $("#Send").button('loading');
                            return $.ajax2({ 
                                data : params,                              
                                url:"{url_to('site_event_ajax',['action'=>'ForgotPasswordChange'])}",
                                 error : function (resp) {
                                     $("#Send").button('reset');
                                    
                                    if (resp.errors && resp.errors.password && resp.errors.password=='required' || resp.errors.repassword && resp.errors.repassword=='required')
                                    {
                                         $("input[name='password']" ).attr('data-content',$(".Errors[name='empty_field']").html());
                                         //$("input[name='password']").popover("show");
                                         $.each(resp.errors , function(key, val){
                                             if (val==='required')
                                             {
                                                $("div[data-name="+key+"]").addClass('intro');
                                             }
                                         });
                                    }
                                    else if(resp.errors && resp.errors.password == '==')
                                     {
                                           $("input[name='password']" ).attr('data-content',$(".Errors[name='password']").html());
                                           //$("[data-toggle='popover']").popover("show");
                                           $("div[data-name='password'],div[data-name='repassword']").addClass('intro');
                                     }
                                     if (resp.action!='forgotPasswordChange' || !resp.errors) return ;
                                 },
                                 success: function (resp)
                                 { 
                                    //  $("#Send").button('reset');
                                    //  $("#actions").html(resp);
                                 }
                            });
            });
        
  
  
       {/JqueryScriptsReady}
 </script>
 
 </body>
</html>

