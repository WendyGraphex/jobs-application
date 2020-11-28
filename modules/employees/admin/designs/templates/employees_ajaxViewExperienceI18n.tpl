
<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__("View Freelancer Experience")}</h3>
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
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('View Freelancer Experience')}
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
                                    {if $item_i18n->getExperience()->hasIcon()}
                                        <img id="blah" alt="" src="{$item_i18n->getExperience()->getIcon()->getURL('superadmin')}"{*/if*} /><br/>
                                    {/if}
                                </div>
                                <a id="pictureAdd" href="#" class="btn btn-default"><i class="fa fa-plus" style="margin-right:10px;"></i>{__('Change Icon')}</a>
                                <input id="item_file" type='file' hidden="" function="file" class="form-control Files Fields" name="EmployeeExperienceI18n[experience][icon]" />
                            </div>
                    </div>
                </div> 
                                
               <div class="col-md-10">
                   <div class="row">
                        <div class="form-group col-md-6">             
                            {if $form->hasErrors()}<div class="alert alert-{if $form.experience.name->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.experience.name->getError()}</div>{/if}
                             <label for="name">{__('Name')}{if $form->experience.name->getOption('required')}*{/if}</label>           
                             <div class="field_with_errors">
                                <input class="EmployeeExperience form-control Fields Input" function="text" value="{$item_i18n->getExperience()->get('name')}" name="name" id="name">
                             </div>
                        </div> 
                        <div class="form-group col-md-6">
                            {if $form->hasErrors()}<div class="alert alert-{if $form.experience.color->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.experience.color->getError()}</div>{/if}
                            <label for="color" class="d-block">{__('Color')}{if $form->experience.color->getOption('required')}*{/if}</label>            
                            <input class="EmployeeExperience form-control Fields Input Color General input-color" function="text" value="{$item_i18n->getExperience()->get('color')}" name="color" id="color"/>
                        </div>
                   </div>
                    <div class="row">
                        <div class="form-group col-md-12">
                            {if $form->hasErrors()}<div class="alert alert-{if $form.experience_i18n.title->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.experience_i18n.title->getError()}</div>{/if}
                            <label for="title">{__('Title')}{if $form->experience_i18n.title->getOption('required')}*{/if}</label>            
                            <div class="field_with_errors"><input class="EmployeeExperienceI18n form-control Fields Input" function="text" value="{$item_i18n->get('title')}" name="title" id="title"></div>
                        </div>
                    </div>
                </div>
        </div>
          
          
          
          
          
          
          
       {* <div class="row">          
            <div class="form-group col-md-6">             
               <span>{__("Name")}</span>
               <div id="error_name" class="error-form">{$form.experience.name->getError()}</div>  
               <input function="text" class="EmployeeExperience  form-control Fields Input " name="name" size="48" id="name" value="{$item_i18n->getExperience()->get('name')}"/> 
          </div>   
            <div class="form-group col-md-6">              
            <span>{__("Title")}</span>{if $form->experience_i18n.title->getOption('required')}*{/if}
               <div id="error_value" class="error-form">{$form.experience_i18n.title->getError()}</div>
               <input function="text" class="EmployeeExperienceI18n form-control Fields Input " name="title" size="40" id="title" value="{$item_i18n->get('title')}"/>    
                
            
         </div>  
        </div>*}
             {*<div class="row">   
     
               <div class="form-group col-md-6">
                  <span>{__("Color")}</span>
                  <div id="error_value" class="error-form">{$form.experience.color->getError()}</div>
                  <input function="text" class="EmployeeExperience Input Color input-color" name="color" value="{$item_i18n->getExperience()->get('color')}"/>    
                  {if $form->experience.color->getOption('required')}*{/if}       
              </div> 
               <div class="form-group col-md-6"> 
                  <span>{__("Icon")}</span>
                  {if $item_i18n->isLoaded()}
                   <div id="EmployeeExperience-error-icon"></div>                  
                   <div id="EmployeeExperience-icon-container" {if !$item_i18n->getExperience()->hasIcon()}style="display:none"{/if}>
                       <img id="EmployeeExperience-icon-img" {if $item_i18n->getExperience()->hasIcon()}src="{$item_i18n->getExperience()->getIcon()->getURL('superadmin')}"{/if} height="32" width="32" alt="{__('icon')}"/>
                       <span id="EmployeeExperience-icon-filename">{$item_i18n->getExperience()->hasIcon()}</span>
                       <a href="#" title="{__('Delete')}" id="EmployeeExperience-DeleteIcon" name="{$item_i18n->getExperience()->get('id')}">
                           <i class="fa fa-remove"></i>
                       </a>
                   </div>
                        <a id="EmployeeExperience-ChangeIcon" href="#"><i class="fa fa-plus" style=" margin-right: 10px;"></i>
                           <span id="EmployeeExperience-text-icon">
                                {if $item_i18n->getExperience()->hasIcon()}{__('Change icon')}{else}{__('Add icon')}{/if}
                           </span>
                        </a>
                   <div id="EmployeeExperience-icon" style="display:none">
                       {* <input class="Files" function="file" name="EmployeeExperienceI18n[experience][icon]"/>*} 
                       {*<div class="input-group">
                      <span class="input-group-btn">
                        <span class="btn btn-default btn-file bg-primary">
                            <a href="#" id="item_file_browse" class="file-btn">{__('Browse…')}</a><input function="file" class="Files Fields" style="display:none" name="EmployeeExperienceI18n[experience][icon]" id="item_file">
                        </span>
                              </span>
                              <input function="text" id="item_file_name" class="form-control" readonly="" value="">
                      </div>
                   </div>
                  {else}
                     <div id="EmployeeExperience-error-icon" class="error-form">{$form.experience.icon->getError()}</div>     
                     {*<input class="files" function="file" name="EmployeeExperienceI18n[experience][icon]"/>*} 
                      {*if $form->experience.icon->getOption('required')}*{/if} 
                      <div class="input-group">
                      <span class="input-group-btn">
                        <span class="btn btn-default btn-file bg-primary">
                            <a href="#" id="item_file_browse" class="file-btn">{__('Browse…')}</a><input function="file" class="Files Fields" style="display:none" name="EmployeeExperienceI18n[experience][icon]" id="item_file">
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
    
       $("#EmployeeExperience-ChangeIcon").click(function() {
           $("#EmployeeExperience-icon").show();
           $(this).hide();
           $("#Save").show();  
        });           
      
       $('#EmployeeExperience-DeleteIcon').click(function(){ 
            if (!confirm("{__("Icon will be deleted. Confirm ?")}")) return false; 
            return $.ajax2({ 
                              data : { EmployeeExperience: "{$item_i18n->getExperience()->get('id')}" }, 
                              url: "{url_to('employees_ajax',['action'=>'DeleteIconContractExperience'])}",                              
                              success :function(response) {
                                          if (response.action=='DeleteIconContractExperience' && response.id=="{$item_i18n->getExperience()->get('id')}")
                                          {                                                     
                                                $("#EmployeeExperience-icon-container").hide(); 
                                                $("span#EmployeeExperience-text-icon").html("{__('Add icon')}");
                                          }
                              }
            });  
      }); 
      
    $(".EmployeeExperience,.EmployeeExperienceI18n").click(function() {  $('#Save').show(); });  
         
     {* =================== L A N G U A G E ================================ *}
        
     {* =================== A C T I O N S ================================ *}
     $('#Cancel').click(function(){                
             return $.ajax2({ data: { filter: { lang:  '{$item_i18n->get('lang')}', token: "{mfForm::getToken('EmployeeExperienceFormFilter')}" } },                              
                              url : "{url_to('employees_ajax',['action'=>'ListPartialExperience'])}",                                                 
                              target: "#actions"}); 
      });
     
        
      $('#Save').click(function(){                             
            var  params= {      iFrame:true,             
                                EmployeeExperienceI18n: { 
                                   experience_i18n : { lang: '{$item_i18n->get('lang')}', experience_id : '{$item_i18n->get('experience_id')}' },
                                   experience : { },
                                   token :'{$form->getCSRFToken()}'
                                } };
          $(".EmployeeExperienceI18n.Input").each(function() { params.EmployeeExperienceI18n.experience_i18n[$(this).attr('name')]=$(this).val(); });
          $(".EmployeeExperience.Input").each(function() {  params.EmployeeExperienceI18n.experience[$(this).attr('name')]=$(this).val();  });  // Get foreign key  
        //      alert("Params="+params.toSource());   return ;      
          return $.ajax2({ data : params,  
                           files :'.Files',
                           url: "{url_to('employees_ajax',['action'=>'SaveExperienceI18n'])}",
                           target: "#actions"}); 
        });                          
</script>
