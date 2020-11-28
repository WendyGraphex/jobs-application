
{messages class="errors"}
<div>
    <a id="NewUser" class="btn" href="#"><i class="fa fa-plus" style="margin-right:10px;"></i>{*<img  src="{url('/icons/add.gif','picture')}" class="icon" style="margin-right: 10px;" alt="{__('new')}"/>*}{__('new user')|capitalize}</a>
  {*  <a id="ExportXLS" href="#"><img  src="{url('/icons/xls.gif','picture')}" alt="{__('new')}"/>{__('export XLS')|capitalize}</a>
    <a id="ExportCSV" href="#"><img  src="{url('/icons/csv.gif','picture')}" alt="{__('new')}"/>{__('export CSV')|capitalize}</a>
    <a id="ExportPDF" href="#"><img  src="{url('/icons/pdf.gif','picture')}" alt="{__('new')}"/>{__('export PDF')|capitalize}</a> *}
</div>
{include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter class="DashboardUsers"}
<button id="DashboardUsers-filter" class="btn-table">{__("filter")|capitalize}</button>   <button class="btn-table" id="DashboardUsers-init">{__("init")|capitalize}</button>
<table class="tabl-list  footable table"  cellpadding="0" cellspacing="0">
    <thead>
     <tr class="list-header">
        <th data-hide="phone" style="display: table-cell;">#</th>
        {if $pager->getNbItems()>5}<th data-hide="phone" style="display: table-cell;">&nbsp;</th>{/if}
        <th data-hide="phone" style="display: table-cell;">{__('id')}
             <div>
                 <a href="#" class="DashboardUsers-order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><img  src='{url("/icons/sort_asc`$formFilter.order.id->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                 <a href="#" class="DashboardUsers-order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><img  src='{url("/icons/sort_desc`$formFilter.order.id->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
             </div> 
         </th>
         <th class="footable-first-column" data-toggle="true">{__('username')}
               <div>
              <a href="#" class="DashboardUsers-order{$formFilter.order.username->getValueExist('asc','_active')}" id="asc" name="username"><img  src='{url("/icons/sort_asc`$formFilter.order.username->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
              <a href="#" class="DashboardUsers-order{$formFilter.order.username->getValueExist('desc','_active')}" id="desc" name="username"><img  src='{url("/icons/sort_desc`$formFilter.order.username->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
             </div> 
         </th>         
         <th data-hide="phone" style="display: table-cell;">{__('first name')}
               <div>
              <a href="#" class="DashboardUsers-order{$formFilter.order.firstname->getValueExist('asc','_active')}" id="asc" name="firstname"><img  src='{url("/icons/sort_asc`$formFilter.order.firstname->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
              <a href="#" class="DashboardUsers-order{$formFilter.order.firstname->getValueExist('desc','_active')}" id="desc" name="firstname"><img  src='{url("/icons/sort_desc`$formFilter.order.firstname->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
             </div> 
         </th>
         <th data-hide="phone" style="display: table-cell;">{__('last name')}
              <div>
              <a href="#" class="DashboardUsers-order{$formFilter.order.lastname->getValueExist('asc','_active')}" id="asc" name="lastname"><img  src='{url("/icons/sort_asc`$formFilter.order.lastname->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
              <a href="#" class="DashboardUsers-order{$formFilter.order.lastname->getValueExist('desc','_active')}" id="desc" name="lastname"><img  src='{url("/icons/sort_desc`$formFilter.order.lastname->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
             </div> 
         </th>
          <th data-hide="phone" style="display: table-cell;">{__('email')}
               <div>
              <a href="#" class="DashboardUsers-order{$formFilter.order.email->getValueExist('asc','_active')}" id="asc" name="email"><img  src='{url("/icons/sort_asc`$formFilter.order.email->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
              <a href="#" class="DashboardUsers-order{$formFilter.order.email->getValueExist('desc','_active')}" id="desc" name="email"><img  src='{url("/icons/sort_desc`$formFilter.order.email->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
             </div> 
          </th>
          <th data-hide="phone,tablet" style="display: table-cell;">{__('state')}</th>
          <th data-hide="phone,tablet" style="display: table-cell;">{__('date creation')}
                <div>
                  <a href="#" class="DashboardUsers-order{$formFilter.order.created_at->getValueExist('asc','_active')}" id="asc" name="created_at"><img  src='{url("/icons/sort_asc`$formFilter.order.created_at->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                  <a href="#" class="DashboardUsers-order{$formFilter.order.created_at->getValueExist('desc','_active')}" id="desc" name="created_at"><img  src='{url("/icons/sort_desc`$formFilter.order.created_at->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
                </div>
          </th>
          <th data-hide="phone,tablet" style="display: table-cell;">{__('last login')}
                <div>
                  <a href="#" class="DashboardUsers-order{$formFilter.order.lastlogin->getValueExist('asc','_active')}" id="asc" name="lastlogin"><img  src='{url("/icons/sort_asc`$formFilter.order.lastlogin->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                  <a href="#" class="DashboardUsers-order{$formFilter.order.lastlogin->getValueExist('desc','_active')}" id="desc" name="lastlogin"><img  src='{url("/icons/sort_desc`$formFilter.order.lastlogin->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
                </div>
          </th>
          <th data-hide="phone,tablet" style="display: table-cell;">{__('last password generation')}
                <div>
                  <a href="#" class="DashboardUsers-order{$formFilter.order.last_password_gen->getValueExist('asc','_active')}" id="asc" name="last_password_gen"><img  src='{url("/icons/sort_asc`$formFilter.order.last_password_gen->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a> 
                  <a href="#" class="DashboardUsers-order{$formFilter.order.last_password_gen->getValueExist('desc','_active')}" id="desc" name="last_password_gen"><img  src='{url("/icons/sort_desc`$formFilter.order.last_password_gen->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a> 
                </div>
          </th>
          <th  class="footable-last-column" data-hide="phone" style="display: table-cell;">{__('actions')}</th>
     </tr>
</thead>
     <tr class="input-list">
            <td></td>
            {if $pager->getNbItems()>5}<td></td>{/if}
            <td><input class="DashboardUsers-search" type="text" size="1" name="id" value="{$formFilter.search.id}"></td>
            <td><input class="DashboardUsers-search" type="text" size="12" name="username" value="{$formFilter.search.username}"></td>
            <td><input class="DashboardUsers-search" type="text" size="12" name="firstname" value="{$formFilter.search.firstname}"></td>
            <td><input class="DashboardUsers-search" type="text" size="12" name="lastname" value="{$formFilter.search.lastname}"></td>
            <td><input class="DashboardUsers-search" type="text" size="24" name="email" value="{$formFilter.search.email}"></td>
            <td>{html_options_format class="DashboardUsers" format="__" name="is_active" options=$formFilter->search.is_active->getOption('choices') selected=(string)$formFilter.search.is_active}</td>
            <td></td>
            <td></td>   
            <td></td>
            <td></td>
        </tr>       
        {foreach $pager as $user}
        <tr class="users list" id="user_{$user->get('id')}">
            <td class="users_count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$user@iteration}</td>
            {if $pager->getNbItems()>5}<td><input class="DashboardUsers-selection" type="checkbox" name="{$user->getId()}" id="{$user->get('firstname')} {$user->get('lastname')} ({$user->get('username')})" /></td>{/if}
            <td>
                {$user->getId()}
            </td>
            <td>
                {$user->get('username')|escape}
            </td>
            <td>
                {$user->get('firstname')|escape}
            </td>
             <td>
                {$user->get('lastname')|escape}
            </td>
            <td>
                {$user->get('email')|escape}
            </td>
            <td>
               {* {$user->get('is_active')} *}
               <a href="#" title="{__('change')}" class="ChangeUser" id="{$user->get('id')}" name="{$user->get('is_active')}"><img  src="{url('/icons/','picture')}{$user->get('is_active')}.gif" alt='{__("user_`$user->get("is_active")`")}'/></a>
            </td>
            <td>
                {$user->get('created_at')|escape}
            </td>
            <td>
                {$user->get('lastlogin')|escape}
            </td>
            <td id="lastpasswordgen_{$user->get('id')}">
                {$user->get('last_password_gen')|escape}
            </td>
            <td class='action-user'>
               <a href="#" title="{__('regenerate password')}" class="RegeneratePasswordUser" id="{$user->get('id')}" name="{$user->get('firstname')} {$user->get('lastname')}"><img  src="{url('/icons/password.png','picture')}" alt='{__("regenerate password")}'/></a>
               <a href="#" title="{__('groups')}" class="ViewGroupUser" id="{$user->get('id')}" name="{$user->get('firstname')} {$user->get('lastname')}"><img  src="{url('/icons/group.png','picture')}" alt='{__("group")}'/></a>
               <a href="#" title="{__('permissions')}" class="ViewPermissionsUser" id="{$user->get('id')}" name="{$user->get('firstname')} {$user->get('lastname')}"><img  src="{url('/icons/permission.png','picture')}" alt='{__("permissions")}'/></a>
               <a href="#" title="{__('all permissions')}" class="ViewAllPermissionsUser" id="{$user->get('id')}"><img  src="{url('/icons/permission.png','picture')}" alt='{__("permissions")}'/></a>
               <a href="#" title="{__('edit')}" class="ViewUser" id="{$user->get('id')}" name="{$user->get('firstname')} {$user->get('lastname')}"><img  src="{url('/icons/edit.gif','picture')}" alt='{__("edit")}'/></a>
               <a href="#" title="{__('delete')}" class="DeleteUser" id="{$user->get('id')}" name="{$user->get('firstname')} {$user->get('lastname')} ({$user->get('username')})"><img  src="{url('/icons/delete.gif','picture')}" alt='{__("delete")}'/></a>
            </td>
        </tr>
        {/foreach}
</table>
{if !$pager->getNbItems()}  
     {__("no result")}
{else}
   {if $pager->getNbItems()>5}
       <input type="checkbox" id="DashboardUsers-all" />  
       <a href="#" title="{__('enable')}" id="EnabledUsers" style="opacity:0.5" class="DashboardUsers-actions_items"><img  src="{url('/icons/YES.gif','picture')}" alt='{__("yes")}'/>
       <a href="#" title="{__('disable')}" id="DisabledUsers" style="opacity:0.5" class="DashboardUsers-actions_items"><img  src="{url('/icons/NO.gif','picture')}" alt='{__("no")}'/></a>
       <a href="#" title="{__('delete')}" id="DeleteUsers" style="opacity:0.5" class="DashboardUsers-actions_items"><img  src="{url('/icons/delete.gif','picture')}" alt='{__("delete")}'/></a>
  {/if}
{/if}    
{include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager class="DashboardUsers"}
<script type="text/javascript">
        
        function changeUserState(resp) 
        {
            $.each(resp.selection?resp.selection:[resp.id], function (id) { 
                sel="a.ChangeUser#"+this;
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

        function getUsersFilterParameters()
        {
            params={ filter: {  order : { }, 
                                     search: { 
                                               is_active : $(".DashboardUsers[name=is_active]").val()
                                             }, 
                                     nbitemsbypage: $("[name=DashboardUsers-nbitemsbypage]").val(),
                                     token:'{$formFilter->getCSRFToken()}'
                                  }};
            params.filter.order[$(".DashboardUsers-order_active").attr("name")] =$(".DashboardUsers-order_active").attr("id");
            $(".DashboardUsers-search").each(function() { params.filter.search[this.name] =this.value; });                               
            return params;                  
        }
        
        function updateUsersFilter()
        {
           return $.ajax2({ data : getUsersFilterParameters(),
                            loading: "#tab-dashboard-superadmin-loading",
                            url:"{url_to('users_dashboard_ajax',['action'=>'DashboardListPartial'])}", 
                            target : "#actions" });
        }
        
        function updatePager(n)
        {
           page_active=$(".DashboardUsers-pager .DashboardUsers-active").html()?parseInt($(".DashboardUsers-pager .DashboardUsers-active").html()):1;
           records_by_page=$("[name=DashboardUsers-nbitemsbypage]").val();
           start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
           $(".users_count").each(function(id) { $(this).html(start+id) }); // Update index column           
           nb_results=parseInt($("#nb_results").html())-n;
           $("#DashboardUsers-nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
           $("#DashboardUsers-end_result").html($(".users_count:last").html());
        }
        
  
         // {* PAGER - begin *}
         $('.DashboardUsers-order').click(function() {
            $(".DashboardUsers-order_active").attr('class','DashboardUsers-order');
            $(this).attr('class','DashboardUsers-order_active');
            return updateUsersFilter();
         });
         
          $(".DashboardUsers[name=is_active],[name=DashboardUsers-nbitemsbypage]").change(function() { return updateUsersFilter(); }); 
          
          $(".DashboardUsers-search").keypress(function(event) {
                        if (event.keyCode==13)
                        {
                             return updateUsersFilter();
                        }     
          });
                   
          $("#DashboardUsers-filter").click(function() { return updateUsersFilter(); }); 
          
          $("#DashboardUsers-init").click(function() { return $.ajax2({ 
                                    loading: "#tab-dashboard-superadmin-loading",
                                    url :"{url_to('users_dashboard_ajax',['action'=>'DashboardListPartial'])}", 
                                    target: "#actions" }); }); 
                             
          $(".DashboardUsers-pager").click(function () {
                    return $.ajax2({ data: getUsersFilterParameters(), 
                                     loading: "#tab-dashboard-superadmin-loading",
                                     url:"{url_to('users_dashboard_ajax',['action'=>'DashboardListPartial'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length) , 
                                     target: "#actions" });
          });
          
          $("#DashboardUsers-all").click(function () {  $(".DashboardUsers-selection").attr("checked",($(this).attr("checked")=="checked"));  });
           // {* PAGER - end *}         
           
           // {* ACTIONS - begin *}
          $("#EnabledUsers,#DisabledUsers").click( function () { 
                var params={ users: { selection : {  } , value :(this.id=='DisabledUsers'?'NO':'YES'),token: "{mfForm::getToken('changeUsersForm')}" } };
                idx=0;
                $(".selection:checked").each(function (id) { 
                    if ($(".ChangeUser#"+this.name).attr('name')!=params.users.value)
                       params.users.selection[idx++]= this.name;
                });
                if ($.isEmptyObject(params.users.selection))
                   return ;
                return $.ajax2({
                    data : params,
                    loading: "#tab-dashboard-superadmin-loading",
                    url :"{url('module/dashboard/users/ChangeUsers')}",
                    success : function(resp) { 
                                 if (resp.action=='ChangeUsers')
                                   changeUserState(resp); 
                             }
                });
                
          });
          
          $("#DeleteUsers").click( function () { 
             var params={ selection : {  } };
             text="";
             $(".DashboardUsers-selection:checked").each(function (id) { 
                params.selection[id]=this.name;
                text+=this.id+",\n";
             });
             if ($.isEmptyObject(params.selection))
                return ;
             if (!confirm("{__('Users :\u000A\u000A\"#0#\"\u000A\u000A will be deleted. Confirm ?')}".format(text.substring(0,text.lastIndexOf(","))))) 
                 return false; 
             return $.ajax2({
                 data : params,
                 loading: "#tab-dashboard-superadmin-loading",
                 url : "{url_to('users_dashboard_ajax',['action'=>'DashboardDeletesUser'])}",
                 success: function(resp) {
                            if (resp.action=='deletesDashboardUser')
                            {                                    
                                if ($(".users").length-resp.parameters.length==0)
                                    return $.ajax2({  loading: "#tab-dashboard-superadmin-loading",
                                                      url:"{url_to('users_dashboard_ajax',['action'=>'DashboardListPartial'])}", 
                                                      target :"#actions" });
                                $.each(resp.parameters, function (id) {  $("tr#user_"+this).remove(); }); 
                                // Update Number of results
                                updatePager(resp.parameters.length);      
                                $("input#all").attr("checked",false);                                    
                            }       
                       }
             });
          });
          
          
          
          $(".DeleteUser").click( function () { 
             if (!confirm('{__("User \"#0#\" will be deleted. Confirm ?")}'.format(this.name))) return false; 
             return $.ajax2({
                 data: { user: this.id },
                 loading: "#tab-dashboard-superadmin-loading",
                 url: "{url_to('users_dashboard_ajax',['action'=>'DashboardDeleteUser'])}",
                 success: function(resp) {
                            if (resp.action=='deleteUser')
                            {    
                                if ($(".users").length-1==0)
                                   return $.ajax2({  loading: "#tab-dashboard-superadmin-loading",
                                                     url: "{url_to('users_dashboard_ajax',['action'=>'DashboardListPartial'])}",
                                                     target : "#actions" });
                                $("tr#user_"+resp.id).remove();  
                                updatePager(1);
                            }
                        }
             }); 
          });
          
          $(".ViewUser").click( function () {  return $.ajax2({ 
                            data: { id: this.id },
                            loading: "#tab-dashboard-superadmin-loading",
                            url:"{url_to('users_dashboard_ajax',['action'=>'DashboardViewUser'])}", 
                            target : "#actions" }); 
          });
          
          $("#NewUser").click( function () { return $.ajax2({ 
                            loading: "#tab-dashboard-superadmin-loading",
                            url:"{url_to('users_dashboard_ajax',['action'=>'DashboardNewUser'])}", 
                            target : "#actions" }); });
          
          $(".ChangeUser").click( function () { 
               return $.ajax2({ 
                            data : { id: this.id , value:this.name },
                            loading: "#tab-dashboard-superadmin-loading",
                            url: "{url_to('users_dashboard_ajax',['action'=>'DashboardChangeUser'])}",
                            success: function(resp) { 
                                        if (resp.action=='ChangeUser')
                                            changeUserState(resp);
                                     }
                    });
          });
          
          $(".RegeneratePasswordUser").click( function () { 
                    return $.ajax2({ data : { id: this.id },
                                   loading: "#tab-dashboard-superadmin-loading",
                                   url :"{url_to('users_dashboard_ajax',['action'=>'DashboardRegeneratePasswordUser'])}",
                                   success: function(resp) { 
                                               if (resp.action=='RegeneratePasswordUser'&&resp.params.id&&resp.params.date)
                                                     $("#lastpasswordgen_"+resp.params.id).html(resp.params.date);
                                   }
                         });
          });
          
          $(".ViewPermissionsUser").click( function () { 
              return $.ajax2({  data : { user: this.id },
                                loading: "#tab-dashboard-superadmin-loading",
                                url: "{url_to('users_dashboard_ajax',['action'=>'DashboardPermissionsList'])}",
                                target : "#actions" });
          });
          
          $(".ViewAllPermissionsUser").click( function () { 
              return $.ajax2({  data : { user: this.id },
                                loading: "#tab-dashboard-superadmin-loading",
                                url: "{url_to('users_dashboard_ajax',['action'=>'DashboardAllPermissionsList'])}",
                                target : "#actions" });
          });
          
          $(".ViewGroupUser").click( function () { 
              return $.ajax2({  data : { user: this.id },
                                loading: "#tab-dashboard-superadmin-loading",
                                url: "{url_to('users_dashboard_ajax',['action'=>'DashboardGroupsList'])}",
                                target : "#actions" });
          });
          
          $(".DashboardUsers-selection,#DashboardUsers-all").click(function (){               
                $(".DashboardUsers-actions_items").css('opacity',($(".DashboardUsers-selection:checked").length?'1':'0.5'));
          });
          
		$('.footable').footable();

      
</script>