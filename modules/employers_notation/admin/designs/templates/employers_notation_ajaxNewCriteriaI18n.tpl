
<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__("New Employer Criteria")}</h3>
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
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('New Employer Criteria')}
    </p>
</div>
{alerts}
<div class="tablewhiteback" style="padding: 20px;">    
     <div class="the-box bg-white p-3">    
         <div class="row">
          <div class="form-group col-md-12">          
            <div>{$form.criteria_i18n.lang->getError()}</div> 
            {component name="/site_languages/selectListLanguagesFrontend" selected=$form.criteria_i18n.lang}
          </div>          
        </div>
          <div class="row">
              <div class="col-md-2">
                <div>
                    <div class="form-group">
                        <label>{__('Icon')}</label>                  
                            <div id="pictureForm">                            
                                <div class="custom-FileInput">
                                    <img id="blah" alt="" style="display: none;" /><br/>
                                </div>
                                <a id="pictureAdd" href="#" class="btn btn-default"><i class="fa fa-plus" style="margin-right:10px;"></i>{__('Add Icon')}</a>
                                <input id="item_file" type='file' hidden="" type="file" class="form-control Files Fields" name="EmployerNotationCriteriaI18n[criteria][icon]" /> {*name="SiteCityI18n[function][icon]"*}
                            </div>
                    </div>
                </div> 
              </div>
                                
               <div class="col-md-10">
                   <div class="row">
                        <div class="form-group col-md-5">             
                            {if $form->hasErrors()}<div class="alert alert-{if $form.criteria.name->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.criteria.name->getError()}</div>{/if}
                             <label for="name">{__('Name')}{if $form->criteria.name->getOption('required')}*{/if}</label>           
                             <div class="field_with_errors">
                                <input class="EmployerNotationCriteria form-control Fields Input" type="text" value="{$item_i18n->getCriteria()->get('name')}" name="name" id="name">
                             </div>
                        </div> 
                        
                        <div class="form-group col-md-2">
                            {if $form->hasErrors()}<div class="alert alert-{if $form.criteria.color->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.criteria.color->getError()}</div>{/if}
                            <label for="color" class="d-block">{__('Color')}{if $form->criteria.color->getOption('required')}*{/if}</label>            
                            <input class="EmployerNotationCriteria form-control Fields Input Color General input-color" language="text" value="{$item_i18n->getCriteria()->get('color')}" name="color" id="color"/>
                        </div>
                           <div class="form-group col-md-2">
                            {if $form->hasErrors()}<div class="alert alert-{if $form.criteria.max->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.criteria.max->getError()}</div>{/if}
                            <label for="max" class="d-block">{__('Max')}{if $form->criteria.max->getOption('required')}*{/if}</label>            
                            <input class="EmployerNotationCriteria form-control Fields Input input-color" type="text" value="{$item_i18n->getCriteria()->get('max')}" name="max" id="max"/>
                        </div>
                       <div class="form-group col-md-3">
                            {if $form->hasErrors()}<div class="alert alert-{if $form.criteria.category_id->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.criteria.category_id->getError()}</div>{/if}
                            <label for="category">{__('Category')}{if $form->criteria.category_id->getOption('required')}*{/if}</label>            
                            <div class="field_with_errors">
                                {html_options class="EmployerNotationCriteria form-control Fields Select" name="category_id" options=$form->criteria['category_id']->getChoices()->toArray() selected=$item_i18n->getCriteria()->get('category_id')}                            
                            </div>
                        </div>
                   </div>
                    <div class="row">
                        <div class="form-group col-md-12">
                            {if $form->hasErrors()}<div class="alert alert-{if $form.criteria_i18n.title->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.criteria_i18n.title->getError()}</div>{/if}
                            <label for="title">{__('Title')}{if $form->criteria_i18n.title->getOption('required')}*{/if}</label>            
                            <div class="field_with_errors"><input class="EmployerNotationCriteriaI18n form-control Fields Input" type="text" value="{$item_i18n->get('title')}" name="title" id="title"></div>
                        </div>
                    </div>
                </div>
        </div>       
    </div>          
</div>
<script language="text/javascript"> 
    
    
    
    $('#pictureAdd').click(function() {
        $('#item_file').click();
     });
      
    $("#item_file").change(function() {   
        if (this.files && this.files[0]) {
          var reader = new FileReader();
          reader.onload = function(e) {  $('#blah').css('display','block').attr('src', e.target.result); };
          reader.readAsDataURL(this.files[0]);
        }        
    });
    
    
    
   $(".Color").minicolors({
      // position: relative,
       position: 'bottom right',
       control: 'hue', 
       inline: false
   });  
     $("#item_file_browse").click(function () { $("#item_file").click(); }); 
          $("#item_file").change(function (e) { $("#item_file_name").val(e.target.files[0].name);$("#item_file_name").addClass("active-file");  });

       
     {* =================== A C T I O N S ================================ *}
     $('#Cancel').click(function(){                
             return $.ajax2({ data: { filter: { lang:$("#SelectListLanguages option:selected").attr('id'), token: "{mfForm::getToken('EmployerNotationCriteriaFormFilter')}" } },                              
                              url : "{url_to('employers_notation_ajax',['action'=>'ListPartialCriteria'])}",                                                 
                              target: "#actions"}); 
      });
      
      $('#Save').click(function(){                             
            var  params= {      iFrame:true,             
                                EmployerNotationCriteriaI18n: { 
                                   criteria_i18n : { lang: $("#SelectListLanguages option:selected").attr('id')  },
                                   criteria : { },
                                   token :'{$form->getCSRFToken()}'
                                } };
          $(".EmployerNotationCriteriaI18n.Input").each(function() { params.EmployerNotationCriteriaI18n.criteria_i18n[$(this).attr('name')]=$(this).val(); });
          $(".EmployerNotationCriteria.Input").each(function() {  params.EmployerNotationCriteriaI18n.criteria[$(this).attr('name')]=$(this).val();  });  // Get foreign key  
          $(".EmployerNotationCriteria.Select option:selected").each(function() {  params.EmployerNotationCriteriaI18n.criteria[$(this).parent().attr('name')]=$(this).val();  });  // Get foreign key  
        //      alert("Params="+params.toSource());   return ;      
          return $.ajax2({ data : params,  
                           files :'.Files',
                           url: "{url_to('employers_notation_ajax',['action'=>'SaveNewCriteriaI18n'])}",
                           target: "#actions"}); 
        });                          
     
</script>
