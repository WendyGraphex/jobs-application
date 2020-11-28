
<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__("View City")}</h3>
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
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('View City')}
    </p>
</div>
{alerts}
<div class="tablewhiteback" style="padding: 20px;">    
     <div class="the-box bg-white p-3">    
          {*<div class="row">
           <div class="form-group col-md-12">          
            <img id="{$item_i18n->get('lang')}" name="lang" src="{url("/flags/`$item_i18n->get('lang')`.png","picture")}" title="{format_country($item_i18n->get('lang'))}" />       
          </div>          
         </div>*}
         <div class="row">
          <div class="form-group col-md-12">          
            <div>{$form.city_i18n.lang->getError()}</div> 
            {component name="/site_languages/selectListLanguagesFrontend" selected=$form.city_i18n.lang}
          </div>          
        </div>
{*=================================================================================================================================================================*}
<div class="row">
            <div class="col-md-2">
                <div>
                    <div class="form-group">
                        <label>{__('Icon')}</label>                  
                            <div id="pictureForm">                            
                                <div class="custom-FileInput">
                                    {if $item_i18n->getCity()->hasIcon()}
                                        <img id="blah" alt="" style="" {*if $item_i18n->getCity()->hasIcon()*} src="{$item_i18n->getCity()->getIcon()->getURL('superadmin')}"{*/if*} /><br/>
                                        {else}
                                             <img id="blah" alt="" style="display: none;" /><br/>
                                    {/if}
                                </div>
                                <a id="pictureAdd" href="#" class="btn btn-default"><i class="fa fa-plus" style="margin-right:10px;"></i>{__('Change Icon')}</a>
                                <input id="item_file" type='file' hidden="" class="Files" name="SiteCityI18n[city][icon]" />
                            </div>
                    </div>
                </div> 
            </div>
            <div class="col-md-10">
                <div class="row">
                    <div class="form-group col-md-6">             
                        <span>{__("Name")}</span>
                        <div id="error_name" class="error-form">{$form.city.name->getError()}</div>  
                        <input city="text" class="SiteCity  form-control Fields Input " name="name" size="48" id="name" value="{$item_i18n->getCity()->get('name')}"/> 
                    </div>
                    <div class="form-group col-md-6">
                        <span>{__('Country')}</span>
                         {if $form.city.country_id->hasError()}<div>{$form.city.country_id->getError()}&nbsp;</div>{/if}
                         {html_options id="country_id"  class="form-control form-control-chosen Fields Select SiteCity"  options=$form->city.country_id->getChoices()->toArray() name="country_id" selected=$item_i18n->getCity()->get('country_id')}
                         {*select_country class="form-control form-control-chosen Fields Select SiteCity" name="country_id" id="country_id" options=$form->city.country_id->getOption('choices') selected=$item_i18n->getCity()->get('country_id')*}
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">              
                        <span>{__("Title")}</span>{if $form->city_i18n.title->getOption('required')}*{/if}
                        <div id="error_value" class="error-form">{$form.city_i18n.title->getError()}</div>
                        <input city="text" class="SiteCityI18n form-control Fields Input " name="title" size="40" id="title" value="{$item_i18n->get('title')}"/>
                    </div>
                    <div class="form-group col-md-6">
                        <span>{__("Color")}</span>
                        <div id="error_value" class="error-form">{$form.city.color->getError()}</div>
                        <input city="text" class="SiteCity Input Color input-color" name="color" value="{$item_i18n->getCity()->get('color')}"/>    
                        {if $form->city.color->getOption('required')}*{/if}       
                    </div>
            </div>
                    
</div>
                                



       {* <div class="row">          
            <div class="form-group col-md-4">             
               <span>{__("Name")}</span>
               <div id="error_name" class="error-form">{$form.city.name->getError()}</div>  
               <input city="text" class="SiteCity  form-control Fields Input " name="name" size="48" id="name" value="{$item_i18n->getCity()->get('name')}"/> 
          </div>  
            <div class="form-group col-md-4">
                 <span>{__('Country')}</span>
                  {if $form.city.country_id->hasError()}<div>{$form.city.country_id->getError()}&nbsp;</div>{/if}
                  {html_options id="country_id"  class="form-control form-control-chosen Fields Select SiteCity"  options=$form->city.country_id->getChoices()->toArray() name="country_id" selected=$item_i18n->getCity()->get('country_id')}      
            </div>
            <div class="form-group col-md-4">              
            <span>{__("Title")}</span>{if $form->city_i18n.title->getOption('required')}*{/if}
               <div id="error_value" class="error-form">{$form.city_i18n.title->getError()}</div>
               <input city="text" class="SiteCityI18n form-control Fields Input " name="title" size="40" id="title" value="{$item_i18n->get('title')}"/>    
                
            
         </div>  
        </div>
             <div class="row">   
     
               <div class="form-group col-md-6">
                  <span>{__("Color")}</span>
                  <div id="error_value" class="error-form">{$form.city.color->getError()}</div>
                  <input city="text" class="SiteCity Input Color input-color" name="color" value="{$item_i18n->getCity()->get('color')}"/>    
                  {if $form->city.color->getOption('required')}*{/if}       
              </div> 
               <div class="form-group col-md-6"> 
                  <span>{__("Icon")}</span>
                  {if $item_i18n->isLoaded()}
                   <div id="SiteCity-error-icon"></div>                  
                   <div id="SiteCity-icon-container" {if !$item_i18n->getCity()->hasIcon()}style="display:none"{/if}>
                       <img id="SiteCity-icon-img" {if $item_i18n->getCity()->hasIcon()}src="{$item_i18n->getCity()->getIcon()->getURL('superadmin')}"{/if} height="32" width="32" alt="{__('icon')}"/>
                       <span id="SiteCity-icon-filename">{$item_i18n->getCity()->hasIcon()}</span>
                       <a href="#" title="{__('Delete')}" id="SiteCity-DeleteIcon" name="{$item_i18n->getCity()->get('id')}">
                           <i class="fa fa-remove"></i>
                       </a>
                   </div>
                        <a id="SiteCity-ChangeIcon" href="#"><i class="fa fa-plus" style=" margin-right: 10px;"></i>
                           <span id="SiteCity-text-icon">
                                {if $item_i18n->getCity()->hasIcon()}{__('Change icon')}{else}{__('Add icon')}{/if}
                           </span>
                        </a>
                   <div id="SiteCity-icon" style="display:none">
                       {* <input class="Files" city="file" name="SiteCityI18n[function][icon]"/>*} 
                       {*<div class="input-group">
                      <span class="input-group-btn">
                        <span class="btn btn-default btn-file bg-primary">
                            <a href="#" id="item_file_browse" class="file-btn">{__('Browse…')}</a><input city="file" class="Files Fields" style="display:none" name="SiteCityI18n[function][icon]" id="item_file">
                        </span>
                              </span>
                              <input city="text" id="item_file_name" class="form-control" readonly="" value="">
                      </div>
                   </div>*}
                  {*else}
                     <div id="SiteCity-error-icon" class="error-form">{$form.city.icon->getError()}</div>     
                     {*<input class="files" city="file" name="SiteCityI18n[function][icon]"/>*} 
                      {*if $form->city.icon->getOption('required')}*{/if} 
                      <div class="input-group">
                      <span class="input-group-btn">
                        <span class="btn btn-default btn-file bg-primary">
                            <a href="#" id="item_file_browse" class="file-btn">{__('Browse…')}</a><input city="file" class="Files Fields" style="display:none" name="SiteCityI18n[function][icon]" id="item_file">
                        </span>
                              </span>
                              <input city="text" id="item_file_name" class="form-control" readonly="" value="">
                      </div>
                  {/if}         

               </div>                    
        </div>*}
                  
          </div>          
    </div>          
</div>
<script city="text/javascript"> 
    
    
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
    
       $("#SiteCity-ChangeIcon").click(function() {
           $("#SiteCity-icon").show();
           $(this).hide();
           $("#Save").show();  
        });           
      
       $('#SiteCity-DeleteIcon').click(function(){ 
            if (!confirm("{__("Icon will be deleted. Confirm ?")}")) return false; 
            return $.ajax2({ 
                              data : { SiteCity: "{$item_i18n->getCity()->get('id')}" }, 
                              url: "{url_to('site_city_ajax',['action'=>'DeleteIconCity'])}",                              
                              success :function(response) {
                                          if (response.action=='DeleteIconCity' && response.id=="{$item_i18n->getCity()->get('id')}")
                                          {                                                     
                                                $("#SiteCity-icon-container").hide(); 
                                                $("span#SiteCity-text-icon").html("{__('Add icon')}");
                                          }
                              }
            });  
      }); 
      
    $(".SiteCity,.SiteCityI18n").click(function() {  $('#Save').show(); });  
         
     {* =================== L A N G U A G E ================================ *}
        
     {* =================== A C T I O N S ================================ *}
     $('#Cancel').click(function(){                
             return $.ajax2({ data: { filter: { lang:  '{$item_i18n->get('lang')}', token: "{mfForm::getToken('SiteCityFormFilter')}" } },                              
                              url : "{url_to('site_city_ajax',['action'=>'ListPartialCity'])}",                                                 
                              target: "#actions"}); 
      });
     
        
      $('#Save').click(function(){                             
            var  params= {      iFrame:true,             
                                SiteCityI18n: { 
                                   city_i18n : { lang: '{$item_i18n->get('lang')}', city_id : '{$item_i18n->get('city_id')}' },
                                   city : { },
                                   token :'{$form->getCSRFToken()}'
                                } };
          $(".SiteCityI18n.Input").each(function() { params.SiteCityI18n.city_i18n[$(this).attr('name')]=$(this).val(); });
          $(".SiteCity.Input").each(function() {  params.SiteCityI18n.city[$(this).attr('name')]=$(this).val();  });  // Get foreign key  
          $(".SiteCity.Select option:selected").each(function() { params.SiteCityI18n.city[$(this).parent().attr('name')]=$(this).val(); });
        //      alert("Params="+params.toSource());   return ;      
          return $.ajax2({ data : params,  
                           files :'.Files',
                           url: "{url_to('site_city_ajax',['action'=>'SaveCityI18n'])}",
                           target: "#actions"}); 
        });                          
</script>
