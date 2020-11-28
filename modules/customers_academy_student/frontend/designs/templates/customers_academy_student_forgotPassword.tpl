<!DOCTYPE html>
<html lang="{$_request->getLanguage()}" xml:lang="{$_request->getLanguage()}">
<head>
    
    
    <link rel="stylesheet" href="{url('majestic/css/vendors/mdi/css/materialdesignicons.min.css','web')}">
    <link rel="stylesheet" href="{url('majestic/css/vendors/base/vendor.bundle.base.css','web')}">
    <!-- endinject -->
    <!-- plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="{url('/css/style.css','web')}">
    <!-- endinject -->
    <link rel="shortcut icon" href="../../images/favicon.png" />
    
    
    {header}
</head>  
<body class="signInBody">
       {* <div id="body">  *}                 
  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5 classTopForgotPass">
              <div class="brand-logo text-center">
                 {if $_request->getSite()->getSite()->hasPicture()}
                  <a href="/"><img src="{$_request->getSite()->getSite()->getPicture()->getUrl()}"/></a>           
                {else}
                   <a href="/"><img src="/web/pictures/logos/logo.png"></a>            
                {/if}
              </div>
            <div id="actions" class="actionsPaddingTop">
              <h4>{__("Forgot your password?")}</h4>
                <div class="form-group">
                  <div class="errors" name="email"></div> 
                  <div class="input-group error" name="email">
                    <div class="input-group-prepend bg-transparent">
                        <span class="input-group-text bg-transparent border-right-0">
                          <i class="mdi mdi-account-outline text-primary"></i>
                        </span>
                    </div>
                  <input type="text" name="email" class="CustomerAcademyStudentUserPassword Fields Input form-control form-control-lg" placeholder="{__('Email')}">
                </div>
                </div>
                <div class="mt-3">
                  <a class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" id="Send" href="#">{__('Send')}</a>
                </div>
                
            </div>
            </div>
          </div>
        </div>
      </div>
                     
<script type="text/javascript">
    {JqueryScriptsReady}

    $('#Send').click(function(){                             
            var  params= {           
                    CustomerAcademyStudentUserForgotPassword: {   
                       email : $(".CustomerAcademyStudentUserPassword[name=email]").val(),
                       token :'{mfForm::getToken('CustomerAcademyStudentUserForgotPasswordForm')}'
                    } };                             
            return $.ajax2({ data : params,                          
                url: "{url_to('customers_academy_student_ajax',['action'=>'ForgotPassword'])}",
                success : function (resp)
                        {
                          if (resp.errors && resp.action=='ForgotPassword'){
                               $.each(resp.errors,function (name,error) {
                                   $(".error[name="+name+"]").addClass('intro');
                               });
                               $(".Errors[name=email]").html(resp.errors.email);
                           }else
                              $("#actions").html(resp);
                        }
              }); 
       }); 
       $(".error").click(function () { 
             $(this).removeClass('intro');
          });
    {/JqueryScriptsReady}
   </script>
        </div>           
    </div>   
</body>
</html>