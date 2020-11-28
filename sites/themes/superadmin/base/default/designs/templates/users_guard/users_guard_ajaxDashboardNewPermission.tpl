{messages class="errors"}
<h3>{__("new permissions")|capitalize}</h3>
<div>
    <a href="#" id="Save" class="btn" style="display:none">
        <i class="fa fa-floppy-o" style="color:#000; margin-right:10px;"></i>
        {*<img  src="{url('/icons/save.gif','picture')}" alt="{__('save')}"/>*}{__('save')}</a>
        <a href="#" id="Cancel" class="btn">
        <i class="fa fa-times" style="color:#000;margin-right:10px;"></i>
        {*<img  src="{url('/icons/cancel.gif','picture')}" alt="{__('cancel')}"/>*}{__('cancel')}</a>
</div>
<table class="tab-form" cellpadding="0" cellspacing="0">
    {section name=index loop=(string)$form['permissions_count']}
        <tr  id="permission_{$smarty.section.index.index}" class="permission_form full-with">
        <td>#{$smarty.section.index.index+1}</td>
        <td class="label">{__("name")}</td>
        <td> 
            <div class="error-form">&nbsp;{$form['permissions'][$smarty.section.index.index]['name']->getError()}</div> 
            <input type="text" class="permission" name="name" value="{$form['permissions'][$smarty.section.index.index]['name']|escape}" size="30"/>{if $form->permissions[$smarty.section.index.index]['name']->getOption('required')}*{/if}
        {if $smarty.section.index.index!=0}<a href="#" title="{__('delete')}" class="Delete" id="{$smarty.section.index.index}"><i class="fa fa-trash" style=" margin-right: 10px;"></i>{*<img  src="{url('/icons/delete.gif','picture')}" alt='{__("delete")}'/>*}</a>{/if}
        </td> 
    </tr>
    {/section}
</table>  
<div>
    <a id="Add" href="#" class="btn"  style="{if (string)$form['permissions_count']>=$form->permissions_count->getOption('max')}display:none{/if}">
       <i class="fa fa-plus" style=" margin-right: 10px;"></i>
       {*<img  src="{url('/icons/add.gif','picture')}" alt="{__('new')}"/>*}{__('add permission')|capitalize}</a>
</div>
<script type="text/javascript">
         
        $('#Cancel').click(function(){ 
            $(".Delete").off('click');
            return $.ajax2({ url: "{url_to('users_guard_ajax',['action'=>'DashboardListPartialPermission'])}",
                            loading:"#tab-dashboard-superadmin-loading",
                            target: "#actions"}); 
        });
         
        $(".permission").on('click',function() { $("#Save").show(); });
        
        $("#Add").click(function() { 
            id=$(".permission_form").length;
            if (id>={$form->permissions_count->getOption('max')})
            {
                alert("{__('maximum records has been reached.')}");
                $(this).hide();
                return ;
            }                
            $("#permission_"+(id-1)).after('<tr id="permission_'+(id)+'" class="permission_form"><td>#'+(id+1)+
                  '<td>{__("name")}</td>'+
                  '<td><div>&nbsp;</div>'+
                  '<input type="text" class="permission" name="name" value="" size="30"/>{if $form->permissions["0"]["name"]->getOption("required")}*{/if}\n'+
                  '<a href="#" title="{__("delete")}" class="Delete" id="'+(id)+'"><img  src="{url("/icons/delete.gif","picture")}" alt="{__("delete")}"/></a>'+
                  '</td></tr>');
        });

        $(".Delete").on('click',function () { 
            $("#permission_"+$(this).attr('id')).remove();
            $(".permission_form").each(function(id) {
                  $("#"+$(this).attr('id')).attr('id',"permission_"+id);
                  $("#permission_"+id+" td:first").html("#"+(id+1));
                  $(".Delete").each(function (id) { $(this).attr("id",id+1); });
            });
            $("#Add").show();
        });
        
        $('#Save').click(function(){ 
              var params= { permission: { 
                                    token :'{$form->getCSRFToken()}' 
                                  } };
                 params.permission.permissions_count=$(".permission_form").length;
                 params.permission.permissions= { };
                 $(".permission_form").each(function(idx) {
                     params.permission.permissions[idx]={ };
                     $("#permission_"+idx+" input.permission").each(function(id) {
                          params.permission.permissions[idx][this.name]=this.value;
                     });
                 });
              $(".Delete").off('click');
              $.ajax2({ data: params, 
                        url: "{url_to('users_guard_ajax',['action'=>'DashboardNewPermission'])}",
                        loading:"#tab-dashboard-superadmin-loading",
                        target: "#actions"}); 
         });  
                    
</script>
