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
            <img class="SystemModelTextI18n" id="{$form.model_i18n.lang}" name="lang" src="{url("/flags/`$form.model_i18n.lang`.png","picture")}" title="{if !$form.model_i18n.lang->getError()}{format_country($form.model_i18n.lang)}{/if}" />
            <a id="SystemModelText-ChangeLang" href="#" title="{__('change')}"><img  src="{url('/icons/edit.gif','picture')}" alt='{__("language")}'/></a> 
        </td>
    </tr> 
    <tr class="full-with">
        <td class="label"><span>{__("Name")}</span></td>
        <td>
             <div class="error_form">{$form.model.name->getError()}</div>               
             <input type="text" class="SystemModelText" size="64" name="name" value="{$item_i18n->getModel()->get('name')}"/> 
        </td>
    </tr>  
     <tr class="full-with">
        <td class="label"><span>{__("Orientation")}</span></td>
        <td>
             <div class="error_form">{$form.model.orientation->getError()}</div>               
             {html_options class="SystemModelText Select"  options=$form->model.orientation->getChoices() name="orientation" selected=$item_i18n->getModel()->get('orientation')}
        </td>
    </tr>  
      <tr class="full-with">
        <td class="label"><span>{__("Size")}</span></td>
        <td>
             <div class="error_form">{$form.model.size->getError()}</div>               
             {html_options class="SystemModelText Select"  options=$form->model.size->getChoices() name="size" selected=$item_i18n->getModel()->get('size')}
        </td>
    </tr>  
       <tr class="full-with">
         <td class="label"><span>{__("Value")}</span></td>
         <td>
            <div id="error_pages" class="error_form">{$form.model_i18n.value->getError()}</div>
            <input type="text"  class="SystemModelTextI18n" size="64" name="value" value="{$item_i18n->get('value')}"/>    
            {if $form->model_i18n.value->getOption('required')}*{/if} 
         </td>
    </tr>     
    <tr class="body-email content" >
         <td class="label"><span>{__("Text")}</span></td>
         <td class="editor-body">
             <div id="error_pages" class="error_form">{$form.model_i18n.text->getError()}</div>
            <textarea  class="SystemModelTextI18n editor" rows="20" cols="80" name="text">{$item_i18n->get('text')}</textarea>    
            {if $form->model_i18n.text->getOption('required')}*{/if} 
         </td>
    </tr>      
</table> 

<script type="text/javascript">
     
     {* =================== F I E L D S ================================ *}
     $(".SystemModelText,.SystemModelTextI18n").click(function() {  $('#Save').show(); });    
        
         
     {* =================== L A N G U A G E ================================ *}
         $( "#SystemModelText-ChangeLang").click(function() {
            $("#Save").show();
            $("#dialogListLanguages").dialog("open");
         });  
         
         $("#dialogListLanguages").bind('select',function(event){                    
            $(".SystemModelTextI18n[name=lang]").attr({
                                  id: event.selected.id,
                                  src: '{url("/flags/","picture")}'+event.selected.id+'.png',
                                  title: event.selected.lang
                                  });         
         }); 
     
     
     {* =================== A C T I O N S ================================ *}
     $('#Cancel').click(function(){   
             $(".dialogs").dialog("destroy").remove(); 
             return $.ajax2({ data: { filter: { lang:$("img.SystemModelTextI18n").attr('id'), token: "{mfForm::getToken('SystemTextModelsFormFilter')}" } },                              
                              url : "{url_to('system_texts_ajax',['action'=>'ListPartialModel'])}",                                                
                              target: "#actions"}); 
      });
      
      $('#Save').click(function(){                             
            var  params= {         
                                SystemModelText: { 
                                   model_i18n : { lang: $(".SystemModelTextI18n[name=lang]").attr('id')  },
                                   model : { },
                                   token :'{$form->getCSRFToken()}'
                                } };
          $("input.SystemModelTextI18n,textarea.SystemModelTextI18n").each(function() { params.SystemModelText.model_i18n[this.name]=$(this).val(); });
          $("input.SystemModelText").each(function() {  params.SystemModelText.model[this.name]=$(this).val();  });  // Get foreign key  
        //      alert("Params="+params.toSource());   return ;
          $(".dialogs").dialog("destroy").remove(); 
          return $.ajax2({ data : params,                        
                           url: "{url_to('system_texts_ajax',['action'=>'SaveNewModelI18n'])}",                        
                           target: "#actions"}); 
        });           

     $('.SystemModelTextI18n[name=text]').ckeditor({               
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


   