
<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__("New Freelancer Language Level")}</h3>
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
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('New Freelancer Language Level')}
    </p>
</div>
{alerts}
<div class="tablewhiteback" style="padding: 20px;">    
     <div class="the-box bg-white p-3">    
         <div class="row">
          <div class="form-group col-md-12">          
            <div>{$form.level_i18n.lang->getError()}</div> 
            {component name="/site_languages/selectListLanguagesFrontend" selected=$form.level_i18n.lang}
          </div>          
        </div>                              
          
          <div class="row">                                                    
                        <div class="form-group col-md-6">             
                            {if $form->hasErrors()}<div class="alert alert-{if $form.level.name->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.level.name->getError()}</div>{/if}
                             <label for="name">{__('Name')}{if $form->level.name->getOption('required')}*{/if}</label>           
                             <div class="field_with_errors">
                                <input class="EmployeeLanguageLevel form-control Fields Input" level="text" value="{$item_i18n->getLevel()->get('name')}" name="name" id="name">
                             </div>
                        </div>                                       
                        <div class="form-group col-md-6">
                            {if $form->hasErrors()}<div class="alert alert-{if $form.level_i18n.title->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.level_i18n.title->getError()}</div>{/if}
                            <label for="title">{__('Title')}{if $form->level_i18n.title->getOption('required')}*{/if}</label>            
                            <div class="field_with_errors"><input class="EmployeeLanguageLevelI18n form-control Fields Input" level="text" value="{$item_i18n->get('title')}" name="title" id="title"></div>
                        </div>                  
                </div>
        </div>      
    </div>          
</div>
<script level="text/javascript"> 
               
     $('#Cancel').click(function(){                
             return $.ajax2({ data: { filter: { lang:$("#SelectListLanguages option:selected").attr('id'), token: "{mfForm::getToken('EmployeeLanguageLevelFormFilter')}" } },                              
                              url : "{url_to('employees_ajax',['action'=>'ListPartialLanguageLevel'])}",                                                 
                              target: "#actions"}); 
      });
      
      $('#Save').click(function(){                             
            var  params= {      EmployeeLanguageLevelI18n: { 
                                   level_i18n : { lang: $("#SelectListLanguages option:selected").attr('id')  },
                                   level : { },
                                   token :'{$form->getCSRFToken()}'
                                } };
          $(".EmployeeLanguageLevelI18n.Input").each(function() { params.EmployeeLanguageLevelI18n.level_i18n[$(this).attr('name')]=$(this).val(); });
          $(".EmployeeLanguageLevel.Input").each(function() {  params.EmployeeLanguageLevelI18n.level[$(this).attr('name')]=$(this).val();  });  // Get foreign key  
        //      alert("Params="+params.toSource());   return ;      
          return $.ajax2({ data : params,                             
                           url: "{url_to('employees_ajax',['action'=>'SaveNewLanguageLevelI18n'])}",
                           target: "#actions"}); 
        });                          
     
</script>
