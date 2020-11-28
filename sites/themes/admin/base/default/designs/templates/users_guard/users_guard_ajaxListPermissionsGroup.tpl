{messages class="site-errors"}
{if  $group->isLoaded()}
<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__('group')|capitalize} : {$group->get('name')} - {__('permissions')|capitalize}</h3>    
        <h3 class="admin-header-small-text">{__('Gestion des permissions')}</h3>    
    </div>
    <div class="col-sm" style="padding: 0;">
        <div style="float: right;"> 
            <a id="AddPermissions" class="btn btn-success admin-header-button" href="#">
                 <i class="fa fa-plus" style=" margin-right: 5px"></i>
                 {*<img  src="{url('/icons/add.gif','picture')}" alt="{__('new')}"/>*}{__('Add permission')}</a>
            <a href="#" id="Cancel" class="btn btn-danger admin-header-button">
                 <i class="fa fa-times" style="margin-right:5px;"></i>
                 {*<img  src="{url('/icons/cancel.gif','picture')}" alt="{__('cancel')}"/>*}{__('Cancel')}</a>
        </div>
    </div>
</div>
<div class="breadcrumb-title">
    <p>
        <i class="fa fa-home" style="color: #37bc9b;"></i>
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__("Droits d'accés")}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__("Groups Permissions")}
    </p>
</div> 
<div style="background-color: white; padding: 10px;">
    {if  $pager->getNbItems()}
        <div class="row admin-header-container">
        <div class="col-sm" style="padding: 0;">
            {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter class="PermissionsGroup"}
        </div>
        <div class="col-sm" style="padding: 0;">
            <div style="float: right; margin-top: 10px;"> 
                <button id="PermissionsGroup-filter" class="btn btn-table tab-button">{__("Filter")}</button>   
                <button style="margin-right: 5px;" id="PermissionsGroup-init" class="btn btn-table tab-button">{__("Init")}</button>
            </div>
        </div>
    </div>
        
        
        <table class="table table-bordered table-hover table-striped" cellspacing="0">
            <thead style="color: white;">
                <tr class="list-header">
                    <th data-hide="phone" style="display: table-cell; background-color: #36bc9a;">#</th>
                    {if $pager->getNbItems()>5}<th data-hide="phone" style="display: table-cell;">&nbsp;</th>{/if}
                    <th data-hide="phone" style="display: table-cell; background-color: #36bc9a;">{__('id')}
                         <div style="float: right;">
                             <a href="#" class="PermissionsGroup-order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><i class="fas fa-sort-up"></i></a>
                             <a href="#" class="PermissionsGroup-order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><i class="fas fa-sort-down"></i></a>
                         </div> 
                     </th>
                     <th class="footable-first-column" data-toggle="true" style="background-color: #36bc9a;">{__('name')}
                           <div style="float: right;">
                          <a href="#" class="PermissionsGroup-order{$formFilter.order.name->getValueExist('asc','_active')}" id="asc" name="name"><i class="fas fa-sort-up"></i></a>
                          <a href="#" class="PermissionsGroup-order{$formFilter.order.name->getValueExist('desc','_active')}" id="desc" name="name"><i class="fas fa-sort-down"></i></a>
                         </div> 
                     </th>         
                     <th data-hide="phone" style="display: table-cell; background-color: #36bc9a;">{__('actions')}</th>
                </tr>
            </thead>
            <tr class="input-list">
                <td></td>
                {if $pager->getNbItems()>5}<td></td>{/if}
                <td><input style="height: 36px;" class="PermissionsGroup-search form-control" type="text" size="5" name="id" value="{$formFilter.search.id}"></td>
                <td><input style="height: 36px;" class="PermissionsGroup-search form-control" type="text" size="5" name="name" value="{$formFilter.search.name}"></td> 
                <td></td>
            </tr>       
            {foreach $pager as $permission}
            <tr class="PermissionsGroup list" id="PermissionsGroup-{$permission->get('id')}">
                <td class="PermissionsGroup-count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$permission@iteration}</td>
                {if $pager->getNbItems()>5}<td><input class="PermissionsGroup-selection" type="checkbox" name="{$permission->get('id')}" id="{$permission->get('name')}"/></td>{/if}
                <td>
                    {$permission->get('id')}
                </td>
                <td>
                    {__($permission->get('name'),'','permissions')} ({$permission->get('name')|escape})
                </td>
                <td>
                   <a href="#" title="{__('delete')}" class="PermissionsGroup-DeletePermission" id="{$permission->get('id')}" name="{$permission->get('name')}"><i style="color: rgb(189, 33, 48);" class="fa fa-trash-alt icon-font"></i></a>
                </td>
            </tr>
            {/foreach}
        </table>
        {if $pager->getNbItems()>5}
               <input type="checkbox" id="PermissionsGroup-all" />  
               <a href="#" title="{__('delete')}" id="PermissionsGroup-DeletePermissions"><i style="color: rgb(189, 33, 48);" class="fa fa-trash-alt icon-font"></i></a>
        {/if}
        {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager class="PermissionsGroup"}
    {else}
            {__("no result")}
    {/if}
{else}
    {__("group doesn't exist")}
{/if}    
</div>
<script type="text/javascript">
          
         function getPermissionsFilterParameters()
        {
            var params={ group : "{$group->get('id')}",
                     filter: {  order : { }, 
                                     search: { is_active : $(".PermissionsGroup-search[name=is_active]").val() }, 
                                     nbitemsbypage: $("[name=PermissionsGroup-nbitemsbypage]").val(),
                                     token:'{$formFilter->getCSRFToken()}'
                                  }};
            params.filter.order[$(".PermissionsGroup-order_active").attr("name")] =$(".PermissionsGroup-order_active").attr("id");
            $(".PermissionsGroup-search").each(function(id) { params.filter.search[this.name] =this.value; });                               
            return params;                  
        }
        
        function updatePermissionsFilter()
        {
           return $.ajax2({ data: getPermissionsFilterParameters(), 
                            url :"{url_to('users_guard_ajax',['action'=>'ListPermissionsGroup'])}",
                              loading: "#tab-site-dashboard-site-x-settings-loading",
                              errorTarget: ".site-errors",
                              target: "#actions"
                          });
        }
        
        function updatePager(n)
        {
           page_active=$(".PermissionsGroup-pager .PermissionsGroup-active").html()?parseInt($(".PermissionsGroup-pager .PermissionsGroup-active").html()):1;
           records_by_page=$("[name=PermissionsGroup-nbitemsbypage]").val();
           start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
           $(".PermissionsGroup-count").each(function(id) { $(this).html(start+id) }); // Update index column           
           nb_results=parseInt($("#PermissionsGroup-nb_results").html())-n;
           $("#PermissionsGroup-nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
           $("#PermissionsGroup-end_result").html($(".PermissionsGroup-count:last").html());
        }
        
         // {* PAGER - begin *}
         $('.PermissionsGroup-order').click(function() {
             $(".PermissionsGroup-order_active").attr('class','PermissionsGroup-order');
             $(this).attr('class','PermissionsGroup-order_active');
             return updatePermissionsFilter();

         });
         
          $("[name=PermissionsGroup-nbitemsbypage],.PermissionsGroup[name=is_active]").change(function() {
              return updatePermissionsFilter();
          }); 
          
          $(".PermissionsGroup-search").keypress(function(event) {
                        if (event.keyCode==13)
                            return updatePermissionsFilter();                            
          });
                   
           $("#PermissionsGroup-filter").click(function() {
              return updatePermissionsFilter();
          }); 
          
          $("#PermissionsGroup-init").click(function() { $.ajax2({ data : {  group : "{$group->get('id')}" },          
                              url :"{url_to('users_guard_ajax',['action'=>'ListPermissionsGroup'])}",
                              loading: "#tab-site-dashboard-x-settings-loading",
                              errorTarget: ".site-errors",
                              target: "#actions"
          }); 
          }); 
                             
          $(".PermissionsGroup-pager").click(function () {                                                
                    return $.ajax2({ data: getPermissionsFilterParameters(),
                                    url:"{url_to('users_guard_ajax',['action'=>'ListPermissionsGroup'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length),                                    
                                 loading: "#tab-site-dashboard-x-settings-loading",
                                 errorTarget: ".site-errors",
                                 target: "#actions"
                        });
          });
          
          $("#PermissionsGroup-all").click(function () {  $(".PermissionsGroup-selection").attr("checked",($(this).attr("checked")=="checked"));  });
          // {* PAGER - end *}         
           
          // {* ACTIONS - begin *}
          
          $("#PermissionsGroup-DeletePermissions").click( function () { 
             var params={ selection : {  }, group : "{$group->get('id')}" };
             text="";              
             $(".PermissionsGroup-selection:checked").each(function (id) { 
                params.selection[id]=this.name;
                text+=this.id+",\n";
             });
             if ($.isEmptyObject(params.selection))
                return ;
             if (!confirm("{__('Permissions :\u000A\u000A\"#0#\"\u000A\u000A will be deleted. Confirm ?')}".format(text.substring(0,text.lastIndexOf(","))))) 
                 return false; 
             return $.ajax2({ data:params,
                              url :"{url_to('users_guard_ajax',['action'=>'DeletePermissionsGroup'])}",
                              loading: "#tab-site-dashboard-x-settings-loading",
                              errorTarget: ".site-errors",
                              success:function(resp) {
                                    if (resp.action=='deletePermissions')
                                    {                                    
                                        if ($(".PermissionsGroup").length-resp.parameters.length==0)
                                           return $.ajax2({ data :{ group : "{$group->get('id')}" },
                                                        url: "{url_to('users_guard_site_ajax',['action'=>'ListPermissionsGroup'])}",
                                                        loading: "#tab-site-dashboard-x-settings-loading",
                                                        errorTarget: ".site-errors",
                                                        target: "#actions"
                                                        });
                                        $.each(resp.parameters, function (id) {  $("tr#PermissionsGroup-"+this).remove(); });
                                        updatePager(resp.parameters.length);      
                                        $("input#PermissionsGroup-all").attr("checked",false);                                    
                                    }  
                              }
             });    
          });
          
          
          
          $(".PermissionsGroup-DeletePermission").click( function () { 
                if (!confirm('{__("Permission \"#0#\" will be deleted. Confirm ?")}'.format(this.name))) return false; 
                return $.ajax2({ data: { groupPermission: this.id },                                 
                                 url :"{url_to('users_guard_ajax',['action'=>'DeletePermissionGroup'])}",
                                 loading: "#tab-site-dashboard-x-settings-loading",
                                 errorTarget: ".site-errors",
                                 success: function(resp) {
                                                    if (resp.action=='deleteGroupPermission')
                                                    {    
                                                        if ($(".PermissionsGroup").length-1==0)
                                                           return $.ajax2({ data :{ group : "{$group->get('id')}" },                                                                        
                                                                        url: "{url_to('users_guard_site_ajax',['action'=>'ListPermissionsGroup'])}",
                                                                        loading: "#tab-site-dashboard-x-settings-loading",
                                                                        errorTarget: ".site-errors",
                                                                        target: "#actions"});
                                                        $("tr#PermissionsGroup-"+resp.id).remove();  
                                                        updatePager(1);      
                                                    }
                                          }
                        }); 
          });
          
          $("#AddPermissions").click( function () { 
                return $.ajax2({ data : { group : "{$group->get('id')}" },
                        url: "{url_to('users_guard_site_ajax',['action'=>'AddPermissionsGroup'])}",
                        loading: "#tab-site-dashboard-x-settings-loading",
                        errorTarget: ".site-errors",
                        target: "#actions"});
          });
                    
          $('#Cancel').click(function(){ return $.ajax2({ 
              url: "{url_to('users_guard_site_ajax',['action'=>'ListPartialGroup'])}",
              loading: "#tab-site-dashboard-x-settings-loading",
              errorTarget: ".site-errors",
              target: "#actions"}); });
          
              $('.footable').footable();
</script>