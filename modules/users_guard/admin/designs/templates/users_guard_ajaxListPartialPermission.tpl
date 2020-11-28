{messages class=" site-errors"}
<h3>{__('Permissions')}</h3> 
<div>
    <a id="NewPermission" href="#"><img  src="{url('/icons/add.gif','picture')}" alt="{__('new')}"/>{__('new permission')|capitalize}</a>
</div>
{include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter class="`$site->getSiteID()`-Permissions"}
<button id="Permissions-filter">{__("Filter")}</button>   
<button id="Permissions-init">{__("Init")}</button>
<table cellpadding="0" cellspacing="0">
     <tr>
        <th>#</th>
        {if $pager->getNbItems()>5}<th>&nbsp;</th>{/if}
        <th>{__('id')}
             <div>
                 <a href="#" class="Permissions-order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><img  src='{url("/icons/sort_asc`$formFilter.order.id->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                 <a href="#" class="Permissions-order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><img  src='{url("/icons/sort_desc`$formFilter.order.id->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
             </div> 
         </th>
         <th>{__('name')}
               <div>
              <a href="#" class=" Permissions-order{$formFilter.order.name->getValueExist('asc','_active')}" id="asc" name="name"><img  src='{url("/icons/sort_asc`$formFilter.order.name->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
              <a href="#" class=" Permissions-order{$formFilter.order.name->getValueExist('desc','_active')}" id="desc" name="name"><img  src='{url("/icons/sort_desc`$formFilter.order.name->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
             </div> 
         </th>      
          <th>{__('date creation')}
                <div>
                  <a href="#" class="Permissions-order{$formFilter.order.created_at->getValueExist('asc','_active')}" id="asc" name="created_at"><img  src='{url("/icons/sort_asc`$formFilter.order.created_at->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                  <a href="#" class="Permissions-order{$formFilter.order.created_at->getValueExist('desc','_active')}" id="desc" name="created_at"><img  src='{url("/icons/sort_desc`$formFilter.order.created_at->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
                </div>
          </th>
          <th>{__('date update')}
                <div>
                  <a href="#" class="Permissions-order{$formFilter.order.updated_at->getValueExist('asc','_active')}" id="asc" name="updated_at"><img  src='{url("/icons/sort_asc`$formFilter.order.updated_at->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                  <a href="#" class="Permissions-order{$formFilter.order.updated_at->getValueExist('desc','_active')}" id="desc" name="updated_at"><img  src='{url("/icons/sort_desc`$formFilter.order.updated_at->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
                </div>
          </th>
          <th>{__('actions')}</th>
     </tr>
     <tr>
            <td></td>
            {if $pager->getNbItems()>5}<td></td>{/if}
            <td><input class="Permissions-search" type="text" size="5" name="id" value="{$formFilter.search.id}"></td>
            <td><input class="Permissions-search" type="text" size="5" name="name" value="{$formFilter.search.name}"></td>                        
             <td></td>
            <td></td>
            <td></td>
        </tr>       
        {foreach $pager as $permission}
        <tr class="Permissions" id=" Permission-{$permission->get('id')}">
            <td class="Permission-count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$permission@iteration}</td>
            {if $pager->getNbItems()>5}<td><input class="Permissions-selection" type="checkbox" name="{$permission->getId()}" id="{$permission->get('name')}"/></td>{/if}
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
       <input type="checkbox" id="Permissions-all" />  
       <a href="#" title="{__('delete')}" id="DeletePermissions" style="opacity:0.5" class="Permissions-actions_items"><img  src="{url('/icons/delete.gif','picture')}" alt='{__("delete")}'/></a>
  {/if}
{/if}    
{include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager class="Permissions"}
<script type="text/javascript">
                 
        
        function getSitePermissionsFilterParameters()
        {
            var params={ filter: {  
                                            node: '{$node->get('id')}', 
                                            lang : $("#SelectListLanguages option:selected").attr('id'),
                                    order : { }, 
                                     search: { 
                                            is_active : $("[name=Permissions-is_active]").val() ,
                                            application : $(".Permissions[name=application] option:selected").val()
                                     },
                                    equal: { },          
                                    range: { },
                                     nbitemsbypage: $("[name=Permissions-nbitemsbypage]").val(),
                                     
                                     token:'{$formFilter->getCSRFToken()}'
                                  }};
            params.filter.order[$(".Permissions-order_active").attr("name")] =$(".Permissions-order_active").attr("id");
            $(".Permissions-search").each(function() { params.filter.search[this.name] =this.value; });
            $(".search").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); });
            $(".equal option:selected").each(function() { params.filter.equal[$(this).parent().attr('name')] =$(this).val(); });
            $(".Range.Date").each(function () {
                if(!params.filter.range[$(this).attr('name')])
                    params.filter.range[$(this).attr('name')]= { };
                params.filter.range[$(this).attr('name')][$(this).attr('date-id')]= $(this).val();
            });
            return params;                  
        }
        
        function updateSitePermissionsFilter()
        {
           return $.ajax2({ data: getSitePermissionsFilterParameters(), 
                            loading: "#tab-site-Dashboard-site-x-settings-loading",
                            url:"{url_to('users_guard_ajax',['action'=>'ListPartialPermission'])}" , 
                            errorTarget: ".site-errors",
                            target: "#actions" });
        }
        
        function updateSitePager(n)
        {
           page_active=$(" Permissions-pager .active").html()?parseInt($(".Permissions-pager .Permissions-active").html()):1;
           records_by_page=$("[name=Permissions-nbitemsbypage]").val();
           start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
           $(".Permissions-count").each(function(id) { $(this).html(start+id) }); // Update index column           
           nb_results=parseInt($("#nb_results").html())-n;
           $("#Permissions-nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
           $("#Permissions-end_result").html($(".Permissions-count:last").html());
        }
        
         function updateFilter()
        {          
           return $.ajax2({ data: getFilterParameters(), 
                            url:"{url_to('users_guard_ajax',['action'=>'ListPartialPermission'])}",                         
                            target: "#actions"
                             });
        }
        
        $("#SelectListLanguages").change(function() {  updateFilter();   });
        
         // {* PAGER - begin *}
         $('.Permissions-order').click(function() {
             $(".Permissions-order_active").attr('class','Permissions-order');
             $(this).attr('class','Permissions-order_active');
             return updateSitePermissionsFilter();
         });
         
          $("[name=Permissions-nbitemsbypage],[name=Permissions-is_active]").change(function() { return updateSitePermissionsFilter(); }); 
                      
          $(".Permissions-search").keypress(function(event) {
                        if (event.keyCode==13)
                            return updateSitePermissionsFilter();
          });
                   
          $("#Permissions-filter").click(function() { return updateSitePermissionsFilter(); }); 
          
          $("#Permissions-init").click(function() { $.ajax2({ 
                                        loading: "#tab-site- dashboard-site-x-settings-loading", 
                                        url:"{url_to('users_guard_ajax',['action'=>'ListPartialPermission'])}",
                                        errorTarget: ".site-errors",
                                        target: "#actions"}); }); 

          $(".Permissions-pager").click(function () {
                  return $.ajax2({ data: getSitePermissionsFilterParameters(), 
                                   loading: "#tab-site-dashboard-site-x-settings-loading",
                                   url: "{url_to('users_guard_ajax',['action'=>'ListPartialPermission'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length),
                                   errorTarget: ".site-errors",
                                   target: "#actions"});
          });
                   
          // {* PAGER - end *}         
           
          // {* ACTIONS - begin *}
          
          $("#DeletePermissions").click( function () { 
             var params={ selection : {  } };
             text="";
             $(".Permissions-selection:checked").each(function (id) { 
                params.selection[id]=this.name;
                text+=this.id+",\n";
             });
             if ($.isEmptyObject(params.selection))
                return ;
             if (!confirm("{__('Permissions :\u000A\u000A\"#0#\"\u000A\u000A will be deleted. Confirm ?')}".format(text.substring(0,text.lastIndexOf(","))))) 
                 return false; 
             return $.ajax2({ data: params,
                       url: "{url_to('users_guard_ajax',['action'=>'DeletesPermission'])}",
                       loading: "#tab-site-dashboard-site-x-settings-loading",
                       errorTarget: ".site-errors",    
                       success: function(resp) {
                                if (resp.action=='deletePermissions')
                                {                                    
                                    if ($(".Permissions").length-resp.parameters.length==0)
                                       return $.ajax2({ url:"{url_to('users_guard_ajax',['action'=>'ListPartialPermission'])}",target : "#actions"});
                                    $.each(resp.parameters, function () {  $("tr#Permission-"+this).remove(); });
                                    updateSitePager(resp.parameters.length);       
                                    $("input#Permissions-all").attr("checked",false);                                    
                                }   
                       }
             });    
          });
          
          
          
          $(".DeletePermission").click( function () { 
                if (!confirm('{__("Permission \"#0#\" will be deleted. Confirm ?")}'.format(this.name))) return false; 
                return $.ajax2({ data: { permission: this.id },
                          loading: "#tab-site-dashboard-site-x-settings-loading",
                          url: "{url_to('users_guard_ajax',['action'=>'DeletePermission'])}",
                          errorTarget: ".site-errors",    
                          success: function(resp) {
                            if (resp.action=='deletePermission')
                            {    
                                if ($(". Permissions").length-1==0)
                                   return $.ajax2({ loading: "#tab-site-dashboard-site-x-settings-loading",
                                                    url:"{url_to('users_guard_ajax',['action'=>'ListPartialPermission'])}",
                                                    errorTarget: ".site-errors",
                                                    target: "#actions"});
                                $("tr#Permission-"+resp.id).remove();  
                                updateSitePager(1);
                            }
                          }
                        }); 
          });
          
          $(".ViewPermission").click( function () { 
                $.ajax2({ data : { id: this.id },
                                   loading: "#tab-site- dashboard-site-x-settings-loading",
                                   url: "{url_to('users_guard_ajax',['action'=>'ViewPermission'])}",
                                   errorTarget: ".site-errors",
                                   target: "#actions"});
          });
          
          $("#NewPermission").click( function () { 
                $.ajax2({   loading: "#tab-site-dashboard-site-x-settings-loading",
                            url: "{url_to('users_guard_ajax',['action'=>'NewPermission'])}",
                            errorTarget: ".site-errors",
                            target: "#actions"});
          });
          
          $(".Permissions-selection").click(function (){               
                $(".Permissions-actions_items").css('opacity',($(".Permissions-selection:checked").length?'1':'0.5'));
          });

           $("#Permissions-all").click(function () {                               
               $(".Permissions-selection").attr("checked","checked"); 
               $(".Permissions-actions_items").css('opacity',($(this).prop("checked")?'1':'0.5'));
           });
</script>