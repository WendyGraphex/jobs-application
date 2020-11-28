<div class="row admin-header-container">
    <div class="col-sm">
         <h3 class="admin-header-small-text">{__("Customer blog")}</h3>
        <h3 class="admin-header-big-text">{__("Multiple activities")}</h3>       
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
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Customer blog')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Multiple activities')}
    </p>
</div>
 {alerts}
<div class="container-fluid  form bg-white p-3">  
    <div class="the-box bg-white p-3">    
        <div class="row">
            <div class="form-group col-md-12">                      
            {component name="/site_languages/selectListLanguagesFrontend" selected=$form.lang}
            </div>          
        </div>
                 
            <div class="row">
                 <div class="form-group col-md-12">             
                     {if $form->hasErrors()}<div class="alert alert-{if $form.values->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.values->getError()}</div>{/if}
                      <label for="name">{__('Activities')}{if $form->values->getOption('required')}*{/if} ({__('Enter activities separated by %s',$form->values->getOption('separator'))})</label>           
                      <div class="field_with_errors">
                          <textarea class="form-control CustomerBlogActivityI18n Input" name="values" cols="80" rows="5">{$form.values|escape}</textarea>
                      </div>
                 </div>                 
            </div>                                              
    </div>          
</div>
<script language="text/javascript"> 
   
     $('#Cancel').click(function(){                
             return $.ajax2({ data : { CustomerBlogActivityNode : { 
                                                node: '{$node->get('id')}',
                                                lang: $("#SelectListLanguages option:selected").attr('id'),
                                                 token : '{mfForm::getToken('CustomerBlogActivityNodeForm')}'
                                    } } ,                             
                              url : "{url_to('customers_blog_ajax',['action'=>'ListPartialActivity'])}",                                                 
                              target: "#actions"}); 
      });
      
   $('#Save').click(function(){                             
            var  params= {      CustomerBlogActivityI18nMultiple: {     
                                    node: '{$node->get('id')}',
                                    lang: $("#SelectListLanguages option:selected").attr('id'),
                                   token :'{$form->getCSRFToken()}'
                                } };
          $(".CustomerBlogActivityI18n.Input").each(function() { params.CustomerBlogActivityI18nMultiple[$(this).attr('name')]=$(this).val(); });                
          return $.ajax2({ data : params,                            
                           url: "{url_to('customers_blog_ajax',['action'=>'SaveNewMultipleActivityI18n'])}",
                           target: "#actions"}); 
        });                      
     
</script>


