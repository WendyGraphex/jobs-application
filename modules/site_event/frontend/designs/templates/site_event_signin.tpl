<!DOCTYPE html>
<html lang="{$_request->getCountry()}">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <title>{component name="/site_company/Display" field='name' COMMENT=false} - {__('Employer - Signin')}</title> 
   <link rel="short icon" type="image/png" href="/web/pictures/favicon-graphex.png"/>
  <!-- plugins:css -->
  <link rel="stylesheet" href="{url('majestic/css/vendors/mdi/css/materialdesignicons.min.css','web')}">
  <link rel="stylesheet" href="{url('majestic/css/vendors/base/vendor.bundle.base.css','web')}">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="{url('/css/style.css','web')}">
  <!-- endinject -->
  <link rel="shortcut icon" href="../../images/favicon.png" />
  <style>
    .contentDiv{
        background:#f3f3f3;
        padding: 2.1rem 1.04rem;
        width: 100%;
        flex-grow: 1;
    }
</style>
</head>

<body class="signInBody" style="background-image: url('/web/files/pictures/sign6.jpg');background-repeat: no-repeat;background-size: cover;">
  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0 {*contentDiv*}">
        <div class="row w-100 mx-0">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
              <div class="brand-logo">
                 {if $_request->getSite()->getSite()->hasPicture()}
             <a href="/"><img src="{$_request->getSite()->getSite()->getPicture()->getUrl()}"/></a>           
         {else}
            <a href="/"><img src="/web/pictures/logos/logo.png"></a>            
         {/if}
              </div>
            <div id="actions" class="SignInDiv">
                <h4>{__('New here?')}</h4>
                <h6 class="font-weight-light">{__('Signing up is easy. It only takes a few steps')}</h6>                
                    <div class="col-md-12 classPadding">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group" name="gender">
                                    <div class="errors" name="gender"></div>   
                                    {html_options style="padding-left: 2px;" name="gender" class="Signup Fields Select form-control form-control-lg error" options=$form->gender->getOption("choices")}                
                                </div>
                            </div>
                             <div class="col-md-8">
                                <div class="form-group" name="firstname">
                                    <div class="errors" name="firstname"></div>     
                                    <input type="text" name="firstname" class="Signup Fields Input form-control form-control-lg error" placeholder="{__('First name')}">
                                </div>
                            </div>
                        </div>
                    </div>

                <div class="form-group" name="lastname">
                    <div class="errors" name="lastname"></div>     
                  <input type="text" name="lastname" class="Signup Fields Input form-control form-control-lg error" placeholder="{__('Last name')}">
                </div>
                
                <div class="form-group" name="email">
                    <div class="errors" name="email"></div>     
                    <div class="input-group mb-3 error" name="password">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1"><i class="mdi mdi-account"></i></span>
                        </div>
                        <input type="email" name="email" class="Signup Fields Input form-control form-control-lg"  placeholder="{__('Email')}">
                        <span id="validateEmailValid" class="validateEmail" style="color:#09ad7e;display:none;position: absolute;right:-24px;top: 0px;font-size: 22px;"><i class="mdi mdi-checkbox-marked-circle"></i></span>
                        <span id="validateEmailNotValid" class="validateEmail" style="color:#ff0000;display:none;position: absolute;right:-24px;top: 0px;font-size: 22px;"><i class="mdi mdi-close-circle"></i></span>
                    </div>
                </div>
                <div class="form-group" >
                    <div class="errors" name="password"></div>     
                    <div class="input-group mb-3 error" name="password">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1"><i class="mdi mdi-lock"></i></span>
                        </div>
                        <input type="password" name="password" class="Signup Fields Input form-control form-control-lg" placeholder="{__('Password')}">
                    </div>
                </div>
                
                <div class="mb-4">
                    
                <div class="custom-control custom-checkbox custom-control-inline">                 
                  {component name="/site_event_order/conditionsLink" tpl="signin"}
                </div>
                </div>
                <div class="mt-3">
                  <a class="nonePointerBtn btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" id="Signup" href="#">{__('SIGN UP')}</a>
                </div>
                <div class="text-center mt-4 font-weight-light">
                  {__('Already have an account?')} 
                  <a href="{link_i18n("site_event_user_login")}" class="text-primary">{__('Login')}</a>
                </div>                                
            </div>
            </div>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="{url('/majestic/js/vendors/base/vendor.bundle.base.js','web')}"></script>
  <!-- endinject -->
  <!-- inject:js -->
  <script src="{url('/majestic/js/off-canvas.js','web')}"></script> 
 {* <script src="{url('js/hoverable-collapse.js','web')}"></script> 
  <script src="{url('js/template.js','web')}"></script> *}
  <script src="{url('/majestic/js/jquery/2.2.4/jquery-2.2.4.min.js','web')}"></script> 
  <script src="{url('js/jquery.custom.js','web')}"></script> 
  <!-- endinject -->
  
<script type="text/javascript">
    
    $('#defaultInline1').change(function() {
        if(this.checked)           
            $('#Signup').removeClass('nonePointerBtn');       
        else         
            $('#Signup').addClass('nonePointerBtn');       
    });
    
       $(function(){
              
            $("#Signup").click(function () { 
                if ($(this).hasClass('isBusy')) return ;
                $(this).addClass('isBusy');
                var params = { Signup: { token : '{mfForm::getToken('SiteEventUserSigninForm')}' } };
                $(".Signup.Input").each(function () { params.Signup[$(this).attr('name')]=$(this).val(); });
                $(".Signup.Radio:checked").each(function () { params.Signup[$(this).attr('name')]=$(this).val(); });
                $(".Signup.Select option:selected").each(function () { params.Signup[$(this).parent().attr('name')]=$(this).val(); });
                return $.ajax2({  data : params,                               
                                  url:"{url_to('site_event_ajax',['action'=>'Signin'])}", 
                                  success : function (resp)
                                       {         
                                            $("#Signup").removeClass('isBusy');
                                            if (resp.errors && resp.action =='Signin')
                                            {
                                                //$.each(resp.errors,function (name,error) { $(".errors[name="+name+"]").html(error); });
                                                //$.each(resp.errors,function (name) { $(".Input[name="+name+"]").css({ "background-color": "yellow !important"}); });
                                                 $.each(resp.errors,function (name) { $(".error[name="+name+"]").addClass("intro"); });
                                            }  
                                            else
                                            {
                                                $.each(resp.errors,function (name) { $(".Fields[name="+name+"]").removeClass("intro"); });
                                                $("#actions").html(resp);
                                            }    
                                        }

                });
            });
            
            
             $(".error").click(function () {
                 $(".error").removeClass("intro");
             });
            
            

             $(".Fields.Input[name=email]").keyup(function () { 
                      $(".validateEmail").hide();                    
                      var r = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{ldelim}1,3{rdelim}\.[0-9]{ldelim}1,3{rdelim}\.[0-9]{ldelim}1,3{rdelim}\.[0-9]{ldelim}1,3{rdelim}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{ldelim}2,{rdelim}))$/;
                      if (!r.test($(this).val()))
                         return ;
                      return  $.ajax2({ data : { EmailChecker: { email: $(this).val(), token : '{mfForm::getToken('SiteEventUserCheckEmailForm')}' } },                              
                                url:"{url_to('site_event_ajax',['action'=>'CheckEmail'])}",  
                                success : function (resp)
                                    {                                             
                                        if (resp.action!='CheckEmail') return ;
                                        if (resp.status!='OK'){ 
                                           $("#validateEmailNotValid").show();
                                        } else {
                                           $("#validateEmailNotValid").hide();
                                           $("#validateEmailValid").show(); 
                                             
                                        }
                                    }
                        });
                });
            
        });  
        
        
        
</script> 
  
  
</body>

</html>



