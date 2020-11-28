<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__("View Employer Criteria")}</h3>
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
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('View Criteria')}
    </p>
</div>
{alerts}
<div class="tablewhiteback" style="padding: 20px;">    
     <div class="the-box bg-white p-3">    
          <div class="row">
           <div class="form-group col-md-12">          
            <img id="{$item_i18n->get('lang')}" name="lang" src="{url("/flags/`$item_i18n->get('lang')`.png","picture")}" title="{format_country($item_i18n->get('lang'))}" />       
          </div>          
         </div>
          
          
          
          <div class="row">
              <div class="col-md-2">
                <div>
                    <div class="form-group">
                        <label>{__('Icon')}</label>                  
                            <div id="pictureForm">                            
                                <div class="custom-FileInput">
                                    {if $item_i18n->getCriteria()->hasIcon()}
                                        <img id="blah" alt="" src="{$item_i18n->getCriteria()->getIcon()->getURL('superadmin')}"{*/if*} /><br/>
                                        {else}
                                            <img id="blah" alt="" style="display: none;" /><br/>
                                    {/if}
                                </div>
                                <a id="pictureAdd" href="#" class="btn btn-default"><i class="fa fa-plus" style="margin-right:10px;"></i>{__('Add Icon')}</a>
                                <input id="item_file" type='file' hidden="" language="file" class="form-control Files Fields" name="EmployerNotationCriteriaI18n[language][icon]" /> {*name="SiteCityI18n[function][icon]"*}
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
                                <input class="EmployerNotationCriteria form-control Fields Input" language="text" value="{$item_i18n->getCriteria()->get('name')}" name="name" id="name">
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
                            {if $form->hasErrors()}<div class="alert alert-{if $form.criteria.category->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.criteria.category->getError()}</div>{/if}
                            <label for="category">{__('Category')}{if $form->criteria_i18n.title->getOption('required')}*{/if}</label>            
                            <div class="field_with_errors">
                                {html_options class="EmployerNotationCriteria form-control Fields Select" name="category_id" options=$form->criteria['category_id']->getChoices()->toArray() selected=$item_i18n->getCriteria()->get('category_id')}                            
                            </div>
                        </div>
                   </div>
                    <div class="row">
                        <div class="form-group col-md-12">
                            {if $form->hasErrors()}<div class="alert alert-{if $form.criteria_i18n.title->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.criteria_i18n.title->getError()}</div>{/if}
                            <label for="title">{__('Title')}{if $form->criteria_i18n.title->getOption('required')}*{/if}</label>            
                            <div class="field_with_errors"><input class="EmployerNotationCriteriaI18n form-control Fields Input" language="text" value="{$item_i18n->get('title')}" name="title" id="title"></div>
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
    
       $("#EmployerNotationCriteria-ChangeIcon").click(function() {
           $("#EmployerNotationCriteria-icon").show();
           $(this).hide();
           $("#Save").show();  
        });           
      
       $('#EmployerNotationCriteria-DeleteIcon').click(function(){ 
            if (!confirm("{__("Icon will be deleted. Confirm ?")}")) return false; 
            return $.ajax2({ 
                              data : { EmployerNotationCriteria: "{$item_i18n->getCriteria()->get('id')}" }, 
                              url: "{url_to('employers_notation_ajax',['action'=>'DeleteIconContractCriteria'])}",                              
                              success :function(response) {
                                          if (response.action=='DeleteIconContractCriteria' && response.id=="{$item_i18n->getCriteria()->get('id')}")
                                          {                                                     
                                                $("#EmployerNotationCriteria-icon-container").hide(); 
                                                $("span#EmployerNotationCriteria-text-icon").html("{__('Add icon')}");
                                          }
                              }
            });  
      }); 
      
    $(".EmployerNotationCriteria,.EmployerNotationCriteriaI18n").click(function() {  $('#Save').show(); });  
         
     {* =================== L A N G U A G E ================================ *}
        
     {* =================== A C T I O N S ================================ *}
     $('#Cancel').click(function(){                
             return $.ajax2({ data: { filter: { lang:  '{$item_i18n->get('lang')}', token: "{mfForm::getToken('EmployerNotationCriteriaFormFilter')}" } },                              
                              url : "{url_to('employers_notation_ajax',['action'=>'ListPartialCriteria'])}",                                                 
                              target: "#actions"}); 
      });
     
        
      $('#Save').click(function(){                             
            var  params= {      iFrame:true,             
                                EmployerNotationCriteriaI18n: { 
                                   criteria_i18n : { lang: '{$item_i18n->get('lang')}', criteria_id : '{$item_i18n->get('criteria_id')}' },
                                   criteria : { },
                                   token :'{$form->getCSRFToken()}'
                                } };
          $(".EmployerNotationCriteriaI18n.Input").each(function() { params.EmployerNotationCriteriaI18n.criteria_i18n[$(this).attr('name')]=$(this).val(); });
          $(".EmployerNotationCriteria.Input").each(function() {  params.EmployerNotationCriteriaI18n.criteria[$(this).attr('name')]=$(this).val();  });  // Get foreign key  
          $(".EmployerNotationCriteria.Select option:selected").each(function() {  params.EmployerNotationCriteriaI18n.criteria[$(this).parent().attr('name')]=$(this).val();  });  // Get foreign key  
        //      alert("Params="+params.toSource());   return ;      
          return $.ajax2({ data : params,  
                           files :'.Files',
                           url: "{url_to('employers_notation_ajax',['action'=>'SaveCriteriaI18n'])}",
                           target: "#actions"}); 
        });                          
</script>
