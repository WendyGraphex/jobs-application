<script type="text/javascript">
	$(function () {
		$('.footable').footable();
	});
         </script>
{messages class="errors"}
<div>
    <a id="NewPermission" class="btn" href="#"><i class="fa fa-plus" style="margin-right:10px;"></i>{*<img  src="{url('/icons/add.gif','picture')}" alt="{__('new')}"/>*}{__('new permission')|capitalize}</a>
</div>
{include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter class="DashboardPermissions"}
<button id="DashboardPermissions-filter" class="btn-table">{__("filter")|capitalize}</button>   <button id="DashboardPermissions-init">{__("init")|capitalize}</button>
<table cellpadding="0" cellspacing="0" class="tabl-list footable table">
    <thead>
     <tr  class="list-header">
        <th>#</th>
        {if $pager->getNbItems()>5}<th>&nbsp;</th>{/if}
        <th>{__('id')}
             <div>
                 <a href="#" class="DashboardPermissions-order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><img  src='{url("/icons/sort_asc`$formFilter.order.id->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                 <a href="#" class="DashboardPermissions-order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><img  src='{url("/icons/sort_desc`$formFilter.order.id->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
             </div> 
         </th>
         <th class="footable-first-column" data-toggle="true">{__('name')}
               <div>
              <a href="#" class="DashboardPermissions-order{$formFilter.order.name->getValueExist('asc','_active')}" id="asc" name="name"><img  src='{url("/icons/sort_asc`$formFilter.order.name->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
              <a href="#" class="DashboardPermissions-order{$formFilter.order.name->getValueExist('desc','_active')}" id="desc" name="name"><img  src='{url("/icons/sort_desc`$formFilter.order.name->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
             </div> 
         </th>
          <th data-hide="phone,tablet" style="display: table-cell;">{__('date creation')}
                <div>
                  <a href="#" class="DashboardPermissions-order{$formFilter.order.created_at->getValueExist('asc','_active')}" id="asc" name="created_at"><img  src='{url("/icons/sort_asc`$formFilter.order.created_at->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                  <a href="#" class="DashboardPermissions-order{$formFilter.order.created_at->getValueExist('desc','_active')}" id="desc" name="created_at"><img  src='{url("/icons/sort_desc`$formFilter.order.created_at->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
                </div>
          </th>
          <th data-hide="phone,tablet" style="display: table-cell;">{__('date update')}
                <div>
                  <a href="#" class="DashboardPermissions-order{$formFilter.order.updated_at->getValueExist('asc','_active')}" id="asc" name="updated_at"><img  src='{url("/icons/sort_asc`$formFilter.order.updated_at->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                  <a href="#" class="DashboardPermissions-order{$formFilter.order.updated_at->getValueExist('desc','_active')}" id="desc" name="updated_at"><img  src='{url("/icons/sort_desc`$formFilter.order.updated_at->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
                </div>
          </th>
          <th data-hide="phone" style="display: table-cell;">{__('actions')}</th>
     </tr>
</thead>
<tr class="input-list">
            <td></td>
            {if $pager->getNbItems()>5}<td></td>{/if}
            <td><input class="DashboardPermissions-search" type="text" size="5" name="id" value="{$formFilter.search.id}"></td>
            <td><input class="DashboardPermissions-search" type="text" size="5" name="name" value="{$formFilter.search.name}"></td>
            <td></td>
            <td></td>   
            <td></td>
        </tr>       
        {foreach $pager as $permission}
        <tr class="permissions list"  id="permission_{$permission->get('id')}">
            <td class="permissions_count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$permission@iteration}</td>
            {if $pager->getNbItems()>5}<td><input class="DashboardPermissions-selection" type="checkbox" name="{$permission->getId()}" id="{$permission->get('name')}"/></td>{/if}
            <td>
                {$permission->get('id')}
            </td>
            <td>
                {$permission->get('name')|escape}
            </td>
            <td>
                {$permission->get('created_at')}
            </td>
            <td>
                {$permission->get('updated_at')}
            </td>
            <td>
               <a href="#" title="{__('edit')}" class="ViewPermission" id="{$permission->get('id')}" name="{$permission->get('name')}"><img  src="{url('/icons/edit.gif','picture')}" alt='{__("edit")}'/></a>
               <a href="#" title="{__('delete')}" class="DeletePermission" id="{$permission->get('id')}" name="{$permission->get('name')}"><img  src="{url('/icons/delete.gif','picture')}" alt='{__("delete")}'/></a>
            </td>
        </tr>
        {/foreach}
</table>
{if !$pager->getNbItems()}  
     {__("no result")}
{else}
   {if $pager->getNbItems()>5}
       <input type="checkbox" id="DashboardPermissions-all" />  
       <a href="#" title="{__('delete')}" id="DeletePermissions" style="opacity:0.5" class="actions_items"><img  src="{url('/icons/delete.gif','picture')}" alt='{__("delete")}'/></a>
  {/if}
{/if}    
{include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager class="DashboardPermissions"}
<script type="text/javascript">
                 
        
        function getPermissionsFilterParameters()
        {
            var params={ filter: {  order : { }, 
                                     search: { is_active : $("[name=DashboardPermissions-is_active]").val() }, 
                                     nbitemsbypage: $("[name=DashboardPermissions-nbitemsbypage]").val(),
                                     token:'{$formFilter->getCSRFToken()}'
                                  }};
            params.filter.order[$(".DashboardPermissions-order_active").attr("name")] =$(".DashboardPermissions-order_active").attr("id");
            $(".DashboardPermissions-search").each(function() { params.filter.search[this.name] =this.value; });                               
            return params;                  
        }
        
        function updatePermissionsFilter()
        {
           return $.ajax2({ data: getPermissionsFilterParameters(), 
                            loading: "#tab-dashboard-superadmin-loading",
                            url:"{url_to('users_guard_ajax',['action'=>'DashboardListPartialPermission'])}" , 
                            target: "#actions" });
        }
        
        function updatePager(n)
        {
           page_active=$(".DashboardPermissions-pager .active").html()?parseInt($(".DashboardPermissions-pager .DashboardPermissions-active").html()):1;
           records_by_page=$("[name=DashboardPermissions-nbitemsbypage]").val();
           start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
           $(".permissions_count").each(function(id) { $(this).html(start+id) }); // Update index column           
           nb_results=parseInt($("#nb_results").html())-n;
           $("#DashboardPermissions-nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
           $("#DashboardPermissions-end_result").html($(".permissions_count:last").html());
        }
        
 {JqueryScriptsReady}   
        
         // {* PAGER - begin *}
         $('.DashboardPermissions-order').click(function() {
             $(".DashboardPermissions-order_active").attr('class','DashboardPermissions-order');
             $(this).attr('class','DashboardPermissions-order_active');
             return updatePermissionsFilter();
         });
         
          $("[name=DashboardPermissions-nbitemsbypage],[name=DashboardPermissions-is_active]").change(function() { return updatePermissionsFilter(); }); 
          
          $(".DashboardPermissions-search").keypress(function(event) {
                        if (event.keyCode==13)
                            return updatePermissionsFilter();
          });
                   
          $("#DashboardPermissions-filter").click(function() { return updatePermissionsFilter(); }); 
          
          $("#DashboardPermissions-init").click(function() { $.ajax2({ loading: "#tab-dashboard-superadmin-loading", 
                                        url:"{url_to('users_guard_ajax',['action'=>'DashboardListPartialPermission'])}",
                                        target: "#actions"}); }); 

          $(".DashboardPermissions-pager").click(function () {
                  return $.ajax2({ data: getPermissionsFilterParameters(), 
                                    loading: "#tab-dashboard-superadmin-loading",
                                    url: "{url_to('users_guard_ajax',['action'=>'DashboardListPartialPermission'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length),
                                    target: "#actions"});
          });
          
          $("#DashboardPermissions-all").click(function () {  $(".selection").attr("checked",($(this).attr("checked")=="checked"));  });
          // {* PAGER - end *}         
           
          // {* ACTIONS - begin *}
          
          $("#DeletePermissions").click( function () { 
             var params={ selection : {  } };
             text="";
             $(".selection:checked").each(function (id) { 
                params.selection[id]=this.name;
                text+=this.id+",\n";
             });
             if ($.isEmptyObject(params.selection))
                return ;
             if (!confirm("{__('Permissions :\u000A\u000A\"#0#\"\u000A\u000A will be deleted. Confirm ?')}".format(text.substring(0,text.lastIndexOf(","))))) 
                 return false; 
             return $.ajax2({ data: params,
                       url: "{url_to('users_guard_ajax',['action'=>'DashboardDeletesPermission'])}",
                       success: function(resp) {
                                if (resp.action=='deletePermissions')
                                {                                    
                                    if ($(".permissions").length-resp.parameters.length==0)
                                       return $.ajax2({ url:"{url_to('users_guard_ajax',['action'=>'DashboardListPartialPermission'])}",target : "#actions"});
                                    $.each(resp.parameters, function (id) {  $("tr#permission_"+this).remove(); });
                                    updatePager(resp.parameters.length);       
                                    $("input#all").attr("checked",false);                                    
                                }   
                       }
             });    
          });
          
          
          
          $(".DeletePermission").click( function () { 
                if (!confirm('{__("Permission \"#0#\" will be deleted. Confirm ?")}'.format(this.name))) return false; 
                return $.ajax2({ data: { permission: this.id },
                          loading: "#tab-dashboard-superadmin-loading",
                          url: "{url_to('users_guard_ajax',['action'=>'DashboardDeletePermission'])}",
                          success: function(resp) {
                            if (resp.action=='deletePermission')
                            {    
                                if ($(".permissions").length-1==0)
                                   return $.ajax2({ loading: "#tab-dashboard-superadmin-loading",
                                                    url:"{url_to('users_guard_ajax',['action'=>'DashboardListPartialPermission'])}",
                                                    target: "#actions"});
                                $("tr#permission_"+resp.id).remove();  
                                updatePager(1);
                            }
                          }
                        }); 
          });
          
          $(".ViewPermission").click( function () { 
                $.ajax2({ data : { id: this.id },
                                   loading: "#tab-dashboard-superadmin-loading",
                                   url: "{url_to('users_guard_ajax',['action'=>'DashboardViewPermission'])}",
                                   target: "#actions"});
          });
          
          $("#NewPermission").click( function () { 
                $.ajax2({   loading: "#tab-dashboard-superadmin-loading",
                            url: "{url_to('users_guard_ajax',['action'=>'DashboardNewPermission'])}",
                            target: "#actions"});
          });
          
          $(".DashboardPermissions-selection,#DashboardPermissions-all").click(function (){               
                $(".actions_items").css('opacity',($(".selection:checked").length?'1':'0.5'));
          });

  {/JqueryScriptsReady}          
</script>