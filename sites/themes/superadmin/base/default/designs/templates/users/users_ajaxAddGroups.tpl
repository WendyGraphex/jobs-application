{messages class="{$site->getSiteID()}-site-errors"}
{if  $user->isLoaded()}
    <h3>{__('user')|capitalize} : {$user->get('username')} [{$user}] - {__('groups')|capitalize}</h3>    
    <div>
        <a href="#" id="Save" class="btn" style="display:none;">
            <i class="fa fa-floppy-o" style="color:#000; margin-right:10px;"></i>
            {*<img  src="{url('/icons/save.gif','picture')}" alt="{__('save')}"/>*}{__('save')|capitalize}</a>
        <a href="#" id="Cancel" class="btn">
            <i class="fa fa-times" style="color:#000;margin-right:10px;"></i>
            {*<img  src="{url('/icons/cancel.gif','picture')}" alt="{__('cancel')}"/>*}{__('cancel')}</a>
    </div> 
    <div class="tab-form" style="overflow-y:auto; width: 400px;">
           <div class="checkbox-block">
             <input type="checkbox" id="all" /><span>{__("selection")}</span>
            </div>
        {foreach $groups as $group}         
            <div  class="{if $group->get('user_id')}active{else}field{/if} add-user" id="{$group->get('id')}">
                <span>{$group->name}</span>    
            </div>
        {/foreach}
    </div> 
   
{else}
    {__("user doesn't exist")}
{/if}    
<script type="text/javascript">
          $('.field').click(function() { 
                    $(this).toggleClass('selected'); 
                    $('#Save').show();
          });
          
          $("#all").click(function () {  $(".field").toggleClass('selected');  $('#Save').show();  });
            
          $('#Cancel').click(function() { 
               return $.ajax2({ data : { User : "{$user->get('id')}" }, 
                                url: "{url_to('users_site_ajax',['action'=>'GroupsList'])}",
                                loading: "#tab-site-{$site->getSiteID()}-dashboard-site-x-settings-loading",
                                errorTarget: ".{$site->getSiteID()}-site-errors",
                                target: "#{$site->getSiteID()}-actions"});
          });
          
          $("#Save").click(function (){ 
                     var params= { Groups: { selection : new Array(),user_id : "{$user->get('id')}",token: "{mfForm::getToken('AddUserGroupsForm')}" } };
                     $(".field.selected").each(function(id) { params.Groups.selection[id]= this.id; }); 
                     return $.ajax2({ data : params,
                                      url: "{url_to('users_site_ajax',['action'=>'AddGroupsSave'])}",
                                      errorTarget: ".{$site->getSiteID()}-site-errors",
                                      target: "#{$site->getSiteID()}-actions"});
          });
</script>