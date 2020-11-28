{messages class="errors"}
<h3>{__("edit group")|capitalize}</h3>
<div>
    {if $group->isLoaded()}<a href="#" id="Save" class="btn" style="display:none">
             <i class="fa fa-floppy-o" style="color:#000; margin-right:10px;"></i>
             {*<img  src="{url('/icons/save.gif','picture')}" alt="{__('save')}"/>*}{__('save')}</a>{/if}
    <a href="#" id="Cancel" class="btn">
         <i class="fa fa-times" style="color:#000;margin-right:10px;"></i>
         {*<img  src="{url('/icons/cancel.gif','picture')}" alt="{__('cancel')}"/>*}{__('cancel')}</a>
</div>

{if $group->isLoaded()}
    <table class="tab-form" cellpadding="0" cellspacing="0">
        <tr>
            <td class="label">{__("name")}</td>
             <td> 
                 <div class="error-form">&nbsp;{$form->getErrorSchema()->getError('name')}</div> 
                 <input type="text" class="group" name="name" value="{$group->get('name')|escape}" size="30"/>{if $form->getValidator('name')->getOption('required')}*{/if}
             </td>
         </tr>
         <tr>
             <td class="label">{__("created at")}</td>
             <td> 
                 <span>{$group->get('created_at')|escape}</span>
             </td>
         </tr>   
         <tr>
             <td class="label">{__("updated at")}</td>
             <td> 
                 <span>{$group->get('updated_at')|escape}</span>
             </td>
         </tr>               
         <tr>
             <td class="label">{__("application")}</td>
             <td> 
                 <span>{$group->get('application')|escape}</span>
             </td>
         </tr>    
    </table>  
{else}
    <span>{__("this group doesn't exist")}</span>
{/if} 
<script type="text/javascript">
         $('#Cancel').click(function(){ return  $.ajax2({ url:"{url_to('users_guard_ajax',['action'=>'DashboardListPartialGroups'])}",
                                                        loading:"#tab-dashboard-superadmin-loading",   
                                                        target: "#actions"}); });
        
         {if $group->isLoaded()}
            $(".group").click(function() { 
                $("#Save").show();
            });
            
            $('#Save').click(function() { 
                 var params= { group : { 
                                       id : "{$group->get('id')}",
                                       token : '{$form->getCSRFToken()}' 
                                    } }; 
             
                   $("input.group").each(function() {  params.group[this.name]=this.value; });
                   return $.ajax2({ data:params, 
                                    url:"{url_to('users_guard_ajax',['action'=>'DashboardSaveGroup'])}",
                                    loading:"#tab-dashboard-superadmin-loading",
                                    target: "#actions"}); 
                   
            });  
             
         {/if}   
   
</script>
