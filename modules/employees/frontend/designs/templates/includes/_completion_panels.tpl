<div class="tab-content" style="padding-top: 20px;">
               {if $employer_user->isProfessional() && $employer_user->isAdmin()}
                <div class="tab-pane fade show active{*if $language@first}active{/if*} {*Languages*}" id="company" role="company-tab">                 
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-2 col-form-label">{__('Name')}{if $form->company.name->getOption('required')}*{/if}</label>
                          <div class="col-sm-10">
                              {*if $form.company.name->hasError() || $form.company.commercial->hasError()}<div style="color: red;">&nbsp;{$form.company.name->getError()}</div>{/if*}
                            <input type="text" class="form-control EmployerCompany Fields Input {if $form.company.name->hasError()}intro{/if}" name="name" value="{$employer_user->getCompany()->get('name')}"/>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-2 col-form-label">{__('Commercial')}{if $form->company.commercial->getOption('required')}*{/if}</label>
                          <div class="col-sm-10">
                               {*if $form.company.name->hasError() || $form.company.commercial->hasError()}<div style="color: red;">&nbsp;{$form.company.commercial->getError()}</div>{/if*}
                            <input type="text" class="form-control EmployerCompany Fields Input {if $form.company.commercial->hasError()}intro{/if}" name="commercial" value="{$employer_user->getCompany()->get('commercial')}">
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                         <div class="form-group row">
                          <label class="col-sm-1 col-form-label">{__('Address1')}{if $form->company.address1->getOption('required')}*{/if}</label>
                          <div class="col-sm-11">
                               {*<div style="color: red;">{$form.company.address1->getError()}</div>*}
                            <input type="text" class="form-control EmployerCompany Fields Input {if $form->company.address1->hasError()}intro{/if}" name="address1" value="{$employer_user->getCompany()->get('address1')}">
                          </div>
                        </div>
                      </div>                                          
                    </div>
                     <div class="row">
                        {*<div class="col-md-12">*}
                            <div class="col-md-3">
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">{__('Postcode')}{if $form->company.postcode->getOption('required')}*{/if}</label>
                                    <div class="col-sm-8">
                                        {*if $form.company.postcode->hasError() || $form.company.city->hasError() || $form.company.country->hasError()}<div style="color: red;">&nbsp;{$form.company.postcode->getError()}</div>{/if*}
                                        <input type="text" class="form-control EmployerCompany Fields Input {if $form.company.postcode->hasError()}intro{/if}" name="postcode" value="{$employer_user->getCompany()->get('postcode')}">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-1 col-form-label">{__('City')}{if $form->company.city->getOption('required')}*{/if}</label>
                                    <div class="col-sm-11">
                                        {*if $form.company.postcode->hasError() || $form.company.city->hasError() || $form.company.country->hasError()}<div style="color: red;">&nbsp;{$form.company.city->getError()}</div>{/if*}
                                        <input type="text" class="form-control EmployerCompany Fields Input {if $form.company.city->hasError()}intro{/if}" name="city" value="{$employer_user->getCompany()->get('city')}">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group row">                         
                                    <label class="col-sm-4 col-form-label">{__('Country')}{if $form->company.country->getOption('required')}*{/if}</label>
                                    <div class="col-sm-8">   
                                        {*if $form.company.postcode->hasError() || $form.company.city->hasError() || $form.company.country->hasError()}<div>&nbsp;</div>{/if*}
                                        {select_country name="country" class="EmployerCompany js-example-responsive form-control Fields Select {if $form.company.country->hasError()}intro{/if}"  options=$form->company.country->getOption('choices') selected=$employer_user->getCompany()->get('country')}
                                    </div>
                                </div>
                            </div>
                       {* </div>*}
                    </div>                 
                  
                    <div class="row">
                         <div class="col-md-6">
                            <div class="form-group row">
                          <label class="col-sm-2 col-form-label">{__('Email')}{if $form->company.email->getOption('required')}*{/if}</label>
                          <div class="col-sm-10">
                                {*if $form.company.email->hasError() || $form.company.web->hasError()}<div style="color: red;">&nbsp;{$form.company.email->getError()}</div>{/if*}
                                <input type="text" class="form-control EmployerCompany Fields Select {if $form->company.email->hasError()}intro{/if}" name="email" value="{$employer_user->getCompany()->get('email')}">
                          </div>
                        </div>
                        </div>  
                        <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-2 col-form-label">{__('Web')}{if $form->company.web->getOption('required')}*{/if}</label>
                          <div class="col-sm-10">
                                {*if $form.company.email->hasError() || $form.company.web->hasError()}<div style="color: red;">&nbsp;{$form.company.web->getError()}</div>{/if*}
                                <input type="text" class="form-control EmployerCompany Fields Input {if $form->company.web->hasError()}intro{/if}" name="web" value="{$employer_user->getCompany()->get('web')}">
                          </div>
                        </div>
                      </div> 
                    </div>
                          
                    <div class="row">
                         <div class="col-md-6">
                            <div class="form-group row">
                          <label class="col-sm-2 col-form-label">{__('Phone')}{if $form->company.phone->getOption('required')}*{/if}</label>
                          <div class="col-sm-10">
                                {*if $form.company.phone->hasError() || $form.company.mobile->hasError()}<div style="color: red;">&nbsp;{$form.company.phone->getError()}</div>{/if*}
                                <input type="text" class="form-control EmployerCompany Fields Input {if $form.company.phone->hasError()}intro{/if}" name="phone" value="{$employer_user->getCompany()->get('phone')}">
                          </div>
                        </div>
                        </div>  
                          <div class="col-md-6">
                            <div class="form-group row">
                          <label class="col-sm-2 col-form-label">{__('Mobile')}{if $form->company.mobile->getOption('required')}*{/if}</label>
                          <div class="col-sm-10">
                              {*if $form.company.phone->hasError() || $form.company.mobile->hasError()}<div style="color: red;">&nbsp;{$form.company.mobile->getError()}</div>{/if*}
                            <input type="text" class="form-control EmployerCompany Fields Input {if $form->company.mobile->hasError()}intro{/if}" name="mobile" value="{$employer_user->getCompany()->get('mobile')}">
                          </div>
                        </div>
                        </div>  
                    </div>
                          
                     <div class="row">
                         <div class="col-md-6">
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">{__('Picture')}</label>
                                <div class="col-sm-10"> 
                                    <div class="form-group">            
                                        <div id="pictureForm"> 
                                            {__('Max size is')} {format_size($form->avatar->getOption('max_size'))}
                                            <div class="custom-FileInput" id="DivPicture">
                                                {*<img id="blah" alt="" style="display: none;" /><br/>*}
                                                 {if $employer_user->getCompany()->hasPicture()}
                                                    <img id="blah" alt="" src="{$employer_user->getCompany()->getPicture()->getSmall()->getUrl()}"{*/if*} /><br/>
                                                    {else}
                                                        <img id="blah" alt="" style="display: none;" /><br/>
                                                {/if}
                                            </div>
                                            <div class="row">
                                                <div class="">
                                                    <a id="pictureAdd" href="javascript:void(0);" class="btn btn-default"><i class="fa fa-plus" style="margin-right:10px;"></i>{__('Add picture')}</a>
                                                    <input type='file' id="imgInp" hidden="" class="files" name="EmployerCompletion[company][picture]"/>
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
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">{__('Logo')}</label>
                                <div class="col-sm-10">
                                     <div class="form-group">            
                                        <div id="LogoForm">                            
                                            <div class="custom-FileInput" id="DivLogo">
                                                {*<img id="blah" alt="" style="display: none;" /><br/>*}
                                                 {if $employer_user->getCOmpany()->hasLogo()}
                                                    <img id="logo" alt="" src="{$employer_user->getCompany()->getLogo()->getSmall()->getUrl()}"{*/if*} /><br/>
                                                    {else}
                                                        <img id="logo" alt="" style="display: none;" /><br/>
                                                {/if}
                                            </div>
                                            <div class="row">
                                                <div class="">
                                                    <a id="logoAdd" href="javascript:void(0);" class="btn btn-default"><i class="fa fa-plus" style="margin-right:10px;"></i>{__('Add logo')}</a>
                                                    <input type='file' id="logoInp" hidden="" class="files" name="EmployerCompletion[company][logo]"/>
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
                </div>
                {/if}
                    {*====================================== PUBLIC ========================================*}
                    <div class="tab-pane fade show {if !$employer_user->isProfessional() || !$employer_user->isAdmin()}active{/if}" id="public" role="public-tab">                 
                        <div class="row">
                            <div class="col-md-6">
                              <div class="form-group row">
                                <label class="col-sm-2 col-form-label">{__('User Name')}{if $form->username->getOption('required')}*{/if}</label>
                                <div class="col-sm-10">
                                    {*if $form.username->hasError()}<div class="w-auto alert {if $form.username->hasError()}alert-danger{/if}">{$form.username->getError()}</div>{/if*}
                                    <input type="text" class="form-control EmployerUser Fields Input {if $form.username->hasError()}intro{/if}" name="username" value="{$employer_user->get('username')}">
                                    <i class="fa fa-check-circle respPosition correctForm" aria-hidden="true" style="color: green;display:{if !$form.username->hasError() && $form.username->getValue()}block;{else}none;{/if}"></i>
                                    <i class="fa fa-times-circle respPosition inCorrectForm" aria-hidden="true" style="color: red;display:{if $form.username->hasError() && $form.username->getValue()}block;{else}none;{/if}"></i>
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
                          {html_options class="form-control EmployerUser Fields Select" name="gender" options=$form->gender->getChoices() selected=$employer_user->get('gender')}
                          </div>
                          <div class="col-sm-8">
                              {*if $form.firstname->hasError() || $form.lastname->hasError()}<div class="w-auto alert {if $form.firstname->hasError()}alert-danger{/if}">{$form.firstname->getError()}</div>{/if*}
                            <input type="text" class="form-control EmployerUser Fields Input {if $form.firstname->hasError()}intro{/if}" name="firstname" value="{$employer_user->get('firstname')}">
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-2 col-form-label">{__('Last Name')}{if $form->lastname->getOption('required')}*{/if}</label>
                          <div class="col-sm-10">
                               {*if $form.lastname->hasError() || $form.firstname->hasError()}<div class="w-auto alert {if $form.lastname->hasError()}alert-danger{/if}">{$form.lastname->getError()}</div>{/if*}
                              <input type="text" class="form-control EmployerUser Fields Input {if $form.lastname->hasError()}intro{/if}" name="lastname" value="{$employer_user->get('lastname')}">
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
                                <input type="text" class="form-control EmployerUser Fields Input {if $form.mobile->hasError()}intro{/if}" name="mobile" value="{$employer_user->get('mobile')}">
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-2 col-form-label">{__('Phone')}{if $form->phone->getOption('required')}*{/if}</label>
                          <div class="col-sm-10">
                                {*if $form.mobile->hasError() || $form.phone->hasError()}<div class="w-auto alert {if $form.phone->hasError()}alert-danger{/if}">{$form.phone->getError()}</div>{/if*}
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
                            <input type="text" class="form-control" readonly="" value="{$employer_user->get('email')}">
                          </div>
                        </div>
                      </div>                                         
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-2 col-form-label">{__('Picture')}</label>
                          <div class="col-sm-10">
                               <div class="form-avatar">            
                                        <div id="AvatarForm">                            
                                            <div class="custom-FileInput" id="DivAvatar">
                                                {*<img id="blah" alt="" style="display: none;" /><br/>*}
                                                 {if $employer_user->hasAvatar()}
                                                    <img id="avatar" alt="" src="{$employer_user->getAvatar()->getThumb()->getUrl()}"{*/if*} /><br/>
                                                    {else}
                                                        <img id="avatar" alt="" style="display: none;" /><br/>
                                                {/if}
                                            </div>
                                            <div class="row">
                                                <div class="">
                                                    <a id="AvatarAdd" href="javascript:void(0);" class="btn btn-default"><i class="fa fa-plus" style="margin-right:10px;"></i>{__('Add a profile picture')}</a>
                                                    <input type='file' id="avatarInp" hidden="" class="EmployerUser files" name="EmployeeCompletion[avatar]"/>
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
                {* ==================================== LANGUAGES  ====================================*}
                <div class="tab-pane fade show" id="languages" role="tabpanel" aria-labelledby="languages-tab">   
                         {*foreach $form->languages->getSchema() as $index=>$user_language}
                              <div class="languages-ctn" data-index="{$index}">
                                  <div class="row" style="line-height: 53px;">   
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
                                                <select class="EmployeeLanguages Select form-control" data-index="{$index}" name="lang">
                                                {foreach $form->languages[$index]['lang']->getChoices() as $key=>$value}
                                                    {if $key}
                                                    <option data-index="{$index}" {if $user->getLanguage()==$key}selected=""{/if} value="{$key}">{$value->getFormatted()->ucfirst()}</option>
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
                                                        <select class="EmployeeLanguages Select form-control" data-index="{$index}" name="level_id">
                                                        {foreach $form->languages[$index]['level_id']->getChoices() as $key=>$value}
                                                            {if $key}
                                                            <option data-index="{$index}" value="{$key}">{$value}</option>
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
                                                <div class="col-md-1">      
                                                    <a href="javascript:void(0);" class="EmployeeLanguages-Add Add" data-index="{$index}"><i class="fa fa-plus"></i></a>    
                                                    {if $index !=0}
                                                        <a href="javascript:void(0);" class="EmployeeLanguages-Delete" data-index="{$index}"><i class="fa fa-trash"></i></a>                    
                                                    {/if}                      
                                                </div> 
                                            </div>
                                       </div>                                     
                                   </div>                          
                         {/foreach*}    
                    </div>
                
                {* ==================================== DETAILS  ====================================*}
                <div class="tab-pane fade show" id="details" role="tabpanel" aria-labelledby="details-tab">                                                                                    
                       <div class="row">
                       <div class="col-md-4">
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">{__('Function')}{if $form->function_id->getOption('required')}*{/if}</label>
                            <div class="col-sm-10">
                                {*if $form.function_id->hasError()}<div class="w-auto alert {if $form.function_id->hasError()}alert-danger{/if}">{$form.function_id->getError()}</div>{/if*}
                                {html_options class="form-control EmployerUser Fields Select {if $form.function_id->hasError()}intro{/if}" name="function_id" options=$form->function_id->getChoices()->toArray() selected=$employer_user->get('function_id')}
                            </div>
                        </div>
                      </div> 
                          
                      <div class="col-md-6" style="padding-left: 75px;">
                        <div class="form-group row">
                            <label class="col-form-label">{__('Default Language')}{if $form->default_language->getOption('required')}*{/if}</label>
                            <div class="col-sm-8" style="padding-left: 40px;">
                                {*if $form.default_language->hasError()}<div class="w-auto alert {if $form.default_language->hasError()}alert-danger{/if}">{$form.default_language->getError()}</div>{/if*}
                                {html_options class="form-control Employee Fields Select {if $form.default_language->hasError()}intro{/if}" name="default_language" options=$form->default_language->getChoices()->toArray() selected=$employer_user->get('default_language')}
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
          </div> 