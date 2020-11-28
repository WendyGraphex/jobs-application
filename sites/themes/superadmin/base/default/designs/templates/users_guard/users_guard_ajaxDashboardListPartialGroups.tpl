{messages class="errors"}
<div>
    <a id="New" class="btn" href="#">
        <i class="fa fa-plus" style="margin-right:10px;"></i>
        {*<img  src="{url('/icons/add.gif','picture')}" alt="{__('new')}"/>*}{__('New group')}</a>
</div>
{include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter class="DashboardGroups"}
<button id="DashboardGroups-filter" class="btn-table">{__("filter")|capitalize}</button>   <button id="DashboardGroups-init" class="btn-table">{__("init")|capitalize}</button>
<table class="tabl-list footable table" cellspacing="0">
    <thead>
     <tr class="list-header">
        <th>#</th>
        {if $pager->getNbItems()>5}<th>&nbsp;</th>{/if}
        <th data-hide="phone" style="display: table-cell;" class="label">{__('id')}
             <div>
                 <a href="#" class="DashboardGroups-order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><img  src='{url("/icons/sort_asc`$formFilter.order.id->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                 <a href="#" class="DashboardGroups-order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><img  src='{url("/icons/sort_desc`$formFilter.order.id->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
             </div> 
         </th>
         <th class="footable-first-column" data-toggle="true" class="label">{__('name')}
               <div>
              <a href="#" class="DashboardGroups-order{$formFilter.order.name->getValueExist('asc','_active')}" id="asc" name="name"><img  src='{url("/icons/sort_asc`$formFilter.order.name->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
              <a href="#" class="DashboardGroups-order{$formFilter.order.name->getValueExist('desc','_active')}" id="desc" name="name"><img  src='{url("/icons/sort_desc`$formFilter.order.name->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
             </div> 
         </th>
         <th data-hide="phone" style="display: table-cell;" class="label">{__('state')}</th>
          <th data-hide="phone" style="display: table-cell;" class="label">{__('date creation')}
                <div>
                  <a href="#" class="DashboardGroups-order{$formFilter.order.created_at->getValueExist('asc','_active')}" id="asc" name="created_at"><img  src='{url("/icons/sort_asc`$formFilter.order.created_at->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                  <a href="#" class="DashboardGroups-order{$formFilter.order.created_at->getValueExist('desc','_active')}" id="desc" name="created_at"><img  src='{url("/icons/sort_desc`$formFilter.order.created_at->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
                </div>
          </th>
          <th data-hide="phone" style="display: table-cell;" class="label">{__('date update')}
                <div>
                  <a href="#" class="DashboardGroups-order{$formFilter.order.updated_at->getValueExist('asc','_active')}" id="asc" name="updated_at"><img  src='{url("/icons/sort_asc`$formFilter.order.updated_at->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                  <a href="#" class="DashboardGroups-order{$formFilter.order.updated_at->getValueExist('desc','_active')}" id="desc" name="updated_at"><img  src='{url("/icons/sort_desc`$formFilter.order.updated_at->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
                </div>
          </th>          
          <th data-hide="phone" style="display: table-cell;" class="label">{__('actions')}</th>
     </tr>
</thead>
     <tr>
            <td></td>
            {if $pager->getNbItems()>5}<td></td>{/if}
            <td><input class="DashboardGroups-search" type="text" size="5" name="id" value="{$formFilter.search.id}"></td>
            <td><input class="DashboardGroups-search" type="text" size="5" name="name" value="{$formFilter.search.name}"></td>
            <td>{html_options_format format="__" name="DashboardGroups-is_active" options=$formFilter->search.is_active->getOption('choices') selected=(string)$formFilter.search.is_active}</td> 
            <td></td>
            <td></td> 
            <td></td>
        </tr>       
        {foreach $pager as $group}
        <tr class="groups" id="group_{$group->get('id')} list">
            <td class="groups_count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$group@iteration}</td>
            {if $pager->getNbItems()>5}<td><input class="DashboardGroups-selection" type="checkbox" name="{$group->getId()}" id="{$group->get('name')}"/></td>{/if}
            <td>
                {$group->get('id')}
            </td>
            <td>
                {$group->get('name')|escape}
            </td>
            <td>             
               <a href="#" title="{__('change')}" class="ChangeGroup" id="{$group->get('id')}" name="{$group->get('is_active')}"><img  src="{url('/icons/','picture')}{$group->get('is_active')}.gif" alt='{__("group_`$group->get("is_active")`")}'/></a>
            </td>
            <td>
                {$group->get('created_at')}
            </td>
            <td>
                {$group->get('updated_at')}
            </td>
            <td>
               <a href="#" title="{__('permissions')}" class="ViewPermissions" id="{$group->get('id')}" name="{$group->get('name')}"><img  src="{url('/icons/permission.png','picture')}" alt='{__("permissions")}'/></a>
               <a href="#" title="{__('edit')}" class="View" id="{$group->get('id')}" name="{$group->get('name')}"><img  src="{url('/icons/edit.gif','picture')}" alt='{__("edit")}'/></a>
               <a href="#" title="{__('delete')}" class="Delete" id="{$group->get('id')}" name="{$group->get('name')}"><img  src="{url('/icons/delete.gif','picture')}" alt='{__("delete")}'/></a>
            </td>
        </tr>
        {/foreach}
</table>
{if !$pager->getNbItems()}  
     {__("no result")}
{else}
   {if $pager->getNbItems()>5}
       <input type="checkbox" id="DashboardGroups-all" />  
       <a href="#" title="{__('enable')}" id="EnabledGroups" style="opacity:0.5" class="DashboardGroups-actions_items"><img  src="{url('/icons/YES.gif','picture')}" alt='{__("yes")}'/>
       <a href="#" title="{__('disable')}" id="DisabledGroups" style="opacity:0.5" class="DashboardGroups-actions_items"><img  src="{url('/icons/NO.gif','picture')}" alt='{__("no")}'/></a>
      <a href="#" title="{__('delete')}" id="DeleteGroups" style="opacity:0.5" class="DashboardGroups-actions_items"><img  src="{url('/icons/delete.gif','picture')}" alt='{__("delete")}'/></a>
  {/if}
{/if}    
{include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager}
<script type="text/javascript">
        
        function changeGroupState(resp) 
        {
            $.each(resp.selection?resp.selection:[resp.id], function (id) { 
                sel="a.ChangeGroup#"+this;
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
        
         function getGroupsFilterParameters()
        {
            params={ filter: {  order : { }, 
                                     search: { 
                                               is_active : $("[name=DashboardGroups-is_active]").val()
                                             }, 
                                     nbitemsbypage: $("[name=DashboardGroups-nbitemsbypage]").val(),
                                     token:'{$formFilter->getCSRFToken()}'
                                  }};
            params.filter.order[$(".DashboardGroups-order_active").attr("name")] =$(".DashboardGroups-order_active").attr("id");
            $(".DashboardGroups-search").each(function() { params.filter.search[this.name] =this.value; });                               
            return params;                  
        }
        
        function updateGroupsFilter()
        {
           return $.ajax2({ data: getGroupsFilterParameters(), 
                url:"{url_to('users_guard_ajax',['action'=>'DashboardListPartialGroups'])}" , 
                loading:"#tab-dashboard-superadmin-loading",
                target: "#actions" });
        }
        
        function updatePager(n)
        {
           page_active=$(".DashboardGroups-pager .DashboardGroups-active").html()?parseInt($(".DashboardGroups-pager .DashboardGroups-active").html()):1;
           records_by_page=$("[name=DashboardGroups-nbitemsbypage]").val();
           start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
           $(".groups_count").each(function(id) { $(this).html(start+id) }); // Update index column           
           nb_results=parseInt($("#nb_results").html())-n;
           $("#DashboardGroups-nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
           $("#DashboardGroups-end_result").html($(".groups_count:last").html());
        }
        
      
         // {* PAGER - begin *}
         $('.DashboardGroups-order').click(function() {
             $(".DashboardGroups-order_active").attr('class','DashboardGroups-order');
             $(this).attr('class','DashboardGroups-order_active');
             return updateGroupsFilter();
         });
         
          $("[name=DashboardGroups-nbitemsbypage],[name=DashboardGroups-is_active]").change(function() {  return updateGroupsFilter(); }); 
          
          $(".DashboardGroups-search").keypress(function(event) {
                        if (event.keyCode==13)
                                return updateGroupsFilter();
          });
                   
          $("#DashboardGroups-filter").click(function() { return updateGroupsFilter(); }); 
          
          $("#DashboardGroups-init").click(function() { $.ajax2({ 
                    url:"{url_to('users_guard_ajax',['action'=>'DashboardListPartialGroups'])}",
                    loading:"#tab-dashboard-superadmin-loading",
                    target: "#actions"}); }); 
                             
          $(".DashboardGroups-pager").click(function () {
                    return $.ajax2({ data: getGroupsFilterParameters(), 
                    url:"{url_to('users_guard_ajax',['action'=>'DashboardListPartialGroups'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length),
                    loading:"#tab-dashboard-superadmin-loading",
                    target: "#actions"});
          });
          
          $("#DashboardGroups-all").click(function () {  $(".DashboardGroups-selection").attr("checked",($(this).attr("checked")=="checked"));  });
          // {* PAGER - end *}         
           
          // {* ACTIONS - begin *}
          
          $("#DeleteGroups").click( function () { 
             var params={ selection : {  } };
             text="";
             $(".selection:checked").each(function (id) { 
                params.selection[id]=this.name;
                text+=this.id+",\n";
             });
             if ($.isEmptyObject(params.selection))
                return ;
             if (!confirm("{__('Groups :\u000A\u000A\"#0#\"\u000A\u000A will be deleted. Confirm ?')}".format(text.substring(0,text.lastIndexOf(","))))) 
                 return false; 
             return $.ajax2({ data:params,
                              url :"{url_to('users_guard_ajax',['action'=>'DashboardDeleteGroups'])}",
                              loading:"#tab-dashboard-superadmin-loading",
                              success: function(resp) {
                              
                                            if (resp.action=='deleteGroups')
                                            {                                    
                                                if ($(".groups").length-resp.parameters.length==0)
                                                   return $.ajax2({ url: "{url_to('users_guard_ajax',['action'=>'DashboardListPartial'])}",
                                                                    loading:"#tab-dashboard-superadmin-loading",
                                                                    target: "#actions"});
                                                $.each(resp.parameters, function () {  $("tr#group_"+this).remove(); });
                                                updatePager(resp.parameters.length); 
                                                $("input#all").attr("checked",false);                                    
                                            }   
                                       }
             });    
          });
          
          
          
          $(".Delete").click( function () { 
                if (!confirm('{__("Group \"#0#\" will be deleted. Confirm ?")}'.format(this.name))) return false; 
                $.ajax2({ data : { group: this.id },
                          url: "{url_to('users_guard_ajax',['action'=>'DashboardDeleteGroup'])}",
                          loading:"#tab-dashboard-superadmin-loading",
                          success: function(resp) {
                                            if (resp.action=='deleteGroup')
                                            {    
                                                if ($(".groups").length-1==0)
                                                   return $.ajax2({ url:"{url_to('users_guard_ajax',['action'=>'DashboardListPartialGroups'])}",
                                                                loading:"#tab-dashboard-superadmin-loading",
                                                                target: "#actions"});
                                                $("tr#group_"+resp.id).remove();  
                                                updatePager(1);
                                            }
                                    }
                        }); 
          });
          
          $(".View").click( function () { 
                return $.ajax2({ data : { id: this.id },
                        url: "{url_to('users_guard_ajax',['action'=>'DashboardViewGroup'])}",
                        loading:"#tab-dashboard-superadmin-loading",
                        target: "#actions"});
          });
          
          $("#New").click( function () { 
                return $.ajax2({ url:"{url_to('users_guard_ajax',['action'=>'DashboardNewGroup'])}",
                                loading:"#tab-dashboard-superadmin-loading",
                                target: "#actions"});
          });
                                     
                    
          $(".ChangeGroup").click( function () { 
              return $.ajax2({ data: { id: this.id , value:this.name },
                               url :"{url_to('users_guard_ajax',['action'=>'DashboardChangeGroup'])}",
                               loading:"#tab-dashboard-superadmin-loading",
                               success: function(resp) { 
                                             if (resp.action=='ChangeGroup')
                                                changeGroupState(resp);
                                        }
                         });
          });
          
          $(".ViewPermissions").click( function () { 
                 return $.ajax2({ data: { group: this.id },
             url: "{url_to('users_guard_ajax',['action'=>'DashboardPermissionsList'])}",
             loading:"#tab-dashboard-superadmin-loading",
             target: "#actions"});
          });
          
          $("#EnabledGroups,#DisabledGroups").click( function () { 
                var params={ groups : { selection : {  } , value :(this.id=='DisabledGroups'?'NO':'YES'),token: "{mfForm::getToken('changeGroupsForm')}" } };
                idx=0;
                $(".selection:checked").each(function (id) { 
                    if ($(".ChangeGroup#"+this.name).attr('name')!=params.groups.value)
                       params.groups.selection[idx++]= this.name;
                });
                if ($.isEmptyObject(params.groups.selection))
                   return ;
                return $.ajax2({ data: params ,
                                 url:"{url_to('users_guard_ajax',['action'=>'DashboardChangeGroups'])}",
                                 loading:"#tab-dashboard-superadmin-loading",
                                 success: function(resp) { 
                                             if (resp.action=='ChangeGroups')
                                               changeGroupState(resp);
                                         }
                });
          });
          
             $(".DashboardGroups-selection,#DashboardGroups-all").click(function (){               
                $(".DashboardGroups-actions_items").css('opacity',($(".DashboardGroups-selection:checked").length?'1':'0.5'));
            });
              $('.footable').footable();
        
</script>