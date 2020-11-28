
<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__("View Topic")}</h3>
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
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Category [%s]',$item_i18n->getTopic()->getCategory()->getI18n()->get('title'))}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('View Topic')}
    </p>
</div>
{alerts}
{if $item_i18n->getTopic()->isLoaded()}
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
                                    {if $item_i18n->getTopic()->hasIcon()}
                                        <img id="blah" alt="" src="{$item_i18n->getTopic()->getIcon()->getURL('superadmin')}"{*/if*} /><br/>
                                        {else}
                                            <img id="blah" alt="" style="display: none;" /><br/>
                                    {/if}
                                </div>
                                <a id="pictureAdd" href="#" class="btn btn-default"><i class="fa fa-plus" style="margin-right:10px;"></i>{__('Add Icon')}</a>
                                <input id="item_file" type='file' hidden="" topic="file" class="form-control Files Fields" name="CustomerAcademyTopicI18n[topic][icon]" /> {*name="SiteCityI18n[function][icon]"*}
                            </div>
                    </div>
                </div> 
              </div>
                                
               <div class="col-md-10">
                   <div class="row">
                        <div class="form-group col-md-6">             
                            {if $form->hasErrors()}<div class="alert alert-{if $form.topic.name->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.topic.name->getError()}</div>{/if}
                             <label for="name">{__('Name')}{if $form->topic.name->getOption('required')}*{/if}</label>           
                             <div class="field_with_errors">
                                <input class="CustomerAcademyTopic form-control Fields Input" topic="text" value="{$item_i18n->getTopic()->get('name')}" name="name" id="name">
                             </div>
                        </div> 
                        <div class="form-group col-md-6">
                            {if $form->hasErrors()}<div class="alert alert-{if $form.topic.color->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.topic.color->getError()}</div>{/if}
                            <label for="color" class="d-block">{__('Color')}{if $form->topic.color->getOption('required')}*{/if}</label>            
                            <input class="CustomerAcademyTopic form-control Fields Input Color General input-color" topic="text" value="{$item_i18n->getTopic()->get('color')}" name="color" id="color"/>
                        </div>
                   </div>
                    <div class="row">
                        <div class="form-group col-md-12">
                            {if $form->hasErrors()}<div class="alert alert-{if $form.topic_i18n.title->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.topic_i18n.title->getError()}</div>{/if}
                            <label for="title">{__('Title')}{if $form->topic_i18n.title->getOption('required')}*{/if}</label>            
                            <div class="field_with_errors"><input class="CustomerAcademyTopicI18n form-control Fields Input" topic="text" value="{$item_i18n->get('title')}" name="title" id="title"></div>
                        </div>
                    </div>
                </div>
        </div>
          
          
          
          
          
        {*<div class="row">          
            <div class="form-group col-md-6">             
               <span>{__("Name")}</span>
               <div id="error_name" class="error-form">{$form.topic.name->getError()}</div>  
               <input topic="text" class="CustomerAcademyTopic  form-control Fields Input " name="name" size="48" id="name" value="{$item_i18n->getTopic()->get('name')}"/> 
          </div>   
            <div class="form-group col-md-6">              
            <span>{__("Title")}</span>{if $form->topic_i18n.title->getOption('required')}*{/if}
               <div id="error_value" class="error-form">{$form.topic_i18n.title->getError()}</div>
               <input topic="text" class="CustomerAcademyTopicI18n form-control Fields Input " name="title" size="40" id="title" value="{$item_i18n->get('title')}"/>    
                
            
         </div>  
        </div>*}
            {* <div class="row">   
     
               <div class="form-group col-md-6">
                  <span>{__("Color")}</span>
                  <div id="error_value" class="error-form">{$form.topic.color->getError()}</div>
                  <input topic="text" class="CustomerAcademyTopic Input Color input-color" name="color" value="{$item_i18n->getTopic()->get('color')}"/>    
                  {if $form->topic.color->getOption('required')}*{/if}       
              </div> 
               <div class="form-group col-md-6"> 
                  <span>{__("Icon")}</span>
                  {if $item_i18n->isLoaded()}
                   <div id="CustomerAcademyTopic-error-icon"></div>                  
                   <div id="CustomerAcademyTopic-icon-container" {if !$item_i18n->getTopic()->hasIcon()}style="display:none"{/if}>
                       <img id="CustomerAcademyTopic-icon-img" {if $item_i18n->getTopic()->hasIcon()}src="{$item_i18n->getTopic()->getIcon()->getURL('superadmin')}"{/if} height="32" width="32" alt="{__('icon')}"/>
                       <span id="CustomerAcademyTopic-icon-filename">{$item_i18n->getTopic()->hasIcon()}</span>
                       <a href="#" title="{__('Delete')}" id="CustomerAcademyTopic-DeleteIcon" name="{$item_i18n->getTopic()->get('id')}">
                           <i class="fa fa-remove"></i>
                       </a>
                   </div>
                        <a id="CustomerAcademyTopic-ChangeIcon" href="#"><i class="fa fa-plus" style=" margin-right: 10px;"></i>
                           <span id="CustomerAcademyTopic-text-icon">
                                {if $item_i18n->getTopic()->hasIcon()}{__('Change icon')}{else}{__('Add icon')}{/if}
                           </span>
                        </a>
                   <div id="CustomerAcademyTopic-icon" style="display:none">
                       {* <input class="Files" topic="file" name="CustomerAcademyTopicI18n[function][icon]"/>*} 
                       {*<div class="input-group">
                      <span class="input-group-btn">
                        <span class="btn btn-default btn-file bg-primary">
                            <a href="#" id="item_file_browse" class="file-btn">{__('Browse…')}</a><input topic="file" class="Files Fields" style="display:none" name="CustomerAcademyTopicI18n[function][icon]" id="item_file">
                        </span>
                              </span>
                              <input topic="text" id="item_file_name" class="form-control" readonly="" value="">
                      </div>
                   </div>
                  {else}
                     <div id="CustomerAcademyTopic-error-icon" class="error-form">{$form.topic.icon->getError()}</div>     
                     {*<input class="files" topic="file" name="CustomerAcademyTopicI18n[function][icon]"/>*} 
                      {*if $form->topic.icon->getOption('required')}*{/if} 
                      <div class="input-group">
                      <span class="input-group-btn">
                        <span class="btn btn-default btn-file bg-primary">
                            <a href="#" id="item_file_browse" class="file-btn">{__('Browse…')}</a><input topic="file" class="Files Fields" style="display:none" name="CustomerAcademyTopicI18n[function][icon]" id="item_file">
                        </span>
                              </span>
                              <input topic="text" id="item_file_name" class="form-control" readonly="" value="">
                      </div>
                  {/if}         

               </div>                    
        </div>*}           
    </div>          
</div>
<script topic="text/javascript">
    
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
    
       $("#CustomerAcademyTopic-ChangeIcon").click(function() {
           $("#CustomerAcademyTopic-icon").show();
           $(this).hide();
           $("#Save").show();  
        });           
      
       $('#CustomerAcademyTopic-DeleteIcon').click(function(){ 
            if (!confirm("{__("Icon will be deleted. Confirm ?")}")) return false; 
            return $.ajax2({ 
                              data : { CustomerAcademyTopic: "{$item_i18n->getTopic()->get('id')}" }, 
                              url: "{url_to('customers_academy_ajax',['action'=>'DeleteIconContractTopic'])}",                              
                              success :function(response) {
                                          if (response.action=='DeleteIconContractTopic' && response.id=="{$item_i18n->getTopic()->get('id')}")
                                          {                                                     
                                                $("#CustomerAcademyTopic-icon-container").hide(); 
                                                $("span#CustomerAcademyTopic-text-icon").html("{__('Add icon')}");
                                          }
                              }
            });  
      }); 
      
    $(".CustomerAcademyTopic,.CustomerAcademyTopicI18n").click(function() {  $('#Save').show(); });  
            
     $('#Cancel').click(function() {                
             return $.ajax2({ data : { CustomerCourseCategoryNode : { node: '{$item_i18n->getTopic()->get('category_id')}', 
                                             lang : '{$item_i18n->get('lang')}', 
                                             token : '{mfForm::getToken('CustomerCourseCategoryNodeForm')}' } },                                 
                              url : "{url_to('customers_academy_ajax',['action'=>'ListPartialTopicForCategoryI18n'])}",                                                 
                              target: "#actions"}); 
      });
     
        
      $('#Save').click(function(){                             
            var  params= {      iFrame:true,             
                                CustomerAcademyTopicI18n: { 
                                   topic_i18n : { lang: '{$item_i18n->get('lang')}', topic_id : '{$item_i18n->get('topic_id')}' },
                                   topic : { },
                                   token :'{$form->getCSRFToken()}'
                                } };
          $(".CustomerAcademyTopicI18n.Input").each(function() { params.CustomerAcademyTopicI18n.topic_i18n[$(this).attr('name')]=$(this).val(); });
          $(".CustomerAcademyTopic.Input").each(function() {  params.CustomerAcademyTopicI18n.topic[$(this).attr('name')]=$(this).val();  });  // Get foreign key  
        //      alert("Params="+params.toSource());   return ;      
          return $.ajax2({ data : params,  
                           files :'.Files',
                           url: "{url_to('customers_academy_ajax',['action'=>'SaveTopicI18nForCategoryI18n'])}",
                           target: "#actions"}); 
        });                          
</script>
{else}
    {__('Topic is invalid.')}
{/if}    