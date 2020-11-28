{messages}
{if  $user->isLoaded()}
    <h3>{__('user')|capitalize} : {$user->get('username')} [{$user}] - {__('Groups')}</h3>    
    <div>
        <a href="#" id="Save" class="btn btn-primary" style="display:none;">
             <i class="fa fa-floppy-o" style="margin-right:10px;"></i>
             {__('Save')}</a>
        <a href="#" id="Cancel" class="btn btn-primary">
             <i class="fa fa-times" style="margin-right:10px;"></i>
             {__('Cancel')}</a>
    </div> 
    <div class="tab-form" style="overflow-y:auto; width: 400px;">
        <div class="checkbox-block">
         <input  type="checkbox" id="all" /><span>{__("Selection")}</span>
        </div>
        {foreach $groups as $group}
            <div class="{if $group->get('user_id')}active{else}field{/if} add-user" id="{$group->get('id')}">
                <span>{$group->name}</span>    
            </div>
        {/foreach}
    </div> 
   
{else}
    {__("User doesn't exist")}
{/if}    
<script type="text/javascript">
    
          $('.field').click(function() { 
                    $(this).toggleClass('selected'); 
                    $('#Save').show();
          });
          
          $("#all").click(function () {  $(".field").toggleClass('selected');  $('#Save').show();  });
            
          $('#Cancel').click(function() { 
               return $.ajax2({ data : { User : "{$user->get('id')}" }, 
                                url: "{url_to('users_ajax',['action'=>'GroupsList'])}",                               
                                target: "#actions"});
          });
          
          $("#Save").click(function (){ 
                     var params= { Groups: { selection : new Array(),user_id : "{$user->get('id')}",token: "{mfForm::getToken('AddUserGroupsForm')}" } };
                     $(".field.selected").each(function(id) { params.Groups.selection[id]= this.id; }); 
                     return $.ajax2({ data : params,
                                      url: "{url_to('users_ajax',['action'=>'AddGroupsSave'])}",                                     
                                      target: "#actions"});
          });
</script>