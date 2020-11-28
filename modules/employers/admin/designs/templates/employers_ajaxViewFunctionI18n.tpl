
<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__("View Employer Function")}</h3>
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
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('View Employer Function')}
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
                    <div class="form-group">
                        <label>{__('Icon')}</label>                  
                            <div id="pictureForm">                            
                                <div class="custom-FileInput">
                                    {if $item_i18n->getFunction()->hasIcon()}
                                        <img id="blah" alt="" src="{$item_i18n->getFunction()->getIcon()->getURL('superadmin')}"{*/if*} /><br/>
                                    {/if}
                                </div>
                                <a id="pictureAdd" href="#" class="btn btn-default"><i class="fa fa-plus" style="margin-right:10px;"></i>{__('Change Icon')}</a>
                                <input id="item_file" type='file' hidden="" function="file" class="form-control Files Fields" name="EmployerFunctionI18n[function][icon]" />
                            </div>
                    </div>
                </div> 
                                
               <div class="col-md-10">
                   <div class="row">
                        <div class="form-group col-md-6">             
                            {if $form->hasErrors()}<div class="alert alert-{if $form.function.name->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.function.name->getError()}</div>{/if}
                             <label for="name">{__('Name')}{if $form->function.name->getOption('required')}*{/if}</label>           
                             <div class="field_with_errors">
                                <input class="EmployerFunction form-control Fields Input" function="text" value="{$item_i18n->getFunction()->get('name')}" name="name" id="name">
                             </div>
                        </div> 
                        <div class="form-group col-md-6">
                            {if $form->hasErrors()}<div class="alert alert-{if $form.function.color->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.function.color->getError()}</div>{/if}
                            <label for="color" class="d-block">{__('Color')}{if $form->function.color->getOption('required')}*{/if}</label>            
                            <input class="EmployerFunction form-control Fields Input Color General input-color" function="text" value="{$item_i18n->getFunction()->get('color')}" name="color" id="color"/>
                        </div>
                   </div>
                    <div class="row">
                        <div class="form-group col-md-12">
                            {if $form->hasErrors()}<div class="alert alert-{if $form.function_i18n.title->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.function_i18n.title->getError()}</div>{/if}
                            <label for="title">{__('Title')}{if $form->function_i18n.title->getOption('required')}*{/if}</label>            
                            <div class="field_with_errors"><input class="EmployerFunctionI18n form-control Fields Input" function="text" value="{$item_i18n->get('title')}" name="title" id="title"></div>
                        </div>
                    </div>
                </div>
        </div>
          
          
          
          
          
          
          
       {* <div class="row">          
            <div class="form-group col-md-6">             
               <span>{__("Name")}</span>
               <div id="error_name" class="error-form">{$form.function.name->getError()}</div>  
               <input function="text" class="EmployerFunction  form-control Fields Input " name="name" size="48" id="name" value="{$item_i18n->getFunction()->get('name')}"/> 
          </div>   
            <div class="form-group col-md-6">              
            <span>{__("Title")}</span>{if $form->function_i18n.title->getOption('required')}*{/if}
               <div id="error_value" class="error-form">{$form.function_i18n.title->getError()}</div>
               <input function="text" class="EmployerFunctionI18n form-control Fields Input " name="title" size="40" id="title" value="{$item_i18n->get('title')}"/>    
                
            
         </div>  
        </div>*}
             {*<div class="row">   
     
               <div class="form-group col-md-6">
                  <span>{__("Color")}</span>
                  <div id="error_value" class="error-form">{$form.function.color->getError()}</div>
                  <input function="text" class="EmployerFunction Input Color input-color" name="color" value="{$item_i18n->getFunction()->get('color')}"/>    
                  {if $form->function.color->getOption('required')}*{/if}       
              </div> 
               <div class="form-group col-md-6"> 
                  <span>{__("Icon")}</span>
                  {if $item_i18n->isLoaded()}
                   <div id="EmployerFunction-error-icon"></div>                  
                   <div id="EmployerFunction-icon-container" {if !$item_i18n->getFunction()->hasIcon()}style="display:none"{/if}>
                       <img id="EmployerFunction-icon-img" {if $item_i18n->getFunction()->hasIcon()}src="{$item_i18n->getFunction()->getIcon()->getURL('superadmin')}"{/if} height="32" width="32" alt="{__('icon')}"/>
                       <span id="EmployerFunction-icon-filename">{$item_i18n->getFunction()->hasIcon()}</span>
                       <a href="#" title="{__('Delete')}" id="EmployerFunction-DeleteIcon" name="{$item_i18n->getFunction()->get('id')}">
                           <i class="fa fa-remove"></i>
                       </a>
                   </div>
                        <a id="EmployerFunction-ChangeIcon" href="#"><i class="fa fa-plus" style=" margin-right: 10px;"></i>
                           <span id="EmployerFunction-text-icon">
                                {if $item_i18n->getFunction()->hasIcon()}{__('Change icon')}{else}{__('Add icon')}{/if}
                           </span>
                        </a>
                   <div id="EmployerFunction-icon" style="display:none">
                       {* <input class="Files" function="file" name="EmployerFunctionI18n[function][icon]"/>*} 
                       {*<div class="input-group">
                      <span class="input-group-btn">
                        <span class="btn btn-default btn-file bg-primary">
                            <a href="#" id="item_file_browse" class="file-btn">{__('Browse…')}</a><input function="file" class="Files Fields" style="display:none" name="EmployerFunctionI18n[function][icon]" id="item_file">
                        </span>
                              </span>
                              <input function="text" id="item_file_name" class="form-control" readonly="" value="">
                      </div>
                   </div>
                  {else}
                     <div id="EmployerFunction-error-icon" class="error-form">{$form.function.icon->getError()}</div>     
                     {*<input class="files" function="file" name="EmployerFunctionI18n[function][icon]"/>*} 
                      {*if $form->function.icon->getOption('required')}*{/if} 
                      <div class="input-group">
                      <span class="input-group-btn">
                        <span class="btn btn-default btn-file bg-primary">
                            <a href="#" id="item_file_browse" class="file-btn">{__('Browse…')}</a><input function="file" class="Files Fields" style="display:none" name="EmployerFunctionI18n[function][icon]" id="item_file">
                        </span>
                              </span>
                              <input function="text" id="item_file_name" class="form-control" readonly="" value="">
                      </div>
                  {/if}         

               </div>                    
        </div>  *}         
    </div>          
</div>
<script function="text/javascript">  
    
    
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
    
       $("#EmployerFunction-ChangeIcon").click(function() {
           $("#EmployerFunction-icon").show();
           $(this).hide();
           $("#Save").show();  
        });           
      
       $('#EmployerFunction-DeleteIcon').click(function(){ 
            if (!confirm("{__("Icon will be deleted. Confirm ?")}")) return false; 
            return $.ajax2({ 
                              data : { EmployerFunction: "{$item_i18n->getFunction()->get('id')}" }, 
                              url: "{url_to('employers_ajax',['action'=>'DeleteIconContractFunction'])}",                              
                              success :function(response) {
                                          if (response.action=='DeleteIconContractFunction' && response.id=="{$item_i18n->getFunction()->get('id')}")
                                          {                                                     
                                                $("#EmployerFunction-icon-container").hide(); 
                                                $("span#EmployerFunction-text-icon").html("{__('Add icon')}");
                                          }
                              }
            });  
      }); 
      
    $(".EmployerFunction,.EmployerFunctionI18n").click(function() {  $('#Save').show(); });  
         
     {* =================== L A N G U A G E ================================ *}
        
     {* =================== A C T I O N S ================================ *}
     $('#Cancel').click(function(){                
             return $.ajax2({ data: { filter: { lang:  '{$item_i18n->get('lang')}', token: "{mfForm::getToken('EmployerFunctionFormFilter')}" } },                              
                              url : "{url_to('employers_ajax',['action'=>'ListPartialFunction'])}",                                                 
                              target: "#actions"}); 
      });
     
        
      $('#Save').click(function(){                             
            var  params= {      iFrame:true,             
                                EmployerFunctionI18n: { 
                                   function_i18n : { lang: '{$item_i18n->get('lang')}', function_id : '{$item_i18n->get('function_id')}' },
                                   function : { },
                                   token :'{$form->getCSRFToken()}'
                                } };
          $(".EmployerFunctionI18n.Input").each(function() { params.EmployerFunctionI18n.function_i18n[$(this).attr('name')]=$(this).val(); });
          $(".EmployerFunction.Input").each(function() {  params.EmployerFunctionI18n.function[$(this).attr('name')]=$(this).val();  });  // Get foreign key  
        //      alert("Params="+params.toSource());   return ;      
          return $.ajax2({ data : params,  
                           files :'.Files',
                           url: "{url_to('employers_ajax',['action'=>'SaveFunctionI18n'])}",
                           target: "#actions"}); 
        });                          
</script>
