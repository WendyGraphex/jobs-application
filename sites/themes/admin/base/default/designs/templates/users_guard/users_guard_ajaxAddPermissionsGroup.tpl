{messages class="site-errors"}
{if  $group->isLoaded()}
<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__('Group')} : {$group->get('name')} {__('permissions')|capitalize}</h3>
        <h3 class="admin-header-small-text">{__('Gestion Groups')}</h3>
    </div>
    <div class="col-sm" style="padding: 0;">
        <div style="float: right;">
            <a href="#" id="Save" class="btn btn-success admin-header-button" style="display:none;">
                  <i class="fa fa-save" style="margin-right: 5px;"></i>
                 {* <img  src="{url('/icons/save.gif','picture')}" alt="{__('save')}"/>*}{__('Save')}</a>
            <a href="#" id="Cancel" class="btn btn-danger admin-header-button" style="margin-left: 10px;">
                 <i class="fa fa-times" style="margin-right: 5px;"></i>
                 {*<img  src="{url('/icons/cancel.gif','picture')}" alt="{__('cancel')}"/>*}{__('Cancel')}</a>
        </div>
    </div>
</div>
<div class="breadcrumb-title">
    <p>
        <i class="fa fa-home" style="color: #37bc9b;"></i>
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__("Droits d'accès")}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Groups')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('SuperAdmin permissions')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Add SuperAdmin permissions')}
    </p>
</div>
    <!-- {* class="{if isset($languages[$code])}active{else}field{/if}" id="{$code}" *}-->
     <div style="overflow-y:auto; background-color: white; padding: 10px;">        
        {foreach $group_permissions as $group_permission}
            <div>
                {if $group_permission->isLoaded()}
                    <h3>{$group_permission->getPermissionGroupI18n()->get('value')}</h3>  
                    <div class="custom-control checkbox-block">
                    <input type="checkbox" class="Groups custom-control-input" id="{$group_permission->get('name')}"/>
                    <label class="custom-control-label" for="undefined">{__('Select/Deselect All')}</label>
                    </div>
                {else}
                    <h3 class="admin-header-big-text">{__('Not defined')}</h3>
                    <div class="custom-control checkbox-block">
                        <input type="checkbox" class="Groups custom-control-input" id="undefined"/>
                        <label class="custom-control-label" for="undefined">{__('Select/Deselect All')}</label>
                    </div>
                {/if}
                {if $group_permission->hasPermissions()}                                     
                    <table class="tab-form">                     
                    {foreach $group_permission->getSortedPermissions() as $permission}
                        {if $permission@index % 5 ==0}<tr class='full-with'>{/if}
                            <td class="add-elemnet {if $permission->get('in_group')}in_group{/if}" >
                           <div class="permissions {if $permission->get('in_group')}active{else}field{/if} {if $group_permission->isLoaded()}{$group_permission->get('name')}{else}undefined{/if}" id="{$permission->get('id')}">
                               <div {if $permission->get('in_group')}style="font-weight:bold"{/if}>{__($permission->get('name'),'','permissions')}</div>                                   
                           </div>
                           </td>
                        {if $permission@index % 5 ==5}</tr>{/if}
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
                    $(this).toggleClass('selected'); 
                    $('#Save').show();
          });
          
          $("#all").click(function () {  $(".field").toggleClass('selected');  $('#Save').show();  });
            
          $('#Cancel').click(function(){ return $.ajax2({ 
                    data : { group : "{$group->get('id')}" },
                    url: "{url_to('users_guard_site_ajax',['action'=>'ListPermissionsGroup'])}",
                    loading: "#tab-site-dashboard-x-settings-loading",
                    errorTarget: ".site-errors",
                    target: "#actions"}); 
          });
          
          $("#Save").click(function (){ 
                     var params= { permissions: { selection : new Array(),group_id : "{$group->get('id')}",token: "{mfForm::getToken('addPermissionsGroupForm')}" } };
                     $(".field.selected").each(function(id) { params.permissions.selection[id]= this.id; });                      
                     return $.ajax2({ data:params,
                                      url: "{url_to('users_guard_site_ajax',['action'=>'AddPermissionsGroupSave'])}",  
                                      loading: "#tab-site-dashboard-x-settings-loading",
                                      errorTarget: ".site-errors",
                                      target: "#actions" });
          });

           $(".Groups").click(function(){
              $('#Save').show();
              if ($(this).prop('checked'))                  
                  $(".permissions.field."+$(this).attr('id')).addClass('selected');
              else
                  $(".permissions.field."+$(this).attr('id')).removeClass('selected'); 
          });
</script>