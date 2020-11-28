{messages class="errors"}
<h3>{__("edit permission")|capitalize}</h3>
<div>
    {if $permission->isLoaded()}<a href="#" id="Save" class="btn" style="display:none">
             <i class="fa fa-floppy-o" style="color:#000; margin-right:10px;"></i>
             {*<img  src="{url('/icons/save.gif','picture')}" alt="{__('save')}"/>*}{__('save')}</a>{/if}
    <a href="#" id="List" class="btn">
        <i class="fa fa-times" style="color:#000;margin-right:10px;"></i>
        {*<img  src="{url('/icons/cancel.gif','picture')}" alt="{__('cancel')}"/>*}{__('cancel')}</a>
</div>

{if $permission->isLoaded()}
    <table class="tab-form" cellpadding="0" cellspacing="0">
        <tr class="full-with">
            <td class="label">{__("name")}</td>
             <td> 
                 <div>&nbsp;{$form->getErrorSchema()->getError('name')}</div> 
                 <input type="text" class="permission" name="name" value="{$permission->get('name')|escape}" size="30"/>{if $form->getValidator('name')->getOption('required')}*{/if}
             </td>
         </tr>
         <tr class="full-with">
             <td class="label">{__("created at")}</td>
             <td> 
                 <span>{$permission->get('created_at')|escape}</span>
             </td>
         </tr>   
         <tr class="full-with">
             <td class="label">{__("updated at")}</td>
             <td> 
                 <span>{$permission->get('updated_at')|escape}</span>
             </td>
         </tr>               
    </table>  
{else}
    <span>{__("this permission doesn't exist")}</span>
{/if} 
<script type="text/javascript">
         
         $('#List').click(function(){ return $.ajax2({ 
                url: "{url_to('users_guard_ajax',['action'=>'DashboardListPartialPermissions'])}",
                loading:"#tab-dashboard-superadmin-loading",
                target: "#actions"}); });
        
         {if $permission->isLoaded()}
            $(".permission").click(function() {  $("#Save").show(); });
            
            $('#Save').click(function() { 
                 var params= { permission : { 
                                       id : "{$permission->get('id')}",
                                       token : '{$form->getCSRFToken()}' 
                                    } }; 
             
                   $("input.permission").each(function(id) {  params.permission[this.name]=this.value; });
                   return $.ajax2({ data: params, 
                        url: "{url_to('users_guard_ajax',['action'=>'DashboardSavePermission'])}",
                        loading:"#tab-dashboard-superadmin-loading",
                        target: "#actions"}); 
                   
            });  
             
         {/if}   
          
</script>

