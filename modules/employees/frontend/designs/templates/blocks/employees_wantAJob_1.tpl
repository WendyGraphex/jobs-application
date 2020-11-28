
<div class="ModalAtJob modal fade" id="ModalWantAJob" role="dialog">
    <div class="modal-dialog modal-lg" style="width: 50%;left: 35%;top: 20%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <ul class="nav nav-tabs" id="myTab" role="tablist">    
                    <li class="nav-item classWidth">
                        <a class="nav-link active" id="t-account-tab" data-toggle="tab" href="#t-account" role="tab" aria-controls="t-account" aria-selected="false"><span class="stepNumberModal">1.</span>&nbsp<span>{__('Account')}</span></a>
                    </li>
                    <li class="nav-item classWidth">
                        <a class="nav-link" id="t-advert-tab" data-toggle="tab" href="#t-advert" role="tab" aria-controls="t-advert" aria-selected="true"><span class="stepNumberModal" style="">2.</span>&nbsp<span>{__('Advert')}</span></a>
                    </li>
                </ul>
                    
                    
                <div class="tab-content" id="myTabContentViewPage">         
                    <div class="tab-pane fade show active" id="t-account" role="tabpanel" aria-labelledby="t-account-tab">  
                        <div class="ModalWantPostJob">
                            <h4>{__('New here?')}</h4>
                            <h6 class="font-weight-light">{__('Signing up is easy. It only takes a few steps')}</h6> 
                                <div class="col-md-12 classPadding" >
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group" name="gender">
                                                <div class="errors" name="gender"></div>   
                                                {*html_options style="padding-left: 2px;" name="gender" class="Signup Fields Select form-control form-control-lg error" options=$form->gender->getOption("choices")*}                
                                                <select class="Signup Fields Select form-control form-control-lg error">
                                                    <option>Mr</option>
                                                </select>
                                            </div>
                                        </div>
                                         <div class="col-md-8">
                                            <div class="form-group" name="firstname">
                                                <div class="errors" name="firstname"></div>     
                                                <input type="text" name="firstname" class="Signup Fields Input form-control form-control-lg error" placeholder="{__('Firstname')}">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            <div class="form-group" name="lastname">
                                <div class="errors" name="lastname"></div>     
                                <input type="text" name="lastname" class="Signup Fields Input form-control form-control-lg error" placeholder="{__('Lastname')}">
                            </div>

                            <div class="form-group" name="email">
                                <div class="errors" name="email"></div>     
                                <div class="input-group mb-3 error" name="password">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon1"><i class="mdi mdi-account"></i></span>
                                    </div>
                                    <input type="email" name="email" class="Signup Fields Input form-control form-control-lg"  placeholder="{__('Email')}">
                                    <span id="validateEmailValid" class="validateEmail" style="color:#09ad7e;display:none;position: absolute;right:-24px;top: 0px;font-size: 22px;"><i class="mdi mdi-checkbox-marked-circle"></i></span>
                                    <span id="validateEmailNotValid" class="validateEmail" style="color:#ff0000;display:none;position: absolute;right:-24px;top: 0px;font-size: 22px;"><i class="mdi mdi-close-circle"></i></span>
                                </div>
                            </div>
                            <div class="form-group" >
                                <div class="errors" name="password"></div>     
                                <div class="input-group mb-3 error" name="password">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon1"><i class="mdi mdi-lock"></i></span>
                                    </div>
                                    <input type="password" name="password" class="Signup Fields Input form-control form-control-lg" placeholder="{__('Password')}">
                                </div>
                            </div>

                            <div class="mb-4">

                            <div class="custom-control custom-checkbox custom-control-inline">
                              <input type="checkbox" class="custom-control-input" id="defaultInline1">
                              <label class="custom-control-label" for="defaultInline1">
                                   {component name="/sales/conditionsLink" tpl="link"} 
                              </label>
                            </div>
                            </div>
                            <div class="mt-3">
                              <a class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" id="Signup" href="#">{__('SIGN UP')}</a>
                            </div>
                            {*<div class="text-center mt-4 font-weight-light">
                                {__('Already have an account?')} 
                                <a href="{link_i18n("employees_login")}" class="text-primary">{__('Login')}</a>
                            </div> *}
                            <div style="margin-top: 20px;">
                                <a href="{link_i18n('employees_login')}" class="btn btn-success" style="padding: 10px 20px 10px 20px;">{__('Login')}</a>
                                <button id="nextStep" class="btn btn-success">{__('Next')} >></button>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="t-advert" role="tabpanel" aria-labelledby="t-advert-tab">
                        <div class="col-lg-12 pt-2 stretch-card">
                            <div class="card classMargin">
                                <div class="card-body">             
                                    <ul class="nav nav-tabs secondTab" id="" role="tablist">
                                        {*foreach $form->getLanguages() as $language*}
                                        <li class="nav-item">            
                                            <a class="nav-link active"  id="language" data-toggle="tab" href="#languages" role="tab" aria-controls="languages" aria-selected="true">
                                                English
                                            </a>
                                        </li>        
                                        {*/foreach*}
                                        <li class="nav-item">            
                                          <a class="nav-link"  id="categories-tab" data-toggle="tab" href="#categories" role="tab" aria-controls="categories" aria-selected="true">
                                             {__('Categories')}
                                          </a>
                                        </li>   
                                        <li class="nav-item">            
                                          <a class="nav-link"  id="documents-tab" data-toggle="tab" href="#documents" role="tab" aria-controls="documents" aria-selected="true">
                                             {__('Documents')}
                                          </a>
                                        </li> 
                                         <li class="nav-item">            
                                          <a class="nav-link"  id="details-tab" data-toggle="tab" href="#details" role="tab" aria-controls="details" aria-selected="true">
                                             {__('Experience')}
                                          </a>
                                        </li>
                                    </ul>

                                   {* <div class="tab-content">
                                        {foreach $form->getLanguages()->byIndex() as $index=>$language}
                                        <div class="tab-pane fade show {if $language@first}active{/if} Languages" id="{$language->get('code')}" role="tabpanel" aria-labelledby="language-{$language->get('code')}-tab">                 
                                              <div class="row mt-3">                       
                                                 <div class="form col-md-12">                                   
                                                   <div class="form-group">                          
                                                           <label>{__("Title")}{if $form->adverts[$index].title->getOption('required')}*{/if}</label>
                                                           <div>{$form.adverts[$index].title->getError()}</div>
                                                           <input type="text" class="EmployeeAdvertI18n Input form-control" data-lang="{$language->get('code')}" name="title" value="{if $form->hasErrors()}{$form.adverts[$index].title}{else}{$form->getAdvert()->getAdvertsI18n()->getItemByIndex($index)->get('title')}{/if}">
                                                   </div>                    
                                                 </div>  
                                               </div>
                                               <div class="row mt-3">                       
                                                 <div class="form col-md-12">                                   
                                                   <div class="form-group">                          
                                                           <label>{__("Short description")}{if $form->adverts[$index].short_description->getOption('required')}*{/if}</label>
                                                           <div>{$form.adverts[$index].short_description->getError()}</div>
                                                           <textarea cols="40" rows="5" class="EmployeeAdvertI18n Input form-control" data-lang="{$language->get('code')}" name="short_description">{if $form->hasErrors()}{$form.adverts[$index].short_description}{else}{$form->getAdvert()->getAdvertsI18n()->getItemByIndex($index)->get('short_description')}{/if}</textarea>
                                                   </div>                    
                                                 </div>  
                                               </div>
                                              <div class="row mt-3">                       
                                                 <div class="form col-md-12">                                   
                                                   <div class="form-group">                          
                                                           <label>{__("Content")}{if $form->adverts[$index].content->getOption('required')}*{/if}</label>
                                                           <div>{$form.adverts[$index].content->getError()}</div>
                                                           <textarea cols="40" rows="10" class="EmployeeAdvertI18n Input form-control" data-lang="{$language->get('code')}" name="content">{if $form->hasErrors()}{$form.adverts[$index].content}{else}{$form->getAdvert()->getAdvertsI18n()->getItemByIndex($index)->get('content')}{/if}</textarea>
                                                   </div>                    
                                                 </div>  
                                               </div>                  
                                        </div> 
                                        {/foreach}
                                    </div> *}                  
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
    {JqueryScriptsReady}  
        
 /*   $("#nextStep").click(function () { 
        $("#t-advert-tab").addClass('active show');
        $("#t-advert-tab").css('pointer-events','auto');
        $("#t-advert").addClass('active show');
        
        $("#t-account-tab").removeClass('active show');
        $("#t-account-tab").css('pointer-events','none');
        $("#t-account").removeClass('active show');
    });
    */

     
    $("#WantAJobBtn").click(function () { 
        $("#ModalWantAJob").modal('show');
    });
    
    {/JqueryScriptsReady}
</script> 
