
<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__("View Software")}</h3>
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
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Softwares')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Category [%s]',$item_i18n->getSoftware()->getCategory()->getI18n()->get('title'))}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('View Software')}
    </p>
</div>
{alerts}
{if $item_i18n->getSoftware()->isLoaded()}
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
                                    {if $item_i18n->getSoftware()->hasIcon()}
                                        <img id="blah" alt="" src="{$item_i18n->getSoftware()->getIcon()->getURL('superadmin')}"{*/if*} /><br/>
                                        {else}
                                            <img id="blah" alt="" style="display: none;" /><br/>
                                    {/if}
                                </div>
                                <a id="pictureAdd" href="#" class="btn btn-default"><i class="fa fa-plus" style="margin-right:10px;"></i>{__('Add Icon')}</a>
                                <input id="item_file" type='file' hidden="" software="file" class="form-control Files Fields" name="CustomerAcademySoftwareI18n[software][icon]" /> {*name="SiteCityI18n[function][icon]"*}
                            </div>
                    </div>
                </div> 
              </div>
                                
               <div class="col-md-10">
                   <div class="row">
                        <div class="form-group col-md-6">             
                            {if $form->hasErrors()}<div class="alert alert-{if $form.software.name->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.software.name->getError()}</div>{/if}
                             <label for="name">{__('Name')}{if $form->software.name->getOption('required')}*{/if}</label>           
                             <div class="field_with_errors">
                                <input class="CustomerAcademySoftware form-control Fields Input" software="text" value="{$item_i18n->getSoftware()->get('name')}" name="name" id="name">
                             </div>
                        </div> 
                        <div class="form-group col-md-6">
                            {if $form->hasErrors()}<div class="alert alert-{if $form.software.color->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.software.color->getError()}</div>{/if}
                            <label for="color" class="d-block">{__('Color')}{if $form->software.color->getOption('required')}*{/if}</label>            
                            <input class="CustomerAcademySoftware form-control Fields Input Color General input-color" software="text" value="{$item_i18n->getSoftware()->get('color')}" name="color" id="color"/>
                        </div>
                   </div>
                    <div class="row">
                        <div class="form-group col-md-12">
                            {if $form->hasErrors()}<div class="alert alert-{if $form.software_i18n.title->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.software_i18n.title->getError()}</div>{/if}
                            <label for="title">{__('Title')}{if $form->software_i18n.title->getOption('required')}*{/if}</label>            
                            <div class="field_with_errors"><input class="CustomerAcademySoftwareI18n form-control Fields Input" software="text" value="{$item_i18n->get('title')}" name="title" id="title"></div>
                        </div>
                    </div>
                </div>
        </div>
          
          
          
          
          
        {*<div class="row">          
            <div class="form-group col-md-6">             
               <span>{__("Name")}</span>
               <div id="error_name" class="error-form">{$form.software.name->getError()}</div>  
               <input software="text" class="CustomerAcademySoftware  form-control Fields Input " name="name" size="48" id="name" value="{$item_i18n->getSoftware()->get('name')}"/> 
          </div>   
            <div class="form-group col-md-6">              
            <span>{__("Title")}</span>{if $form->software_i18n.title->getOption('required')}*{/if}
               <div id="error_value" class="error-form">{$form.software_i18n.title->getError()}</div>
               <input software="text" class="CustomerAcademySoftwareI18n form-control Fields Input " name="title" size="40" id="title" value="{$item_i18n->get('title')}"/>    
                
            
         </div>  
        </div>*}
            {* <div class="row">   
     
               <div class="form-group col-md-6">
                  <span>{__("Color")}</span>
                  <div id="error_value" class="error-form">{$form.software.color->getError()}</div>
                  <input software="text" class="CustomerAcademySoftware Input Color input-color" name="color" value="{$item_i18n->getSoftware()->get('color')}"/>    
                  {if $form->software.color->getOption('required')}*{/if}       
              </div> 
               <div class="form-group col-md-6"> 
                  <span>{__("Icon")}</span>
                  {if $item_i18n->isLoaded()}
                   <div id="CustomerAcademySoftware-error-icon"></div>                  
                   <div id="CustomerAcademySoftware-icon-container" {if !$item_i18n->getSoftware()->hasIcon()}style="display:none"{/if}>
                       <img id="CustomerAcademySoftware-icon-img" {if $item_i18n->getSoftware()->hasIcon()}src="{$item_i18n->getSoftware()->getIcon()->getURL('superadmin')}"{/if} height="32" width="32" alt="{__('icon')}"/>
                       <span id="CustomerAcademySoftware-icon-filename">{$item_i18n->getSoftware()->hasIcon()}</span>
                       <a href="#" title="{__('Delete')}" id="CustomerAcademySoftware-DeleteIcon" name="{$item_i18n->getSoftware()->get('id')}">
                           <i class="fa fa-remove"></i>
                       </a>
                   </div>
                        <a id="CustomerAcademySoftware-ChangeIcon" href="#"><i class="fa fa-plus" style=" margin-right: 10px;"></i>
                           <span id="CustomerAcademySoftware-text-icon">
                                {if $item_i18n->getSoftware()->hasIcon()}{__('Change icon')}{else}{__('Add icon')}{/if}
                           </span>
                        </a>
                   <div id="CustomerAcademySoftware-icon" style="display:none">
                       {* <input class="Files" software="file" name="CustomerAcademySoftwareI18n[function][icon]"/>*} 
                       {*<div class="input-group">
                      <span class="input-group-btn">
                        <span class="btn btn-default btn-file bg-primary">
                            <a href="#" id="item_file_browse" class="file-btn">{__('Browse…')}</a><input software="file" class="Files Fields" style="display:none" name="CustomerAcademySoftwareI18n[function][icon]" id="item_file">
                        </span>
                              </span>
                              <input software="text" id="item_file_name" class="form-control" readonly="" value="">
                      </div>
                   </div>
                  {else}
                     <div id="CustomerAcademySoftware-error-icon" class="error-form">{$form.software.icon->getError()}</div>     
                     {*<input class="files" software="file" name="CustomerAcademySoftwareI18n[function][icon]"/>*} 
                      {*if $form->software.icon->getOption('required')}*{/if} 
                      <div class="input-group">
                      <span class="input-group-btn">
                        <span class="btn btn-default btn-file bg-primary">
                            <a href="#" id="item_file_browse" class="file-btn">{__('Browse…')}</a><input software="file" class="Files Fields" style="display:none" name="CustomerAcademySoftwareI18n[function][icon]" id="item_file">
                        </span>
                              </span>
                              <input software="text" id="item_file_name" class="form-control" readonly="" value="">
                      </div>
                  {/if}         

               </div>                    
        </div>*}           
    </div>          
</div>
<script software="text/javascript">
    
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
    
       $("#CustomerAcademySoftware-ChangeIcon").click(function() {
           $("#CustomerAcademySoftware-icon").show();
           $(this).hide();
           $("#Save").show();  
        });           
      
       $('#CustomerAcademySoftware-DeleteIcon').click(function(){ 
            if (!confirm("{__("Icon will be deleted. Confirm ?")}")) return false; 
            return $.ajax2({ 
                              data : { CustomerAcademySoftware: "{$item_i18n->getSoftware()->get('id')}" }, 
                              url: "{url_to('customers_academy_ajax',['action'=>'DeleteIconContractSoftware'])}",                              
                              success :function(response) {
                                          if (response.action=='DeleteIconContractSoftware' && response.id=="{$item_i18n->getSoftware()->get('id')}")
                                          {                                                     
                                                $("#CustomerAcademySoftware-icon-container").hide(); 
                                                $("span#CustomerAcademySoftware-text-icon").html("{__('Add icon')}");
                                          }
                              }
            });  
      }); 
      
    $(".CustomerAcademySoftware,.CustomerAcademySoftwareI18n").click(function() {  $('#Save').show(); });  
            
     $('#Cancel').click(function() {                
             return $.ajax2({ data : { CustomerCourseCategoryNode : { node: '{$item_i18n->getSoftware()->get('category_id')}', 
                                             lang : '{$item_i18n->get('lang')}', 
                                             token : '{mfForm::getToken('CustomerCourseCategoryNodeForm')}' } },                                 
                              url : "{url_to('customers_academy_ajax',['action'=>'ListPartialSoftwareForCategoryI18n'])}",                                                 
                              target: "#actions"}); 
      });
     
        
      $('#Save').click(function(){                             
            var  params= {      iFrame:true,             
                                CustomerAcademySoftwareI18n: { 
                                   software_i18n : { lang: '{$item_i18n->get('lang')}', software_id : '{$item_i18n->get('software_id')}' },
                                   software : { },
                                   token :'{$form->getCSRFToken()}'
                                } };
          $(".CustomerAcademySoftwareI18n.Input").each(function() { params.CustomerAcademySoftwareI18n.software_i18n[$(this).attr('name')]=$(this).val(); });
          $(".CustomerAcademySoftware.Input").each(function() {  params.CustomerAcademySoftwareI18n.software[$(this).attr('name')]=$(this).val();  });  // Get foreign key  
        //      alert("Params="+params.toSource());   return ;      
          return $.ajax2({ data : params,  
                           files :'.Files',
                           url: "{url_to('customers_academy_ajax',['action'=>'SaveSoftwareI18nForCategoryI18n'])}",
                           target: "#actions"}); 
        });                          
</script>
{else}
    {__('Software is invalid.')}
{/if}    