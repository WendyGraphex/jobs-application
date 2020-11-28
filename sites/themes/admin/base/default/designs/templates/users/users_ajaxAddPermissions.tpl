{messages}
{if  $user->isLoaded()}
    <h3>{__('User')} : {$user->get('username')} [{$user}] - {__('Permissions')}</h3>    
    <div>
        <a href="#" id="Save" class="btn btn-primary" style="display:none;">
             <i class="fa fa-floppy-o" style="margin-right:10px;"></i>
             {__('Save')}</a>
             <a href="#" id="Cancel" class="btn btn-primary">
             <i class="fa fa-times" style="margin-right:10px;"></i>
             {__('Cancel')}</a>
    </div> 
    <div style="overflow-y:auto;">
        <table class="tab-form">
        {foreach $permissions as $permission}
            {if $permission@index % 5 ==0}<tr class="full-with">{/if}
                <td>
            <div class="{if $permission->get('user_id')}active{else}field{/if} add-elemnet" id="{$permission->get('id')}">
                <span>{__($permission->get('name'),'','permissions')}</span>    
            </div>
            </td>
            {if $permission@index % 5 ==5}</tr>{/if}
        {/foreach}
        </table>
    </div> 
    <input type="checkbox" id="all" /><span>{__("Selection")}</span>
{else}
    {__("User doesn't exist")}
{/if}    
<script type="text/javascript">
        
          $('.field').click(function() { 
                    $(this).toggleClass('selected'); 
                    $('#Save').show();
          });
          
          $("#all").click(function () {  $(".field").toggleClass('selected');  $('#Save').show();  });
            
          $('#Cancel').click(function(){ 
              return $.ajax2({ data: { User : "{$user->get('id')}" }, 
                                       url: "{url_to('users_ajax',['action'=>'PermissionsList'])}",                                     
                                       target: "#actions" });
          });
          
          $("#Save").click(function (){ 
                     params= { permissions: { selection : new Array(),user_id : "{$user->get('id')}",token: "{mfForm::getToken('AddPermissionsUserForm')}" } };
                     $(".field.selected").each(function(id) { params.permissions.selection[id]= this.id; });  
                     return $.ajax2({ data: params, 
                                      url: "{url_to('users_ajax',['action'=>'AddPermissionsSave'])}",                                     
                                      target: "#actions" });
          });
</script>