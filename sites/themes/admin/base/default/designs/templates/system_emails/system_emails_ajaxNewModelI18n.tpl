{messages}
<h3>{__("New model")}</h3>

<div>
    <a href="#" class="btn btn-primary" id="Save">
        <i class="fa fa-floppy-o" style="margin-right:10px;"></i>
        {__('Save')}</a>
    <a href="#" class="btn btn-primary" id="Cancel">
        <i class="fa fa-times" style="margin-right:10px;"></i>
      {__('Cancel')}</a>
</div>
{component name="/site_languages/dialogListLanguagesFrontend" selected=(string)$form.model_i18n.lang}   
<table class="tab-form" cellpadding="0" cellspacing="0">
    <tr class="full-with">
        <td></td>
        <td>
            <div class="error_form">{$form.model_i18n.lang->getError()}</div>      
            <img class="SystemModelEmailI18n" id="{$form.model_i18n.lang}" name="lang" src="{url("/flags/`$form.model_i18n.lang`.png","picture")}" title="{if !$form.model_i18n.lang->getError()}{format_country($form.model_i18n.lang)}{/if}" />
            <a id="SystemModelEmail-ChangeLang" href="#" title="{__('change')}"><img  src="{url('/icons/edit.gif','picture')}" alt='{__("language")}'/></a> 
        </td>
    </tr> 
    <tr class="full-with">
        <td class="label"><span>{__("Name")}</span></td>
        <td>
             <div class="error_form">{$form.model.name->getError()}</div>               
             <input type="text" class="SystemModelEmail" size="64" name="name" value="{$item_i18n->getModel()->get('name')}"/> 
        </td>
    </tr>     
       <tr class="full-with">
         <td class="label"><span>{__("Value")}</span></td>
         <td>
            <div id="error_pages" class="error_form">{$form.model_i18n.value->getError()}</div>
            <input type="text"  class="SystemModelEmailI18n" size="64" name="value" value="{$item_i18n->get('value')}"/>    
            {if $form->model_i18n.value->getOption('required')}*{/if} 
         </td>
    </tr>  
       <tr class="full-with">
         <td class="label"><span>{__("Subject")}</span></td>
         <td>
            <div id="error_pages" class="error_form">{$form.model_i18n.subject->getError()}</div>
            <input type="text"  class="SystemModelEmailI18n" size="64" name="subject" value="{$item_i18n->get('subject')}"/>    
            {if $form->model_i18n.subject->getOption('required')}*{/if} 
         </td>
    </tr>  
    <tr class="body-email content" >
         <td class="label"><span>{__("Body")}</span></td>
         <td class="editor-body">
             <div id="error_pages" class="error_form">{$form.model_i18n.body->getError()}</div>
            <textarea  class="SystemModelEmailI18n editor" rows="20" cols="80" name="body">{$item_i18n->get('body')}</textarea>    
            {if $form->model_i18n.body->getOption('required')}*{/if} 
         </td>
    </tr>      
</table> 

<script type="text/javascript">
     
     {* =================== F I E L D S ================================ *}
     $(".SystemModelEmail,.SystemModelEmailI18n").click(function() {  $('#Save').show(); });    
        
         
     {* =================== L A N G U A G E ================================ *}
         $( "#SystemModelEmail-ChangeLang").click(function() {
            $("#Save").show();
            $("#dialogListLanguages").dialog("open");
         });  
         
         $("#dialogListLanguages").bind('select',function(event){                    
            $(".SystemModelEmailI18n[name=lang]").attr({
                                  id: event.selected.id,
                                  src: '{url("/flags/","picture")}'+event.selected.id+'.png',
                                  title: event.selected.lang
                                  });         
         }); 
     
     
     {* =================== A C T I O N S ================================ *}
     $('#Cancel').click(function(){   
             $(".dialogs").dialog("destroy").remove(); 
             return $.ajax2({ data: { filter: { lang:$("img.SystemModelEmailI18n").attr('id'), token: "{mfForm::getToken('SystemEmailModelsFormFilter')}" } },                              
                              url : "{url_to('system_emails_ajax',['action'=>'ListPartialModel'])}",                                                
                              target: "#actions"}); 
      });
      
      $('#Save').click(function(){                             
            var  params= {         
                                SystemModelEmail: { 
                                   model_i18n : { lang: $(".SystemModelEmailI18n[name=lang]").attr('id')  },
                                   model : { },
                                   token :'{$form->getCSRFToken()}'
                                } };
          $("input.SystemModelEmailI18n,textarea.SystemModelEmailI18n").each(function() { params.SystemModelEmail.model_i18n[this.name]=$(this).val(); });
          $("input.SystemModelEmail").each(function() {  params.SystemModelEmail.model[this.name]=$(this).val();  });  // Get foreign key  
        //      alert("Params="+params.toSource());   return ;
          $(".dialogs").dialog("destroy").remove(); 
          return $.ajax2({ data : params,                        
                           url: "{url_to('system_emails_ajax',['action'=>'SaveNewModelI18n'])}",                        
                           target: "#actions"}); 
        });           

     $('.SystemModelEmailI18n[name=body]').ckeditor({               
        toolbar: [
             
            { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ], items: [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat' ] },             
            { name: 'document', groups: [ 'mode', 'document', 'doctools' ], items: [ 'Source' ] },
            { name: 'colors', items : [ 'TextColor','BGColor' ] }
                ],
        toolbarGroups: [
            { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
        ]
    }); 
  
</script>


   