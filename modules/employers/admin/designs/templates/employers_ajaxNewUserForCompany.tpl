<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__("Employers")}</h3>
        <h3 class="admin-header-small-text">{__("Employers Management")}</h3>
    </div>
    <div class="col-sm" style="padding: 0;">
        <div style="float: right;"> 
                <a href="#" id="Save" class="btn btn-success admin-header-button"><i class="fa fa-save"/>{__('Save')}</a>
                <a href="#" id="Cancel" class="btn btn-danger admin-header-button"><i class="fa fa-times"/>{__('Cancel')}</a>
        </div>
    </div>
</div>
<div class="breadcrumb-title">
    <p>
        <i class="fa fa-home" style="color: #37bc9b;"></i>
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Configurations')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('New user for employer [%s]',(string)$company)}
    </p>
</div>
{alerts}  
{if $company->isLoaded()}
<div class="tablewhiteback" style="padding: 20px;">  
     <div class="the-box bg-white p-3">    
                      
                 <div class="row"> 
           <div class="form-group col-md-4">
            {if $form->hasErrors()}<div class="alert alert-{if $form.phone->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.gender->getError()}</div>{/if}
            <label for="phone">{__('Gender')}{if $form->gender->getOption('required')}*{/if}</label>                                       
                 {foreach $form->gender->getOption("choices") as $name=>$gender}
                        <input type="radio" class="EmployerUser Radio form-control Fields" name="gender" value="{$name}" {if $item->get('gender')==$name}checked="checked"{/if}/>
                        <label for="id_gender" class="top">{format_gender($gender,1,true)|capitalize}</label>
                 {/foreach} {if $form->gender->getOption('required')}*{/if}
          </div> 
           <div class="form-group col-md-4">
            {if $form->hasErrors()}<div class="alert alert-{if $form.firstname->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.firstname->getError()}</div>{/if}
            <label for="firstname">{__('First name')}{if $form->firstname->getOption('required')}*{/if}</label>            
            <div class="field_with_errors"><input class="EmployerUser form-control Fields Input " type="text" value="{$item->get('firstname')}" name="firstname" id="firstname"></div>
          </div> 
           <div class="form-group col-md-4">
            {if $form->hasErrors()}<div class="alert alert-{if $form.lastname->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.lastname->getError()}</div>{/if}
            <label for="lastname">{__('Last name')}{if $form->lastname->getOption('required')}*{/if}</label>            
            <div class="field_with_errors"><input class="EmployerUser form-control Fields Input " type="text" value="{$item->get('lastname')}" name="lastname" id="lastname"></div>
          </div> 
          </div>
            <div class="row"> 
                  <div class="form-group col-md-3">             
            {if $form->hasErrors()}<div class="alert alert-{if $form.email->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.email->getError()}</div>{/if}
            <label for="email">{__('Email')}{if $form->email->getOption('required')}*{/if}</label>            
            <div class="field_with_errors"><input class="EmployerUser form-control Fields Input " type="text" value="{$item->get('email')}" name="email" id="email"></div>
          </div>  
                <div class="form-group col-md-3">             
            {if $form->hasErrors()}<div class="alert alert-{if $form.phone->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.phone->getError()}</div>{/if}
            <label for="phone">{__('Phone')}{if $form->phone->getOption('required')}*{/if}</label>            
            <div class="field_with_errors"><input class="EmployerUser form-control Fields Input " type="text" value="{$item->get('phone')}" name="phone" id="phone"></div>
          </div>         
           <div class="form-group col-md-3">
            {if $form->hasErrors()}<div class="alert alert-{if $form.mobile->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.mobile->getError()}</div>{/if}
            <label for="mobile">{__('Mobile')}{if $form->mobile->getOption('required')}*{/if}</label>            
            <div class="field_with_errors"><input class="EmployerUser form-control Fields Input " type="text" value="{$item->get('mobile')}" name="mobile" id="mobile"></div>
          </div>          
          </div>               
           
         
       
    </div>          
</div>
<script type="text/javascript">              
 
     {* =================== A C T I O N S ================================ *}
     $('#Cancel').click(function(){                
             return $.ajax2({ data : {  EmployerCompany: '{$company->get('id')}' },
                              url : "{url_to('employers_ajax',['action'=>'ListPartialUserForCompany'])}",                                                 
                              target: "#actions"}); 
      });
      
     $('#Save').click(function(){                             
            var  params= {      EmployerCompany: '{$company->get('id')}',     
                                EmployerUser: {                                                                     
                                   token :'{$form->getCSRFToken()}'
                                } };         
          $(".EmployerUser.Input").each(function() {  params.EmployerUser[$(this).attr('name')]=$(this).val();  });  
          $(".EmployerUser.Radio:checked").each(function () { params.EmployerUser[$(this).attr('name')]=$(this).val(); });  
          $(".EmployerUser.Select option:selected").each(function () { params.EmployerUser[$(this).parent().attr('name')]=$(this).val(); });            
          return $.ajax2({ data : params,                     
                           url: "{url_to('employers_ajax',['action'=>'NewUserForCompany'])}",
                           target: "#actions"}); 
        }); 
</script>
{else}
    {__('Company is invalid.')}
{/if}

