{messages class="{$site->getSiteID()}-site-errors"}
{if  $user->isLoaded()}
    <h3>{__('user')|capitalize} : {$user->get('username')} [{$user}] - {__('groups')|capitalize}</h3>    
    <div>
        <a id="UserGroup-New" class="btn" href="#"><i class="fa fa-plus" style="margin-right:10px;"></i>{*<img  src="{url('/icons/add.gif','picture')}" alt="{__('new')}"/>*}{__('add group')|capitalize}</a>
        <a href="#" class="btn" id="UserGroup-Cancel">
             <i class="fa fa-times" style="color:#000;margin-right:10px;"></i>
             {*<img  src="{url('/icons/cancel.gif','picture')}" alt="{__('cancel')}"/>*}{__('cancel')}</a>
    </div>
    {if  $pager->getNbItems()}
        {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter class="UserGroup"}
        <button id="UserGroup-filter" class="btn-table">{__("filter")|capitalize}</button>   <button id="UserGroup-init" class="btn-table">{__("init")|capitalize}</button>     
        <table class="tabl-list  footable table" cellpadding="0" cellspacing="0">
            <thead>
                <tr class="list-header">
                <th>#</th>
                {if $pager->getNbItems()>5}<th>&nbsp;</th>{/if}
                <th data-hide="phone" style="display: table-cell;">{__('id')}
                     <div>
                         <a href="#" class="UserGroup-order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><img  src='{url("/icons/sort_asc`$formFilter.order.id->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                         <a href="#" class="UserGroup-order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><img  src='{url("/icons/sort_desc`$formFilter.order.id->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
                     </div> 
                 </th>
                 <th class="footable-first-column" data-toggle="true">{__('name')}
                     <div>
                          <a href="#" class="UserGroup-order{$formFilter.order.name->getValueExist('asc','_active')}" id="asc" name="name"><img  src='{url("/icons/sort_asc`$formFilter.order.name->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                          <a href="#" class="UserGroup-order{$formFilter.order.name->getValueExist('desc','_active')}" id="desc" name="name"><img  src='{url("/icons/sort_desc`$formFilter.order.name->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
                     </div> 
                 </th>      
                 <th data-hide="phone" style="display: table-cell;">{__('state')}</th>
                 <th data-hide="phone" style="display: table-cell;">{__('actions')}</th>
             </tr>
         </thead> 
             <tr class="input-list">
                    <td></td>
                    {if $pager->getNbItems()>5}<td></td>{/if}
                    <td><input class="UserGroup-search" type="text" size="5" name="id" value="{$formFilter.search.id}"></td>
                    <td><input class="UserGroup-search" type="text" size="5" name="name" value="{$formFilter.search.name}"></td> 
                    <td>{html_options_format class="UserGroup" format="__" name="is_active" options=$formFilter->search.is_active->getOption('choices') selected=(string)$formFilter.search.is_active}</td>
                    <td></td>
                </tr>       
                {foreach $pager as $usergroup}
                <tr class="UserGroup list" id="UserGroup-{$usergroup->get('id')}">
                    <td class="UserGroup-count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$usergroup@iteration}</td>
                    {if $pager->getNbItems()>5}<td><input class="UserGroup-selection" type="checkbox" name="{$usergroup->get('id')}" id="{$usergroup->get('name')}"/></td>{/if}
                    <td>
                        {$usergroup->get('id')}
                    </td>
                    <td>
                        {$usergroup->get('name')}
                    </td>
                    <td>
                       <a href="#" title="{__('change')}" class="UserGroup-ChangeUserGroup" id="{$usergroup->get('id')}" name="{$usergroup->get('is_active')}"><img  src="{url('/icons/','picture')}{$usergroup->get('is_active')}.gif" alt='{__("usergroup_`$usergroup->get("is_active")`")}'/></a>
                    </td>                    
                    <td>
                       <a href="#" title="{__('delete')}" class="UserGroup-DeleteUserGroup" id="{$usergroup->get('id')}" name="{$usergroup->get('name')}"><img  src="{url('/icons/delete.gif','picture')}" alt='{__("delete")}'/></a>
                    </td>
                </tr>
                {/foreach}
        </table>
        {if $pager->getNbItems()>5}
               <input type="checkbox" id="UserGroup-all" />  
               <a href="#" title="{__('enable')}" id="UserGroup-EnabledUserGroups"><img  src="{url('/icons/YES.gif','picture')}" alt='{__("yes")}'/>
               <a href="#" title="{__('disable')}" id="UserGroup-DisabledUserGroups"><img  src="{url('/icons/NO.gif','picture')}" alt='{__("no")}'/></a>
               <a href="#" title="{__('delete')}" id="UserGroup-DeleteUserGroups"><img  src="{url('/icons/delete.gif','picture')}" alt='{__("delete")}'/></a>
        {/if}
        {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager class="UserGroup"}
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
                    sel="a.UserGroup-ChangeUserGroup#"+this;
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
            var params={   User : "{$user->get('id')}",
                       filter: {  order : { }, 
                                     search: { is_active : $(".UserGroup[name=is_active]").val() }, 
                                     nbitemsbypage: $("[name=UserGroup-nbitemsbypage]").val(),
                                     token:'{$formFilter->getCSRFToken()}'
                                  }};
            params.filter.order[$(".UserGroup-order_active").attr("name")] =$(".UserGroup-order_active").attr("id");
            $(".UserGroup-search").each(function(id) { params.filter.search[this.name] =this.value; });                               
            return params;                  
        }
        
        function updateUserGroupFilter()
        {
           return $.ajax2({ data: getUserGroupFilterParameters(), 
                            url:"{url_to('users_site_ajax',['action'=>'GroupsList'])}" , 
                            target: "#{$site->getSiteID()}-actions" });
        }
        
        function updatePager(n)
        {
           page_active=$(".UserGroup-pager .UserGroup-active").html()?parseInt($(".UserGroup-pager .UserGroup-active").html()):1;
           records_by_page=$("[name=UserGroup-nbitemsbypage]").val();
           start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
           $(".UserGroup-count").each(function(id) { $(this).html(start+id) }); // Update index column           
           nb_results=parseInt($("#UserGroup-nb_results").html())-n;
           $("#UserGroup-nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
           $("#UserGroup-end_result").html($(".UserGroup-count:last").html());
        }
        
         // {* PAGER - begin *}
         $('.UserGroup-order').click(function() {
             $(".UserGroup-order_active").attr('class','UserGroup-order');
             $(this).attr('class','UserGroup-order_active');
             updateUserGroupFilter();
          });
         
          $("[name=UserGroup-nbitemsbypage],.UserGroup[name=is_active]").change(function() { updateUserGroupFilter(); }); 
          
          $(".UserGroup-search").keypress(function(event) {
                        if (event.keyCode==13)
                             updateUserGroupFilter();
          });
                   
          $("#UserGroup-filter").click(function() { updateUserGroupFilter(); }); 
          
          $("#UserGroup-init").click(function() { 
                            return $.ajax2({ data : { User : "{$user->get('id')}" },
                                             url: "{url_to('users_site_ajax',['action'=>'GroupsList'])}",
                                             target: "#{$site->getSiteID()}-actions"}); }); 
                             
          $(".UserGroup-pager").click(function () {
                  return $.ajax2({ data:getUserGroupFilterParameters(),
                                    url: "{url_to('users_site_ajax',['action'=>'GroupsList'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length),
                                    loading: "#tab-site-{$site->getSiteID()}-dashboard-site-x-settings-loading",
                                    errorTarget: ".{$site->getSiteID()}-site-errors",
                                    target: "#{$site->getSiteID()}-actions" });           
                });
          
          $("#UserGroup-all").click(function () {  $(".UserGroup-selection").attr("checked",($(this).attr("checked")=="checked"));  });
          // {* PAGER - end *}         
           
          // {* ACTIONS - begin *}
          
          $("#UserGroup-DeleteUserGroups").click( function () { 
             var params={ selection : {  }, User : "{$user->get('id')}" };
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
                              url: "{url_to('users_site_ajax',['action'=>'DeleteGroups'])}",
                              success: function(resp) {
                                            if (resp.action=='deleteUserGroups')
                                            {                                    
                                                if ($(".UserGroup").length-resp.parameters.length==0)
                                                   return $.ajax2({ data : { user : "{$user->get('id')}"} ,
                                                                             url:"{url_to('users_site_ajax',['action'=>'GroupsList'])}",
                                                                             loading: "#tab-site-{$site->getSiteID()}-dashboard-site-x-settings-loading",
                                                                             errorTarget: ".{$site->getSiteID()}-site-errors",
                                                                             target: "#{$site->getSiteID()}-actions"
                                                                    });
                                                $.each(resp.parameters, function (id) {  $("tr#UserGroup-"+this).remove(); });
                                                updatePager(resp.parameters.length);
                                                $("#UserGroup-all").attr("checked",false);                                    
                                            }       
                              }
             });    
          });
          
          $(".UserGroup-DeleteUserGroup").click( function () { 
                if (!confirm('{__("Group \"#0#\" will be deleted. Confirm ?")}'.format(this.name))) return false; 
                return $.ajax2({ data : { userGroup: $(this).attr('id') },
                                 url :"{url_to('users_site_ajax',['action'=>'DeleteGroup'])}",
                                 success: function(resp) {
                                            if (resp.action=='deleteUserGroup')
                                            {    
                                                if ($(".UserGroup").length-1==0)
                                                   return $.ajax2({ data : { user : "{$user->get('id')}"} ,
                                                                    url:"{url_to('users_site_ajax',['action'=>'GroupsList'])}",
                                                                    loading: "#tab-site-{$site->getSiteID()}-dashboard-site-x-settings-loading",
                                                                    errorTarget: ".{$site->getSiteID()}-site-errors",
                                                                    target: "#{$site->getSiteID()}-actions"});
                                                $("tr#UserGroup-"+resp.id).remove();  
                                                updatePager(1);
                                            }
                                 }
                        }); 
          });
          
          $("#UserGroup-New").click( function () { 
               return $.ajax2({ data : { User : "{$user->get('id')}" },
                                url: "{url_to('users_site_ajax',['action'=>'AddGroups'])}",
                                loading: "#tab-site-{$site->getSiteID()}-dashboard-site-x-settings-loading",
                                errorTarget: ".{$site->getSiteID()}-site-errors",
                                target: "#{$site->getSiteID()}-actions"});
          });
          
          $(".UserGroup-ChangeUserGroup").click( function () { 
                return $.ajax2({ data : { id: this.id , value:this.name },
                                 url :"{url_to('users_site_ajax',['action'=>'ChangeUserGroup'])}",
                                 success: function(resp) { 
                                                 if (resp.action=='ChangeUserGroup')
                                                       changeUserGroupState(resp);
                                          }
                });
          });
                    
          $("#UserGroup-EnabledUserGroups,#UserGroup-DisabledUserGroups").click( function () { 
                params={ usergroups : { selection : {  } , value :(this.id=='UserGroup-DisabledUserGroups'?'NO':'YES') , User : "{$user->get('id')}",token: "{mfForm::getToken('userGroupsChangeForm')}" } };
                idx=0;
                $(".UserGroup-selection:checked").each(function (id) { 
                    if ($(".UserGroup-ChangeUserGroup#"+this.name).attr('name')!=params.usergroups.value)
                       params.usergroups.selection[idx++]= this.name;
                });
                if ($.isEmptyObject(params.usergroups.selection))
                   return ;
                return $.ajax2( { data : params ,
                                  url : "{url_to('users_site_ajax',['action'=>'ChangeUserGroups'])}",
                                  success: function(resp) { 
                                             if (resp.action=='ChangeUserGroups')
                                               changeUserGroupState(resp);                                
                                  }
                });
          });
          
          $('#UserGroup-Cancel').click(function(){ return $.ajax2({ url: "{url_to('users_site_ajax',['action'=>'ListPartial'])}",
                                                          loading: "#tab-site-{$site->getSiteID()}-dashboard-site-x-settings-loading",
                                                        errorTarget: ".{$site->getSiteID()}-site-errors",
                                                        target: "#{$site->getSiteID()}-actions"}); 
          });
          
          
	$('.footable').footable();
	
</script>