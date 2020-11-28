<div class="tab-content" style="padding-top: 20px;">
    {if $employer_user->isProfessional() && $employer_user->isAdmin() && $form->hasValidator('company')}  
        {if $is_block}   
            {include file="./../includes/_myprofile_company.tpl"}    
        {else}
            {include file="./includes/_myprofile_company.tpl"}    
        {/if}   
    {/if}

    <div class="tab-pane fade show {if !$employer_user->isProfessional() || !$employer_user->isAdmin() || !$form->hasValidator('company')}active{/if}" id="public" role="public-tab">                 
        <div class="row">
            <div class="col-md-6">
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">{__('User Name')}{if $form->username->getOption('required')}*{/if}</label>
                    <div class="col-sm-10">
                        {*if $form.username->hasError()}<div class="w-auto alert {if $form.username->hasError()}alert-danger{/if}">{$form.username->getError()}</div>{/if*}
                        <div style="position: relative;">
                            <label style="font-size: 12px;margin-bottom: 0px;">{$form->username->getDefaultMessage()}</label>
                            <input type="text" class="form-control EmployerUser Fields Input {if $form.username->hasError()}intro{/if}" name="username" value="{$employer_user->get('username')}">
                            <i class="fa fa-check-circle respPosition correctForm" aria-hidden="true" style="color: green;display: {if !$form.username->hasError() && $form.username->getValue()}block;{else}none;{/if}"></i>
                            <i class="fa fa-times-circle respPosition inCorrectForm" aria-hidden="true" style="color: red;display: {if $form.username->hasError() && $form.username->getValue()}block;{else}none;{/if}"></i>
                            <label style="font-size: 12px;margin-bottom: 0px;">{__('Min character')}: {$form->username->getOption('min_length')}</label>
                            <label style="font-size: 12px;margin-bottom: 0px;position: absolute;right: 2px;">{__('Max character')}: {$form->username->getOption('max_length')}</label>
                        </div>
                    </div>
                </div>
            </div>
        </div>                  
    </div> 

    {* ==================================== PERSONAL  ====================================*}
    <div class="tab-pane fade show " id="personal" role="tabpanel" aria-labelledby="personals-tab">                                   
        <div class="row">
            <div class="col-md-5">
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">{__('First Name')}{if $form->firstname->getOption('required')}*{/if}</label>
                    <div class="col-sm-2">
                        {html_options class="form-control EmployerUser Fields Select {if $form.gender->hasError()}intro{/if}" name="gender" options=$form->gender->getChoices() selected=$employer_user->get('gender')}
                    </div>
                    <div class="col-sm-8">
                        <input type="text" class="form-control EmployerUser Fields Input {if $form.firstname->hasError()}intro{/if}" name="firstname" value="{$employer_user->get('firstname')}">
                    </div>
                </div>
            </div>
            <div class="col-md-7">
                <div class="form-group row">
                    <div class="col-md-8">
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label">{__('Last Name')}{if $form->lastname->getOption('required')}*{/if}</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control EmployerUser Fields Input {if $form.lastname->hasError()}intro{/if}" name="lastname" value="{$employer_user->get('lastname')}">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label">{__('Birthday')}{if $form->birthday->getOption('required')}*{/if}</label>
                            <div class="col-sm-9">
                                {*<input id="Birthday" type="text" class="form-control EmployerUser Fields Input birthday {if $form.birthday->hasError()}intro{/if}" name="birthday" value="{if $form->hasErrors()}{$form.birthday}{elseif $employer_user->hasBirthday()}{$employer_user->getFormatter()->getBirthday()->getText()}{/if}">*}
                                {if $form.firstname->hasError() || $form.lastname->hasError() || $form.birthday_day->hasError()}<div class="w-auto alert {if $form.birthday_day->hasError()}alert-danger{/if}">{$form.birthday_day->getError()}</div>{/if}
                                {if $form->hasErrors()}
                                    {html_options class="form-control EmployerUser Select" name="birthday_day" style="display: inline-block;width: 32%;" options=$form->birthday_day->getChoices()->toArray() selected=$form.birthday_day}
                                    {html_options class="form-control EmployerUser Select" name="birthday_month" style="display: inline-block;width: 32%;" options=$form->birthday_month->getChoices() selected=$form.birthday_month}
                                    {html_options class="form-control EmployerUser Select" name="birthday_year" style="display: inline-block;width: 32%;" options=$form->birthday_year->getChoices()->toArray() selected=$form.birthday_year}
                                {elseif $employer_user->hasBirthDay()}    
                                    {html_options class="form-control EmployerUser Select" name="birthday_day" style="display: inline-block;width: 32%;" options=$form->birthday_day->getChoices()->toArray() selected=$employer_user->getFormatter()->getBirthday()->getDay()}
                                    {html_options class="form-control EmployerUser Select" name="birthday_month" style="display: inline-block;width: 32%;" options=$form->birthday_month->getChoices() selected=$employer_user->getFormatter()->getBirthday()->getMonth()}
                                    {html_options class="form-control EmployerUser Select" name="birthday_year" style="display: inline-block;width: 32%;" options=$form->birthday_year->getChoices()->toArray() selected=$employer_user->getFormatter()->getBirthday()->getYear()}                                     
                                {else}    
                                    {html_options class="form-control EmployerUser Select" name="birthday_day" style="display: inline-block;width: 32%;" options=$form->birthday_day->getChoices()->toArray()}
                                    {html_options class="form-control EmployerUser Select" name="birthday_month" style="display: inline-block;width: 32%;" options=$form->birthday_month->getChoices()}
                                    {html_options class="form-control EmployerUser Select" name="birthday_year" style="display: inline-block;width: 32%;" options=$form->birthday_year->getChoices()->toArray()}                                                                    
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
                        <input type="text" class="form-control EmployerUser Fields Input {if $form.mobile->hasError()}intro{/if}" name="mobile" value="{$employer_user->get('mobile')}">
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">{__('Phone')}{if $form->phone->getOption('required')}*{/if}</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control EmployerUser Fields Input {if $form.phone->hasError()}intro{/if}" name="phone" value="{$employer_user->get('phone')}">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">{__('Email')}</label>
                    <div class="col-sm-10">
                        {*if $form.email->hasError() || $form.email->hasError()}<div style="color: red;">&nbsp;{$form.email->getError()}</div>{/if*}
                        {if $form->hasValidator('email')}
                            <input type="text" class="form-control EmployerUser Fields Input {if $form.email->hasError()}intro{/if}" name="email" value="{$employer_user->get('email')}">
                        {else}
                            <input type="text" class="form-control" readonly="" name="email" value="{$employer_user->get('email')}">
                        {/if}    
                    </div>
                </div>
            </div>     
            <div class="col-md-6">
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">{__('Picture')}</label>
                    <div class="col-sm-10">
                        <div class="form-group">            
                            <div id="avatarForm">                            
                                <div class="custom-FileInput" id="DivAvatar">
                                    {__('Max size is')} {format_size($form->avatar->getOption('max_size'))}
                                    {*<img id="blah" alt="" style="display: none;" /><br/>*}
                                    {if $employer_user->hasAvatar()}
                                        <img id="blah" alt="" src="{$employer_user->getAvatar()->getThumb()->getUrl()}"{*/if*} /><br/>
                                    {else}
                                        <img id="blah" alt="" style="display: none;" /><br/>
                                    {/if}
                                </div>
                                <div class="row">
                                    <div class="">
                                        <a id="pictureAdd" href="javascript:void(0);" class="btn btn-default"><i class="fa fa-plus" style="margin-right:10px;"></i>{__('Add a profile picture')}</a>
                                        <input type='file' id="imgInp" hidden="" class="EmployerUser files" name="MyProfile[avatar]"/>
                                    </div>
                                    <div class="" style="padding-top: 14px;padding-left: 0px;">
                                        <div class="thumbnail media-lib-item parent">
                                            <a href="javascript:void(0);" class="list-action ModePicture" name="NORMAL" id="BtnInverse" style=""><i class="ModeIconForPicture Normal fa fa-square-o"></i></a>
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
                            {*if $form.username->hasError()}<label>{$form->password->getDefaultMessage()}</label>{/if*}
                            <label style="font-size: 12px;margin-bottom: 0px;">{$form->password->getDefaultMessage()}</label>
                            <input type="password" autocomplete="off" class="form-control EmployerUser Fields Input {if $form.password->hasError()}intro{/if}" name="password" value="{*$employer_user->get('password')*}">
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">{__('Re Password')}{if $form->repassword->getOption('required')}*{/if}</label>
                        <div class="col-sm-10">
                            <label style="color: #fff;font-size: 12px;margin-bottom: 0px;">a</label>
                            <input type="password" autocomplete="off" class="form-control EmployerUser Fields Input {if $form.repassword->hasError()}intro{/if}" name="repassword" value="{$employer_user->get('repassword')}">
                        </div>
                    </div>
                </div>
            </div>
        {/if}

    </div>                                                        

    {* ==================================== DETAILS  ====================================*}
    <div class="tab-pane fade show" id="details" role="tabpanel" aria-labelledby="details-tab">                                                                                    
        <div class="row">
            <div class="col-md-4">
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">{__('Function')}{if $form->function_id->getOption('required')}*{/if}</label>
                    <div class="col-sm-8">
                        {html_options class="form-control EmployerUser Fields Select {if $form.function_id->hasError()}intro{/if}" name="function_id" options=$form->function_id->getChoices()->toArray() selected=$employer_user->get('function_id')}
                    </div>
                </div>
            </div> 

            {if $form->hasValidator('activity_id')}     
                <div class="col-md-4">
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">{__('Activity')}{if $form->activity_id->getOption('required')}*{/if}</label>
                        <div class="col-sm-8">
                            {html_options class="form-control EmployerUser Fields Select {if $form.activity_id->hasError()}intro{/if}" name="activity_id" options=$form->activity_id->getChoices()->toArray() selected=$employer_user->get('activity_id')}
                        </div>
                    </div>
                </div> 
            {/if}    

            <div class="col-md-4" style="padding-left: 75px;">
                <div class="form-group row">
                    <label class="col-form-label">{__('Default Language')}{if $form->default_language->getOption('required')}*{/if}</label>
                    <div class="col-sm-8" style="padding-left: 40px;">
                        {html_options class="form-control EmployerUser Fields Select {if $form.default_language->hasError()}intro{/if}" name="default_language" options=$form->default_language->getChoices()->toArray() selected=$employer_user->get('default_language')}
                    </div>
                </div>
            </div> 
        </div>                               
    </div>

    {* ==================================== ADDRESS  ====================================*}
    {if $employer_user->isPrivate()}
        <div class="tab-pane fade show" id="address" role="tabpanel" aria-labelledby="address-tab">                                                                                    
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">{__('Address 1')}{if $form->address1->getOption('required')}*{/if}</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control EmployerUser Fields Input {if $form.address1->hasError()}intro{/if}" name="address1" value="{$employer_user->get('address1')}">
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">{__('Address 2')}{if $form->address2->getOption('required')}*{/if}</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control EmployerUser Fields Input {if $form.address2->hasError()}intro{/if}" name="address2" value="{$employer_user->get('address2')}">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    <div class="form-group row">
                        <label class="col-sm-5 col-form-label">{__('Post code')}{if $form->postcode->getOption('required')}*{/if}</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control EmployerUser Fields Input {if $form.postcode->hasError()}intro{/if}" name="postcode" value="{$employer_user->get('postcode')}">
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">{__('City')}{if $form->city->getOption('required')}*{/if}</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control EmployerUser Fields Input {if $form.city->hasError()}intro{/if}" name="city" value="{$employer_user->get('city')}">
                        </div>
                    </div>
                </div>   
                <div class="col-md-3">
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">{__('State')}{if $form->state->getOption('required')}*{/if}</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control EmployerUser Fields Input {if $form.state->hasError()}intro{/if}" name="state" value="{$employer_user->get('state')}">
                        </div>
                    </div>
                </div>    
                <div class="col-md-4">
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">{__('Country')}{if $form->country->getOption('required')}*{/if}</label>
                        <div class="col-sm-10">
                            {*if $form.company.postcode->hasError() || $form.company.city->hasError() || $form.company.country->hasError()}<div>&nbsp;</div>{/if*}
                            {select_country name="country" class="EmployerUser js-example-responsive form-control Fields Select EmployerUserSelect {if $form.country->hasError()}intro{/if}" preferred=['MA','FR'] options=$form->country->getOption('choices') selected=$employer_user->get('country')}                               
                        </div>
                    </div>
                </div>
            </div>                       
        </div>           
    {/if}          
    {* ==================================== CATEGORIES  ====================================*}
    <div class="tab-pane fade show" id="categories" role="tabpanel" aria-labelledby="categories-tab"> 

        <div class="row mt-3" style="height: 20px;">                       
            <div class="form col-md-12">                                   
                <div class="form-group">                                                    
                    <a href="javascript:void();" id="DialogCategories"><i class="fa fa-plus"></i></a>
                </div>                    
            </div>  
        </div>

        <div id="categories-ctn">
            <div id="EmployerCategories">                               
                {foreach $employer_user->getEmployerCategories()->getCategories() as $category} 
                    <div class="EmployerCategories-list" id="{$category->get('id')}">                                              
                        <div class="btn btn-outline-primary EmployerCategories" id="{$category->get('id')}">
                    {if $category->hasI18n()}{$category->getI18n()->get('title')}{else}{__('----')}{/if}                                                                               
                    <a href="javascript:void(0);" title="{__('Delete')}" class="EmployerCategory-Delete" id="{$category->get('id')}"  name="{if $category->hasI18n()}{$category->getI18n()->get('title')}{else}{$category->get('name')}{/if}">
                        <i  class="fa fa-times icon-font delete-color"></i>
                    </a>                                                       
                </div> 
            </div>
        {/foreach}    
    </div>

</div>

<div id="Modal-Categories" class="modal " role="dialog">
    <div class="modal-dialog modal-lg model-cat-product">    
        <div class="modal-content">
            <div class="px-2"><span class="close" style="cursor: pointer;" id="Modal-Categories-Close">&times;</span></div>
            <div id="Modal-Categories-ctn">            
            </div>
            <div class="col-md-12" style="padding: 0;">
                <div class="Addbtn px-2"> 
                    <div style="width: 163px;margin: 0 auto;">
                        <a href="#" id="AddCategories" class="btn btn-primary admin-header-button mb-2"><i class="fa fa-plus"></i>{__('Add categories')}</a>                
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> 

</div>                             

{* ==================================== LANGUAGES  ====================================*}
<div class="tab-pane fade show" id="languages" role="tabpanel" aria-labelledby="languages-tab">                         
    {foreach $form->languages->getSchema() as $index=>$user_language}
        <div class="languages-ctn" data-index="{$index}">
            <div class="row" style="line-height: 53px;margin-top: -15px;">   
                <div class="col-md-1">
                    <div class="form-group col-md-1 Index">                                            
                        {$index+1}
                    </div>    
                </div>  
                <div class="col-md-4">
                    <div class="form-group row">                        
                        <label class="col-sm-4 col-form-label">{__('Language')}</label>
                        <div class="col-sm-4">
                            <div class="field_with_errors">
                            </div>
                            <select class="EmployeeLanguage Select SelectLanguage form-control" data-index="{$index}" name="lang">
                                {foreach $form->languages[$index]['lang']->getChoices() as $key=>$value}
                                    {if $key}
                                        <option data-index="{$index}" {if $form.languages[$index]['lang']->getValue()==$key}selected=""{/if} value="{$key}">{$value->getFormatted()->ucfirst()}</option>
                                    {else}
                                        <option data-index="{$index}" value="">{$value}</option>
                                    {/if}    
                                {/foreach}
                            </select>                                          
                        </div>
                    </div>    
                </div>
                <div class="col-md-4">
                    <div class="form-group row">                        
                        <label class="col-sm-4 col-form-label">{__('Level')}</label>
                        <div class="col-sm-4">
                            <div class="field_with_errors">
                            </div>
                            <select class="EmployeeLanguage Select form-control" data-index="{$index}" name="level_id">
                                {foreach $form->languages[$index]['level_id']->getChoices() as $key=>$value}
                                    {if $key}
                                        <option data-index="{$index}" {if $form.languages[$index]['level_id']->getValue()==$key}selected=""{/if} value="{$key}">{$value}</option>
                                    {else}
                                        <option data-index="{$index}" value="">{$value}</option>
                                    {/if}  
                                {/foreach}
                            </select>                                                   
                        </div>
                    </div>   
                </div>
                <div class="col-md-1">
                    <div class="form-group row">   
                        <div class="col-md-12">      
                            <a href="javascript:void(0);" class="EmployeeLanguage-Add" data-index="{$index}"><i class="fa fa-plus"></i></a>&nbsp    
                                {if $index !=0}
                                <a href="javascript:void(0);" class="EmployeeLanguage-Delete" data-index="{$index}"><i class="fa fa-trash"></i></a>                    
                                {/if}                      
                        </div> 
                    </div>
                </div>                                     
            </div>   
        </div>
    {/foreach}                       
</div>         
</div>                