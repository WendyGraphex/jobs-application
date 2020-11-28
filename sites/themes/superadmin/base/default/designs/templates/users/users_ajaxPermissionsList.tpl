{messages class="{$site->getSiteID()}-site-errors"}
{if  $user->isLoaded()}
    <h3>{__('user')|capitalize} : {$user->get('username')} [{$user}] - {__('permissions')|capitalize}</h3>    
    <div>
        <a id="{$site->getSiteID()}-UserPermission-AddPermission" class="btn" href="#">
            <i class="fa fa-plus" style="margin-right:10px;"></i>
            {*<img  src="{url('/icons/add.gif','picture')}" alt="{__('new')}"/>*}{__('add permission')|capitalize}</a>
        <a href="#" id="{$site->getSiteID()}-UserPermission-Cancel" class="btn">
             <i class="fa fa-times" style="color:#000;margin-right:10px;"></i>
             {*<img  src="{url('/icons/cancel.gif','picture')}" alt="{__('cancel')}"/>*}{__('cancel')}</a>
    </div>
    {if  $pager->getNbItems()}
        {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter class="{$site->getSiteID()}-UserPermission"}
        <button id="{$site->getSiteID()}-UserPermission-filter" class="btn-table">{__("filter")|capitalize}</button>   
        <button id="{$site->getSiteID()}-UserPermission-init" class="btn-table">{__("init")|capitalize}</button>
        <table class="tabl-list  footable table" cellpadding="0" cellspacing="0">
            <thead>
             <tr class="list-header">
                <th>#</th>
                {if $pager->getNbItems()>5}<th>&nbsp;</th>{/if}
                <th data-hide="phone" style="display: table-cell;">{__('id')}
                     <div>
                         <a href="#" class="{$site->getSiteID()}-UserPermission-order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><img  src='{url("/icons/sort_asc`$formFilter.order.id->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                         <a href="#" class="{$site->getSiteID()}-UserPermission-order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><img  src='{url("/icons/sort_desc`$formFilter.order.id->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
                     </div> 
                 </th>
                 <th class="footable-first-column" data-toggle="true">{__('name')}
                       <div>
                      <a href="#" class="{$site->getSiteID()}-UserPermission-order{$formFilter.order.name->getValueExist('asc','_active')}" id="asc" name="name"><img  src='{url("/icons/sort_asc`$formFilter.order.name->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                      <a href="#" class="{$site->getSiteID()}-UserPermission-order{$formFilter.order.name->getValueExist('desc','_active')}" id="desc" name="name"><img  src='{url("/icons/sort_desc`$formFilter.order.name->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
                     </div> 
                 </th>         
                 <th data-hide="phone" style="display: table-cell;">{__('actions')}</th>
             </tr>
</thead>
             <tr class="input-list">
                    <td></td>
                    {if $pager->getNbItems()>5}<td></td>{/if}
                    <td></td>
                    <td></td> 
                    <td></td>
                </tr>       
                {foreach $pager as $permission}
                <tr class="permissions list" id="permission_{$permission->get('id')}">
                    <td class="permissions_count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$permission@iteration}</td>
                    {if $pager->getNbItems()>5}<td><input class="selection" type="checkbox" name="{$permission->get('id')}" id="{$permission->get('name')}"/></td>{/if}
                    <td>
                        {$permission->get('id')}
                    </td>
                    <td>
                         {__($permission->get('name'),'','permissions')}
                    </td>
                    <td>
                       <a href="#" title="{__('delete')}" class="{$site->getSiteID()}-UserPermission-DeletePermission" id="{$permission->get('id')}" name="{$permission->get('name')}"><img  src="{url('/icons/delete.gif','picture')}" alt='{__("delete")}'/></a>
                    </td>
                </tr>
                {/foreach}
        </table>
        {if $pager->getNbItems()>5}
               <input type="checkbox" id="all" />  
               <a href="#" title="{__('delete')}" id="DeletePermissions"><img  src="{url('/icons/delete.gif','picture')}" alt='{__("delete")}'/></a>
        {/if}
        {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager class="{$site->getSiteID()}-UserPermission"}
    {else}
            {__("no result")}
    {/if}
{else}
    {__("user doesn't exist")}
{/if}    
<script type="text/javascript">
    
        function getPermissionsFilterParameters()
        {
            var params={ User : "{$user->get('id')}",
                     filter: {  order : { }, 
                                     search: {                                                
                                             }, 
                                     nbitemsbypage: $("[name={$site->getSiteID()}-UserPermission-nbitemsbypage]").val(),
                                     token:'{$formFilter->getCSRFToken()}'
                                  }};
            params.filter.order[$(".{$site->getSiteID()}-UserPermission-order_active").attr("name")] =$(".{$site->getSiteID()}-UserPermission-order_active").attr("id");
            $(".{$site->getSiteID()}-UserPermission-search").each(function() { params.filter.search[this.name] =this.value; });                               
            return params;                  
        }
        
        function updatePermissionsFilter()
        {
           return $.ajax2({ data: getPermissionsFilterParameters(), 
                            url:"{url_to('users_site_ajax',['action'=>'PermissionsList'])}" , 
                            loading: "#tab-site-{$site->getSiteID()}-dashboard-site-x-settings-loading",
                            errorTarget: ".{$site->getSiteID()}-site-errors",
                            target: "#{$site->getSiteID()}-actions" });
        }
        
        function updatePager(n)
        {
           page_active=$(".{$site->getSiteID()}-UserPermission-pager .active").html()?parseInt($(".{$site->getSiteID()}-UserPermission-pager .active").html()):1;
           records_by_page=$("[name={$site->getSiteID()}-UserPermission-nbitemsbypage]").val();
           start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
           $(".permissions_count").each(function(id) { $(this).html(start+id) }); // Update index column           
           nb_results=parseInt($("#{$site->getSiteID()}-UserPermission-nb_results").html())-n;
           $("#{$site->getSiteID()}-UserPermission-nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
           $("#{$site->getSiteID()}-UserPermission-end_result").html($(".permissions_count:last").html());
        }
         // {* PAGER - begin *}
         $('.{$site->getSiteID()}-UserPermission-order').click(function() {
            $(".{$site->getSiteID()}-UserPermission-order_active").attr('class','{$site->getSiteID()}-UserPermission-order');
            $(this).attr('class','{$site->getSiteID()}-UserPermission-order_active');
            return updatePermissionsFilter();
         });
         
          $("[name={$site->getSiteID()}-UserPermission-nbitemsbypage],[name={$site->getSiteID()}-UserPermission-is_active]").change(function() { return updatePermissionsFilter(); }); 
          
          $(".{$site->getSiteID()}-UserPermission-search").keypress(function(event) {
                        if (event.keyCode==13)
                             return updatePermissionsFilter();
          });
                   
          $("#{$site->getSiteID()}-UserPermission-filter").click(function() { return updatePermissionsFilter(); }); 
          
          $("#{$site->getSiteID()}-UserPermission-init").click(function() { $.ajax2({ data : { User : "{$user->get('id')}" }, 
                                                           url :"{url_to('users_site_ajax',['action'=>'PermissionsList'])}",
                                                           loading: "#tab-site-{$site->getSiteID()}-dashboard-site-x-settings-loading",
                                                           errorTarget: ".{$site->getSiteID()}-site-errors",
                                                           target: "#{$site->getSiteID()}-actions" });
          }); 
                             
          $(".{$site->getSiteID()}-UserPermission-pager").click(function () {
             return $.ajax2({ data: getPermissionsFilterParameters(), 
                              url:"{url_to('users_site_ajax',['action'=>'PermissionsList'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length) , 
                              errorTarget: ".{$site->getSiteID()}-site-errors",
                              loading: "#tab-site-{$site->getSiteID()}-dashboard-site-x-settings-loading",
                              target: "#{$site->getSiteID()}-actions" });
          });
          
          $("#all").click(function () {  $(".selection").attr("checked",($(this).attr("checked")=="checked"));  });
          // {* PAGER - end *}         
           
          // {* ACTIONS - begin *}
          
          $("#DeletePermissions").click( function () { 
             var params={ selection : {  }, User : "{$user->get('id')}" };
             text="";              
             $(".selection:checked").each(function (id) { 
                params.selection[id]=this.name;
                text+=this.id+",\n";
             });
             if ($.isEmptyObject(params.selection))
                return ;
             if (!confirm("{__('Permissions :\u000A\u000A\"#0#\"\u000A\u000A will be deleted. Confirm ?')}".format(text.substring(0,text.lastIndexOf(","))))) 
                 return false; 
             return $.ajax2({ data:params,
                       url: "{url_to('users_site_ajax',['action'=>'DeleteUserPermissions'])}",
                       errorTarget: ".{$site->getSiteID()}-site-errors",
                       loading: "#tab-site-{$site->getSiteID()}-dashboard-site-x-settings-loading",
                       success: function(resp) {
                                    if (resp.action=='deleteUserPermissions')
                                    {                                    
                                        if ($(".permissions").length-resp.parameters.length==0)
                                             return $.ajax2({ data : { User : "{$user->get('id')}" },
                                                                       url:"{url_to('users_site_ajax',['action'=>'PermissionsList'])}",
                                                                       loading: "#tab-site-{$site->getSiteID()}-dashboard-site-x-settings-loading",
                                                                       errorTarget: ".{$site->getSiteID()}-site-errors",
                                                                       target: "#{$site->getSiteID()}-actions" });
                                        $.each(resp.parameters, function (id) {  $("tr#permission_"+this).remove(); });
                                        // Update Number of results
                                         updatePager(resp.parameters.length); 
                                        $("input#all").attr("checked",false);                                    
                                    }       
                               }
             });    
             return false;
          });
          
          $(".{$site->getSiteID()}-UserPermission-DeletePermission").click( function () { 
                if (!confirm('{__("Permission \"#0#\" will be deleted. Confirm ?")}'.format(this.name))) return false; 
                return $.ajax2({ data: { userPermission: this.id },
                                 url : "{url_to('users_site_ajax',['action'=>'DeleteUserPermission'])}",
                                 errorTarget: ".{$site->getSiteID()}-site-errors",
                                 success :function(resp) {
                                                if (resp.action=='deleteUserPermission')
                                                {    
                                                    if ($(".permissions").length-1==0)
                                                       return $.ajax2({ data : { User : "{$user->get('id')}" },
                                                                                 url:"{url_to('users_site_ajax',['action'=>'PermissionsList'])}",
                                                                                 loading: "#tab-site-{$site->getSiteID()}-dashboard-site-x-settings-loading",
                                                                                 errorTarget: ".{$site->getSiteID()}-site-errors",
                                                                                 target: "#{$site->getSiteID()}-actions" });
                                                    $("tr#permission_"+resp.id).remove();  
                                                    updatePager(1); 
                                                }
                                         }
                        }); 
          });
          
          $("#{$site->getSiteID()}-UserPermission-AddPermission").click( function () { 
                $.ajax2({ data: { User : "{$user->get('id')}" }, 
                                  url: "{url_to('users_site_ajax',['action'=>'AddPermissions'])}",
                                  errorTarget: ".{$site->getSiteID()}-site-errors",
                                  loading: "#tab-site-{$site->getSiteID()}-dashboard-site-x-settings-loading",
                                  target: "#{$site->getSiteID()}-actions"});
          });
                    
          $('#{$site->getSiteID()}-UserPermission-Cancel').click(function(){ $.ajax2({ url: "{url_to('users_site_ajax',['action'=>'ListPartial'])}", 
                                                   errorTarget: ".{$site->getSiteID()}-site-errors",
                                                   loading: "#tab-site-{$site->getSiteID()}-dashboard-site-x-settings-loading",
                                                   target: "#{$site->getSiteID()}-actions"
                                        }); 
          });
          $('.footable').footable();
</script>