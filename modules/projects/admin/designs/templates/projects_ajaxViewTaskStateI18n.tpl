{messages}
<h3>{__("View Task state")}</h3>
<div>
    <a href="#" id="State-Save" class="btn btn-primary"><i class="fa fa-floppy-o"></i>{__('Save')}</a>
    <a href="#" id="State-Cancel" class="btn btn-primary"><i class="fa fa-times"></i>{__('Cancel')}</a>
</div>
<table class="tab-form">
    <tr>
        <td class="label">{__('id')}</td>
        <td>{if $item_i18n->isLoaded()} 
            <span>{$item_i18n->get('id')}</span>  
            {else}
             <span>{__('New')}</span>  
            {/if} 
        </td>
    </tr>
    <tr>
        <td></td>
        <td><img id="{$item_i18n->get('lang')}" name="lang" src="{url("/flags/`$item_i18n->get('lang')`.png","picture")}" title="{format_country($item_i18n->get('lang'))}" />       
        </td>
    </tr>
     <tr>
        <td class="label"><span>{__("name")}</span>
        </td>
        <td><div id="State-error_name" class="error-form">{$form.state.name->getError()}</div>  
            <input type="text" class="State" name="name" size="48" value="{$item_i18n->getState()->get('name')}"/> 
        </td>
    </tr>     
      <tr>
        <td class="label"><span>{__("color")}</span></td>
        <td>
             <div class="error-form">{$form.state.color->getError()}</div>               
             <input type="text" size="20" class="State" name="color" value="{$item_i18n->getState()->get('color')}"/> 
        </td>
    </tr>
    <tr>
        <td class="label"><span>{__("icon")}</span></td>
        <td>          
            {if $item_i18n->isLoaded()}
                <div id="State-error_icon"></div>                  
                <div id="State-icon_container" {if !$item_i18n->getState()->get('icon')}style="display:none"{/if}>
                    <img id="State-icon_img" {if $item_i18n->getState()->get('icon')}src="{$item_i18n->getState()->getIcon()->getURL('superadmin')}"{/if} height="32" width="32" alt="{__('icon')}"/>
                    <span id="State-icon_filename">{$item_i18n->getState()->get("icon")}</span>
                    <a href="#" title="{__('delete')}" id="State-DeleteIcon" name="{$item_i18n->getState()->get('id')}">
                       <img  src="{url('/icons/delete.gif','picture')}" alt='{__("Delete")}'/>
                    </a>
                </div>
                       <a id="State-ChangeIcon" href="#"><i class="fa fa-plus" style=" margin-right: 10px;"></i>
                     <span id="State-text_icon">
                         {if $item_i18n->getState()->get("icon")} {__('Change icon')} {else} {__('Add icon')} {/if}
                     </span>
                </a>
                <div id="State-icon" style="display:none">
                     <input class="State-fileIcon" type="file" name="RecruitmentCampaignEmailStateI18n[icon]"/> 
                     <a href="#" id="State-uploadIcon"><img id="State-uploadIcon" src="{url('/icons/upload.png','picture')}" alt="{__('upload')|capitalize}"></a>
                     <img id="State-iconLoading" height="16" width="16" src="{url('/icons/loading.gif','picture')}" alt="" style="display:none;"> 
                </div>
            {else}
                <div id="State-error_icon" class="error-form">{$form.state.icon->getError()}</div>     
                <input class="files" type="file" name="State[state][icon]"/> 
                {if $form->state.icon->getOption('required')}*{/if}    
            {/if}               
            </td>         
    </tr>         
    <tr>
         <td class="label"><span>{__("value")}</span></td>
         <td>
            <div id="State-error_value" class="error-form">{$form.state_i18n.value->getError()}</div>
            <input type="text" class="StateI18n" name="value" size="40" value="{$item_i18n->get('value')}"/>    
            {if $form->state_i18n.value->getOption('required')}*{/if} 
         </td>
    </tr>   
</table>
<script type="text/javascript">
     $(".State[name=color]").minicolors();
      {* =================== F I L E S ================================ *}
      
        
         {* begin icon *} 
        $("#State-ChangeIcon").click(function() {
          $("#State-icon").show();
          $(this).hide();
           $("#State-Save").show();  
        });
     
        $('#State-uploadIcon').click(function(){ 
            return $.ajax2({ 
                loading:"#State-iconLoading",                    
                data : { State: { 
                                   id: "{$item_i18n->get('id')}",
                                   token :"{mfForm::getToken('StateIconForm')}"
                                } },
                url:"{url_to('projects_ajax',['action'=>'SaveIconTaskStateI18n'])}",               
                files: ".State-fileIcon",
                complete: function()
                          {
                              $(".State-fileIcon").val('');       
                          },
                success: function(response)
                         {
                              if (response.icon)
                              {    
                                   $("#State-icon_img").attr('src',"{$item_i18n->getState()->getIcon()->getURLPath('superadmin')}"+response.icon+"?"+$.now()); 
                                   $("#State-icon_filename").html(response.icon);
                                   $("#State-icon_container").show();

                                   $("#State-icon").hide(); 
                                   $("span#State-text_icon").html("{__('Change icon')}");
                                   $("#State-ChangeIcon").show();
                              }  
                         }
               }); 
      }); 
      
       $('#State-DeleteIcon').click(function(){ 
            if (!confirm("{__("Icon will be deleted. Confirm ?")}")) return false; 
            return $.ajax2({ 
                              data : { State: "{$item_i18n->get('id')}" }, 
                              url: "{url_to('projects_ajax',['action'=>'DeleteIconTaskState'])}",                             
                              success :function(response) {
                                          if (response.action=='DeleteIconTaskState' && response.id=="{$item_i18n->getState()->get('id')}")
                                          {                                                     
                                                $("#State-icon_container").hide(); 
                                                $("span#State-text_icon").html("{__('Add icon')}");
                                          }
                              }
            });  
      }); 
      {* end icon *}

     
     
     {* =================== F I E L D S ================================ *}
     $(".State,.StateI18n").click(function() {  $('#State-Save').show(); });    
    
     $("#State-ChangeIcon").click(function() {
        $("#State-icon").show();
        $(this).hide();
      });
      
     
    
     {* =================== A C T I O N S ================================ *}
     $('#State-Cancel').click(function(){                           
             return $.ajax2({ data: { filter: { lang:"{$item_i18n->get('lang')}", token: "{mfForm::getToken('ProjectTaskStateFormFilter')}" } },                              
                              url : "{url_to('projects_ajax',['action'=>'ListPartialTaskState'])}",                                                    
                              target: "#actions" }); 
      });
      
      $('#State-Save').click(function(){                             
            var  params= {            
                                ProjectTaskStateI18n: { 
                                   state_i18n : { lang: "{$item_i18n->get('lang')}",state_id: "{$item_i18n->get('state_id')}"    },
                                   state : { },
                                   token :'{$form->getCSRFToken()}'
                                } };
          $("input.StateI18n").each(function() { params.ProjectTaskStateI18n.state_i18n[this.name]=$(this).val(); });
          $("input.State").each(function() {  params.ProjectTaskStateI18n.state[this.name]=$(this).val();  });  // Get foreign key  
          //    alert("Params="+params.toSource());   return ;       
          return $.ajax2({ data : params,  
                           files: ".State-files",                   
                           url: "{url_to('projects_ajax',['action'=>'SaveTaskStateI18n'])}",
                           target: "#actions" }); 
        });  
     
</script>