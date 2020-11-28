{messages class="site-errors"}
<h3>{__("Edit permission")}</h3>
<div>
    {if $permission->isLoaded()}<a href="#" id="Save" class="btn" style="display:none">
            <i class="fa fa-floppy-o" style="color:#000; margin-right:10px;"></i>
            {*<img  src="{url('/icons/save.gif','picture')}" alt="{__('save')}"/>*}{__('save')}</a>{/if}
    <a href="#" id="Cancel" class="btn">
         <i class="fa fa-times" style="color:#000;margin-right:10px;"></i>
         {*<img  src="{url('/icons/cancel.gif','picture')}" alt="{__('cancel')}"/>*}{__('cancel')}</a>
</div>

{if $permission->isLoaded()}
    <table class="tab-form" cellspacing="0">       
         <tr>
             <td class="label">{__("name")}</td>
             <td> 
                 <div class="error-form">&nbsp;{$form->getErrorSchema()->getError('name')}</div> 
                 <input type="text" class="Permissions" name="name" value="{$permission->get('name')|escape}" size="30"/>{if $form->getValidator('name')->getOption('required')}*{/if}
             </td>
         </tr>    
          <tr>
             <td class="label">{__("Group")}</td>
             <td> 
                 {html_options name="group_id" class="Permissions" options=$form->group_id->getOption('choices') selected=$permission->get('group_id')}
            </td>
         </tr> 
         <tr>
             <td class="label">{__("created at")}</td>
             <td> 
                 <span>{$permission->get('created_at')|escape}</span>
             </td>
         </tr>   
         <tr>
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
    
         $('#Cancel').click(function(){ return $.ajax2({ 
                            loading: "#tab-site-dashboard-x-settings-loading",
                            url: "{url_to('users_guard_ajax',['action'=>'ListPartialPermission'])}",
                            errorTarget: ".site-errors",
                            target: "#actions"
                        }); 
         });
        
         {if $permission->isLoaded()}
            $(".Permissions").click(function() { 
                $("#Save").show();
            });
            
            $('#Save').click(function() { 
                 var params= { Permission : { 
                                       id : "{$permission->get('id')}",
                                       group_id: $(".Permissions[name=group_id] option:selected").val(),
                                       token : '{$form->getCSRFToken()}' 
                                    } }; 
             
                   $("input.Permissions").each(function() {  params.Permission[this.name]=this.value; });
                   return $.ajax2({ data:params, 
                                    loading: "#tab-site-dashboard-x-settings-loading",
                                    url: "{url_to('users_guard_ajax',['action'=>'SavePermission'])}",
                                    errorTarget: ".site-errors",
                                    target: "#actions"}); 
                   
            });  
             
         {/if}   
          
</script>

