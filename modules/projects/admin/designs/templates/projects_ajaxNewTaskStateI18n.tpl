{messages}
<h3>{__("New task state")}</h3>
<div>
    <a href="#" id="State-Save" class="btn btn-primary"><i class="fa fa-floppy-o"></i>{__('Save')}</a>
    <a href="#" id="State-Cancel" class="btn btn-primary"><i class="fa fa-times"></i>{__('Cancel')}</a>
</div>
<style> .ui-dialog { font-size: 62.5%; }</style> 
{component name="/site_languages/dialogListLanguagesAdmin" selected=(string)$form.state_i18n.lang}   
<table class="tab-form" cellpadding="0" cellspacing="0">
    <tr>
        <td></td>
        <td>
            <div class="error-form">{$form.state_i18n.lang->getError()}</div>      
            <img class="StateI18n" id="{$form.state_i18n.lang}" name="lang" src="{url("/flags/`$form.state_i18n.lang`.png","picture")}" title="{if !$form.state_i18n.lang->getError()}{format_country($form.state_i18n.lang)}{/if}" />
            <a id="State-ChangeLang" href="#" title="{__('change')}"><img  src="{url('/icons/edit.gif','picture')}" alt='{__("language")}'/></a> 
        </td>
    </tr> 
    <tr>
        <td class="label"><span>{__("Name")}</span></td>
        <td>
             <div>{$form.state.name->getError()}</div>               
             <input type="text" size="20" class="State" name="name" value="{$item_i18n->getState()->get('name')}"/> 
        </td>
    </tr>  
     <tr>
        <td class="label"><span>{__("Color")}</span></td>
        <td>
             <div class="error-form">{$form.state.color->getError()}</div>               
             <input type="text" size="20" class="State" name="color" value="{$item_i18n->getState()->get('color')}"/> 
        </td>
    </tr> 
    <tr>
        <td class="label"><span>{__("Icon")}</span></td>
        <td>                       
            <div id="error_icon" class="error-form">{$form.state.icon->getError()}</div>                 
            <a id="ChangeIcon" href="#"><i class="fa fa-plus" style="margin-right: 10px;"></i>
               <span id="text_icon">{__('Add picture')}</span>
            </a>
            <div id="icon" style="display:none">
               <div>{__('Max size for picture %s.',format_size($form->state.icon->getOption('max_size')))}</div>
               <input class="State-files" type="file" name="State[state][icon]"/> 
            </div>
            {if $form->state.icon->getOption('required')}*{/if} 
        </td>
    </tr>    
       <tr>
         <td class="label"><span>{__("Value")}</span></td>
         <td>
             <div id="error_pages" class="error-form">{$form.state_i18n.value->getError()}</div>
            <input type="text" size="10" class="StateI18n" name="value" value="{$item_i18n->get('value')}"/>    
            {if $form->state_i18n.value->getOption('required')}*{/if} 
         </td>
    </tr>  
</table>      
<script type="text/javascript">
     $(".State[name=color]").minicolors();
     {* =================== F I E L D S ================================ *}
     $(".State,.StateI18n").click(function() {  $('#State-Save').show(); });    
    
     $(".State-files").change(function() {  $('#State-Save').show(); });   
     
     $("#ChangeIcon").click(function() {
        $("#icon").show();
        $(this).hide();
      });
         
     {* =================== L A N G U A G E ================================ *}
         $( "#State-ChangeLang").click(function() {
            $("#State-Save").show();
            $("#dialogListLanguages").dialog("open");
         });  
         
         $("#dialogListLanguages").bind('select',function(event){                    
            $(".StateI18n[name=lang]").attr({
                                  id: event.selected.id,
                                  src: '{url("/flags/","picture")}'+event.selected.id+'.png',
                                  title: event.selected.lang
                                  });         
         }); 
     
     
     {* =================== A C T I O N S ================================ *}
     $('#State-Cancel').click(function(){              
             return $.ajax2({ data: { filter: { lang:$("img.StateI18n").attr('id'), token: "{mfForm::getToken('ProjectTaskStateFormFilter')}" } },                              
                              url : "{url_to('projects_ajax',['action'=>'ListPartialTaskState'])}",                                              
                              target: "#actions"}); 
      });
      
      $('#State-Save').click(function(){                             
            var  params= {      iFrame:true,             
                               ProjectTaskState: { 
                                   state_i18n : { lang: $(".StateI18n[name=lang]").attr('id')  },
                                   state : { },
                                   token :'{$form->getCSRFToken()}'
                                } };
          $("input.StateI18n").each(function() { params.ProjectTaskState.state_i18n[this.name]=$(this).val(); });
          $("input.State").each(function() {  params.ProjectTaskState.state[this.name]=$(this).val();  });  // Get foreign key  
        //      alert("Params="+params.toSource());   return ;        
          return $.ajax2({ data : params,  
                           files: ".State-files",
                           url: "{url_to('projects_ajax',['action'=>'SaveNewTaskStateI18n'])}",
                           target: "#actions"}); 
        });  
     
</script>
