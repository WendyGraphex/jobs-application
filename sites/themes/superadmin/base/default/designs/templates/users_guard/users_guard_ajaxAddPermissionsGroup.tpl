{messages class="{$site->getSiteId()}-site-errors"}
{if  $group->isLoaded()}
    <h3>{__('Group')} : {$group->get('name')}  {__('Permissions')}</h3>    
    <div>
        <a href="#" id="{$site->getSiteId()}-Save" class="btn" style="display:none;">
            <i class="fa fa-floppy-o" style="color:#000; margin-right:10px;"></i>
            {*<img  src="{url('/icons/save.gif','picture')}" alt="{__('save')}"/>*}{__('Save')}</a>
        <a href="#" id="{$site->getSiteId()}-Cancel" class="btn">
             <i class="fa fa-times" style="color:#000;margin-right:10px;"></i>
             {*<img  src="{url('/icons/cancel.gif','picture')}" alt="{__('cancel')}"/>*}{__('Cancel')}</a>
    </div> 
    <!-- {* class="{if isset($languages[$code])}active{else}field{/if}" id="{$code}" *}-->
     <div style="overflow-y:auto;">
        {foreach $group_permissions as $group_permission}
            <div>
                {if $group_permission->isLoaded()}
                    <h4>{$group_permission->getPermissionGroupI18n()->get('value')}</h4>      
                    <input type="checkbox" class="Groups" id="{$group_permission->get('name')}"/>{__('Select/Deselect All')}
                {else}
                    <h4>{__('Not defined')}</h4>
                    <input type="checkbox" class="Groups" id="undefined"/>{__('Select/Deselect All')}
                {/if}
                {if $group_permission->hasPermissions()}                   
                    <table class="tab-form">                     
                    {foreach $group_permission->getSortedPermissions() as $permission}
                        {if $permission@index % 4 ==0}<tr class='full-with'>{/if}
                            <td class="add_in_group {if $permission->get('in_group')}in_group{/if}" >
                           <div class="permissions {if $permission->get('in_group')}active{else}field{/if} {if $group_permission->isLoaded()}{$group_permission->get('name')}{else}undefined{/if}" id="{$permission->get('id')}">
                               <div {if $permission->get('in_group')} class='in_group' style="font-weight:bold"{/if}>{__($permission->get('name'),'','permissions')}</div>                                   
                           </div>
                           </td>
                        {if $permission@index % 4 ==4}</tr>{/if}
                    {/foreach}    
                    </table>
                 {else}
                     {__('No permission in this group.')}
                 {/if}   
            </div>
        {/foreach} 
     </div>    
{else}
    {__("Group doesn't exist")}
{/if}    
<script type="text/javascript">
          $('.field').click(function() { 
                    $(this).toggleClass('selected_group'); 
                    $('#{$site->getSiteId()}-Save').show();
          });
          
          $("#{$site->getSiteId()}-all").click(function () {  $(".field").toggleClass('selected_group');  $('#{$site->getSiteId()}-Save').show();  });
            
          $('#{$site->getSiteId()}-Cancel').click(function(){ return $.ajax2({ 
                    data : { group : "{$group->get('id')}" },
                    url: "{url_to('users_guard_site_ajax',['action'=>'ListPermissionsGroup'])}",
                    loading: "#tab-site-{$site->getSiteID()}-dashboard-site-x-settings-loading",
                    errorTarget: ".{$site->getSiteId()}-site-errors",
                    target: "#{$site->getSiteId()}-actions"}); 
          });
          
          $("#{$site->getSiteId()}-Save").click(function (){ 
                     var params= { permissions: { selection : new Array(),group_id : "{$group->get('id')}",token: "{mfForm::getToken('addPermissionsGroupForm')}" } };
                     $(".field.selected_group").each(function(id) { params.permissions.selection[id]= this.id; });                      
                     return $.ajax2({ data:params,
                                      url: "{url_to('users_guard_site_ajax',['action'=>'AddPermissionsGroupSave'])}",  
                                       loading: "#tab-site-{$site->getSiteID()}-dashboard-site-x-settings-loading",
                                      errorTarget: ".{$site->getSiteId()}-site-errors",
                                      target: "#{$site->getSiteId()}-actions" });
          });

          $(".Groups").click(function(){
              $('#{$site->getSiteId()}-Save').show();
              if ($(this).prop('checked'))                  
                  $(".permissions.field."+$(this).attr('id')).addClass('selected_group');
              else
                  $(".permissions.field."+$(this).attr('id')).removeClass('selected_group'); 
          });
</script>