{messages}
<h3>{__("New permission")}</h3>
<div>
    <a href="#" id="Save" class="btn" style="display:none">
         <i class="fa fa-floppy-o" style="margin-right:10px;"></i>
         {__('Save')}</a>
    <a href="#" id="Cancel" class="btn">
        <i class="fa fa-times" style="margin-right:10px;"></i>
        {__('Cancel')}</a>
</div>
{component name="/site_languages/dialogListLanguagesFrontend" selected=(string)$form.lang}  
 
            <div class="error-form">{$form.lang->getError()}</div>      
            <img class="PermissionI18n" id="{$form.lang}" name="lang" src="{url("/flags/`$form.lang`.png","picture")}" title="{if !$form.lang->getError()}{format_country($form.lang)}{/if}" />
            <a id="ChangeLang" href="#" title="{__('Change')}"><img  src="{url('/icons/edit.gif','picture')}" alt='{__("Language")}'/></a>        
    {section name=index loop=(string)$form.count}
    <div id="permission-{$smarty.section.index.index}" class="permission-form">
        
        <table class="tab-form-2"  cellspacing="0">
            <tr class="full-with">
            <td>#{$smarty.section.index.index+1}</td>
            </tr>
            <tr class="full-with">
                <td class="label">{__("Name")}</td>
                <td> 
                    <div class="error-form">&nbsp;{$form.collection[$smarty.section.index.index].name->getError()}</div> 
                    <input type="text" class="permission" name="name" value="{$form['collection'][$smarty.section.index.index]['name']|escape}" size="30"/>{if $form->collection[$smarty.section.index.index]['name']->getOption('required')}*{/if}
                </td>
            </tr>
             <tr class="full-with">
                <td class="label">{__("Title")}</td>
                <td> 
                    <div class="error-form">&nbsp;{$form.collection[$smarty.section.index.index].title->getError()}</div> 
                    <input type="text" class="permission" name="title" value="{$form['collection'][$smarty.section.index.index]['title']|escape}" size="30"/>{if $form->collection[$smarty.section.index.index]['title']->getOption('required')}*{/if}
                </td>
            </tr>
        <tr class="full-with">
            <td class="label">   
            {__("Group")}
         </td>
         <td>
            {html_options name="group_id" class="permission" options=$form->collection[$smarty.section.index.index].group_id->getOption('choices') selected=(string)$form['collection'][$smarty.section.index.index].group_id} 
            {if $smarty.section.index.index!=0}<a href="#" title="{__('delete')}" class=" Delete" id="{$smarty.section.index.index}">
                <i class=" fa fa-trash fa-2x" style=" margin-left: 10px;"></i>    
            </a>{/if}
        </td>
      </tr>
        </table>  
    </div>
    {/section}

<div>
    <center style=" clear: both;"> <a id="Add" href="#" class="btn"  style="{if (string)$form.count>=$form->count->getOption('max')}display:none{/if}">
         <i class="fa fa-plus" style=" margin-right: 10px;"></i>
         {*<img  src="{url('/icons/add.gif','picture')}" alt="{__('new')}"/>*}{__('Add permission')}</a></center>
</div>
<script type="text/javascript">
         
        $('#Cancel').click(function(){ 
            $(".dialogs").dialog("destroy").remove(); 
            $(document).off('click','.Delete');
            return $.ajax2({ url: "{url_to('users_guard_ajax',['action'=>'ListPartialPermission'])}",                            
                             target: "#actions"
                           }); 
        });
         
        $(document).on('click',".permission",function() {  $("#Save").show(); });
        
        $("#Add").click(function() { 
            id=$(".permission-form").length;
            if (id>={$form->count->getOption('max')})
            {
                alert("{__('maximum records has been reached.')}");
                $(this).hide();
                return ;
            }                
            $("#permission-"+(id-1)).after('<div id="permission-'+(id)+'" class="permission-form"><table class="tab-form-2"><tr class="full-with"><td>#'+(id+1)+'</tr>'+
                   '<tr class="full-with">'+
                  '<td class="label">{__("name")}</td>'+
                  '<td><div>&nbsp;</div>'+
                  '<input type="text" class="permission" name="name" value="" size="30"/>{if $form->collection["0"]["name"]->getOption("required")}*{/if}\n'+
                  '</tr>'+
                  '<tr class="full-with">'+
                  '<td class="label">{__("title")}</td>'+
                  '<td><div>&nbsp;</div>'+
                  '<input type="text" class="permission" name="title" value="" size="30"/>{if $form->collection["0"]["title"]->getOption("required")}*{/if}\n'+
                  '</tr>'+
                  '<tr class="full-with">'+
                  '<td class="label">'+
                  '{__("Group")}'+
                  '</td>'+
                  '<td>'+
                  '<select class="permission" name="group_id">titi</select>'+
                  '<a href="#" title="{__("delete")}" class=" Delete" id="'+(id)+'"><i class=" fa fa-trash fa-2x" style=" margin-left: 10px;"></i></a>'+
                  '</td></tr></table></div>');
           $("#permission-"+(id)).find("[name=group_id]").html($("#permission-0").find("[name=group_id]").html());          
        });

        $(document).on('click',".Delete",function () { 
            $("#permission-"+$(this).attr('id')).remove();
            $(".permission-form").each(function(id) {
                  $("#"+$(this).attr('id')).attr('id',"permission-"+id);
                  $("#permission-"+id+" td:first").html("#"+(id+1));
                  $(". Delete").each(function (id) { $(this).attr("id",id+1); });
            });
            $("#Add").show();
        });
               
        $('#Save').click(function(){ 
                $(".dialogs").dialog("destroy").remove(); 
                var params= { PermissionsI18n: {                                     
                                        lang: $(".PermissionI18n[name=lang]").attr('id'),
                                        token :'{$form->getCSRFToken()}' 
                                  } };
                 params.PermissionsI18n.count=$(".permission-form").length;
                 params.PermissionsI18n.collection= { };
                 $(".permission-form").each(function(idx) {
                     params.PermissionsI18n.collection[idx]={ };
                     $("#permission-"+idx+" input.permission").each(function(id) {
                          params.PermissionsI18n.collection[idx][this.name]=this.value;
                     });
                     $("#permission-"+idx+" select.permission option:selected").each(function() {
                         params.PermissionsI18n.collection[idx][$(this).parent().attr('name')]=$(this).val();
                     });
                 });
              $(document).off('click','.Delete');
              $.ajax2({ data: params, 
                         url: "{url_to('users_guard_ajax',['action'=>'SaveNewPermissionI18n'])}",                       
                        target: "#actions"}); 
         });  
       
    {* =================== L A N G U A G E ================================ *}
         $( "#ChangeLang").click(function() {
            $("#Save").show();
            $("#dialogListLanguages").dialog("open");
         });  
         
         $("#dialogListLanguages").bind('select',function(event){                    
            $(".PermissionI18n[name=lang]").attr({
                                  id: event.selected.id,
                                  src: '{url("/flags/","picture")}'+event.selected.id+'.png',
                                  title: event.selected.lang
                                  });         
         }); 
</script>
