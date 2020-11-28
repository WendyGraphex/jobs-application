<div class="row RowTop">
    <div class="col-md-12 grid-margin classConducteurTop">
        <div class="d-flex justify-content-between flex-wrap">
            <div class="d-flex align-items-end flex-wrap">
                <div class="mr-md-3 mr-xl-5 styleWidth">
                    <h2>{__('My Company')}</h2>                   
                </div>
                <div class="d-flex">
                    <i class="mdi mdi-home text-muted hover-cursor"></i>
                    <a id="Dashboard"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('Dashboard')}</p></a>   
                    <p class="text-muted mb-0">&nbsp;/&nbsp;{__('My company')}</p>
                    <p class="text-muted mb-0 hover-cursor">&nbsp;-&nbsp;</p>
                    <p class="text-primary mb-0 hover-cursor"><a href="{$item->getUrl()}">{$item->getFormatter()->getName()->ucfirst()}</a></p>
                </div> 
            </div> 
            {component name="/site_help/help" help="employer-myCompany"}
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
<div class="tablewhiteback" style="padding: 20px;">  
    <div class="the-box bg-white p-3">    
        <div class="row">          
            <div class="form-group col-md-4">             
                {*if $form->hasErrors()}<div class="alert alert-{if $form.name->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.name->getError()}</div>{/if*}
                <label for="name">{__('Name')}{if $form->name->getOption('required')}*{/if}</label>           
                <div class="field_with_errors">
                    <input class="EmployerCompany form-control Fields Input {if $form.name->hasError()}intro{/if}" type="text" value="{$item->get('name')}" name="name" id="name">
                </div>
            </div>            

            <div class="form-group col-md-4">
                {*if $form->hasErrors()}<div class="alert alert-{if $form.web->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.web->getError()}</div>{/if*}
                <label for="web">{__('Web')}{if $form->web->getOption('required')}*{/if}</label>            
                <div class="field_with_errors"><input class="EmployerCompany form-control Fields Input {if $form.web->hasError()}intro{/if}" type="text" value="{$item->get('web')}" name="web" id="web"></div>
            </div> 
            <div class="form-group col-md-4">
                {*if $form->hasErrors()}<div class="alert alert-{if $form.email->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.email->getError()}</div>{/if*}
                <label for="email">{__('Email')}{if $form->email->getOption('required')}*{/if}</label>            
                <div class="field_with_errors"><input class="EmployerCompany form-control Fields Input {if $form.email->hasError()}intro{/if}" type="text" value="{$item->get('email')}" name="email" id="email"></div>
            </div> 
        </div>             
        <div class="row">          
            <div class="form-group col-md-8">             
                {*if $form->hasErrors()}<div class="alert alert-{if $form.address1->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.address1->getError()}</div>{/if*}
                <label for="address1">{__('Address1')}{if $form->address1->getOption('required')}*{/if}</label>           
                <div class="field_with_errors">
                    <input class="EmployerCompany form-control Fields Input {if $form.address1->hasError()}intro{/if}" type="text" value="{$item->get('address1')}" name="address1" id="address1">
                </div>
            </div> 

            <div class="form-group col-md-4">             
                {*if $form->hasErrors()}<div class="alert alert-{if $form.activity_id->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.activity_id->getError()}</div>{/if*}
                <label for="activity">{__('Activity')}{if $form->activity_id->getOption('required')}*{/if}</label>           
                <div class="field_with_errors">
                    {html_options class="form-control EmployerCompany Fields Select {if $form.activity_id->hasError()}intro{/if}" name="activity_id" options=$form->activity_id->getChoices()->toArray() selected=$item->get('activity_id')}
                </div>
            </div> 

        </div>
        <div class="row"> 
            <div class="form-group col-md-8">             
                {*if $form->hasErrors()}<div class="alert alert-{if $form.address2->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.address2->getError()}</div>{/if*}
                <label for="address2">{__('Address2')}{if $form->address2->getOption('required')}*{/if}</label>           
                <div class="field_with_errors">
                    <input class="EmployerCompany form-control Fields Input {if $form.address2->hasError()}intro{/if}" type="text" value="{$item->get('address2')}" name="address2" id="address2">
                </div>
            </div>    
            {if $form->hasValidator('registration')}
                <div class="form-group col-md-4">             
                    {*if $form->hasErrors()}<div class="alert alert-{if $form.registration->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.registration->getError()}</div>{/if*}
                    <label for="registration">{__('Business Registration Number')}{if $form->registration->getOption('required')}*{/if}</label>           
                    <div class="field_with_errors">
                        <input class="EmployerCompany form-control Fields Input {if $form.registration->hasError()}intro{/if}" type="text" value="{$item->get('registration')}" name="registration" id="registration">
                    </div> 
                </div> 
            {/if}
        </div>   
        <div class="row"> 
            <div class="form-group col-md-2">
                {*if $form->hasErrors()}<div class="alert alert-{if $form.postcode->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.postcode->getError()}</div>{/if*}
                <label for="postcode">{__('Postcode')}{if $form->postcode->getOption('required')}*{/if}</label>            
                <div class="field_with_errors"><input class="EmployerCompany form-control Fields Input {if $form.postcode->hasError()}intro{/if}" type="text" value="{$item->get('postcode')}" name="postcode" id="postcode"></div>
            </div> 
            <div class="form-group col-md-6">
                {*if $form->hasErrors()}<div class="alert alert-{if $form.city->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.city->getError()}</div>{/if*}
                <label for="city">{__('City')}{if $form->city->getOption('required')}*{/if}</label>            
                <div class="field_with_errors"><input class="EmployerCompany form-control Fields Input {if $form.city->hasError()}intro{/if}" type="text" value="{$item->get('city')}" name="city" id="city"></div>
            </div> 
            <div class="form-group col-md-2">
                {*if $form->hasErrors()}<div class="alert alert-{if $form.state->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.state->getError()}</div>{/if*}
                <label for="state">{__('State')}{if $form->state->getOption('required')}*{/if}</label>            
                <div class="field_with_errors"><input class="EmployerCompany form-control Fields Input {if $form.state->hasError()}intro{/if}" type="text" value="{$item->get('state')}" name="state" id="state"></div>
            </div> 
            <div class="form-group col-md-2">
                {*if $form->hasErrors()}<div class="alert alert-{if $form.country->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.country->getError()}</div>{/if*}
                <label for="country">{__('Country')}{if $form->country->getOption('required')}*{/if}</label>            
                {select_country name="country" class="EmployerCompany js-example-responsive form-control Fields Select {if $form.country->hasError()}intro{/if}" options=$form->country->getOption('choices') selected=$item->get('country')}
            </div> 
        </div>  
        <div class="row"> 
            <div class="form-group col-md-4">
                {*if $form->hasErrors()}<div class="alert alert-{if $form.phone->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.phone->getError()}</div>{/if*}
                <label for="phone">{__('Phone')}{if $form->phone->getOption('required')}*{/if}</label>            
                <div class="field_with_errors"><input class="EmployerCompany form-control Fields Input {if $form.phone->hasError()}intro{/if}" type="text" value="{$item->get('phone')}" name="phone" id="phone"></div>
            </div> 
            <div class="form-group col-md-4">
                {*if $form->hasErrors()}<div class="alert alert-{if $form.mobile->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.mobile->getError()}</div>{/if*}
                <label for="mobile">{__('Mobile')}{if $form->mobile->getOption('required')}*{/if}</label>            
                <div class="field_with_errors"><input class="EmployerCompany form-control Fields Input {if $form.mobile->hasError()}intro{/if}" type="text" value="{$item->get('mobile')}" name="mobile" id="mobile"></div>
            </div> 

        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">{__('Picture')}</label>
                    <div class="col-sm-10">                                  
                        <div class="form-group">            
                            <div id="pictureForm">                            
                                <div class="custom-FileInput" id="DivPicture">
                                    {*<img id="blah" alt="" style="display: none;" /><br/>*}
                                    {if $item->hasPicture()}
                                        <img id="blah" alt="" src="{$item->getPicture()->getSmall()->getUrl()}"{*/if*} /><br/>
                                    {else}
                                        <img id="blah" alt="" style="display: none;" /><br/>
                                    {/if}
                                </div>
                                <div class="row">
                                    <div class="">
                                        <a id="pictureAdd" href="#" class="btn btn-default"><i class="fa fa-plus" style="margin-right:10px;"></i>{__('Add picture')}</a>
                                        <input type='file' id="imgInp" hidden="" class="files" name="MyCompany[picture]"/>
                                    </div>
                                    <div class="" style="padding-top: 14px;padding-left: 0px;">
                                        <div class="thumbnail media-lib-item parent">
                                            <a href="javascript:void();" class="list-action ModePicture" name="NORMAL" id="BtnInverse" style=""><i class="ModeIconForPicture Normal fa fa-square-o"></i></a>
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
                                    {if $item->hasLogo()}
                                        <img id="logo" alt="" src="{$item->getLogo()->getSmall()->getUrl()}"{*/if*} /><br/>
                                    {else}
                                        <img id="logo" alt="" style="display: none;" /><br/>
                                    {/if}
                                </div>
                                <div class="row">
                                    <div class="">
                                        <a id="logoAdd" href="#" class="btn btn-default"><i class="fa fa-plus" style="margin-right:10px;"></i>{__('Add logo')}</a>
                                        <input type='file' id="logoInp" hidden="" class="files" name="MyCompany[logo]"/>
                                    </div>
                                    <div class="" style="padding-top: 14px;padding-left: 0px;">
                                        <div class="thumbnail media-lib-item parent">
                                            <a href="javascript:void();" class="list-action ModeLogo" name="NORMAL" id="BtnInverse" style=""><i class="ModeIconForLogo Normal fa fa-square-o"></i></a>
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
    
    $(".js-example-responsive").select2({
       width: 'resolve',
    });
 
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
      
 $('#Save').click(function(){                             
           var  params= {           
                                MyCompany: {                                 
                                   token :'{$form->getCSRFToken()}'
                                } };
          $(".EmployerCompany.Input").each(function() { params.MyCompany[$(this).attr('name')]=$(this).val(); });                              
          $(".EmployerCompany.Select option:selected").each(function () { params.MyCompany[$(this).parent().attr('name')]=$(this).val(); });  
          return $.ajax2({ data : params, 
                           files : '.files',
                           url: "{url_to('employers_ajax',['action'=>'SaveMyCompany'])}",
                           target: "#page-wrapper"}); 
        }); 
   

   $('#Dashboard').click(function(){                                       
          return $.ajax2({ url: "{url_to('employers_ajax',['action'=>'Dashboard'])}",                           
                           target: "#page-wrapper"}); 
        });
</script>



