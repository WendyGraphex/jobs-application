
<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__("New course level")}</h3>
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
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('New course level')}
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
                 <div class="form-group col-md-12">             
                     {if $form->hasErrors()}<div class="alert alert-{if $form.values->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.values->getError()}</div>{/if}
                      <label for="name">{__('Levels')}{if $form->values->getOption('required')}*{/if} ({__('Enter levels separated by %s',$form->values->getOption('separator'))})</label>           
                      <div class="field_with_errors">
                          <textarea class="form-control CustomerAcademyLevelI18n Input" name="values" cols="80" rows="5">{$form.values|escape}</textarea>
                      </div>
                 </div>                 
            </div>                                              
    </div>          
</div>
<script language="text/javascript"> 
   
     $('#Cancel').click(function(){                
             return $.ajax2({ data: { filter: { lang:$("#SelectListLanguages option:selected").attr('id'), token: "{mfForm::getToken('CustomerAcademyLevelFormFilter')}" } },                              
                              url : "{url_to('customers_academy_ajax',['action'=>'ListPartialLevel'])}",                                                 
                              target: "#actions"}); 
      });
      
   $('#Save').click(function(){                             
            var  params= {     CustomerAcademyLevelI18nMultiple: { 
                                   lang: $("#SelectListLanguages option:selected").attr('id'),                              
                                   token :'{$form->getCSRFToken()}'
                                } };
          $(".CustomerAcademyLevelI18n.Input").each(function() { params.CustomerAcademyLevelI18nMultiple[$(this).attr('name')]=$(this).val(); });                
          return $.ajax2({ data : params,                            
                           url: "{url_to('customers_academy_ajax',['action'=>'SaveNewMultipleLevelI18n'])}",
                           target: "#actions"}); 
        });                      
     
</script>

