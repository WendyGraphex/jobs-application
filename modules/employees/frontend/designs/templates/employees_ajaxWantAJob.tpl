       <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div id="want-a-job-ctn"  class="modal-body">
                <h3>{__('Create your account & your job')}</h3>
                <ul class="nav nav-tabs" id="myTab" role="tablist">    
                    <li class="nav-item classWidth">
                        <a class="nav-link active" id="t-employee-account-tab" data-toggle="tab" href="#t-employee-account" role="tab" aria-controls="t-employee-account" aria-selected="false"><span class="stepNumberModal">1.</span>&nbsp<span>{__('Account')}</span></a>
                    </li>
                    <li class="nav-item classWidth">
                        <a class="nav-link" id="t-employee-advert-tab" data-toggle="tab" href="#t-employee-advert" role="tab" aria-controls="t-employee-advert" aria-selected="true"><span class="stepNumberModal" style="">2.</span>&nbsp<span>{__('Job')}</span></a>
                    </li>
                </ul>  
                    
                 <div class="tab-content" id="myTabContentViewPage">         
                    <div class="tab-pane fade show active" id="t-employee-account" role="tabpanel" aria-labelledby="t-employee-account-tab">  
                        <div class="ModalWantPostJob NoneModalWantPostJob">
                             
                            <h6 class="font-weight-light">{__('Signing up is easy. It only takes a few steps')}</h6> 
                            <div class="form-group" name="username" style="position: relative;">
                                <div class="errors" name="username"></div>     
                                <input type="text" name="username" class="WantAJob Fields Input form-control form-control-lg error" placeholder="{__('Username')}" value="{$employee_user->get('username')}">
                                <i class="mdi mdi-checkbox-marked-circle respPosition correctForm" aria-hidden="true" style="color: green;display: none;"></i>
                                <i class="mdi mdi-close-circle respPosition inCorrectForm" aria-hidden="true" style="color: red;display: none;"></i>  
                            </div>
                            
                                <div class="col-md-12 classPadding" >
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group" name="gender">
                                                <div class="errors" name="gender"></div>   
                                                {html_options style="padding-left: 2px;" name="gender" class="WantAJob Fields Select form-control form-control-lg error" options=$form->gender->getChoices() selected=$employee_user->get('gender')}                                                               
                                            </div>
                                        </div>
                                         <div class="col-md-8">
                                            <div class="form-group" name="firstname">
                                                <div class="errors" name="firstname"></div>     
                                                <input type="text" name="firstname" class="WantAJob Fields Input form-control form-control-lg error" placeholder="{__('First name')}" value="{$employee_user->get('firstname')}">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            <div class="form-group" name="lastname">
                                <div class="errors" name="lastname"></div>     
                                <input type="text" name="lastname" class="WantAJob Fields Input form-control form-control-lg error" placeholder="{__('Last name')}" value="{$employee_user->get('lastname')}">
                            </div>

                            <div class="form-group" name="email" style="position: relative;">
                                <div class="errors" name="email"></div>     
                                <div class="input-group mb-3 error" name="password">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon1"><i class="mdi mdi-account"></i></span>
                                    </div>
                                    {if $form->hasValidator('email')}
                                    <input type="email" name="email" class="WantAJob Fields Input form-control form-control-lg"  placeholder="{__('Email')}" value="{$employee_user->get('email')}">
                                    {else}
                                    <input type="email" name="email" disabled="" class="form-control form-control-lg"  placeholder="{__('Email')}" value="{$employee_user->get('email')}">
                                    <i class="mdi mdi-checkbox-marked-circle respPosition correctFormEmail" aria-hidden="true" style="color: green;display: none;"></i>
                                    <i class="mdi mdi-close-circle respPosition inCorrectFormEmail" aria-hidden="true" style="color: red;display: none;"></i> 
                                    {/if}    
                                    <i class="mdi mdi-checkbox-marked-circle respPosition correctFormEmail" aria-hidden="true" style="color: green;display: none;"></i>
                                    <i class="mdi mdi-close-circle respPosition inCorrectFormEmail" aria-hidden="true" style="color: red;display: none;"></i>
                                </div>
                            </div>
                             {if $form->hasValidator('password')}
                            <div class="form-group" >
                                <div class="errors" name="password"></div>     
                                <div class="input-group mb-3 error" name="password">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon1"><i class="mdi mdi-lock"></i></span>
                                    </div>
                                    <input type="password" name="password" class="WantAJob Fields Input form-control form-control-lg" placeholder="{__('Password')}">
                                </div>
                            </div>
                            {/if}
                            <div class="mb-4">

                           {* <div class="custom-control custom-checkbox custom-control-inline">
                              <input type="checkbox" class="custom-control-input" id="defaultInline1">
                              <label class="custom-control-label" for="defaultInline1">
                                  {component name="/cms_pages/nodeLink" node="terms_and_conditions" tpl="agreement"}                                
                              </label>
                            </div> *}
                             {if $employee_user->isNotLoaded()}
                               {component name="/sales/conditionsLink" tpl="employee"} 
                              {/if}
                            </div>
                            <div class="mt-3">
                                <a class="{if $employee_user->isNotLoaded()}nonePointerBtn{/if} btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" id="WantAJob-Signup" href="#">
                                  {if $employee_user->isLoaded()}
                                      {__('MODIFY')}
                                  {else}
                                    {__('SIGN UP')}
                                  {/if}
                              </a>                           
                            </div>                        
                            <div style="margin-top: 20px;">                               
                                <button id="EmployeeSignin-Next" {if $employee_user->isNotLoaded()}style="display:none"{/if} class="btn btn-success">{__('Next')}</button>
                            </div>
                        </div>
                          {if $employee_user->isNotLoaded()}  
                        <div class="row" style="width: 80%;margin: 0 auto;">
                            <div class="col-md-3">
                                {component name="/facebook_oauth/oauthBtnWantAJobEmployee"}
                            </div>
                            <div class="col-md-3">
                                {component name="/instagram_oauth/oauthBtnWantAJobEmployee"}
                            </div>
                            <div class="col-md-3">
                                {component name="/google_oauth/oauthBtnWantAJobEmployee"}
                            </div>
                             <div class="col-md-3">
                                {component name="/linkedin_oauth/oauthBtnWantAJobEmployee"}
                            </div>
                        </div>
                    {/if}
                    </div>
                           
                    <div class="tab-pane fade" id="t-employee-advert" role="tabpanel" aria-labelledby="t-employee-advert-tab">                                   
                    </div>  
                       
                                               
                </div>                              
            </div>
                        
<script type="text/javascript">
    
        $('.WantAJob.Input').click(function () { 
            $(".WantAJob.Input").removeClass('intro').removeClass('introRadio');
        });
         
       $("#WantAJob-Signup").click(function () {     
         var params = { EmployeeWantAJob : {  token : '{$form->getCSRFToken()}' } };
         $(".WantAJob.Input").each(function () { params.EmployeeWantAJob[$(this).attr('name')]=$(this).val(); });
         $(".WantAJob.Select option:selected").each(function () { params.EmployeeWantAJob[$(this).parent().attr('name')]=$(this).val(); });
         return $.ajax2({  data : params,
                            url:"{url_to('employees_ajax',['action'=>'SaveWantAJobProfile'])}",                                
                               //  target: "#post-a-job-ctn",
                                 success: function (resp)
                                    {
                                        if (resp.errors)
                                        {
                                            $.each(resp.errors,function (field,error) {
                                                $(".WantAJob.Input[name="+field+"]").addClass("intro");                       
                                            });
                                            return ;
                                        }
                                        $("#t-employee-advert").html(resp);
                                        $("#t-employee-account-tab").removeClass('active');
                                        $("#t-employee-advert-tab").addClass('active');
                                        $("#t-employee-account").removeClass('show active');
                                        $("#t-employee-advert").addClass('show active');
                                        
                                        
                                    }
                });
         
    });
    
 $(".WantAJob[name=username]").keyup(function () {
            if ($(this).val().length == 0){ 
                $(".inCorrectForm").css("display","none");
                $(".correctForm").css("display","none");
            }
            if ($(this).val().length < 7) return ;                   
            return $.ajax2({
                  data : { EmployeeUsernameCheck : {  username: $(this).val(), token : '{mfForm::getToken('EmployeeCheckUsernameForm')}' } },
                  url: "{url_to('employees_ajax',['action'=>'CheckUsername'])}",    
                  success : function (resp) {   
                        if (resp.errors)
                        {
                            $(".correctForm").css("display","none");
                            $(".inCorrectForm").css("display","block");
                        }
                        else{
                            $(".inCorrectForm").css("display","none");
                            $(".correctForm").css("display","block");
                        }
                    }                    
              });
     });
     
     
     $(".WantAJob[name=email]").keyup(function () { 
        $(".inCorrectFormEmail").css("display","none");
        $(".correctFormEmail").css("display","none");
        var r = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{ldelim}1,3{rdelim}\.[0-9]{ldelim}1,3{rdelim}\.[0-9]{ldelim}1,3{rdelim}\.[0-9]{ldelim}1,3{rdelim}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{ldelim}2,{rdelim}))$/;
        if (!r.test($(this).val()))
           return ;
        return  $.ajax2({ data : { EmailChecker: { email: $(this).val(), token : '{mfForm::getToken('EmployeeCheckEmailForm')}' } },                              
                  url:"{url_to('employees_ajax',['action'=>'CheckEmail'])}",  
                  success : function (resp)
                    {                                             
                        if (resp.action!='CheckEmail') return ;
                        if (resp.status!='OK'){ 
                            $(".inCorrectFormEmail").css("display","block");
                        } else {
                           $(".inCorrectFormEmail").css("display","none");
                           $(".correctFormEmail").css("display","block"); 
                        }
                    }
          });
    });
    
    
     $("#EmployeeSignin-Next").click(function () { 
        return $.ajax2({    url:"{url_to('employees_ajax',['action'=>'WantAJobAdvert'])}",                                
                              target: "#t-employee-advert",
                            success: function (resp)
                            {                                                               
                                $("#t-employee-account-tab").removeClass('active');
                                $("#t-employee-advert-tab").addClass('active');
                                $("#t-employee-account").removeClass('show active');
                                $("#t-employee-advert").addClass('show active');
                                $("#t-employee-advert-tab").removeClass('nonePointer');
                            }
            });
    });
    
    $("#t-employee-advert-tab").click(function () { 
        return $.ajax2({    url:"{url_to('employees_ajax',['action'=>'WantAJobAdvert'])}",                                
                              target: "#t-employee-advert",
                            success: function (resp)
                            {                                                               
                                $("#t-employee-account-tab").removeClass('active');
                                $("#t-employee-advert-tab").addClass('active');
                                $("#t-employee-account").removeClass('show active');
                                $("#t-employee-advert").addClass('show active');
                                $("#t-employee-advert-tab").removeClass('nonePointer');
                            }
            });
    });
    
    
     $('#employee-defaultChecked2').change(function() {
        if(this.checked)           
            $('#WantAJob-Signup').removeClass('nonePointerBtn');       
        else         
            $('#WantAJob-Signup').addClass('nonePointerBtn');       
    });  
</script>            
