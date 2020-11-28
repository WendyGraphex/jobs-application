<div class="row RowTop">
    <div class="col-md-12 grid-margin classConducteurTop">
      <div class="d-flex justify-content-between flex-wrap">
        <div class="d-flex align-items-end flex-wrap">
          <div class="mr-md-3 mr-xl-5 styleWidth">
            <h2>{__('Finalize your registration')}</h2>                   
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
               {if $employer_user->isProfessional() && $employer_user->isAdmin()}
                <li class="nav-item">  
                    <a class="nav-link active"  id="comapny-tab" data-toggle="tab" href="#company" role="tab" aria-controls="company" aria-selected="true">
                      {__('Company information')}
                      {*if $form.->hasError()}<span style="color:red">?</span>{/if*}
                  </a>
                </li>
                {/if}
                <li class="nav-item">  
                  <a class="nav-link {if !$employer_user->isProfessional() || !$employer_user->isAdmin()}active{/if}"  id="public-tab" data-toggle="tab" href="#public" role="tab" aria-controls="public" aria-selected="true">
                      {__('Public information')}
                      {*if $form.->hasError()}<span style="color:red">?</span>{/if*}
                  </a>
                </li>   
                <li class="nav-item">            
                  <a class="nav-link"  id="personal-tab" data-toggle="tab" href="#personal" role="tab" aria-controls="personal" aria-selected="true">
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
                 <li class="nav-item">            
                  <a class="nav-link"  id="details-tab" data-toggle="tab" href="#categories" role="tab" aria-controls="categories" aria-selected="true">
                     {__('Categories')}
                     {*if $form.->hasError()}<span style="color:red">?</span>{/if*}
                  </a>
                </li>
            </ul>
                  
            <div class="tab-content" style="padding-top: 20px;">
               {if $employer_user->isProfessional() && $employer_user->isAdmin()}
                <div class="tab-pane fade show active{*if $language@first}active{/if*} {*Languages*}" id="company" role="company-tab">                 
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-2 col-form-label">{__('Name')}{if $form->company.name->getOption('required')}*{/if}</label>
                          <div class="col-sm-10">
                              {if $form.company.name->hasError() || $form.company.commercial->hasError()}<div style="color: red;">&nbsp;{$form.company.name->getError()}</div>{/if}
                            <input type="text" class="form-control EmployerCompany Fields Input" name="name" value="{$employer_user->getCompany()->get('name')}"/>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-2 col-form-label">{__('Commercial')}{if $form->company.commercial->getOption('required')}*{/if}</label>
                          <div class="col-sm-10">
                               {if $form.company.name->hasError() || $form.company.commercial->hasError()}<div style="color: red;">&nbsp;{$form.company.commercial->getError()}</div>{/if}
                            <input type="text" class="form-control EmployerCompany Fields Input" name="commercial" value="{$employer_user->getCompany()->get('commercial')}">
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                         <div class="form-group row">
                          <label class="col-sm-1 col-form-label">{__('Address1')}{if $form->company.address1->getOption('required')}*{/if}</label>
                          <div class="col-sm-11">
                               <div style="color: red;">{$form.company.address1->getError()}</div>
                            <input type="text" class="form-control EmployerCompany Fields Input" name="address1" value="{$employer_user->getCompany()->get('address1')}">
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
                                         {if $form.company.postcode->hasError() || $form.company.city->hasError() || $form.company.country->hasError()}<div style="color: red;">&nbsp;{$form.company.postcode->getError()}</div>{/if}
                                      <input type="text" class="form-control EmployerCompany Fields Input" name="postcode" value="{$employer_user->getCompany()->get('postcode')}">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-1 col-form-label">{__('City')}{if $form->company.city->getOption('required')}*{/if}</label>
                                    <div class="col-sm-11">
                                         {if $form.company.postcode->hasError() || $form.company.city->hasError() || $form.company.country->hasError()}<div style="color: red;">&nbsp;{$form.company.city->getError()}</div>{/if}
                                      <input type="text" class="form-control EmployerCompany Fields Input" name="city" value="{$employer_user->getCompany()->get('city')}">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group row">                         
                                    <label class="col-sm-4 col-form-label">{__('Country')}{if $form->company.country->getOption('required')}*{/if}</label>
                                    <div class="col-sm-8">   
                                        {if $form.company.postcode->hasError() || $form.company.city->hasError() || $form.company.country->hasError()}<div>&nbsp;</div>{/if}
                                       {select_country name="country" class="EmployerCompany js-example-responsive form-control Fields Select"  multiple="multiple" preferred=['MA','FR'] options=$form->company.country->getOption('choices') selected=$employer_user->getCompany()->get('country')}
                                       
                                       {*<select class="js-example-basic-single js-states form-control" id="id_label_single" style="width: 75%">
                                            <option>white</option>
                                            <option>purple</option>
                                            <option>eeeee</option>
                                            <option>rrrrr</option>
                                            <option>bbbbb</option>
                                       </select>*}
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
                               {if $form.company.email->hasError() || $form.company.web->hasError()}<div style="color: red;">&nbsp;{$form.company.email->getError()}</div>{/if}
                            <input type="text" class="form-control EmployerCompany Fields Select" name="email" value="{$employer_user->getCompany()->get('email')}">
                          </div>
                        </div>
                        </div>  
                        <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-2 col-form-label">{__('Web')}{if $form->company.web->getOption('required')}*{/if}</label>
                          <div class="col-sm-10">
                                {if $form.company.email->hasError() || $form.company.web->hasError()}<div style="color: red;">&nbsp;{$form.company.web->getError()}</div>{/if}
                            <input type="text" class="form-control EmployerCompany Fields Input" name="web" value="{$employer_user->getCompany()->get('web')}">
                          </div>
                        </div>
                      </div> 
                    </div>
                          
                    <div class="row">
                         <div class="col-md-6">
                            <div class="form-group row">
                          <label class="col-sm-2 col-form-label">{__('Phone')}{if $form->company.phone->getOption('required')}*{/if}</label>
                          <div class="col-sm-10">
                                 {if $form.company.phone->hasError() || $form.company.mobile->hasError()}<div style="color: red;">&nbsp;{$form.company.phone->getError()}</div>{/if}
                            <input type="text" class="form-control EmployerCompany Fields Input" name="phone" value="{$employer_user->getCompany()->get('phone')}">
                          </div>
                        </div>
                        </div>  
                          <div class="col-md-6">
                            <div class="form-group row">
                          <label class="col-sm-2 col-form-label">{__('Mobile')}{if $form->company.mobile->getOption('required')}*{/if}</label>
                          <div class="col-sm-10">
                              {if $form.company.phone->hasError() || $form.company.mobile->hasError()}<div style="color: red;">&nbsp;{$form.company.mobile->getError()}</div>{/if}
                            <input type="text" class="form-control EmployerCompany Fields Input" name="mobile" value="{$employer_user->getCompany()->get('mobile')}">
                          </div>
                        </div>
                        </div>  
                    </div>
                          
                     <div class="row">
                         <div class="col-md-6">
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">{__('Picture')}</label>
                                <div class="col-sm-10">
                                  {*if $employer_user->getCompany()->hasPicture()}
                                         <div id="picture-ctn">
                                          <img height="128px" width="128px" src="{$employer_user->getCompany()->getPicture()->getSmall()->getUrl()}"/>                                   
                                          <a href="#" id="EmployerCompanyPicture-Delete"><i class="fa fa-trash"></i></a>
                                         </div>
                                     {else}

                                     {/if}    
                                     <input type="file" class="form-control files" name="EmployerCompletion[company][picture]">  *}
                                     
                                    <div class="form-group">            
                                        <div id="pictureForm">                            
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
                                                    <a id="pictureAdd" href="#" class="btn btn-default"><i class="fa fa-plus" style="margin-right:10px;"></i>{__('Add picture')}</a>
                                                    <input type='file' id="imgInp" hidden="" class="files" name="EmployerCompletion[company][picture]"/>
                                                </div>
                                                <div class="" style="padding-top: 14px;padding-left: 0px;">
                                                    <div class="thumbnail media-lib-item parent">
                                                        <a href="#" class="list-action ModePicture" name="NORMAL" id="BtnInverse" style=""><i class="ModeIconForPicture Normal fa fa-square-o"></i></a>
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
                                  {*if $employer_user->getCOmpany()->hasLogo()}
                                         <div id="logo-ctn">
                                          <img height="128px" width="128px" src="{$employer_user->getCompany()->getLogo()->getSmall()->getUrl()}"/>                                   
                                          <a href="#" id="EmployerCompanyLogo-Delete"><i class="fa fa-trash"></i></a>
                                         </div>
                                     {else}

                                     {/if}    
                                     <input type="file" class="form-control files" name="EmployerCompletion[company][logo]">  *}
                                     
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
                                                    <a id="logoAdd" href="#" class="btn btn-default"><i class="fa fa-plus" style="margin-right:10px;"></i>{__('Add logo')}</a>
                                                    <input type='file' id="logoInp" hidden="" class="files" name="EmployerCompletion[company][logo]"/>
                                                </div>
                                                <div class="" style="padding-top: 14px;padding-left: 0px;">
                                                    <div class="thumbnail media-lib-item parent">
                                                        <a href="#" class="list-action ModeLogo" name="NORMAL" id="BtnInverse" style=""><i class="ModeIconForLogo Normal fa fa-square-o"></i></a>
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
                                     {if $form.username->hasError()}<div class="w-auto alert {if $form.username->hasError()}alert-danger{/if}">{$form.username->getError()}</div>{/if}
                                    <input type="text" class="form-control EmployerUser Fields Input" name="username" value="{$employer_user->get('username')}">
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
                              {if $form.firstname->hasError() || $form.lastname->hasError()}<div class="w-auto alert {if $form.firstname->hasError()}alert-danger{/if}">{$form.firstname->getError()}</div>{/if}
                            <input type="text" class="form-control EmployerUser Fields Input" name="firstname" value="{$employer_user->get('firstname')}">
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-2 col-form-label">{__('Last Name')}{if $form->lastname->getOption('required')}*{/if}</label>
                          <div class="col-sm-10">
                               {if $form.lastname->hasError() || $form.firstname->hasError()}<div class="w-auto alert {if $form.lastname->hasError()}alert-danger{/if}">{$form.lastname->getError()}</div>{/if}
                              <input type="text" class="form-control EmployerUser Fields Input" name="lastname" value="{$employer_user->get('lastname')}">
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
                            <input type="text" class="form-control EmployerUser Fields Input" name="mobile" value="{$employer_user->get('mobile')}">
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-2 col-form-label">{__('Phone')}{if $form->phone->getOption('required')}*{/if}</label>
                          <div class="col-sm-10">
                              {if $form.mobile->hasError() || $form.phone->hasError()}<div class="w-auto alert {if $form.phone->hasError()}alert-danger{/if}">{$form.phone->getError()}</div>{/if}
                            <input type="text" class="form-control EmployerUser Fields Input" name="phone" value="{$employer_user->get('phone')}">
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
                          <label class="col-sm-2 col-form-label">{__('Avatar')}</label>
                          <div class="col-sm-10">
                               {*if $employer_user->hasAvatar()}
                                   <div id="avatar-ctn">
                                    <img src="{$employer_user->getAvatar()->getThumb()->getUrl()}"/>                                   
                                    <a href="javascript:void(0);" id="EmployerUserAvatar-Delete"><i class="fa fa-trash"></i></a>
                                   </div>
                               {else}
                                   
                               {/if}    
                               <input type="file" class="form-control EmployerUser files" name="EmployerCompletion[avatar]">  *}
                               
                               
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
                                                    <input type='file' id="avatarInp" hidden="" class="EmployerUser files" name="EmployerCompletion[avatar]"/>
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
                             {html_options class="form-control EmployerUser Fields Select" name="function_id" options=$form->function_id->getChoices()->toArray() selected=$employer_user->get('function_id')}
                          </div>
                        </div>
                      </div> 
                          
                      <div class="col-md-6" style="padding-left: 75px;">
                        <div class="form-group row">
                          <label class="col-form-label">{__('Default Language')}{if $form->default_language->getOption('required')}*{/if}</label>
                          <div class="col-sm-8" style="padding-left: 40px;">
                               {if $form.default_language->hasError()}<div class="w-auto alert {if $form.default_language->hasError()}alert-danger{/if}">{$form.default_language->getError()}</div>{/if}
                             {html_options class="form-control Employee Fields Select" name="default_language" options=$form->default_language->getChoices()->toArray() selected=$employer_user->get('default_language')}
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
        </div>         
    </div>
</div>
                
                         
<script type="text/javascript">                  
      
      
      
      $('#pictureAdd').click(function() {
        $('#imgInp').click();
     });
      
    $("#imgInp").change(function() {   
        if (this.files && this.files[0]) {
          var reader = new FileReader();
          reader.onload = function(e) {  $('#blah').css('display','block').attr('src', e.target.result); };
          reader.readAsDataURL(this.files[0]);
        }        
    });
    
    
    
    $(".ModePicture").click(function(){
        if ($(this).attr('name')=='NORMAL'){
            $(this).attr('name','INVERSE');
                $(".ModeIconForPicture").removeClass('Normal fa fa-square-o').addClass('Inverse fa fa-square');
                $("#DivPicture").css('background-color','rgb(155, 155, 155)');
            }
            else
            {
                $(this).attr('name','NORMAL');
                $(".ModeIconForPicture").removeClass('Inverse fa fa-square').addClass('Normal fa fa-square-o');
                $("#DivPicture").css('background-color','');
            }
   });
   {*=============================================================================================================*}
      
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
   {*=============================================================================================================*}
      
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
   {*======================================================================================================================*}   
      
      
      
      
        {*$(".js-example-theme-multiple").select2({
            theme: "classic"
        });*}
            
    {*    $('#id_label_single').select2({
                
            }); *}
        
             
     {* $(".js-example-tags").select2({
        tags: true
      });*}
      
    $('#Save').click(function(){                             
           var  params= {           
                                EmployerCompletion: {   
                                   company : { },              
                                   categories :  [],
                                   token :'{$form->getCSRFToken()}'
                                } };
          $(".EmployerCompany.Input").each(function() { params.EmployerCompletion.company[$(this).attr('name')]=$(this).val(); });                              
          $(".EmployerUser.Input").each(function() { params.EmployerCompletion[$(this).attr('name')]=$(this).val(); });                              
          $(".EmployerCompany.Select option:selected").each(function () { params.EmployerCompletion.company[$(this).parent().attr('name')]=$(this).val(); });  
          $(".EmployerUser.Select option:selected").each(function () { params.EmployerCompletion[$(this).parent().attr('name')]=$(this).val(); });  
          $(".EmployerCategories").each(function () { params.EmployerCompletion.categories.push($(this).attr('id')); });
          return $.ajax2({ data : params,   
                           files: ".files",
                           url: "{url_to('employers_ajax',['action'=>'SaveCompletion'])}",
                           target: "#page-wrapper"}); 
    }); 
     
     
    $("#EmployerUserAvatar-Delete").click(function () { 
       return $.ajax2({                        
                           url: "{url_to('employers_ajax',['action'=>'DeleteMyAvatar'])}",
                           success : function (resp)
                                {
                                     if (resp.action !='DeleteMyAvatar') return ;
                                     $("#avatar-ctn").html("")
                                }
                     });
    });
    
    
     $("#EmployerCompanyLogo-Delete").click(function () { 
       return $.ajax2({                        
                           url: "{url_to('employers_ajax',['action'=>'DeleteCompanyLogo'])}",
                           success : function (resp)
                                {
                                     if (resp.action !='DeleteCompanyLogo') return ;
                                     $("#logo-ctn").html("")
                                }
                     });
    });
    
      $("#EmployerCompanyPicture-Delete").click(function () { 
       return $.ajax2({                        
                           url: "{url_to('employers_ajax',['action'=>'DeleteCompanyPicture'])}",
                           success : function (resp)
                                {
                                     if (resp.action !='DeleteCompanyPicture') return ;
                                     $("#picture-ctn").html("")
                                }
                     });
    });
    
     $("#Modal-Categories-Close").click(function () {  $("#Modal-Categories").hide(); });     
      
     $("#DialogCategories").click(function () { 
           var params = { EmployerCategory : {   selection : [ ],  token : '{mfForm::getToken('EmployerPartnerWorkCategorySelectionForm')}' } };      
            $(".EmployerCategories-list").each(function() { params.EmployerCategory.selection.push($(this).attr('id'));  }); 
             return $.ajax2({      
                         data : params,
                         url:"{url_to('employers_ajax',['action'=>'ListPartialDialogCategoryForMyProfile'])}",                                              
                         success : function () { $("#Modal-Categories").show(); },
                         target: "#Modal-Categories-ctn"
                       });     
     });  
     
     
     $("#AddCategories").click(function () { 
            var params = { AddCategoriesForMyProfile : {  selection: $("#DialogCategoryList").data('selection'), token : '{mfForm::getToken('AddCategoriesForMyProfileForm')}' } };           
            return $.ajax2({
                  data : params,
                  url: "{url_to('employers_ajax',['action'=>'AddCategoriesForMyProfile'])}",    
                  success : function () {   $("#Modal-Categories").hide(); },
                  target: "#categories-ctn"
              });
     });
      
     $(".EmployerCategory-Delete").click(function () {            
     {* if (!confirm('{__("Category [#0#] will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false;  *}
            $(".EmployerCategories-list[id="+$(this).attr('id')+"]").remove();
     }); 
</script>    

