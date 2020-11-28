<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__("View Employer Category")}</h3>
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
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('View Category')}
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
                                    {if $item_i18n->getCategory()->hasIcon()}
                                        <img id="blah" alt="" src="{$item_i18n->getCategory()->getIcon()->getURL('superadmin')}"{*/if*} /><br/>
                                        {else}
                                            <img id="blah" alt="" style="display: none;" /><br/>
                                    {/if}
                                </div>
                                <a id="pictureAdd" href="#" class="btn btn-default"><i class="fa fa-plus" style="margin-right:10px;"></i>{__('Add Icon')}</a>
                                <input id="item_file" type='file' hidden="" language="file" class="form-control Files Fields" name="EmployerNotationCategoryI18n[language][icon]" /> {*name="SiteCityI18n[function][icon]"*}
                            </div>
                    </div>
                </div> 
              </div>
                                
               <div class="col-md-10">
                   <div class="row">
                        <div class="form-group col-md-6">             
                            {if $form->hasErrors()}<div class="alert alert-{if $form.category.name->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.category.name->getError()}</div>{/if}
                             <label for="name">{__('Name')}{if $form->category.name->getOption('required')}*{/if}</label>           
                             <div class="field_with_errors">
                                <input class="EmployerNotationCategory form-control Fields Input" language="text" value="{$item_i18n->getCategory()->get('name')}" name="name" id="name">
                             </div>
                        </div> 
                        <div class="form-group col-md-6">
                            {if $form->hasErrors()}<div class="alert alert-{if $form.category.color->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.category.color->getError()}</div>{/if}
                            <label for="color" class="d-block">{__('Color')}{if $form->category.color->getOption('required')}*{/if}</label>            
                            <input class="EmployerNotationCategory form-control Fields Input Color General input-color" language="text" value="{$item_i18n->getCategory()->get('color')}" name="color" id="color"/>
                        </div>
                   </div>
                    <div class="row">
                        <div class="form-group col-md-12">
                            {if $form->hasErrors()}<div class="alert alert-{if $form.category_i18n.title->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.category_i18n.title->getError()}</div>{/if}
                            <label for="title">{__('Title')}{if $form->category_i18n.title->getOption('required')}*{/if}</label>            
                            <div class="field_with_errors"><input class="EmployerNotationCategoryI18n form-control Fields Input" language="text" value="{$item_i18n->get('title')}" name="title" id="title"></div>
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
    
       $("#EmployerNotationCategory-ChangeIcon").click(function() {
           $("#EmployerNotationCategory-icon").show();
           $(this).hide();
           $("#Save").show();  
        });           
      
       $('#EmployerNotationCategory-DeleteIcon').click(function(){ 
            if (!confirm("{__("Icon will be deleted. Confirm ?")}")) return false; 
            return $.ajax2({ 
                              data : { EmployerNotationCategory: "{$item_i18n->getCategory()->get('id')}" }, 
                              url: "{url_to('employers_notation_ajax',['action'=>'DeleteIconContractCategory'])}",                              
                              success :function(response) {
                                          if (response.action=='DeleteIconContractCategory' && response.id=="{$item_i18n->getCategory()->get('id')}")
                                          {                                                     
                                                $("#EmployerNotationCategory-icon-container").hide(); 
                                                $("span#EmployerNotationCategory-text-icon").html("{__('Add icon')}");
                                          }
                              }
            });  
      }); 
      
    $(".EmployerNotationCategory,.EmployerNotationCategoryI18n").click(function() {  $('#Save').show(); });  
         
     {* =================== L A N G U A G E ================================ *}
        
     {* =================== A C T I O N S ================================ *}
     $('#Cancel').click(function(){                
             return $.ajax2({ data: { filter: { lang:  '{$item_i18n->get('lang')}', token: "{mfForm::getToken('EmployerNotationCategoryFormFilter')}" } },                              
                              url : "{url_to('employers_notation_ajax',['action'=>'ListPartialCategory'])}",                                                 
                              target: "#actions"}); 
      });
     
        
      $('#Save').click(function(){                             
            var  params= {      iFrame:true,             
                                EmployerNotationCategoryI18n: { 
                                   category_i18n : { lang: '{$item_i18n->get('lang')}', category_id : '{$item_i18n->get('category_id')}' },
                                   category : { },
                                   token :'{$form->getCSRFToken()}'
                                } };
          $(".EmployerNotationCategoryI18n.Input").each(function() { params.EmployerNotationCategoryI18n.category_i18n[$(this).attr('name')]=$(this).val(); });
          $(".EmployerNotationCategory.Input").each(function() {  params.EmployerNotationCategoryI18n.category[$(this).attr('name')]=$(this).val();  });  // Get foreign key  
        //      alert("Params="+params.toSource());   return ;      
          return $.ajax2({ data : params,  
                           files :'.Files',
                           url: "{url_to('employers_notation_ajax',['action'=>'SaveCategoryI18n'])}",
                           target: "#actions"}); 
        });                          
</script>
