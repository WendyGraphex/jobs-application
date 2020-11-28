
<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__("View  State")}</h3>
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
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('View State')}
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
            <div class="form-group col-md-6">             
               <span>{__("Name")}</span>
               <div id="error_name" class="error-form">{$form.state.name->getError()}</div>  
               <input type="text" class="BillingState  form-control Fields Input " name="name" size="48" id="name" value="{$item_i18n->getState()->get('name')}"/> 
          </div>   
            <div class="form-group col-md-6">              
            <span>{__("Title")}</span>{if $form->state_i18n.title->getOption('required')}*{/if}
               <div id="error_value" class="error-form">{$form.state_i18n.title->getError()}</div>
               <input type="text" class="BillingStateI18n form-control Fields Input " name="title" size="40" id="title" value="{$item_i18n->get('title')}"/>    
                
            
         </div>  
        </div>
             <div class="row">   
     
               <div class="form-group col-md-6">
                  <span>{__("Color")}</span>
                  <div id="error_value" class="error-form">{$form.state.color->getError()}</div>
                  <input type="text" class="BillingState Input Color input-color" name="color" value="{$item_i18n->getState()->get('color')}"/>    
                  {if $form->state.color->getOption('required')}*{/if}       
              </div> 
               <div class="form-group col-md-6"> 
                  <span>{__("Icon")}</span>
                  {if $item_i18n->isLoaded()}
                   <div id="BillingState-error-icon"></div>                  
                   <div id="BillingState-icon-container" {if !$item_i18n->getState()->hasIcon()}style="display:none"{/if}>
                       <img id="BillingState-icon-img" {if $item_i18n->getState()->hasIcon()}src="{$item_i18n->getState()->getIcon()->getURL('superadmin')}"{/if} height="32" width="32" alt="{__('icon')}"/>
                       <span id="BillingState-icon-filename">{$item_i18n->getState()->hasIcon()}</span>
                       <a href="#" title="{__('Delete')}" id="BillingState-DeleteIcon" name="{$item_i18n->getState()->get('id')}">
                           <i class="fa fa-remove"></i>
                       </a>
                   </div>
                        <a id="BillingState-ChangeIcon" href="#"><i class="fa fa-plus" style=" margin-right: 10px;"></i>
                           <span id="BillingState-text-icon">
                                {if $item_i18n->getState()->hasIcon()}{__('Change icon')}{else}{__('Add icon')}{/if}
                           </span>
                        </a>
                   <div id="BillingState-icon" style="display:none">
                       {* <input class="Files" type="file" name="BillingStateI18n[state][icon]"/>*} 
                       <div class="input-group">
                      <span class="input-group-btn">
                        <span class="btn btn-default btn-file bg-primary">
                            <a href="#" id="item_file_browse" class="file-btn">{__('Browse…')}</a><input type="file" class="Files Fields" style="display:none" name="BillingStateI18n[state][icon]" id="item_file">
                        </span>
                              </span>
                              <input type="text" id="item_file_name" class="form-control" readonly="" value="">
                      </div>
                   </div>
                  {else}
                     <div id="BillingState-error-icon" class="error-form">{$form.state.icon->getError()}</div>     
                     {*<input class="files" type="file" name="BillingStateI18n[state][icon]"/>*} 
                      {if $form->state.icon->getOption('required')}*{/if} 
                      <div class="input-group">
                      <span class="input-group-btn">
                        <span class="btn btn-default btn-file bg-primary">
                            <a href="#" id="item_file_browse" class="file-btn">{__('Browse…')}</a><input type="file" class="Files Fields" style="display:none" name="BillingStateI18n[state][icon]" id="item_file">
                        </span>
                              </span>
                              <input type="text" id="item_file_name" class="form-control" readonly="" value="">
                      </div>
                  {/if}         

               </div>                    
        </div>           
    </div>          
</div>
<script type="text/javascript">              
   $(".Color").minicolors({
      // position: relative,
       position: 'bottom right',
       control: 'hue', 
       inline: false
   });  
    $("#item_file_browse").click(function () { $("#item_file").click(); }); 
       $("#item_file").change(function (e) { $("#item_file_name").val(e.target.files[0].name);$("#item_file_name").addClass("active-file");  });
 
       $("#BillingState-ChangeIcon").click(function() {
           $("#BillingState-icon").show();
           $(this).hide();
           $("#Save").show();  
        });           
      
       $('#BillingState-DeleteIcon').click(function(){ 
            if (!confirm("{__("Icon will be deleted. Confirm ?")}")) return false; 
            return $.ajax2({ 
                              data : { QuotationState: "{$item_i18n->getState()->get('id')}" }, 
                              url: "{url_to('sales_quotation_ajax',['action'=>'DeleteIconState'])}",                              
                              success :function(response) {
                                          if (response.action=='DeleteIconState' && response.id=="{$item_i18n->getState()->get('id')}")
                                          {                                                     
                                                $("#BillingState-icon-container").hide(); 
                                                $("span#BillingState-text-icon").html("{__('Add icon')}");
                                          }
                              }
            });  
      }); 
      
    $(".BillingState,.BillingStateI18n").click(function() {  $('#Save').show(); });  
         
     {* =================== L A N G U A G E ================================ *}
        
     {* =================== A C T I O N S ================================ *}
     $('#Cancel').click(function(){                
             return $.ajax2({ data: { filter: { lang:  '{$item_i18n->get('lang')}', token: "{mfForm::getToken('BillingStateFormFilter')}" } },                              
                              url : "{url_to('sales_quotation_ajax',['action'=>'ListPartialState'])}",                                                 
                              target: "#actions"}); 
      });
     
        
      $('#Save').click(function(){                             
            var  params= {      iFrame:true,             
                                BillingStateI18n: { 
                                   state_i18n : { lang: '{$item_i18n->get('lang')}', state_id : '{$item_i18n->get('state_id')}' },
                                   state : { },
                                   token :'{$form->getCSRFToken()}'
                                } };
          $(".BillingStateI18n.Input").each(function() { params.BillingStateI18n.state_i18n[$(this).attr('name')]=$(this).val(); });
          $(".BillingState.Input").each(function() {  params.BillingStateI18n.state[$(this).attr('name')]=$(this).val();  });  // Get foreign key  
        //      alert("Params="+params.toSource());   return ;      
          return $.ajax2({ data : params,  
                           files :'.Files',
                           url: "{url_to('sales_quotation_ajax',['action'=>'SaveStateI18n'])}",
                           target: "#actions"}); 
        });                          
</script>
