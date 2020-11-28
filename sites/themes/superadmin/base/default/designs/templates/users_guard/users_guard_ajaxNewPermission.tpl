{messages class="{$site->getSiteID()}-site-errors"}
<h3>{__("New permission")}</h3>
<div>
    <a href="#" id="{$site->getSiteID()}-Save" class="btn" style="display:none">
           <i class="fa fa-floppy-o" style="color:#000; margin-right:10px;"></i>
           {*<img  src="{url('/icons/save.gif','picture')}" alt="{__('save')}"/>*}{__('Save')}</a>
    <a href="#" id="{$site->getSiteID()}-Cancel" class="btn">
         <i class="fa fa-times" style="color:#000;margin-right:10px;"></i>
         {*<img  src="{url('/icons/cancel.gif','picture')}" alt="{__('cancel')}"/>*}{__('Cancel')}</a>
</div>
<table  class="tab-form" cellpadding="0" cellspacing="0">
    {section name=index loop=(string)$form.count}
    <tr id="{$site->getSiteID()}-permission-{$smarty.section.index.index}" class="{$site->getSiteID()}-permission-form">
        <td>#{$smarty.section.index.index+1}</td>
        <td class="label">{__("Name")}</td>
        <td> 
            <div class="error-form">&nbsp;{$form.collection[$smarty.section.index.index].name->getError()}</div> 
            <input type="text" class="{$site->getSiteID()}-permission" name="name" value="{$form['collection'][$smarty.section.index.index]['name']|escape}" size="30"/>{if $form->collection[$smarty.section.index.index]['name']->getOption('required')}*{/if}            
           {__("Group")}{html_options name="group_id" class="`$site->getSiteID()`-permission" options=$form->collection[$smarty.section.index.index].group_id->getOption('choices') selected=(string)$form['collection'][$smarty.section.index.index].group_id} 
           {if $smarty.section.index.index!=0}<a href="#" title="{__('delete')}" class="{$site->getSiteID()}-Delete" id="{$smarty.section.index.index}"><i class=" fa fa-trash" style=" margin-left: 10px;"></i>{*<img  src="{url('/icons/delete.gif','picture')}" alt='{__("delete")}'/>*}</a>{/if}
        </td>                     
    </tr>   
    {/section}
</table>  
<div>
    <a id="{$site->getSiteID()}-Add" href="#" class="btn"  style="{if (string)$form.count>=$form->count->getOption('max')}display:none{/if}">
        <i class="fa fa-plus" style=" margin-right: 10px;"></i>
        {*<img  src="{url('/icons/add.gif','picture')}" alt="{__('new')}"/>*}{__('Add permission')}</a>
</div>
<script type="text/javascript">
         
        $('#{$site->getSiteID()}-Cancel').click(function(){ 
            $(document).off('click','.{$site->getSiteID()}-Delete');
            return $.ajax2({ url: "{url_to('users_guard_ajax',['action'=>'ListPartialPermission'])}",
                             loading: "#tab-site-{$site->getSiteID()}-dashboard-site-x-settings-loading",
                             errorTarget: ".{$site->getSiteID()}-site-errors",
                             target: "#{$site->getSiteID()}-actions"
                           }); 
        });
         
        $(document).on('click',".{$site->getSiteID()}-permission",function() { $("#{$site->getSiteID()}-Save").show(); });
        
        $("#{$site->getSiteID()}-Add").click(function() { 
            id=$(".{$site->getSiteID()}-permission-form").length;
            if (id>={$form->count->getOption('max')})
            {
                alert("{__('maximum records has been reached.')}");
                $(this).hide();
                return ;
            }                
            $("#{$site->getSiteID()}-permission-"+(id-1)).after('<tr id="{$site->getSiteID()}-permission-'+(id)+'" class="{$site->getSiteID()}-permission-form"><td>#'+(id+1)+
                  '<td class="label">{__("name")}</td>'+
                  '<td><div>&nbsp;</div>'+
                  '<input type="text" class="{$site->getSiteID()}-permission" name="name" value="" size="30"/>{if $form->collection["0"]["name"]->getOption("required")}*{/if}\n'+
                  '{__("Group")}'+
                  '<select class="{$site->getSiteID()}-Permission" name="group_id">titi</select>'+
                  '<a href="#" title="{__("delete")}" class="{$site->getSiteID()}-Delete" id="'+(id)+'"><i class=" fa fa-trash" style=" margin-left: 10px;"></i></a>'+
                  '</td></tr>');
                  $("#{$site->getSiteID()}-permission-"+(id)).find("[name=group_id]").html($("#{$site->getSiteID()}-permission-0").find("[name=group_id]").html());          
        });

        $(document).on('click',".{$site->getSiteID()}-Delete",function () { 
            $("#{$site->getSiteID()}-permission-"+$(this).attr('id')).remove();
            $(".{$site->getSiteID()}-permission-form").each(function(id) {
                  $("#"+$(this).attr('id')).attr('id',"{$site->getSiteID()}-permission-"+id);
                  $("#{$site->getSiteID()}-permission-"+id+" td:first").html("#"+(id+1));
                  $(".{$site->getSiteID()}-Delete").each(function (id) { $(this).attr("id",id+1); });
            });
            $("#{$site->getSiteID()}-Add").show();
        });
               
        $('#{$site->getSiteID()}-Save').click(function(){ 
              var params= { Permissions: {                                     
                                    token :'{$form->getCSRFToken()}' 
                                  } };
                 params.Permissions.count=$(".{$site->getSiteID()}-permission-form").length;
                 params.Permissions.collection= { };
                 $(".{$site->getSiteID()}-permission-form").each(function(idx) {
                     params.Permissions.collection[idx]={ };
                     $("#{$site->getSiteID()}-permission-"+idx+" input.{$site->getSiteID()}-permission").each(function(id) {
                          params.Permissions.collection[idx][this.name]=this.value;
                     });
                     $("#{$site->getSiteID()}-permission-"+idx+" select.{$site->getSiteID()}-permission option:selected").each(function() {
                         params.Permissions.collection[idx][$(this).parent().attr('name')]=$(this).val();
                     });
                 });
             // alert("Params"+params.toSource()); return ;
              $(document).off('click','.{$site->getSiteID()}-Delete');
              $.ajax2({ data: params, 
                         url: "{url_to('users_guard_ajax',['action'=>'NewPermission'])}",
                        loading: "#tab-site-{$site->getSiteID()}-dashboard-site-x-settings-loading",
                        errorTarget: ".{$site->getSiteID()}-site-errors",
                        target: "#{$site->getSiteID()}-actions"}); 
         });  
                    
</script>
