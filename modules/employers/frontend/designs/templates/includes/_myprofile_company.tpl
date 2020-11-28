<div class="tab-pane fade show active{*if $language@first}active{/if*} {*Languages*}" id="company" role="company-tab">                 
    <div class="row">
        <label class="col-md-1 col-form-label">{__('Name')}{if $form->company.name->getOption('required')}*{/if}</label>
        <div class="col-md-5">
            <div class="form-group row">
                <div class="col-sm-12">
                    {*if $form.company.name->hasError() || $form.company.commercial->hasError()}<div class="w-auto alert alert-danger">{$form.company.name->getError()}</div>{/if*}
                    <input type="text" class="form-control EmployerCompany Fields Input {if $form.company.name->hasError()}intro{/if}" name="name" value="{$employer_user->getCompany()->get('name')}"/>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">{__('Commercial')}{if $form->company.commercial->getOption('required')}*{/if}</label>
                <div class="col-sm-10">
                    {*if $form.company.name->hasError() || $form.company.commercial->hasError()}<div class="w-auto alert alert-danger">&nbsp;{$form.company.commercial->getError()}</div>{/if*}
                    <input type="text" class="form-control EmployerCompany Fields Input {if $form.company.commercial->hasError()}intro{/if}" name="commercial" value="{$employer_user->getCompany()->get('commercial')}">
                </div>
            </div>
        </div>
    </div>   
    <div class="row">
        <label class="col-md-1 col-form-label">{__('Address')}{if $form->company.address1->getOption('required')}*{/if}</label>
        <div class="col-md-7">
            <div class="form-group row">
                <div class="col-sm-12">
                    {*if $form->company.address1->hasError()}<div class="w-auto alert alert-danger">{$form.company.address1->getError()}</div>{/if*}
                    <input type="text" class="form-control EmployerCompany Fields Input {if $form.company.address1->hasError()}intro{/if}" name="address1" value="{$employer_user->getCompany()->get('address1')}">
                </div>
            </div>
        </div>   
        <div class="col-md-4">
            <div class="form-group row">
                <label class="col-sm-3 col-form-label">{__('Activity')}{if $form->company.activity_id->getOption('required')}*{/if}</label>
                <div class="col-sm-9">
                    {*if $form->hasErrors()}<div class="alert alert-{if $form.company.activity_id->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.company.activity_id->getError()}</div>{/if*}
                    {html_options class="form-control EmployerCompany Fields Select {if $form.company.activity_id->hasError()}intro{/if}" name="activity_id" options=$form->company.activity_id->getChoices()->toArray() selected=$employer_user->getCompany()->get('activity_id')}
                </div>
            </div>
        </div>   
    </div>

    <div class="row">
        {*<div class="col-md-12">*}
        <label class="col-md-1 col-form-label">{__('Postcode')}{if $form->company.postcode->getOption('required')}*{/if}</label>
        <div class="col-md-2">
            <div class="form-group row">
                <div class="col-sm-12">
                    {*if  $form.company.state->hasError() || $form.company.postcode->hasError() || $form.company.city->hasError() || $form.company.country->hasError()}<div class="w-auto alert alert-danger">&nbsp;{$form.company.postcode->getError()}</div>{/if*}
                    <input type="text" class="form-control EmployerCompany Fields Input {if $form.company.postcode->hasError()}intro{/if}" name="postcode" value="{$employer_user->getCompany()->get('postcode')}">
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="form-group row">
                <label class="col-sm-3 col-form-label">{__('City')}{if $form->company.city->getOption('required')}*{/if}</label>
                <div class="col-sm-9">
                    {*if $form.company.state->hasError() || $form.company.postcode->hasError() || $form.company.city->hasError() || $form.company.country->hasError()}<div class="w-auto alert alert-danger">&nbsp;{$form.company.city->getError()}</div>{/if*}
                    <input type="text" class="form-control EmployerCompany Fields Input {if $form.company.city->hasError()}intro{/if}" name="city" value="{$employer_user->getCompany()->get('city')}">
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="form-group row">
                <label class="col-sm-4 col-form-label">{__('State')}{if $form->company.state->getOption('required')}*{/if}</label>
                <div class="col-sm-8">
                    {*if $form.company.state->hasError() || $form.company.postcode->hasError() || $form.company.city->hasError() || $form.company.country->hasError()}<div class="w-auto alert alert-danger">&nbsp;{$form.company.state->getError()}</div>{/if*}
                    <input type="text" class="form-control EmployerCompany Fields Input {if $form.company.state->hasError()}intro{/if}" name="state" value="{$employer_user->getCompany()->get('state')}">
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="form-group row">                         
                <label class="col-sm-4 col-form-label">{__('Country')}{if $form->company.country->getOption('required')}*{/if}</label>
                <div class="col-sm-8">   
                    {*if $form.company.postcode->hasError() || $form.company.city->hasError() || $form.company.country->hasError()}<div>&nbsp;</div>{/if*}
                    {select_country name="country" class="EmployerCompany js-example-responsive form-control Fields Select {if $form.company.country->hasError()}intro{/if}"  multiple="multiple" preferred=['MA','FR'] options=$form->company.country->getOption('choices') selected=$employer_user->getCompany()->get('country')}

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
        <label class="col-md-1 col-form-label">{__('Email')}{if $form->company.email->getOption('required')}*{/if}</label>
        <div class="col-md-5">
            <div class="form-group row">
                <div class="col-sm-12">
                    {*if $form.company.email->hasError() || $form.company.web->hasError()}<div class="w-auto alert alert-danger">&nbsp;{$form.company.email->getError()}</div>{/if*}
                    <input type="text" class="form-control EmployerCompany Fields Select {if $form.company.email->hasError()}intro{/if}" name="email" value="{$employer_user->getCompany()->get('email')}">
                </div>
            </div>
        </div>  
        <div class="col-md-6">
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">{__('Web')}{if $form->company.web->getOption('required')}*{/if}</label>
                <div class="col-sm-10">
                    {*if $form.company.email->hasError() || $form.company.web->hasError()}<div class="w-auto alert alert-danger">&nbsp;{$form.company.web->getError()}</div>{/if*}
                    <input type="text" class="form-control EmployerCompany Fields Input {if $form.company.web->hasError()}intro{/if}" name="web" value="{$employer_user->getCompany()->get('web')}">
                </div>
            </div>
        </div> 
    </div>

    <div class="row">
        <label class="col-md-1 col-form-label">{__('Phone')}{if $form->company.phone->getOption('required')}*{/if}</label>
        <div class="col-md-2">
            <div class="form-group row">
                <div class="col-sm-12">
                    {*if $form.company.registration->hasError() || $form.company.phone->hasError() || $form.company.mobile->hasError()}<div class="w-auto alert alert-danger">&nbsp;{$form.company.phone->getError()}</div>{/if*}
                    <input type="text" class="form-control EmployerCompany Fields Input {if $form.company.phone->hasError()}intro{/if}" name="phone" value="{$employer_user->getCompany()->get('phone')}">
                </div>
            </div>
        </div>  
        <div class="col-md-3">
            <div class="form-group row">
                <label class="col-sm-3 col-form-label">{__('Mobile')}{if $form->company.mobile->getOption('required')}*{/if}</label>
                <div class="col-sm-9">
                    {*if $form.company.registration->hasError() || $form.company.phone->hasError() || $form.company.mobile->hasError()}<div class="w-auto alert alert-danger">&nbsp;{$form.company.mobile->getError()}</div>{/if*}
                    <input type="text" class="form-control EmployerCompany Fields Input {if $form.company.mobile->hasError()}intro{/if}" name="mobile" value="{$employer_user->getCompany()->get('mobile')}">
                </div>
            </div>
        </div>
        {if $form->company->hasValidator('registration')} 
            <div class="col-md-6">
                <div class="form-group row">
                    <label class="col-sm-4 col-form-label">{__('Business Registration Number')}{if $form->company.mobile->getOption('required')}*{/if}</label>
                    <div class="col-sm-8">
                        {*if $form.company.registration->hasError() || $form.company.phone->hasError() || $form.company.registration->hasError()}<div class="w-auto alert alert-danger">&nbsp;{$form.company.registration->getError()}</div>{/if*}
                        <input type="text" class="form-control EmployerCompany Fields Input {if $form.company.registration->hasError()}intro{/if}" name="registration" value="{$employer_user->getCompany()->get('registration')}">
                    </div>
                </div>
            </div> 
        {/if}
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

