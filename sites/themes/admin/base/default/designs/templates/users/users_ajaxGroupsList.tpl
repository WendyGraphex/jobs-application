{messages}
{if  $item->isLoaded()}    
    <h3>{__('user')|capitalize} : {$item->get('username')} [{$item}] - {__('groups')|capitalize}</h3>    
    <div>
        {if $user->hasCredential([['superadmin','admin','settings_user_group_user_new']])}  
            <a id="New" class="btn btn-primary" href="#">
            <i class="fa fa-plus" style="margin-right:10px;"></i>
            {__('Add group')}</a>
        {/if}
        <a href="#" id="Cancel" class="btn btn-primary">
            <i class="fa fa-times" style="margin-right:10px;"></i>
            {__('Cancel')}</a>
    </div>
    {if  $pager->getNbItems()}
        {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter}
        <button id="filter" class="btn btn-default">{__("Filter")}</button>   
        <button id="init" class="btn btn-default">{__("Init")}</button>
        <div class="table-responsive">
    <table class="table table-bordered table-hover table-striped"> 
            <thead>
             <tr>
                <th>#</th>
                {if $pager->getNbItems()>5}<th>&nbsp;</th>{/if}                
                 <th>{__('Name')}
                     <div>
                          <a href="#" class="order{$formFilter.order.name->getValueExist('asc','_active')}" id="asc" name="name"><img  src='{url("/icons/sort_asc`$formFilter.order.name->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                          <a href="#" class="order{$formFilter.order.name->getValueExist('desc','_active')}" id="desc" name="name"><img  src='{url("/icons/sort_desc`$formFilter.order.name->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
                     </div> 
                 </th>      
                 <th>{__('State')}</th>
                 <th>{__('Actions')}</th>
             </tr>
</thead>
             <tr>
                    <td></td>
                    {if $pager->getNbItems()>5}<td></td>{/if}                 
                    <td><input class="search" type="text" size="5" name="name" value="{$formFilter.search.name}"></td> 
                    <td>{html_options_format format="__" name="is_active" options=$formFilter->search.is_active->getOption('choices') selected=(string)$formFilter.search.is_active}</td>
                    <td></td>
                </tr>       
                {foreach $pager as $usergroup}
                <tr class="usergroups list" id="usergroup_{$usergroup->get('id')}">
                    <td class="usergroups_count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$usergroup@iteration}</td>
                    {if $pager->getNbItems()>5}<td><input class="selection" type="checkbox" name="{$usergroup->get('id')}" id="{$usergroup->get('name')}"/></td>{/if}                   
                    <td>
                        {$usergroup->get('name')}
                    </td>
                    <td>
                       <a href="#" title="{__('Change')}" class="ChangeUserGroup" id="{$usergroup->get('id')}" name="{$usergroup->get('is_active')}">
                           <img  src="{url('/icons/','picture')}{$usergroup->get('is_active')}.gif" alt='{__("usergroup_`$usergroup->get("is_active")`")}'/></a>
                    </td>                    
                    <td>
                       {if $user->hasCredential([['superadmin','admin','settings_user_group_user_delete']])}  
                       <a href="#" title="{__('Delete')}" class="DeleteUserGroup" id="{$usergroup->get('id')}" name="{$usergroup->get('name')}">
                           <i class="fa fa-remove"></i></a>
                       {/if}
                    </td>
                </tr>
                {/foreach}
        </table>
        </div>
        {if $pager->getNbItems()>5}
               <input type="checkbox" id="all" />  
               <a href="#" title="{__('Enable')}" id="EnabledUserGroups"><img  src="{url('/icons/YES.gif','picture')}" alt='{__("yes")}'/>
               <a href="#" title="{__('Disable')}" id="DisabledUserGroups"><img  src="{url('/icons/NO.gif','picture')}" alt='{__("no")}'/></a>
               <a href="#" title="{__('Delete')}" id="DeleteUserGroups"><img  src="{url('/icons/delete.gif','picture')}" alt='{__("delete")}'/></a>
        {/if}
        {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager}
    {else}
            {__("no result")}
    {/if}
{else}
    {__("user doesn't exist")}
{/if}    
<script type="text/javascript">
        
         function changeUserGroupState(resp) 
            {
                $.each(resp.selection?resp.selection:[resp.id], function (id) { 
                    sel="a.ChangeUserGroup#"+this;
                    if (resp.state=='YES'||resp.state=='NO') 
                    {    
                        $(sel+" img").attr({
                            src :"{url('/icons/','picture')}"+resp.state+".gif",
                            alt : (resp.state=='YES'?'{__("user_YES")}':'{__("user_NO")}'),
                            title : (resp.state=='YES'?'{__("user_YES")}':'{__("user_NO")}')
                        });
                        $(sel).attr("name",resp.state);
                    }
                });  
            }
        
        function getUserGroupFilterParameters()
        {
            var params={   User : "{$item->get('id')}",
                       filter: {  order : { }, 
                                     search: { is_active : $("[name=is_active]").val(), }, 
                                     nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                     token:'{$formFilter->getCSRFToken()}'
                                  }};
            params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");
            $(".search").each(function(id) { params.filter.search[this.name] =this.value; });                               
            return params;                  
        }
        
        function updateUserGroupFilter()
        {
           return $.ajax2({ data: getUserGroupFilterParameters(), 
                            url:"{url_to('users_ajax',['action'=>'GroupsList'])}" ,                               
                            target: "#actions" });
        }
        
        function updatePager(n)
        {
           page_active=$(".pager .active").html()?parseInt($(".pager .active").html()):1;
           records_by_page=$("[name=nbitemsbypage]").val();
           start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
           $(".usergroups_count").each(function(id) { $(this).html(start+id) }); // Update index column           
           nb_results=parseInt($("#nb_results").html())-n;
           $("#nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
           $("#end_result").html($(".usergroups_count:last").html());
        }
        
         // {* PAGER - begin *}
         $('.order').click(function() {
             $(".order_active").attr('class','order');
             $(this).attr('class','order_active');
             updateUserGroupFilter();
          });
         
          $("[name=nbitemsbypage],[name=is_active]").change(function() { updateUserGroupFilter(); }); 
          
          $(".search").keypress(function(event) {
                        if (event.keyCode==13)
                             updateUserGroupFilter();
          });
                   
          $("#filter").click(function() { updateUserGroupFilter(); }); 
          
          $("#init").click(function() { 
                            return $.ajax2({ data : { User : "{$item->get('id')}" },
                                             url: "{url_to('users_ajax',['action'=>'GroupsList'])}",                                            
                                             target: "#actions"}); }); 
                             
          $(".pager").click(function () {
                  return $.ajax2({ data:getUserGroupFilterParameters(),
                                    url: "{url_to('users_ajax',['action'=>'GroupsList'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length),                                  
                                    target: "#actions" });           
                });
          
          $("#all").click(function () {  $(".selection").attr("checked",($(this).attr("checked")=="checked"));  });
          // {* PAGER - end *}         
           
          // {* ACTIONS - begin *}
          
          $("#DeleteUserGroups").click( function () { 
             var params={ selection : {  }, User : "{$item->get('id')}" };
             text="";              
             $(".selection:checked").each(function (id) { 
                params.selection[id]=this.name;
                text+=this.id+",\n";
             });
             if ($.isEmptyObject(params.selection))
                return ;
             if (!confirm("{__('Groups :\u000A\u000A\"#0#\"\u000A\u000A will be deleted. Confirm ?')}".format(text.substring(0,text.lastIndexOf(","))))) 
                 return false; 
             return $.ajax2({ data: params,
                              url: "{url_to('users_ajax',['action'=>'DeleteGroups'])}",                             
                              success: function(resp) {
                                            if (resp.action=='deleteUserGroups')
                                            {                                    
                                                if ($(".usergroups").length-resp.parameters.length==0)
                                                   return $.ajax2({ data : { user : "{$item->get('id')}"} ,
                                                                             url:"{url_to('users_ajax',['action'=>'GroupsList'])}",
                                                                             loading: "#tab-site-dashboard-x-settings-loading",
                                                                             errorTarget: ".site-errors",
                                                                             target: "#actions"
                                                                    });
                                                $.each(resp.parameters, function (id) {  $("tr#usergroup_"+this).remove(); });
                                                updatePager(resp.parameters.length);
                                                $("input#all").attr("checked",false);                                    
                                            }       
                              }
             });    
          });
          
          $(".DeleteUserGroup").click( function () { 
                if (!confirm('{__("Group \"#0#\" will be deleted. Confirm ?")}'.format(this.name))) return false; 
                return $.ajax2({ data : { UserGroup: this.id },
                                 url :"{url_to('users_ajax',['action'=>'DeleteGroup'])}",                                     
                                 success: function(resp) {
                                            if (resp.action=='deleteUserGroup')
                                            {    
                                                if ($(".usergroups").length-1==0)
                                                   return $.ajax2({ data : { User : "{$item->get('id')}"} ,
                                                                    url:"{url_to('users_ajax',['action'=>'GroupsList'])}",
                                                                    loading: "#tab-site-dashboard-x-settings-loading",
                                                                    errorTarget: ".site-errors",
                                                                    target: "#actions"});
                                                $("tr#usergroup_"+resp.id).remove();  
                                                updatePager(1);
                                            }
                                 }
                        }); 
          });
          
          $("#New").click( function () { 
               return $.ajax2({ data : { User : "{$item->get('id')}" },
                                url: "{url_to('users_ajax',['action'=>'AddGroups'])}",                              
                                target: "#actions"});
          });
          
          $(".ChangeUserGroup").click( function () {               
                return $.ajax2({ data : { id: this.id , value:$(this).attr('name') },
                                 url :"{url_to('users_ajax',['action'=>'ChangeUserGroup'])}",                                
                                 success: function(resp) { 
                                                 if (resp.action=='ChangeUserGroup')
                                                       changeUserGroupState(resp);
                                          }
                });
          });
                    
          $("#EnabledUserGroups,#DisabledUserGroups").click( function () { 
                params={ usergroups : { selection : {  } , value :(this.id=='DisabledUserGroups'?'NO':'YES') , User : "{$item->get('id')}",token: "{mfForm::getToken('userGroupsChangeForm')}" } };
                idx=0;
                $(".selection:checked").each(function (id) { 
                    if ($(".ChangeUserGroup#"+this.name).attr('name')!=params.usergroups.value)
                       params.usergroups.selection[idx++]= this.name;
                });
                if ($.isEmptyObject(params.usergroups.selection))
                   return ;
                return $.ajax2( { data : params ,
                                  url : "{url_to('users_ajax',['action'=>'ChangeUserGroups'])}",                                
                                  success: function(resp) { 
                                             if (resp.action=='ChangeUserGroups')
                                               changeUserGroupState(resp);                                
                                  }
                });
          });
          
          $('#Cancel').click(function(){ return $.ajax2({ url: "{url_to('users_ajax',['action'=>'ListPartialUser'])}",                                                         
                                                        target: "#actions"}); 
          });
         
</script>