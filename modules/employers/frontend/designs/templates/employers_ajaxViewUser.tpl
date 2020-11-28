<div class="row RowTop">
    <div class="col-md-12 grid-margin classConducteurTop">
        <div class="d-flex justify-content-between flex-wrap">
            <div class="d-flex align-items-end flex-wrap">
                <div class="mr-md-3 mr-xl-5 styleWidth">
                    <h2>{__('My Users')}</h2>                   
                </div>
                <div class="d-flex">
                    <i class="mdi mdi-home text-muted hover-cursor"></i>            
                    <a id="Dashboard"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('Dashboard')}</p></a>
                    <a id="Cancel"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('My users')}</p></a>
                    <p class="text-muted mb-0">&nbsp;/&nbsp;{__('View user')}</p>
                </div>
            </div>      
        </div>
    </div>
</div>
{alerts}
{if $item->isLoaded()}
    <div class="row admin-header-container btn-r">    
        <div class="col-sm" style="padding: 0;">
            <div class="buttonSave">
                <a href="#" id="Save" class="btn btn-primary admin-header-button"><i class="fa fa-save mr-2"></i>{__('Save')}</a>                
            </div>
        </div>
    </div>                 
    <div class="col-12 grid-margin" style="padding: 20px;">
        <div class="card classMargin">
            <div class="card-body">             
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item">            
                        <a class="nav-link active"  id="public-tab" data-toggle="tab" href="#public" role="tab" aria-controls="public" aria-selected="true">
                            {__('Public information')}
                            {*if $form.->hasError()}<span style="color:red">?</span>{/if*}
                        </a>
                    </li>   
                    <li class="nav-item">            
                        <a class="nav-link"  id="documents-tab" data-toggle="tab" href="#personal" role="tab" aria-controls="personal" aria-selected="true">
                            {__('Personal information')}
                            {*if $form.->hasError()}<span style="color:red">?</span>{/if*}
                        </a>
                    </li>  
                    <li class="nav-item">            
                        <a class="nav-link"  id="details-tab" data-toggle="tab" href="#details" role="tab" aria-controls="details" aria-selected="true">
                            {__('Experience')}
                            {*if $form.->hasError()}<span style="color:red">?</span>{/if*}
                        </a>
                    </li>
                </ul>

                <div class="tab-content" style="padding-top: 20px;">
                    <div class="tab-pane fade show active{*if $language@first}active{/if*} {*Languages*}" id="public" role="public-tab">                 
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">{__('User Name')}{if $form->username->getOption('required')}*{/if}</label>
                                    <div class="col-sm-10">
                                        {if $form.username->hasError()}<div class="w-auto alert {if $form.username->hasError()}alert-danger{/if}">{$form.username->getError()}</div>{/if}
                                        <div style="position: relative;">
                                            <input type="text" class="form-control EmployerUser Fields Input" name="username" value="{$item->get('username')}">
                                            <i class="fa fa-check-circle respPosition correctForm" aria-hidden="true" style="color: green;display: {if !$form.username->hasError()}block;{else}none;{/if}"></i>
                                            <i class="fa fa-times-circle respPosition inCorrectForm" aria-hidden="true" style="color: red;display: {if $form.username->hasError()}block;{else}none;{/if}"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                 
                    </div> 

                    {* ==================================== PERSONAL  ====================================*}
                    <div class="tab-pane fade show" id="personal" role="tabpanel" aria-labelledby="personals-tab">                                   
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">{__('First Name')}{if $form->firstname->getOption('required')}*{/if}</label>
                                    <div class="col-sm-2">
                                        {if $form.firstname->hasError() || $form.lastname->hasError()}<div class="w-auto alert {if $form.gender->hasError()}alert-danger{/if}">&nbsp;</div>{/if}
                                        {html_options class="form-control EmployerUser Fields Select" name="gender" options=$form->gender->getChoices() selected=$item->get('gender')}
                                    </div>
                                    <div class="col-sm-8">
                                        {if $form.firstname->hasError() || $form.lastname->hasError()}<div class="w-auto alert {if $form.firstname->hasError()}alert-danger{/if}">{$form.firstname->getError()}</div>{/if}
                                        <input type="text" class="form-control EmployerUser Fields Input" name="firstname" value="{$item->get('firstname')}">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">{__('Last Name')}{if $form->lastname->getOption('required')}*{/if}</label>
                                    <div class="col-sm-10">
                                        {if $form.lastname->hasError() || $form.firstname->hasError()}<div class="w-auto alert {if $form.lastname->hasError()}alert-danger{/if}">{$form.lastname->getError()}</div>{/if}
                                        <input type="text" class="form-control EmployerUser Fields Input" name="lastname" value="{$item->get('lastname')}">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">{__('Mobile')}{if $form->mobile->getOption('required')}*{/if}</label>
                                    <div class="col-sm-10">
                                        {if $form.mobile->hasError() || $form.phone->hasError()}<div class="w-auto alert {if $form.mobile->hasError()}alert-danger{/if}">{$form.mobile->getError()}</div>{/if}
                                        <input type="text" class="form-control EmployerUser Fields Input" name="mobile" value="{$item->get('mobile')}">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">{__('Phone')}{if $form->phone->getOption('required')}*{/if}</label>
                                    <div class="col-sm-10">
                                        {if $form.mobile->hasError() || $form.phone->hasError()}<div class="w-auto alert {if $form.phone->hasError()}alert-danger{/if}">{$form.phone->getError()}</div>{/if}
                                        <input type="text" class="form-control EmployerUser Fields Input" name="phone" value="{$item->get('phone')}">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">{__('Email')}</label>
                                    <div class="col-sm-10">
                                        {if $form.email->hasError()}<div class="w-auto alert {if $form.email->hasError()}alert-danger{/if}">{$form.email->getError()}</div>{/if}
                                        <div style="position: relative;">
                                            <input type="text" class="form-control EmployerUser Fields Input" name="email" value="{$item->get('email')}">
                                            <i class="mdi mdi-checkbox-marked-circle respPosition correctFormEmail" aria-hidden="true" style="color: green;display: {if !$form.email->hasError()}block;{else}none;{/if}"></i>
                                            <i class="mdi mdi-close-circle respPosition inCorrectFormEmail" aria-hidden="true" style="color: red;display: {if $form.email->hasError()}block;{else}none;{/if}"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>                                         
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">{__('Avatar')}</label>
                                    <div class="col-sm-10">
                                        <div class="form-avatar">            
                                            <div id="AvatarForm">                            
                                                <div class="custom-FileInput" id="DivAvatar">
                                                    {*<img id="blah" alt="" style="display: none;" /><br/>*}
                                                    {if $item->hasAvatar()}
                                                        <img id="avatar" alt="" src="{$item->getAvatar()->getThumb()->getUrl()}"{*/if*} /><br/>
                                                    {else}
                                                        <img id="avatar" alt="" style="display: none;" /><br/>
                                                    {/if}
                                                </div>
                                                <div class="row">
                                                    <div class="">
                                                        <a id="AvatarAdd" href="javascript:void(0);" class="btn btn-default"><i class="fa fa-plus" style="margin-right:10px;"></i>{__('Add a profile picture')}</a>
                                                        <input type='file' id="avatarInp" hidden="" class="EmployerUser files" name="EmployerUser[avatar]"/>
                                                    </div>
                                                    <div class="" style="padding-top: 14px;;padding-left: 0px;">
                                                        <div class="thumbnail media-lib-item parent">
                                                            <a href="javascript:void(0);" class="list-action ModelAvatar" name="NORMAL" id="BtnInverse" style=""><i class="ModeIconForAvatar Normal fa fa-square-o"></i></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                                              
                                    </div>
                                </div>
                            </div>                     
                        </div> 
                    </div>                                         

                    {* ==================================== DETAILS  ====================================*}
                    <div class="tab-pane fade show" id="details" role="tabpanel" aria-labelledby="details-tab">                                                                                    
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">{__('Function')}{if $form->function_id->getOption('required')}*{/if}</label>
                                    <div class="col-sm-10">
                                        {if $form.function_id->hasError()}<div class="w-auto alert {if $form.function_id->hasError()}alert-danger{/if}">{$form.function_id->getError()}</div>{/if}
                                        {html_options class="form-control EmployerUser Fields Select" name="function_id" options=$form->function_id->getChoices()->toArray() selected=$item->get('function_id')}
                                    </div>
                                </div>
                            </div>                                                   
                        </div>                               
                    </div>               
                </div> 
            </div>         
        </div>
    </div>
                
                         
<script type="text/javascript"> 
    
     $('#AvatarAdd').click(function() {
        $('#avatarInp').click();
     });
      
    $("#avatarInp").change(function() {   
        if (this.files && this.files[0]) {
          var reader = new FileReader();
          reader.onload = function(e) {  $('#avatar').css('display','block').attr('src', e.target.result); };
          reader.readAsDataURL(this.files[0]);
        }        
    });
    
    
    
    $(".ModelAvatar").click(function(){
        if ($(this).attr('name')=='NORMAL'){
            $(this).attr('name','INVERSE');
                $(".ModeIconForAvatar").removeClass('Normal fa fa-square-o').addClass('Inverse fa fa-square');
                $("#DivAvatar").css('background-color','rgb(155, 155, 155)');
            }
            else
            {
                $(this).attr('name','NORMAL');
                $(".ModeIconForAvatar").removeClass('Inverse fa fa-square').addClass('Normal fa fa-square-o');
                $("#DivAvatar").css('background-color','');
            }
   });
   
    
     $('#Dashboard').click(function(){                                       
          return $.ajax2({ url: "{url_to('employers_ajax',['action'=>'Dashboard'])}",                           
                           target: "#actions"}); 
        });
        
     $('#Cancel').click(function(){                                       
          return $.ajax2({ url: "{url_to('employers_ajax',['action'=>'ListPartialUser'])}",                           
                           target: "#actions"}); 
        });
        
        
     $('#Save').click(function(){                             
          var  params= { EmployerUser: {            
                                id : '{$item->get('id')}',
                                token :'{$form->getCSRFToken()}'
                             } };                              
          $(".EmployerUser.Input").each(function() { params.EmployerUser[$(this).attr('name')]=$(this).val(); });                                       
          $(".EmployerUser.Select option:selected").each(function () { params.EmployerUser[$(this).parent().attr('name')]=$(this).val(); });  
          return $.ajax2({ data : params,    
                           files: ".files",
                           url: "{url_to('employers_ajax',['action'=>'SaveUser'])}",
                           target: "#actions"}); 
        }); 
     
     
       $("#EmployerUserAvatar-Delete").click(function () { 
       return $.ajax2({                        
                           url: "{url_to('employers_ajax',['action'=>'DeleteAvatar'])}",
                           success : function (resp)
                                {
                                     if (resp.action !='DeleteAvatar') return ;
                                     $("#avatar-ctn").html("")
                                }
                     });
    });
    
    $(".EmployerUser[name=username]").keyup(function () { 
            if ($(this).val().length === 0 || $(this).val().length < 3) {
                $(".correctForm").css("display","none");
                $(".inCorrectForm").css("display","none");
                return ; 
            }
           // if ($(this).val().length < 3) return ;                   
            return $.ajax2({
                  data : { EmployerUsernameCheck : {  username: $(this).val(), token : '{mfForm::getToken('EmployerCheckUsernameForm')}' } },
                  url: "{url_to('employers_ajax',['action'=>'CheckUsername'])}",    
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
     
    $(".EmployerUser[name=email]").keyup(function () { 
        if ($(this).val().length === 0) {
            $(".correctFormEmail").css("display","none");
            $(".inCorrectFormEmail").css("display","none");
            return ; 
        }
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
    
</script>

{else}
    {__('user is invalid.')}
{/if}    