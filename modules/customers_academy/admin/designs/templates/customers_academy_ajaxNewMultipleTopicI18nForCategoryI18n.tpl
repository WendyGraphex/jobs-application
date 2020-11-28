
<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__("New multiple topics")}</h3>
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
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Categories')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Topics')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Category [%s]',$category_i18n->get('title'))}               
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('New multiple topics')}
    </p>
</div>
{alerts}
{if $category_i18n->getCategory()->isLoaded()}
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
                      <label for="name">{__('Topics')}{if $form->values->getOption('required')}*{/if} ({__('Enter topics separated by %s',$form->values->getOption('separator'))})</label>           
                      <div class="field_with_errors">
                          <textarea class="form-control CustomerAcademyTopicI18n Input" name="values" cols="80" rows="5">{$form.values|escape}</textarea>
                      </div>
                 </div>                 
            </div>                                              
    </div>          
</div>
<script language="text/javascript"> 
   
   $('#Cancel').click(function() {                
             return $.ajax2({ data : { CustomerCourseCategoryNode : { node: '{$category_i18n->get('category_id')}', 
                                             lang : $("#SelectListLanguages option:selected").attr('id'), 
                                             token : '{mfForm::getToken('CustomerCourseCategoryNodeForm')}' } },                                 
                              url : "{url_to('customers_academy_ajax',['action'=>'ListPartialTopicForCategoryI18n'])}",                                                 
                              target: "#actions"}); 
      });
      
   $('#Save').click(function(){                             
            var  params= {      CustomerCourseCategoryI18n : { category_id: '{$category_i18n->get('category_id')}',  lang: $("#SelectListLanguages option:selected").attr('id')  },
                                CustomerAcademyTopicI18nMultiple: {   
                                   lang : $("#SelectListLanguages option:selected").attr('id'), 
                                   token :'{$form->getCSRFToken()}'
                                } };
          $(".CustomerAcademyTopicI18n.Input").each(function() { params.CustomerAcademyTopicI18nMultiple[$(this).attr('name')]=$(this).val(); });                
          return $.ajax2({ data : params,                            
                           url: "{url_to('customers_academy_ajax',['action'=>'SaveNewMultipleTopicI18nForCategoryI18n'])}",
                           target: "#actions"}); 
        });                      
     
</script>

{else}
    {__('Category is invalid.')}
{/if}    