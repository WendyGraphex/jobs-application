<div class="row RowTop">
    <div class="col-md-12 grid-margin classConducteurTop">
        <div class="d-flex justify-content-between flex-wrap">
            <div class="d-flex align-items-end flex-wrap">
                <div class="mr-md-3 mr-xl-5 styleWidth">
                    <h2>{__('My profile')}</h2>                   
                </div>
                <div class="d-flex">
                    <i class="mdi mdi-home text-muted hover-cursor"></i>
                    <p class="text-muted mb-0 hover-cursor">&nbsp;/&nbsp;{__('Dashboard')}&nbsp;/&nbsp;</p>
                    <p class="text-primary mb-0 hover-cursor">{__('My profile')}</p>
                </div>
            </div>      
        </div>
    </div>
</div>
{alerts}
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
                        {if $form->hasErrors(['username'])}<span style="color:red">?</span>{/if}
                    </a>
                </li>   
                <li class="nav-item">            
                    <a class="nav-link"  id="personal-tab" data-toggle="tab" href="#personal" role="tab" aria-controls="personal" aria-selected="true">
                        {__('Personal information')}
                        {if $form->hasErrors(['firstname','lastname','mobile','birthday','email','phone'])}<span style="color:red">?</span>{/if}
                    </a>
                </li>
                <li class="nav-item">            
                    <a class="nav-link"  id="address-tab" data-toggle="tab" href="#address" role="tab" aria-controls="address" aria-selected="true">
                        {__('My Address')}
                        {if $form->hasErrors(['address1','address2','postcode','city','country'])}<span style="color:red">?</span>{/if}
                    </a>
                </li>
                {* <li class="nav-item">            
                <a class="nav-link"  id="details-tab" data-toggle="tab" href="#details" role="tab" aria-controls="details" aria-selected="true">
                {__('Experience')}
                {if $form.->hasError()}<span style="color:red">?</span>{/if}
                </a>                                 *}
                </li> 
            </ul>

            <div class="tab-content" style="padding-top: 20px;">
                <div class="tab-pane fade show active{*if $language@first}active{/if*} {*Languages*}" id="public" role="public-tab">                 
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">{__('User Name')}{if $form->username->getOption('required')}*{/if}</label>
                                <div class="col-sm-10">
                                    <div style="position: relative;">
                                        {if $form.username->hasError()}<div class="w-auto alert {if $form.username->hasError()}alert-danger{/if}">{$form.username->getError()}</div>{/if}
                                        <label style="font-size: 12px;margin-bottom: 0px;">{$form->username->getDefaultMessage()}</label>
                                        <input type="text" class="form-control SiteEventUser Fields Input" name="username" value="{$event_user->get('username')}">
                                        <label style="font-size: 12px;margin-bottom: 0px;">{__('Min character')}: {$form->username->getOption('min_length')}</label>
                                        <label style="font-size: 12px;margin-bottom: 0px;position: absolute;right: 2px;">{__('Max character')}: {$form->username->getOption('max_length')}</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>                
                </div> 

                {* ==================================== PERSONAL  ====================================*}
                <div class="tab-pane fade show" id="personal" role="tabpanel" aria-labelledby="personals-tab">                                   
                    <div class="row">
                        <div class="col-md-5">
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">{__('First Name')}{if $form->firstname->getOption('required')}*{/if}</label>
                                <div class="col-sm-2">
                                    {*if $form.firstname->hasError() || $form.firstname->hasError()}<div style="color: red;">{$form.firstname->getError()}</div>{/if*}
                                    {html_options class="form-control SiteEventUser Fields Select" name="gender" options=$form->gender->getChoices() selected=$event_user->get('gender')}
                                </div>
                                <div class="col-sm-8">
                                    {if $form.firstname->hasError() || $form.lastname->hasError()}<div class="w-auto alert {if $form.firstname->hasError()}alert-danger{/if}">{$form.firstname->getError()}</div>{/if}
                                    <input type="text" class="form-control SiteEventUser Fields Input" name="firstname" value="{$event_user->get('firstname')}">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-7">
                            <div class="form-group row">
                                <div class="col-md-8">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">{__('Last Name')}{if $form->lastname->getOption('required')}*{/if}</label>
                                        <div class="col-sm-9">
                                            {if $form.firstname->hasError() || $form.lastname->hasError()}<div class="w-auto alert {if $form.lastname->hasError()}alert-danger{/if}">{$form.lastname->getError()}</div>{/if}
                                            <input type="text" class="form-control SiteEventUser Fields Input" name="lastname" value="{$event_user->get('lastname')}">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">{__('Birthday')}{if $form->birthday->getOption('required')}*{/if}</label>
                                        <div class="col-sm-9">
                                            {if $form.firstname->hasError() || $form.lastname->hasError() || $form.birthday->hasError()}<div class="w-auto alert {if $form.birthday->hasError()}alert-danger{/if}">{$form.birthday->getError()}</div>{/if}
                                            {*<input id="Birthday" type="text" class="form-control SiteEventUser Fields Input birthday" name="birthday" value="{if $form->hasErrors()}{$form.birthday}{else}{$event_user->getFormatter()->getBirthday()->getText()}{/if}">*}
                                            {*<input id="Birthday" type="text" class="form-control SiteEventUser Fields Input birthday" name="birthday" value="{if $form->hasErrors()}{$form.birthday}{elseif $event_user->hasBirthday()}{$event_user->getFormatter()->getBirthday()->getText()}{/if}">*}
                                            {if $form->hasErrors()}
                                                {html_options class="form-control SiteEventUser Select" name="birthday_day" style="display: inline-block;width: 32%;" options=$form->birthday_day->getChoices()->toArray() selected=$form.birthday_day}
                                                {html_options class="form-control SiteEventUser Select" name="birthday_month" style="display: inline-block;width: 32%;" options=$form->birthday_month->getChoices() selected=$form.birthday_month}
                                                {html_options class="form-control SiteEventUser Select" name="birthday_year" style="display: inline-block;width: 32%;" options=$form->birthday_year->getChoices()->toArray() selected=$form.birthday_year}
                                            {elseif $event_user->hasBirthDay()}    
                                                {html_options class="form-control SiteEventUser Select" name="birthday_day" style="display: inline-block;width: 32%;" options=$form->birthday_day->getChoices()->toArray() selected=$event_user->getFormatter()->getBirthday()->getDay()}
                                                {html_options class="form-control SiteEventUser Select" name="birthday_month" style="display: inline-block;width: 32%;" options=$form->birthday_month->getChoices() selected=$event_user->getFormatter()->getBirthday()->getMonth()}
                                                {html_options class="form-control SiteEventUser Select" name="birthday_year" style="display: inline-block;width: 32%;" options=$form->birthday_year->getChoices()->toArray() selected=$event_user->getFormatter()->getBirthday()->getYear()}                                     
                                            {else}    
                                                {html_options class="form-control SiteEventUser Select" name="birthday_day" style="display: inline-block;width: 32%;" options=$form->birthday_day->getChoices()->toArray()}
                                                {html_options class="form-control SiteEventUser Select" name="birthday_month" style="display: inline-block;width: 32%;" options=$form->birthday_month->getChoices()}
                                                {html_options class="form-control SiteEventUser Select" name="birthday_year" style="display: inline-block;width: 32%;" options=$form->birthday_year->getChoices()->toArray()}                                                                    
                                            {/if}
                                        </div>
                                    </div>
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
                                    <input type="text" class="form-control SiteEventUser Fields Input" name="mobile" value="{$event_user->get('mobile')}">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">{__('Phone')}{if $form->phone->getOption('required')}*{/if}</label>
                                <div class="col-sm-10">
                                    {if $form.mobile->hasError() || $form.phone->hasError()}<div class="w-auto alert {if $form.phone->hasError()}alert-danger{/if}">{$form.phone->getError()}</div>{/if}
                                    <input type="text" class="form-control SiteEventUser Fields Input" name="phone" value="{$event_user->get('phone')}">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">{__('Email')}</label>
                                <div class="col-sm-10">
                                    {if $form->hasValidator('email')}
                                        <input type="text" class="form-control SiteEventUser Fields Input" name="email" value="{$event_user->get('email')}">
                                    {else}
                                        <input type="text" class="form-control" readonly="" name="email" value="{$event_user->get('email')}">
                                    {/if} 
                                </div>
                            </div>
                        </div> 
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">{__('Avatar')}</label>
                                <div class="col-sm-10">
                                    {*if $event_user->hasAvatar()}
                                    <div id="avatar-ctn">
                                    <img src="{$event_user->getAvatar()->getThumb()->getUrl()}"/>                                   
                                    <a href="#" id="SiteEventUserAvatar-Delete"><i class="fa fa-trash"></i></a>
                                    </div>
                                    {else}
                                        
                                    {/if}    
                                    <input type="file" class="form-control SiteEventUser files" name="MyProfile[avatar]"> *}
                                    <div class="form-group">            
                                        <div id="AvatarForm">                            
                                            <div class="custom-FileInput" id="DivLogo">
                                                {*<img id="blah" alt="" style="display: none;" /><br/>*}
                                                {if $event_user->hasAvatar()}
                                                    <img id="logo" alt="" src="{$event_user->getAvatar()->getThumb()->getUrl()}"{*/if*} /><br/>
                                                {else}
                                                    <img id="logo" alt="" style="display: none;" /><br/>
                                                {/if}
                                            </div>
                                            <div class="row">
                                                <div class="">
                                                    <a id="logoAdd" href="javascript:void(0);" class="btn btn-default"><i class="fa fa-plus" style="margin-right:10px;"></i>{__('Add a profile picture')}</a>
                                                    <input type='file' id="logoInp" hidden="" class="files" name="SiteEventUserCompletion[avatar]"/>
                                                </div>
                                                <div class="" style="padding-top: 14px;padding-left: 0px;">
                                                    <div class="thumbnail media-lib-item parent">
                                                        <a href="javascript:void(0);" class="list-action ModeLogo" name="NORMAL" id="BtnInverse" style=""><i class="ModeIconForLogo Normal fa fa-square-o"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>                    
                        </div>                     
                    </div> 

                    {if $form->hasValidator('password')}          
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">{__('Password')}{if $form->password->getOption('required')}*{/if}</label>
                                    <div class="col-sm-10">
                                        {if $form.password->hasError() || $form.repassword->hasError()}<div class="w-auto alert {if $form.password->hasError()}alert-danger{/if}">{$form.password->getError()}</div>{/if}
                                        <label style="font-size: 12px;margin-bottom: 0px;">{$form->password->getDefaultMessage()}</label>
                                        <input type="password" autocomplete="off" class="form-control SiteEventUser Fields Input" name="password">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">{__('Re Password')}{if $form->repassword->getOption('required')}*{/if}</label>
                                    <div class="col-sm-10">
                                        {if $form.repassword->hasError() || $form.password->hasError()}<div class="w-auto alert {if $form.repassword->hasError()}alert-danger{/if}">{$form.repassword->getError()}</div>{/if}
                                        <input type="password" autocomplete="off" class="form-control SiteEventUser Fields Input" name="repassword">
                                    </div>
                                </div>
                            </div>
                        </div>
                    {/if}
                </div>  

                {* ==================================== ADDRESS ====================================*}
                <div class="tab-pane fade show" id="address" role="tabpanel" aria-labelledby="address-tab">    
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">{__('Address 1')}{if $form->address1->getOption('required')}*{/if}</label>
                                <div class="col-sm-10">
                                    {if $form.address1->hasError() || $form.address2->hasError()}<div class="w-auto alert {if $form.address1->hasError()}alert-danger{/if}">{$form.address1->getError()}</div>{/if}
                                    <input type="text" class="form-control SiteEventUser Fields Input" name="address2" value="{$event_user->get('address2')}">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">{__('Address 2')}{if $form->address2->getOption('required')}*{/if}</label>
                                <div class="col-sm-10">
                                    {if $form.address2->hasError() || $form.address1->hasError()}<div class="w-auto alert {if $form.address2->hasError()}alert-danger{/if}">{$form.address2->getError()}</div>{/if}
                                    <input type="text" class="form-control SiteEventUser Fields Input" name="address2" value="{$event_user->get('address2')}">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2">
                            <div class="form-group row">
                                <label class="col-sm-5 col-form-label">{__('Post code')}{if $form->postcode->getOption('required')}*{/if}</label>
                                <div class="col-sm-7">
                                    {if $form.city->hasError() || $form.postcode->hasError() || $form.country->hasError()}<div class="w-auto alert {if $form.postcode->hasError()}alert-danger{/if}">{$form.postcode->getError()}</div>{/if}
                                    <input type="text" class="form-control SiteEventUser Fields Input" name="postcode" value="{$event_user->get('postcode')}">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">{__('City')}{if $form->city->getOption('required')}*{/if}</label>
                                <div class="col-sm-10">
                                    {if $form.city->hasError() || $form.postcode->hasError() || $form.country->hasError()}<div class="w-auto alert {if $form.city->hasError()}alert-danger{/if}">{$form.city->getError()}</div>{/if}
                                    <input type="text" class="form-control SiteEventUser Fields Input" name="city" value="{$event_user->get('city')}">
                                </div>
                            </div>
                        </div>   
                        <div class="col-md-3">
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">{__('State')}{if $form->state->getOption('required')}*{/if}</label>
                                <div class="col-sm-10">
                                    {if $form.city->hasError() || $form.postcode->hasError() || $form.country->hasError()}<div class="w-auto alert {if $form.city->hasError()}alert-danger{/if}">{$form.state->getError()}</div>{/if}
                                    <input type="text" class="form-control SiteEventUser Fields Input" name="state" value="{$event_user->get('state')}">
                                </div>
                            </div>
                        </div>    
                        <div class="col-md-4">
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">{__('Country')}{if $form->country->getOption('required')}*{/if}</label>
                                <div class="col-sm-10">
                                    {if $form.city->hasError() || $form.postcode->hasError() || $form.country->hasError()}<div class="w-auto alert {if $form.country->hasError()}alert-danger{/if}">{$form.country->getError()}</div>{/if}                             
                                    {*if $form.company.postcode->hasError() || $form.company.city->hasError() || $form.company.country->hasError()}<div>&nbsp;</div>{/if*}
                                    {select_country name="country" class="SiteEventUser js-example-responsive form-control Fields Select SiteEventUserSelect" preferred=['MA','FR'] options=$form->country->getOption('choices') selected=$event_user->get('country')}                               
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
    
    $(".SiteEventUserSelect").select2({
       width: 'resolve',
    });
                                                          
  
    $('#logoAdd').click(function() {
        $('#logoInp').click();
     });
      
    $("#logoInp").change(function() {   
        if (this.files && this.files[0]) {
          var reader = new FileReader();
          reader.onload = function(e) {  $('#logo').css('display','block').attr('src', e.target.result); };
          reader.readAsDataURL(this.files[0]);
        }        
    });
    
    
    
    $(".ModeLogo").click(function(){
        if ($(this).attr('name')=='NORMAL'){
            $(this).attr('name','INVERSE');
                $(".ModeIconForLogo").removeClass('Normal fa fa-square-o').addClass('Inverse fa fa-square');
                $("#DivLogo").css('background-color','rgb(155, 155, 155)');
            }
            else
            {
                $(this).attr('name','NORMAL');
                $(".ModeIconForLogo").removeClass('Inverse fa fa-square').addClass('Normal fa fa-square-o');
                $("#DivLogo").css('background-color','');
            }
   });
    
    
      
      $('#Save').click(function(){                             
          var  params= { MyProfile: { token :'{$form->getCSRFToken()}'  } };                              
          $(".SiteEventUser.Input").each(function() { params.MyProfile[$(this).attr('name')]=$(this).val(); });                                       
          $(".SiteEventUser.Select option:selected").each(function () { params.MyProfile[$(this).parent().attr('name')]=$(this).val(); });  
              
         //console.log(params);
          return $.ajax2({ data : params,   
                           files: ".files",
                           url: "{url_to('site_event_ajax',['action'=>'MyProfile'])}",
                           target: "#page-wrapper"}); 
        }); 
     
       $("#SiteEventUserAvatar-Delete").click(function () { 
       return $.ajax2({                        
                           url: "{url_to('site_event_ajax',['action'=>'DeleteAvatar'])}",
                           success : function (resp)
                                {
                                     if (resp.action !='DeleteAvatar') return ;
                                     $("#avatar-ctn").html("")
                                }
                     });
    });
      
      
     
     
    $("#Birthday").datepicker({ maxDate : '-18Y' });
    
   
</script>    
