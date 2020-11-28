{messages}
<h3>{__("View model")}</h3>
<div>
    <a href="#" class="btn" id="Save"><i class="fa fa-floppy-o" style="margin-right:10px;"></i>
        {__('Save')}</a>
    <a href="#" class="btn" id="Cancel"><i class="fa fa-times" style="margin-right:10px;"></i>
       {__('Cancel')}</a>
</div>

<table class="tab-form">
    <tr class="full-with">
        <td class="label">{__('id')}</td>
        <td>{if $item->isLoaded()} 
            <span>{$item->get('id')}</span>  
            {else}
             <span>{__('New')}</span>  
            {/if} 
        </td>
    </tr>
    <tr class="full-with">
        <td></td>
        <td><img id="{$item->get('lang')}" name="lang" src="{url("/flags/`$item->get('lang')`.png","picture")}" title="{format_country($item->get('lang'))}" />       
        </td>
    </tr>
     <tr class="full-with">
         <td class="label"><span>{__("Name")}</span>
        </td>
        <td><div class="error_form" id="SystemModelText-error_name">{$form.model.name->getError()}</div>  
            <input type="text" class="SystemModelText" name="name" size="64" value="{$item->getModel()->get('name')}"/> 
        </td>
    </tr>        
    <tr>
         <td class="label"><span>{__("Title")}</span></td>
         <td>
            <div class="error_form" id="SystemModelText-error_value">{$form.model_i18n.value->getError()}</div>
            <input type="text" size="64" class="SystemModelTextI18n" name="value" value="{$item->get('value')}"/>    
            {if $form->model_i18n.value->getOption('required')}*{/if} 
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
       <tr class=" body-email content">
         <td class="label"><span>{__("Text")}</span></td>
         <td class="editor-body">
             <div id="error_pages" class="error-form">{$form.model_i18n.text->getError()}</div>
            <textarea  class="SystemModelTextI18n editor" rows="20" cols="100" name="text">{$item->get('text')}</textarea>    
            {if $form->model_i18n.text->getOption('required')}*{/if} 
         </td>
    </tr>     
</table>



<script type="text/javascript">
  
      
     {* =================== F I E L D S ================================ *}
     $(".SystemModelText,.SystemModelTextI18n").click(function() {  $('#Save').show(); });        
   
     {* =================== A C T I O N S ================================ *}
     $('#Cancel').click(function(){                           
             return $.ajax2({ data: { filter: { lang:"{$item->get('lang')}", token: "{mfForm::getToken('SystemTextModelsFormFilter')}" } },                              
                              url : "{url_to('system_texts_ajax',['action'=>'ListPartialModel'])}",                                                   
                              target: "#actions" }); 
      });
      
      $('#Save').click(function(){                             
            var  params= {            
                                SystemModelTextI18n: { 
                                   model_i18n : { lang: "{$item->get('lang')}",model_id: "{$item->get('model_id')}"    },
                                   model : { },
                                   token :'{$form->getCSRFToken()}'
                                } };
          $("input.SystemModelTextI18n,textarea.SystemModelTextI18n").each(function() { params.SystemModelTextI18n.model_i18n[this.name]=$(this).val(); });
          $("input.SystemModelText").each(function() {  params.SystemModelTextI18n.model[this.name]=$(this).val();  });  // Get foreign key  
          //    alert("Params="+params.toSource());   return ;       
          return $.ajax2({ data : params,                                                      
                           url: "{url_to('system_texts_ajax',['action'=>'SaveModelI18n'])}",
                           target: "#actions" }); 
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

