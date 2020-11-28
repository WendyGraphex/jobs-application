{alerts}  
{if $item->isLoaded()}
<div class="row admin-header-container">    
    <div class="col-sm" style="padding: 0;">
        <div> 
                <a href="#" id="Save" class="btn btn-success admin-header-button"><i class="fa fa-save"/>{__('Save')}</a>                
        </div>
    </div>
</div>    
<div class="tablewhiteback" style="padding: 20px;">  
     <div class="the-box bg-white p-3">    
          <div class="row">          
           <div class="form-group col-md-4">             
              {if $form->hasErrors()}<div class="alert alert-{if $form.name->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.name->getError()}</div>{/if}
            <label for="name">{__('Name')}{if $form->name->getOption('required')}*{/if}</label>           
            <div class="field_with_errors">
                <input class="EmployeeCompany form-control Fields Input" type="text" value="{$item->get('name')|escape}" name="name" id="name">
            </div>
          </div>            
                       
           <div class="form-group col-md-4">
            {if $form->hasErrors()}<div class="alert alert-{if $form.web->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.web->getError()}</div>{/if}
            <label for="web">{__('Web')}{if $form->web->getOption('required')}*{/if}</label>            
            <div class="field_with_errors"><input class="EmployeeCompany form-control Fields Input " type="text" value="{$item->get('web')|escape}" name="web" id="web"></div>
          </div> 
           <div class="form-group col-md-4">
            {if $form->hasErrors()}<div class="alert alert-{if $form.email->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.email->getError()}</div>{/if}
            <label for="email">{__('Email')}{if $form->email->getOption('required')}*{/if}</label>            
            <div class="field_with_errors"><input class="EmployeeCompany form-control Fields Input " type="text" value="{$item->get('email')|escape}" name="email" id="email"></div>
          </div> 
        </div>             
       <div class="row">          
           <div class="form-group col-md-12">             
              {if $form->hasErrors()}<div class="alert alert-{if $form.address1->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.address1->getError()}</div>{/if}
            <label for="address1">{__('Address1')}{if $form->address1->getOption('required')}*{/if}</label>           
            <div class="field_with_errors">
                <input class="EmployeeCompany form-control Fields Input" type="text" value="{$item->get('address1')|escape}" name="address1" id="address1">
            </div>
          </div> 
       </div>
       <div class="row"> 
             <div class="form-group col-md-8">             
              {if $form->hasErrors()}<div class="alert alert-{if $form.address2->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.address2->getError()}</div>{/if}
            <label for="address2">{__('Address2')}{if $form->address2->getOption('required')}*{/if}</label>           
            <div class="field_with_errors">
                <input class="EmployeeCompany form-control Fields Input" type="text" value="{$item->get('address2')|escape}" name="address2" id="address2">
            </div>
          </div>        
             <div class="form-group col-md-4">             
              
          </div> 
       </div>   
       <div class="row"> 
           <div class="form-group col-md-4">
            {if $form->hasErrors()}<div class="alert alert-{if $form.postcode->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.postcode->getError()}</div>{/if}
            <label for="postcode">{__('Postcode')}{if $form->postcode->getOption('required')}*{/if}</label>            
            <div class="field_with_errors"><input class="EmployeeCompany form-control Fields Input " type="text" value="{$item->get('postcode')|escape}" name="postcode" id="postcode"></div>
          </div> 
           <div class="form-group col-md-4">
            {if $form->hasErrors()}<div class="alert alert-{if $form.city->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.city->getError()}</div>{/if}
            <label for="city">{__('City')}{if $form->city->getOption('required')}*{/if}</label>            
            <div class="field_with_errors"><input class="EmployeeCompany form-control Fields Input " type="text" value="{$item->get('city')|escape}" name="city" id="city"></div>
          </div> 
          <div class="form-group col-md-4">
            {if $form->hasErrors()}<div class="alert alert-{if $form.country->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.country->getError()}</div>{/if}
            <label for="city">{__('Country')}{if $form->country->getOption('required')}*{/if}</label>            
             {select_country name="country" class="EmployeeCompany form-control Fields Select" options=$form->country->getOption('choices') selected=$item->get('country')}
          </div> 
        </div>  
          <div class="row"> 
           <div class="form-group col-md-4">
            {if $form->hasErrors()}<div class="alert alert-{if $form.phone->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.phone->getError()}</div>{/if}
            <label for="phone">{__('Phone')}{if $form->phone->getOption('required')}*{/if}</label>            
            <div class="field_with_errors"><input class="EmployeeCompany form-control Fields Input " type="text" value="{$item->get('phone')|escape}" name="phone" id="phone"></div>
          </div> 
           <div class="form-group col-md-4">
            {if $form->hasErrors()}<div class="alert alert-{if $form.mobile->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.mobile->getError()}</div>{/if}
            <label for="mobile">{__('Mobile')}{if $form->mobile->getOption('required')}*{/if}</label>            
            <div class="field_with_errors"><input class="EmployeeCompany form-control Fields Input " type="text" value="{$item->get('mobile')|escape}" name="mobile" id="mobile"></div>
          </div> 
           
          </div> 
    </div>          
</div>
<script type="text/javascript">              
 
     
      
 $('#Save').click(function(){                             
           var  params= {           
                                MyCompany: {                                 
                                   token :'{$form->getCSRFToken()}'
                                } };
          $(".EmployeeCompany.Input").each(function() { params.MyCompany[$(this).attr('name')]=$(this).val(); });                              
          $(".EmployeeCompany.Select option:selected").each(function () { params.MyCompany[$(this).parent().attr('name')]=$(this).val(); });  
          return $.ajax2({ data : params,                          
                           url: "{url_to('employees_ajax',['action'=>'SaveMyCompany'])}",
                           target: "#page-wrapper"}); 
        }); 
     
</script>
{else}
    {__('Company is invalid.')}
{/if}


