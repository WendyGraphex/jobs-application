
<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__("New Warning")}</h3>
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
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('New Warning')}
    </p>
</div>
{alerts}
<div class="tablewhiteback" style="padding: 20px;">    
     <div class="the-box bg-white p-3">    
         <div class="row">
          <div class="form-group col-md-12">          
            <div>{$form.warning_i18n.lang->getError()}</div> 
            {component name="/site_languages/selectListLanguagesFrontend" selected=$form.warning_i18n.lang}
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
                                <input id="item_file" type='file' hidden="" type="file" class="form-control Files Fields" name="SiteWarningI18n[warning][icon]" /> {*name="SiteCityI18n[function][icon]"*}
                            </div>
                    </div>
                </div> 
              </div>
                                
               <div class="col-md-10">
                   <div class="row">
                        <div class="form-group col-md-6">             
                            {if $form->hasErrors()}<div class="alert alert-{if $form.warning.name->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.warning.name->getError()}</div>{/if}
                             <label for="name">{__('Name')}{if $form->warning.name->getOption('required')}*{/if}</label>           
                             <div class="field_with_errors">
                                <input class="SiteWarning form-control Fields Input" type="text" value="{$item_i18n->getWarning()->get('name')}" name="name" id="name">
                             </div>
                        </div> 
                        <div class="form-group col-md-6">
                            {if $form->hasErrors()}<div class="alert alert-{if $form.warning.color->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.warning.color->getError()}</div>{/if}
                            <label for="color" class="d-block">{__('Color')}{if $form->warning.color->getOption('required')}*{/if}</label>            
                            <input class="SiteWarning form-control Fields Input Color General input-color" language="text" value="{$item_i18n->getWarning()->get('color')}" name="color" id="color"/>
                        </div>
                   </div>
                    <div class="row">
                        <div class="form-group col-md-12">
                            {if $form->hasErrors()}<div class="alert alert-{if $form.warning_i18n.title->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.warning_i18n.title->getError()}</div>{/if}
                            <label for="title">{__('Title')}{if $form->warning_i18n.title->getOption('required')}*{/if}</label>            
                            <div class="field_with_errors"><input class="SiteWarningI18n form-control Fields Input" language="text" value="{$item_i18n->get('title')}" name="title" id="title"></div>
                        </div>
                    </div>
                     <div class="row">
                        <div class="form-group col-md-12">
                            {if $form->hasErrors()}<div class="alert alert-{if $form.warning_i18n.description->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.warning_i18n.description->getError()}</div>{/if}
                            <label for="description">{__('Description')}{if $form->warning_i18n.description->getOption('required')}*{/if}</label>            
                            <div class="field_with_errors"><textarea cols="40" rows="4" class="SiteWarningI18n form-control Fields Input" language="text" name="description" id="description">{$item_i18n->get('description')|escape}</textarea></div>
                        </div>
                    </div>
                      <div class="row">
                        <div class="form-group col-md-12">
                            {if $form->hasErrors()}<div class="alert alert-{if $form.warning_i18n.content->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.warning_i18n.content->getError()}</div>{/if}
                            <label for="content">{__('Content')}{if $form->warning_i18n.content->getOption('required')}*{/if}</label>            
                            <div class="field_with_errors"><textarea cols="40" rows="4" class="SiteWarningI18n form-control Fields Input" language="text" name="content" id="content">{$item_i18n->get('content')|escape}</textarea></div>
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
             return $.ajax2({ data: { filter: { lang:$("#SelectListLanguages option:selected").attr('id'), token: "{mfForm::getToken('SiteWarningFormFilter')}" } },                              
                              url : "{url_to('site_warning_ajax',['action'=>'ListPartialWarning'])}",                                                 
                              target: "#actions"}); 
      });
      
      $('#Save').click(function(){                             
            var  params= {      iFrame:true,             
                                SiteWarningI18n: { 
                                   warning_i18n : { lang: $("#SelectListLanguages option:selected").attr('id')  },
                                   warning : { },
                                   token :'{$form->getCSRFToken()}'
                                } };
          $(".SiteWarningI18n.Input").each(function() { params.SiteWarningI18n.warning_i18n[$(this).attr('name')]=$(this).val(); });
          $(".SiteWarning.Input").each(function() {  params.SiteWarningI18n.warning[$(this).attr('name')]=$(this).val();  });  // Get foreign key  
        //      alert("Params="+params.toSource());   return ;      
          return $.ajax2({ data : params,  
                           files :'.Files',
                           url: "{url_to('site_warning_ajax',['action'=>'SaveNewWarningI18n'])}",
                           target: "#actions"}); 
        });                          
     
</script>
