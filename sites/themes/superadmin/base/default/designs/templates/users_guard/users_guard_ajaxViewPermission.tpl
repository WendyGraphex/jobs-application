{messages class="{$site->getSiteID()}-site-errors"}
<h3>{__("Edit permission")}</h3>
<div>
{if $permission->isLoaded()}<a href="#" id="{$site->getSiteID()}-Save" class="btn" style="display:none">
         <i class="fa fa-floppy-o" style="color:#000; margin-right:10px;"></i>
         {*<img  src="{url('/icons/save.gif','picture')}" alt="{__('save')}"/>*}{__('Save')}</a>{/if}
    <a href="#" id="{$site->getSiteID()}-Cancel" class="btn">
        <i class="fa fa-times" style="color:#000;margin-right:10px;"></i>
        {*<img  src="{url('/icons/cancel.gif','picture')}" alt="{__('cancel')}"/>*}{__('Cancel')}</a>
</div>

{if $permission->isLoaded()}
    <table class="tab-form" cellspacing="0">
        <tr class="full-with">
            <td class="label">{__("name")}</td>
             <td> 
                 <div class="error-form">&nbsp;{$form->getErrorSchema()->getError('name')}</div> 
                 <input type="text" class="{$site->getSiteID()}-Permissions" name="name" value="{$permission->get('name')|escape}" size="30"/>{if $form->getValidator('name')->getOption('required')}*{/if}
             </td>
         </tr>        
          <tr class="full-with">
             <td class="label">{__("Group")}</td>
             <td> 
                 {html_options name="group_id" class="`$site->getSiteID()`-Permissions" options=$form->group_id->getOption('choices') selected=$permission->get('group_id')}
            </td>
         </tr> 
         <tr class="full-with">
             <td class="label">{__("Created at")}</td>
             <td> 
                 <span>{$permission->get('created_at')|escape}</span>
             </td>
         </tr>   
         <tr class="full-with">
             <td class="label">{__("Updated at")}</td>
             <td> 
                 <span>{$permission->get('updated_at')|escape}</span>
             </td>
         </tr>               
    </table>  
{else}
    <span>{__("this permission doesn't exist")}</span>
{/if} 
<script type="text/javascript">
    
         $('#{$site->getSiteID()}-Cancel').click(function(){ return $.ajax2({ 
                            loading: "#tab-site-{$site->getSiteID()}-dashboard-site-x-settings-loading",
                            url: "{url_to('users_guard_ajax',['action'=>'ListPartialPermission'])}",
                            errorTarget: ".{$site->getSiteID()}-site-errors",
                            target: "#{$site->getSiteID()}-actions"
                        }); 
         });
        
         {if $permission->isLoaded()}
            $(".{$site->getSiteID()}-permissions").click(function() { 
                $("#{$site->getSiteID()}-Save").show();
            });
            
            $('#{$site->getSiteID()}-Save').click(function() { 
                 var params= { Permission : { 
                                       id : "{$permission->get('id')}",
                                       group_id: $(".{$site->getSiteID()}-Permissions[name=group_id] option:selected").val(),
                                       token : '{$form->getCSRFToken()}' 
                                    } }; 
             
                   $("input.{$site->getSiteID()}-Permissions").each(function() {  params.Permission[this.name]=this.value; });
                   return $.ajax2({ data:params, 
                                    loading: "#tab-site-{$site->getSiteID()}-dashboard-site-x-settings-loading",
                                    url: "{url_to('users_guard_ajax',['action'=>'SavePermission'])}",
                                    errorTarget: ".{$site->getSiteID()}-site-errors",
                                    target: "#{$site->getSiteID()}-actions"}); 
                   
            });  
             
         {/if}   
          
</script>

