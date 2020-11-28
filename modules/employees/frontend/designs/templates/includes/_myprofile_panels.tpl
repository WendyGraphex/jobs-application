<div class="tab-content" style="padding-top: 20px;">
    <div class="tab-pane fade show active{*if $language@first}active{/if*} {*Languages*}" id="public" role="public-tab">                 
        <div class="row">
            <div class="col-md-6">
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">{__('User Name')}{if $form->lastname->getOption('required')}*{/if}</label>
                    <div class="col-sm-10">
                        {*if $form.username->hasError()}<div class="w-auto alert alert-danger">{$form.username->getError()}</div>{/if*}
                        <div style="position: relative;"> 
                            <label style="font-size: 12px;margin-bottom: 0px;">{$form->username->getDefaultMessage()}</label>
                            <input type="text" class="form-control Employee Fields Input {if $form.username->hasError()}intro{/if}" name="username" value="{$employee->get('username')}">
                            <i class="fa fa-check-circle respPosition correctForm" aria-hidden="true" style="color: green;display:{if !$form.username->hasError() && $form.username->getValue()}block{else}none{/if};"></i>
                            <i class="fa fa-times-circle respPosition inCorrectForm" aria-hidden="true" style="color: red;display:{if $form.username->hasError() && $form.username->getValue()}block{else}none{/if};"></i>
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
                        {html_options class="form-control Employee Fields Select {if $form.gender->hasError()}intro{/if}" name="gender" options=$form->gender->getChoices() selected=$employee->get('gender')}
                    </div>
                    <div class="col-sm-8">
                        {*if $form.firstname->hasError() || $form.lastname->hasError()}<div class="w-auto alert {if $form.firstname->hasError()}alert-danger{/if}">{$form.firstname->getError()}</div>{/if*}
                        <input type="text" class="form-control Employee Fields Input {if $form.firstname->hasError()}intro{/if}" name="firstname" value="{$employee->get('firstname')}">
                    </div>
                </div>
            </div>
            <div class="col-md-7">
                <div class="form-group row">
                    <div class="col-md-7">
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label">{__('Last Name')}{if $form->lastname->getOption('required')}*{/if}</label>
                            <div class="col-sm-9">
                                {*if $form.firstname->hasError() || $form.lastname->hasError()}<div class="w-auto alert {if $form.lastname->hasError()}alert-danger{/if}">{$form.lastname->getError()}</div>{/if*}
                                <input type="text" class="form-control Employee Fields Input {if $form.lastname->hasError()}intro{/if}" name="lastname" value="{$employee->get('lastname')}">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label">{__('Birthday')}{if $form->birthday_day->getOption('required')}*{/if}</label>
                            <div class="col-sm-9">
                                {if $form.firstname->hasError() || $form.lastname->hasError() || $form.birthday_day->hasError()}<div class="w-auto alert {if $form.birthday_day->hasError()}alert-danger{/if}">{$form.birthday_day->getError()}</div>{/if}
                                {*<input id="Birthday" type="text" class="form-control Employee Fields Input birthday" name="birthday" value="{if $form->hasErrors()}{$form.birthday}{else}{$employee->getFormatter()->getBirthday()->getText()}{/if}">*}
                               {* <input id="Birthday" type="text" class="form-control Employee Fields Input birthday {if $form.birthday->hasError()}intro{/if}" name="birthday" value="{if $form->hasErrors()}{$form.birthday}{elseif $employee->hasBirthday()}{$employee->getFormatter()->getBirthday()->getText()}{/if}"> *}
                               {if $form->hasErrors()}
                                     {html_options class="form-control Employee Select" name="birthday_day" style="display: inline-block;width: 32%;" options=$form->birthday_day->getChoices()->toArray() selected=$form.birthday_day}
                                     {html_options class="form-control Employee Select" name="birthday_month" style="display: inline-block;width: 32%;" options=$form->birthday_month->getChoices() selected=$form.birthday_month}
                                     {html_options class="form-control Employee Select" name="birthday_year" style="display: inline-block;width: 32%;" options=$form->birthday_year->getChoices()->toArray() selected=$form.birthday_year}
                               {elseif $employee->hasBirthDay()}    
                                    {html_options class="form-control Employee Select" name="birthday_day" style="display: inline-block;width: 32%;" options=$form->birthday_day->getChoices()->toArray() selected=$employee->getFormatter()->getBirthday()->getDay()}
                                    {html_options class="form-control Employee Select" name="birthday_month" style="display: inline-block;width: 32%;" options=$form->birthday_month->getChoices() selected=$employee->getFormatter()->getBirthday()->getMonth()}
                                    {html_options class="form-control Employee Select" name="birthday_year" style="display: inline-block;width: 32%;" options=$form->birthday_year->getChoices()->toArray() selected=$employee->getFormatter()->getBirthday()->getYear()}                                     
                                {else}    
                                    {html_options class="form-control Employee Select" name="birthday_day" style="display: inline-block;width: 32%;" options=$form->birthday_day->getChoices()->toArray()}
                                    {html_options class="form-control Employee Select" name="birthday_month" style="display: inline-block;width: 32%;" options=$form->birthday_month->getChoices()}
                                    {html_options class="form-control Employee Select" name="birthday_year" style="display: inline-block;width: 32%;" options=$form->birthday_year->getChoices()->toArray()}                                                                    
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
                        {*if $form.mobile->hasError() || $form.phone->hasError()}<div class="w-auto alert {if $form.mobile->hasError()}alert-danger{/if}">{$form.mobile->getError()}</div>{/if*}
                        <input type="text" class="form-control Employee Fields Input {if $form.mobile->hasError()}intro{/if}" name="mobile" value="{$employee->get('mobile')}">
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">{__('Phone')}{if $form->phone->getOption('required')}*{/if}</label>
                    <div class="col-sm-10">
                        {*if $form.mobile->hasError() || $form.phone->hasError()}<div class="w-auto alert {if $form.phone->hasError()}alert-danger{/if}">{$form.phone->getError()}</div>{/if*}
                        <input type="text" class="form-control Employee Fields Input {if $form.phone->hasError()}intro{/if}" name="phone" value="{$employee->get('phone')}">
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
                            <input type="text" class="form-control Employee Fields Input {if $form.email->hasError()}intro{/if}" name="email" value="{$employee->get('email')}">
                        {else}
                            <input type="text" class="form-control" readonly="" name="email" value="{$employee->get('email')}">
                        {/if} 
                    </div>
                </div>
            </div> 
            <div class="col-md-6">
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">{__('Picture')}</label>
                    <div class="col-sm-10">
                        {*if $employee->hasAvatar()}
                        <div id="avatar-ctn">
                        <img src="{$employee->getAvatar()->getThumb()->getUrl()}"/>                                   
                        <a href="#" id="EmployeeAvatar-Delete"><i class="fa fa-trash"></i></a>
                        </div>
                        {else}
                            
                        {/if}    
                        <input type="file" class="form-control Employee files" name="MyProfile[avatar]"> *}
                        <div class="form-group">            
                            <div id="AvatarForm">      
                                {__('Max size is')} {format_size($form->avatar->getOption('max_size'))}
                                <div class="custom-FileInput" id="DivLogo">
                                    {*<img id="blah" alt="" style="display: none;" /><br/>*}
                                    {if $employee->hasAvatar()}
                                        <img id="logo" alt="" src="{$employee->getAvatar()->getThumb()->getUrl()}"{*/if*} /><br/>
                                    {else}
                                        <img id="logo" alt="" style="display: none;" /><br/>
                                    {/if}
                                </div>
                                <div class="row">
                                    <div class="">
                                        <a id="logoAdd" href="javascript:void(0);" class="btn btn-default"><i class="fa fa-plus" style="margin-right:10px;"></i>{__('Add a profile picture')}</a>
                                        <input type='file' id="logoInp" hidden="" class="files" name="MyProfile[avatar]"/>
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
                            {*if $form.password->hasError() || $form.repassword->hasError()}<div class="w-auto alert {if $form.password->hasError()}alert-danger{/if}">{$form.password->getError()}</div>{/if*}
                            <label style="font-size: 12px;margin-bottom: 0px;">{$form->password->getDefaultMessage()}</label>
                            <input type="password" autocomplete="off" class="form-control Employee Fields Input {if $form.password->hasError()}intro{/if}" name="password">
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">{__('Re Password')}{if $form->repassword->getOption('required')}*{/if}</label>
                        <div class="col-sm-10">
                            {*if $form.repassword->hasError() || $form.password->hasError()}<div class="w-auto alert {if $form.repassword->hasError()}alert-danger{/if}">{$form.repassword->getError()}</div>{/if*}
                            <label style="color: #fff;font-size: 12px;margin-bottom: 0px;">a</label>
                            <input type="password" autocomplete="off" class="form-control Employee Fields Input {if $form.repassword->hasError()}intro{/if}" name="repassword">
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
                        {*if $form.address1->hasError() || $form.address2->hasError()}<div class="w-auto alert {if $form.address1->hasError()}alert-danger{/if}">{$form.address1->getError()}</div>{/if*}
                        <input type="text" class="form-control Employee Fields Input {if $form.address1->hasError()}intro{/if}" name="address1" value="{$employee->get('address1')}">
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">{__('Address 2')}{if $form->address2->getOption('required')}*{/if}</label>
                    <div class="col-sm-10">
                        {*if $form.address2->hasError() || $form.address1->hasError()}<div class="w-auto alert {if $form.address2->hasError()}alert-danger{/if}">{$form.address2->getError()}</div>{/if*}
                        <input type="text" class="form-control Employee Fields Input {if $form.address2->hasError()}intro{/if}" name="address2" value="{$employee->get('address2')}">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <div class="form-group row">
                    <label class="col-sm-5 col-form-label">{__('Post code')}{if $form->postcode->getOption('required')}*{/if}</label>
                    <div class="col-sm-7">
                        {*if $form.city->hasError() || $form.postcode->hasError() || $form.country->hasError() || $form.state->hasError()}<div class="w-auto alert {if $form.postcode->hasError()}alert-danger{/if}">{$form.postcode->getError()}</div>{/if*}
                        <input type="text" class="form-control Employee Fields Input {if $form.postcode->hasError()}intro{/if}" name="postcode" value="{$employee->get('postcode')}">
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">{__('City')}{if $form->city->getOption('required')}*{/if}</label>
                    <div class="col-sm-10">
                        {*if $form.city->hasError() || $form.postcode->hasError() || $form.country->hasError() || $form.state->hasError()}<div class="w-auto alert {if $form.city->hasError()}alert-danger{/if}">{$form.city->getError()}</div>{/if*}
                        <input type="text" class="form-control Employee Fields Input {if $form.city->hasError()}intro{/if}" name="city" value="{$employee->get('city')}">
                    </div>
                </div>
            </div>   
            <div class="col-md-3">
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">{__('State')}{if $form->state->getOption('required')}*{/if}</label>
                    <div class="col-sm-10">
                        {*if $form.city->hasError() || $form.postcode->hasError() || $form.country->hasError() || $form.state->hasError()}<div class="w-auto alert {if $form.state->hasError()}alert-danger{/if}">{$form.state->getError()}</div>{/if*}
                        <input type="text" class="form-control Employee Fields Input {if $form.state->hasError()}intro{/if}" name="state" value="{$employee->get('state')}">
                    </div>
                </div>
            </div>    
            <div class="col-md-4">
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">{__('Country')}{if $form->country->getOption('required')}*{/if}</label>
                    <div class="col-sm-10">
                        {*if $form.city->hasError() || $form.postcode->hasError() || $form.country->hasError()}<div class="w-auto alert {if $form.country->hasError()}alert-danger{/if}">{$form.country->getError()}</div>{/if*}                             
                        {*if $form.company.postcode->hasError() || $form.company.city->hasError() || $form.company.country->hasError()}<div>&nbsp;</div>{/if*}
                        {select_country name="country" class="Employee js-example-responsive form-control Fields Select EmployeeSelect {if $form.country->hasError()}intro{/if}" preferred=['MA','FR'] options=$form->country->getOption('choices') selected=$employee->get('country')}                               
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
                    <div class="col-sm-12">
                        {*if $form.function_id->hasError()}<div class="w-auto alert {if $form.function_id->hasError()}alert-danger{/if}">{$form.function_id->getError()}</div>{/if*}
                        {html_options class="form-control Employee Fields Select {if $form.function_id->hasError()}intro{/if}" name="function_id" options=$form->function_id->getChoices()->toArray() selected=$employee->get('function_id')}
                    </div>
                </div>
            </div> 
            <div class="col-md-4">
                <div class="form-group row">
                    <div class="col-sm-12">
                        {*if $form.experience_id->hasError()}<div class="w-auto alert {if $form.experience_id->hasError()}alert-danger{/if}">{$form.experience_id->getError()}</div>{/if*}
                        {html_options class="form-control Employee Fields Select {if $form.experience_id->hasError()}intro{/if}" name="experience_id" options=$form->experience_id->getChoices()->toArray() selected=$employee->get('experience_id')}
                    </div>
                </div>
            </div> 
            <div class="col-md-4">
                <div class="form-group row">
                    <div class="col-sm-12">
                        {*if $form.level_id->hasError()}<div class="w-auto alert {if $form.level_id->hasError()}alert-danger{/if}">{$form.level_id->getError()}</div>{/if*}
                        {html_options class="form-control Employee Fields Select {if $form.level_id->hasError()}intro{/if}" name="level_id" options=$form->level_id->getChoices()->toArray() selected=$employee->get('level_id')}
                    </div>
                </div>
            </div> 
        </div>      
        <div class="row">
            <div class="col-md-4">
                <div class="form-group row">
                    <div class="col-sm-12">
                        {*if $form.default_language->hasError()}<div class="w-auto alert {if $form.default_language->hasError()}alert-danger{/if}">{$form.default_language->getError()}</div>{/if*}
                        {html_options class="form-control Employee Fields Select {if $form.default_language->hasError()}intro{/if}" name="default_language" options=$form->default_language->getChoices()->toArray() selected=$employee->get('default_language')}
                    </div>
                </div>
            </div> 
        </div>  
    </div>    
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
            <div id="EmployeeCategories">      
                 {if $form->hasErrors()}
                     {foreach $form->getCategories() as $category} 
                    <div class="EmployeeCategories-list" id="{$category->get('id')}">                                              
                        <div class="btn btn-outline-primary EmployeeCategories" id="{$category->get('id')}">
                    {if $category->hasI18n()}{$category->getI18n()->get('title')}{else}{__('----')}{/if}                                                                               
                    <a href="javascript:void(0);" title="{__('Delete')}" class="EmployeeCategory-Delete" id="{$category->get('id')}"  name="{if $category->hasI18n()}{$category->getI18n()->get('title')}{else}{$category->get('name')}{/if}">
                        <i  class="fa fa-times icon-font delete-color"></i>
                    </a>                                                       
                </div>                
            </div>
        {/foreach}  
                {else}    
                {foreach $employee->getEmployeeCategories()->getCategories() as $category} 
                    <div class="EmployeeCategories-list" id="{$category->get('id')}">                                              
                        <div class="btn btn-outline-primary EmployeeCategories" id="{$category->get('id')}">
                    {if $category->hasI18n()}{$category->getI18n()->get('title')}{else}{__('----')}{/if}                                                                               
                    <a href="javascript:void(0);" title="{__('Delete')}" class="EmployeeCategory-Delete" id="{$category->get('id')}"  name="{if $category->hasI18n()}{$category->getI18n()->get('title')}{else}{$category->get('name')}{/if}">
                        <i  class="fa fa-times icon-font delete-color"></i>
                    </a>                                                       
                </div>                
            </div>
        {/foreach}    
        {/if}
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
{* ==================================== SKILLS  ====================================*}
<div class="tab-pane fade show" id="skills" role="tabpanel" aria-labelledby="skills-tab">                     
    {foreach $form->skills->getSchema() as $index=>$user_skill}
        <div class="skills-ctn" data-index="{$index}">
            <div class="row" style="line-height: 53px;margin-top: -15px;">   
                <div class="col-md-3">
                    <div class="form-group row">
                        <div class="col-md-2 skills-index">
                            {$index+1}
                        </div>                                            
                        <div class="col-md-10">                                                
                            <select class="EmployeeSkill Select form-control" data-index="{$index}" name="skill_id">
                                {foreach $form->skills[$index]['skill_id']->getChoices() as $key=>$value}
                                    {if $key}
                                        <option data-index="{$index}" {if $form.skills[$index]['skill_id']->getValue()==$key}selected=""{/if}  value="{$key}">{$value}</option>
                                    {else}
                                        <option data-index="{$index}" value="">{$value}</option>
                                    {/if}    
                                {/foreach}
                            </select>                                          
                        </div>
                    </div>    
                </div>
                <div class="col-md-3">   
                    <select class="EmployeeSkillLanguages Select form-control" data-index="{$index}" name="lang">
                        {foreach $form->getLanguages()->byIndex() as $idx=>$language}                                               
                            <option data-index="{$index}" {if $user->getLanguage()==$language->get('code')}selected=""{/if} value="{$language->get('code')}">{$language->getFormatter()->getText()->ucfirst()}</option>                                                                                                  
                        {/foreach}   
                    </select>                                                                                                                                                                                                                      
                </div>                                     
                <div class="col-md-3">
                    {foreach $form->getLanguages()->byIndex() as $idx=>$language}                                                       
                        <div style="{if $user->getLanguage()!=$language->get('code')}display:none{/if}" class="skills-i18n-ctn-{$index} skills-i18n-ctn-{$index}-{$language->get('code')}">
                            <input type="text" placeholder="{__('Enter your skill')}" data-index="{$index}" class="EmployeeSkillI18n Input form-control" data-lang="{$language->get('code')}" name="value" value="{if $form->hasErrors()}{else}{$form.skills[$index]['i18n'][$idx]['value']->getValue()}{/if}">                                                                                 
                        </div>
                    {/foreach}
                </div>
                <div class="col-md-1">
                    <div class="form-group row">   
                        <div class="col-md-12">      
                            <a href="javascript:void(0);" class="EmployeeSkill-Add" data-index="{$index}"><i class="fa fa-plus"></i></a>&nbsp    
                                {if $index !=0}
                                <a href="javascript:void(0);" class="EmployeeSkill-Delete" data-index="{$index}"><i class="fa fa-trash"></i></a>                    
                                {/if}                      
                        </div> 
                    </div>
                </div>  
            </div>
        </div>
    {/foreach}     
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
                            <select class="EmployeeLanguage Select EmployeeSelect form-control" data-index="{$index}" name="lang">
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
{* ==================================== DIPLOMAS  ====================================*}
<div class="tab-pane fade show" id="diplomas" role="tabpanel" aria-labelledby="diplomas-tab">                    
    {foreach $form->diplomas->getSchema() as $index=>$user_diploma}
        <div class="diplomas-ctn" data-index="{$index}">
            <div class="row" style="line-height: 53px;margin-bottom: -50px;">   
                <div class="col-md-1">
                    <div class="form-group row Index">
                        <div class="col-md-3">
                            {$index+1}
                        </div>                                            
                        <div class="col-md-9">                                                
                            <div class="field_with_errors">
                                <input placeholder="{__('Year')}" data-index="{$index}" class="EmployeeDiploma Input form-control {if $form.diplomas[$index]['year']->hasError()}intro{/if}" name="year" style="padding: 8px;" value="{$form.diplomas[$index]['year']}"/>
                            </div>                                        
                        </div>
                    </div>    
                </div>
                <div class="col-md-3">
                    <div class="form-group row Index">
                        <div class="col-md-6">
                            <div class="field_with_errors"></div>
                            <select class="EmployeeDiploma Select form-control" data-index="{$index}" name="graduate_id">
                                {foreach $user_diploma['graduate_id']->getChoices() as $key=>$value}
                                    {if $key}
                                        <option data-index="{$index}" {if $form.diplomas[$index]['graduate_id']->getValue()==$key}selected=""{/if} value="{$key}">{$value}</option>
                                    {else}
                                        <option data-index="{$index}" value="">{$value}</option>
                                    {/if}    
                                {/foreach}
                            </select>
                        </div>
                        <div class="col-md-6">
                            <div class="field_with_errors"></div>
                            <select class="EmployeeDiploma Select form-control" data-index="{$index}" name="country">
                                {foreach $user_diploma['country']->getChoices() as $key=>$value}
                                    {if $key}
                                        <option data-index="{$index}" {if $form.diplomas[$index]['country']->getValue()==$key}selected=""{/if} value="{$key}">{$value}</option>
                                    {else}
                                        <option data-index="{$index}" value="">{$value}</option>
                                    {/if}    
                                {/foreach}
                            </select> 
                        </div>
                    </div>
                </div>            
                <div class="col-md-8">
                    <div class="form-group row Index">
                        <div class="col-md-2">
                            <select class="EmployeeDiplomaLanguages Select form-control" data-index="{$index}" name="lang">
                                {foreach $form->getLanguages()->byIndex() as $idx=>$language}                                               
                                    <option data-index="{$index}" {if $user->getLanguage()==$language->get('code')}selected=""{/if} value="{$language->get('code')}">{$language->getFormatter()->getText()->ucfirst()}</option>                                               
                                {/foreach}   
                            </select>
                        </div>
                        <div class="col-md-10">
                            {foreach $form->getLanguages()->byIndex() as $idx=>$language}  
                                <div style="{if $user->getLanguage()!=$language->get('code')}display:none{/if}" class="diplomas-i18n-ctn-{$index} diplomas-i18n-ctn-{$index}-{$language->get('code')}">
                                    <div class="form-group row Index">
                                        <div class="col-md-3">
                                            <input type="text" placeholder="{__('Diploma')}" data-index="{$index}" class="EmployeeDiplomaI18n Input form-control" data-lang="{$language->get('code')}" name="diploma" value="{if $form->hasErrors()}{else}{$form.diplomas[$index]['i18n'][$idx]['diploma']->getValue()}{/if}"> 
                                        </div>
                                        <div class="col-md-5">
                                            <input type="text" placeholder="{__('Address')}" data-index="{$index}" class="EmployeeDiplomaI18n Input form-control" data-lang="{$language->get('code')}" name="location" value="{if $form->hasErrors()}{else}{$form.diplomas[$index]['i18n'][$idx]['location']->getValue()}{/if}">
                                        </div>
                                        <div class="col-md-3">
                                            <input type="text" placeholder="{__('City')}" data-index="{$index}" class="EmployeeDiplomaI18n Input form-control" data-lang="{$language->get('code')}" name="city" value="{if $form->hasErrors()}{else}{$form.diplomas[$index]['i18n'][$idx]['city']->getValue()}{/if}">
                                        </div>
                                        <div class="col-md-1">
                                            <div class="form-group row">   
                                                <div class="col-md-12">      
                                                    <a href="javascript:void(0);" class="EmployeeDiploma-Add" data-index="{$index}"><i class="fa fa-plus"></i></a>&nbsp    
                                                        {if $index !=0}
                                                        <a href="javascript:void(0);" class="EmployeeDiploma-Delete" data-index="{$index}"><i class="fa fa-trash"></i></a>                    
                                                        {/if}                      
                                                </div> 
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            {/foreach} 
                        </div>
                    </div>
                </div>                                                                   
            </div>
        </div>
    {/foreach}    
</div>
</div>
