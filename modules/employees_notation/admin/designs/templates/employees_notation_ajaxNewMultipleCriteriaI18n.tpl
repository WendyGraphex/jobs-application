
<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__("New Freelancer Criteria")}</h3>
        <h3 class="admin-header-small-text">{__("Configuration Management")}</h3>
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
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('New Freelancer Criteria')}
    </p>
</div>
{alerts}
<div class="tablewhiteback" style="padding: 20px;">    
    <div class="the-box bg-white p-3">    
        <div class="row">
            <div class="form-group col-md-12">                      
            {component name="/site_languages/selectListLanguagesFrontend" selected=$form.lang}
            </div>          
        </div>
             <div class="row">                      
                <div class="form-group col-md-2">
                            {if $form->hasErrors()}<div class="alert alert-{if $form.max->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.max->getError()}</div>{/if}
                            <label for="max" class="d-block">{__('Max')}{if $form->max->getOption('required')}*{/if}</label>            
                            <input class="EmployeeNotationCriteriaI18n form-control Fields Input input-color" type="text" value="{$form.max}" name="max" id="max"/>
                        </div>
                <div class="form-group col-md-4">
                  {if $form->hasErrors()}<div class="alert alert-{if $form.category_id->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.category_id->getError()}</div>{/if}
                  <label for="category">{__('Category')}{if $form->category_id->getOption('required')}*{/if}</label>            
                  <div class="field_with_errors">
                      {html_options class="EmployeeNotationCriteriaI18n form-control Fields Select" name="category_id" options=$form->category_id->getChoices()->toArray() selected=$form.category_id}                            
                  </div>
              </div>
             </div>                  
            <div class="row">
                 <div class="form-group col-md-12">             
                     {if $form->hasErrors()}<div class="alert alert-{if $form.values->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.values->getError()}</div>{/if}
                      <label for="name">{__('Criterias')}{if $form->values->getOption('required')}*{/if} ({__('Enter criterias separated by %s',$form->values->getOption('separator'))})</label>           
                      <div class="field_with_errors">
                          <textarea class="form-control EmployeeNotationCriteriaI18n Input" name="values" cols="80" rows="5">{$form.values|escape}</textarea>
                      </div>
                 </div>                 
            </div>                                              
    </div>          
</div>
<script language="text/javascript"> 
   
     $('#Cancel').click(function(){                
             return $.ajax2({ data: { filter: { lang:$("#SelectListLanguages option:selected").attr('id'), token: "{mfForm::getToken('EmployeeNotationCriteriaFormFilter')}" } },                              
                              url : "{url_to('employees_notation_ajax',['action'=>'ListPartialCriteria'])}",                                                 
                              target: "#actions"}); 
      });
      
   $('#Save').click(function(){                             
            var  params= {     EmployeeNotationCriteriaI18nMultiple: { 
                                   lang: $("#SelectListLanguages option:selected").attr('id'),                              
                                   token :'{$form->getCSRFToken()}'
                                } };
          $(".EmployeeNotationCriteriaI18n.Input").each(function() { params.EmployeeNotationCriteriaI18nMultiple[$(this).attr('name')]=$(this).val(); });                
          $(".EmployeeNotationCriteriaI18n.Select option:selected").each(function() {  params.EmployeeNotationCriteriaI18nMultiple[$(this).parent().attr('name')]=$(this).val();  });  // Get foreign key  
          return $.ajax2({ data : params,                            
                           url: "{url_to('employees_notation_ajax',['action'=>'SaveNewMultipleCriteriaI18n'])}",
                           target: "#actions"}); 
        });                      
     
</script>

