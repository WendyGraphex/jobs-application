<!DOCTYPE html>
<html lang="{$_request->getLanguage()}">
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>{component name="/site_company/Display" field='name' COMMENT=false} - {__('Employer - Login')}</title> 
        <link rel="short icon" type="image/png" href="/web/pictures/favicon-graphex.png"/>
        <!-- plugins:css -->
        <link rel="stylesheet" href="{url('/majestic/css/vendors/mdi/css/materialdesignicons.min.css','web')}">
        <link rel="stylesheet" href="{url('/majestic/css/vendors/base/vendor.bundle.base.css','web')}">
        <!-- endinject -->
        <!-- plugin css for this page -->
        <!-- End plugin css for this page -->
        <!-- inject:css -->
        <link rel="stylesheet" href="{url('/majestic/css/style.css','web')}">
        <!-- endinject -->
        <link rel="shortcut icon" href="../../images/favicon.png" />

        {*<link rel="stylesheet" href="{url('css/font-awesome/4.1.0/css/font-awesome.min.css','frontend')}">*}
        <link rel="stylesheet" type="text/css" href="{url('/majestic/css/font-awesome/4.1.0/font-awesome.min.css','web')}"/>
        <!-- Bootstrap Core CSS -->
        <link href="/web/css/bootstrap.min.css" rel="stylesheet"/>
        <!-- Required meta tags -->

        {*<script src="{url('/majestic/js/vendor.bundle.base.js','web','admin')}"></script>*}
        {header} 
    </head>  
    <body>

        <div class="container-scroller">
            <div class="container-fluid page-body-wrapper full-page-wrapper">
                <div class="content-wrapper d-flex align-items-stretch auth auth-img-bg">
                    <div class="row flex-grow">
                        <div class="col-lg-6 d-flex align-items-center justify-content-center">
                            <div class="auth-form-transparent text-left p-3">
                                <div class="brand-logo">              
                                    {if $_request->getSite()->getSite()->hasPicture()}
                                        <a href="/"><img src="{$_request->getSite()->getSite()->getPicture()->getUrl()}"/></a>           
                                        {else}
                                        <a href="/"><img src="/web/pictures/logos/logo.png"></a>            
                                        {/if}
                                </div>
                                {alerts}
                                <h4>Welcome back to Graphex Academy !</h4>
                                <h6 class="font-weight-light">Happy to see you again!</h6>
                                <form class="pt-3" id="f_authent" action="" method="post">
                                    <div class="form-group">
                                        <div class="error-log"> {$form.username->getError()} </div>      
                                        <label for="exampleInputEmail">{__('Username/Email')}</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend bg-transparent">
                                                <span class="input-group-text bg-transparent border-right-0">
                                                    <i class="mdi mdi-account-outline text-primary"></i>
                                                    {*<i class="fa fa-user-circle-o"></i> *}	
                                                </span>
                                            </div>
                                            <input type="text" name="Login[username]" class="form-control form-control-lg border-left-0" id="exampleInputEmail" placeholder="{__('Username')}">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="error-log"> {$form.password->getError()} </div>      
                                        <label for="exampleInputPassword">{__('Password')}</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend bg-transparent">
                                                <span class="input-group-text bg-transparent border-right-0">
                                                    <i class="mdi mdi-lock-outline text-primary"></i>
                                                </span>
                                            </div>
                                            <input type="password" name="Login[password]" class="form-control form-control-lg border-left-0" id="exampleInputPassword" placeholder="{__('Password')}">                        
                                        </div>
                                    </div>
                                    <div class="my-2 d-flex justify-content-between align-items-center">                    
                                        <div class="form-check" style="padding-left: 0px !important;">
                                            <label class="form-check-label text-muted textSize" style="line-height: 1.0;margin-left: 1.75rem;font-size: 16px;">
                                                <input type="checkbox" class="form-check-input" name="Login[remember]" {if $form->getRemember()}checked="checked"{/if}>
                                                {__('Keep me signed in')}
                                            </label>
                                        </div>
                                        <a href="{link_i18n('customers_academy_student_forgot_password')}" class="auth-link text-black textSize" style="font-size: 16px;">{__('Forgot password?')}</a>
                                    </div>
                                    <div class="my-3 d-flex d-flex-lgn">       {*class="my-3"*}
                                        <a id="login" class="enter btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" href="#" style="padding-top: 11px;">{__('LOGIN')}</a> 
                                    </div>

                                    <div style="text-align: center;border-bottom: 1px solid #b9b0b0;margin-bottom: 30px;color: #999;position: relative;height: 15px;">
                                        <span style="position: absolute;bottom: -10px;background-color: #f3f3f3;width: 40px;right: 45%;">{__('Or')}</span>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 classPaddingBottom" style="padding-right: 5px;">
                                            {component name="/facebook_oauth/oauthBtnStudent"} 
                                        </div>
                                        <div class="col-md-6" style="padding-left: 5px;">
                                            {component name="/google_oauth/oauthBtnStudent"}  
                                        </div>
                                    </div>
                                    <div class="row" style="padding-top: 10px;">
                                        <div class="col-md-6 classPaddingBottom" style="padding-right: 5px;">
                                            {component name="/instagram_oauth/oauthBtnStudent"}
                                            
                                        </div>
                                         <div class="col-md-6" style="padding-left: 5px;">
                                            {component name="/linkedin_oauth/oauthBtnStudent"}  
                                        </div> 
                                    </div>

                                    <div class="text-center mt-4 font-weight-light">
                                        {__("Don't have an account?")} <a href="{link_i18n('customers_academy_student_signin')}" class="text-primary">{__('Create')}</a>
                                    </div>
                                    <input type="hidden" name="Login[token]"  value="{$form->getCSRFToken()}" /> 
                                </form>
                            </div>
                        </div>
                        <div class="col-lg-6 login-half-bg" style="background-color: rgb(18, 26, 59);padding-left: 0px !important;padding-right: 0px !important;">
                            <div class="divFirstImageLogin">
                                <img src="/web/pictures/login-employee2.jpg" style="width: 100%;"/>
                                <h3 class="titleClassGlobal">{__('Welcome to Graphex Technology')}</h3>
                            </div>
                            <div class="divImageLogin">
                                <img src="/web/pictures/login-student.jpg" style="width: 100%;"/>
                            </div>
                            <div>
                                <p class="paragraphLogin">
                                    {__('By clicking “Sign Up”, you agree to Graphex’s Terms of Use and acknowledge you have read the Privacy Policy.<br/>  
                        You also consent to receive calls or SMS messages, including by automated dialer,<br/>  
                        from Graphex and its affiliates to the number you provide for informational and/or marketing purposes.<br/>  
                        Consent to receive marketing messages is not a condition to use Graphex’s services.<br/>  
                        You understand that you may opt out by texting “STOP’ or unsubscribe at anytime.')}<br/>
                                </p>
                            </div>
                            <div class="divLastImageLogin">
                                <img src="/web/pictures/global-bottom-2.jpg"/>
                                <h3 class="titleClassGlobal classTitleSize">{__('Graphex Technology Team')}</h3>
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
        <script src="{url('/majestic/js/hoverable-collapse.js','web')}"></script>
        <script src="{url('/majestic/js/template.js','web')}"></script>
        <script type="text/javascript">
            // ID=login[d56b699830e77ba53855679cb1d252da] {* mandatory md5(login) for iframe upload files not remove *}
            $(document).ready(function ()
            {
                $("#login").click(function () {
                    $('#f_authent').submit();
                });
                $(".error-log").click(function () {
                    $(this).hide();
                });
                $(document).keypress(function (event) {
                    if (event.keyCode == 13)
                        $('#f_authent').submit();
                });
            });

        </script>               
    </body>
</html>

