<div id="lockscreen-ctn" class="container-scroller" {if !$user->getGuardUser()->isLocked()}style="display:none"{/if}>
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth lock-full-bg">
        <div class="row w-100">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-transparent text-left p-5 text-center">
                {if $user->getGuardUser()->hasAvatar()}  
                    <img id="EmployeeAvatar" src="{$user->getGuardUser()->getAvatar()->getThumb()->getUrl()}" alt=""/>
                {else}
                    <img id="EmployeeAvatar" src="{url('icons/user_84308.png','picture')}" alt=""/>
                {/if}         
                <div class="form-group">
                  <label for="Password">{__('Password to unlock')}</label>
                  <input type="password" class="form-control text-center Input" id="Password" placeholder="{__('Password')}">
                </div>
                <div class="mt-5">
                  <a id="Unlock" class="btn btn-block btn-success btn-lg font-weight-medium" href="#">{__('Unlock')}</a>
                </div>
                <div class="mt-3 text-center">
                  <a href="#" class="auth-link text-white">{__('Sign in using a different account')}</a>
                </div>             
            </div>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
<script type="text/javascript">
    
    
    $(document).on('keypress',function(e) {
        if(e.which == 13) {
            $('#Unlock').click();
            return false; 
        }
    });
    
    $('.Input').keyup(function () { 
        $(".Input").removeClass('intro');
    });
    
    
            function lockScreen()
            {
                $("#body-ctn").hide();
                $("#lockscreen-ctn").show();                
                return $.ajax2({                       
                       url :"{url_to('customers_academy_teacher_ajax',['action'=>'Lock'])}"                                                      
                });               
            }                        

            $(function()
            {                   
                   var unlock_timeout=setTimeout(lockScreen, {$settings->getLockTime()});
                   
                   $(document).mousemove(function(){     
                        if (unlock_timeout)
                        {                            
                            clearTimeout(unlock_timeout);      
                            unlock_timeout=setTimeout(lockScreen, {$settings->getLockTime()});
                        }                      
                   });                                                                            
                   
                   $("#Unlock").click(function () { 
                        return $.ajax2({  
                               data : { CustomerAcademyTeacherUserUnlock:  { password: $("#Password").val(), token:'{mfForm::getToken('CustomerAcademyTeacherUserUnlockForm')}'} }, 
                               url :"{url_to('customers_academy_teacher_ajax',['action'=>'Unlock'])}",                                
                               success: function(resp) {                                            
                                            if (resp.action !='Unlock') return ;
                                            if (resp.errors){
                                                $(".Input").addClass("intro");
                                                return ;
                                            }
                                            if (resp.unlock) 
                                            {    
                                                if (unlock_timeout)
                                                {                            
                                                    clearTimeout(unlock_timeout);      
                                                    unlock_timeout=setTimeout(lockScreen, {$settings->getLockTime()});
                                                }  
                                                $("#body-ctn").show();
                                                $("#lockscreen-ctn").hide();
                                            }
                                      }
                        });
                   });
            }); 
                                                  
        </script> 