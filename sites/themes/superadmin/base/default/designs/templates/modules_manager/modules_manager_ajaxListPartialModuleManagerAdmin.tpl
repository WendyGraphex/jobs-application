{messages class="errors-tab-dashboard-superadmin"}
<div>
     {*      <a id="ModuleManagerAdmin-Load" title="{__('load module')|capitalize}" href="#">
            <img  src="{url('/icons/add.gif','picture')}" alt="{__('load')}"/>{__('load module')|capitalize}
         </a> 
         <a id="Build" title="{__('build')|capitalize}" href="#">
            <img  src="{url('/icons/exec.gif','picture')}" alt="{__('build')}"/>{__('build')|capitalize}
         </a> *}
         <a id="ModuleManagerAdmin-Refresh" class="btn"  title="{__('refresh')|capitalize}" href="#">
             <i class="fa fa-refresh" style=" margin-right: 10px;"></i>
             {* <img  src="{url('/icons/refresh.png','picture')}" alt="{__('build')}"/>*}{__('refresh')|capitalize}
         </a> 
</div>
{include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter class="ModuleManagerAdmin"}
<button id="ModuleManagerAdmin-filter" class="btn-table">{__("filter")|capitalize}</button>   <button id="ModuleManagerAdmin-init" class="btn-table">{__("init")|capitalize}</button>
        
   <table id="listModuleManagerAdmin" class="tabl-list footable table" cellspacing="0"> 
       <thead>
<tr class="list-header">
<tr class=" list-header">
        <th  data-hide="phone" style="display: table-cell;">#</th>
        {if $pager->getNbItems()>5}<th  data-hide="phone" style="display: table-cell;">&nbsp;</th>{/if}
         
            <th  data-hide="phone" style="display: table-cell;">
            <span>{__('id')|capitalize}</span>
             
            <div>
                <a href="#" class="ModuleManagerAdmin-order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><img  src='{url("/icons/sort_asc`$formFilter.order.id->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                <a href="#" class="ModuleManagerAdmin-order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><img  src='{url("/icons/sort_desc`$formFilter.order.id->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
            </div> 
                        </th>
 
            <th  data-hide="phone" style="display: table-cell;">
            <span>{__('logo')|capitalize}</span>
                        </th>
 
            <th class="footable-first-column" data-toggle="true">
            <span>{__('name')|capitalize}</span>
             
            <div>
                <a href="#" class="ModuleManagerAdmin-order{$formFilter.order.name->getValueExist('asc','_active')}" id="asc" name="name"><img  src='{url("/icons/sort_asc`$formFilter.order.name->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                <a href="#" class="ModuleManagerAdmin-order{$formFilter.order.name->getValueExist('desc','_active')}" id="desc" name="name"><img  src='{url("/icons/sort_desc`$formFilter.order.name->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
            </div> 
                        </th>
             <th  data-hide="phone,tablet" style="display: table-cell;">
            <span>{__('description')|capitalize}</span>
                        </th>
            <th  data-hide="phone" style="display: table-cell;">
            <span>{__('type')|capitalize}</span>
             <div>
                <a href="#" class="ModuleManagerAdmin-order{$formFilter.order.type->getValueExist('asc','_active')}" id="asc" name="type"><img  src='{url("/icons/sort_asc`$formFilter.order.type->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                <a href="#" class="ModuleManagerAdmin-order{$formFilter.order.type->getValueExist('desc','_active')}" id="desc" name="type"><img  src='{url("/icons/sort_desc`$formFilter.order.type->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
            </div>
                        </th>
 
            <th  data-hide="phone,tablet" style="display: table-cell;">
            <span>{__('version')|capitalize}</span>
                        </th>
               <th  data-hide="phone" style="display: table-cell;">
            <span>{__('actions')|capitalize}</span>
                        </th>          
            </tr>  
</thead>
<tr class=" input-list">
       <td></td>    
          {if $pager->getNbItems()>5}<td></td>{/if}
          
      <td>
                                <input class="ModuleManagerAdmin-search" type="text" size="5" name="id" value="{$formFilter.search.id}">
                    </td>
     <td>
        </td>
     <td>
                                <input class="ModuleManagerAdmin-search" type="text" size="5" name="name" value="{$formFilter.search.name}">
                    </td>
     <td>
        </td>
     <td> {html_options_format name="type" options=$formFilter->equal.type->getOption('choices') selected=(string)$formFilter.equal.type}
        </td>
 
  <td></td>
        <td></td>    
    </tr>       
    {foreach $pager as $item}
        <tr class="moduleManagerAdmins list" id="ModuleManagerAdmin-{$item->get('id')}">
        <td class="ModuleManagerAdmin-count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>
        {if $pager->getNbItems()>5}
            <td>  
               <input class="selection" type="checkbox" id="" name="{$item->get('id')}"/> 
            </td>
        {/if}
                <td>
            <span>{$item->get('id')|escape|truncate:20}</span>
   
        </td>
                <td>                 
              {if $item->get('logo')}<img id="moduleManagerAdmin_logo" src="{$item->getLogo()->getURL('superadmin')}" height="32" width="32" alt="{__('logo')}"/>{/if}
   
        </td>
                <td>
            <span>{__("module_`$item->get('name')`",[],'messages',$item->get('name'))}</span>
   
        </td>
         <td>
            <span>{__($item->get('description'),[],'messages',$item->get('name'))|escape|truncate:300}</span>
   
        </td>
                <td>
            <span>{$item->get('type')|escape|truncate:32}</span>
   
        </td>
                <td>
            <span>{$item->get('version')|escape|truncate:32}</span>
   
        </td>
          <td>
               <a href="#" title="{__('install')}"  class="Install" id="{$item->get('id')}" >
               <img  src="{url('/icons/exec.gif','picture')}" alt='{__("install")}'/></a> 
                <a href="#" title="{__('uninstall')}" class="Uninstall" id="{$item->get('id')}">
                <img src="{url('/icons/cancel.gif','picture')}" alt='{__("uninstall")}'/></a> 
               {* <a href="{url_to('modules_manager_export_moduleManagerAdmin',['type'=>'Zip','url'])}?module={$item->get('name')}" title="{__('zip export')}" class="ExportZip" target="_blank">
                       <img src="{url('/icons/files/zip.gif','picture')}" alt='{__("zip export")}'/>
                </a>  *}
          </td>   
</tr>  
    {/foreach}
</table>     
         
{if !$pager->getNbItems()}  
    {__("no result")}
{else}
    {if $pager->getNbItems()>5}
        <input type="checkbox" id="ModuleManagerAdmin-all" /> 
           
    {/if}
{/if}    
{include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager class="ModuleManagerAdmin"}
{component name="/site/dialogListFilterMultipleSites"}      
<script type="text/javascript">
             
        function getModuleManagerAdminsFilterParameters()
        {
            params={ filter: {  order : { }, 
                                equal : { type : $("[name=type] option:selected").val() },
                                search: { },
                                nbitemsbypage: $("[name=ModuleManagerAdmin-nbitemsbypage]").val(),
                                token:'{$formFilter->getCSRFToken()}'
                   }};
            if ($(".ModuleManagerAdmin-order_active").attr("name"))
                    params.filter.order[$(".ModuleManagerAdmin-order_active").attr("name")] =$(".ModuleManagerAdmin-order_active").attr("id");
            $(".ModuleManagerAdmin-search").each(function() { params.filter.search[this.name] =this.value; });                               
            return params;                  
        }
        
        function updateModuleManagerAdminsFilter()
        {
           $(".dialogs").dialog("destroy").remove();            
           return $.ajax2({ 
                        data: getModuleManagerAdminsFilterParameters(), 
                        loading: "#tab-dashboard-superadmin-loading",
                        errorTarget: ".errors-tab-dashboard-superadmin", 
                        target: "#tab-panel-dashboard-superadmin-actions",                     
                        url:"{url_to('modules_manager_ajax_moduleManagerAdmin',['action'=>'ListPartialModuleManagerAdmin'])}" 
                });
        }
        
        function updateModuleManagerAdminPager(n)
        {
           page_active=$(".ModuleManagerAdmin-pager .active").html()?parseInt($(".ModuleManagerAdmin-pager .active").html()):1;
           records_by_page=$("[name=ModuleManagerAdmin-nbitemsbypage]").val();
           start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
           $(".ModuleManagerAdmin-count").each(function(id) { $(this).html(start+id) }); // Update index column           
           nb_results=parseInt($("#ModuleManagerAdmin-nb_results").html())-n;
           $("#ModuleManagerAdmin-nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
           $("#ModuleManagerAdmin-end_result").html($(".ModuleManagerAdmin-count:last").html());
        }
           
    
             
                                                                        
            // {* PAGER - begin *}
            $('.ModuleManagerAdmin-order').click(function() {
                $(".ModuleManagerAdmin-order_active").attr('class','ModuleManagerAdmin-order');
                $(this).attr('class','ModuleManagerAdmin-order_active');
                return updateModuleManagerAdminsFilter();
            });

            $(".ModuleManagerAdmin-search").keypress(function(event) {
                if (event.keyCode==13)
                    return updateModuleManagerAdminsFilter();
            });
            
            $("[name=ModuleManagerAdmin-nbitemsbypage]").change(function() { return updateModuleManagerAdminsFilter(); });           
            
            $("[name=type]").change(function() { return updateModuleManagerAdminsFilter(); }); 
            
            $("#ModuleManagerAdmin-filter").click(function() { return updateModuleManagerAdminsFilter(); }); 

            $("#ModuleManagerAdmin-init").click(function() { 
                $(".dialogs").dialog("destroy").remove();    
                $.ajax2({   loading: "#tab-dashboard-superadmin-loading",
                            target: "#tab-panel-dashboard-superadmin-actions",
                            errorTarget: ".errors-tab-dashboard-superadmin", 
                            url:"{url_to('modules_manager_ajax_moduleManagerAdmin',['action'=>'ListPartialModuleManagerAdmin'])}",
                        }); 
            }); 

            $(".ModuleManagerAdmin-pager").click(function () {
                $(".dialogs").dialog("destroy").remove();       
                  return $.ajax2({ data: getModuleManagerAdminsFilterParameters(),  
                                 loading: "#tab-dashboard-superadmin-loading",
                                 target: "#tab-panel-dashboard-superadmin-actions",
                                 errorTarget: ".errors-tab-dashboard-superadmin", 
                                 url:"{url_to('modules_manager_ajax_moduleManagerAdmin',['action'=>'ListPartialModuleManagerAdmin'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length)
                            });
            });

            $("#ModuleManagerAdmin-all").click(function () {  $(".ModuleManagerAdmin-selection").attr("checked",($(this).attr("checked")=="checked"));  });

         // {* PAGER - end *}   

         // {* ACTIONS - begin *}   
            
            $(".Install").click(function(){
                $("#dialogListFilterMultipleSites").dialog('open');  
                $("#listModuleManagerAdmin").data('selected',$(this).attr('id'));              
                $("#listModuleManagerAdmin").data('action',"{url_to('modules_manager_ajax_moduleManagerAdmin',['action'=>'InstallModuleSitesModuleManagerAdmin'])}");
            });
            
            $(".Uninstall").click(function(){
                $("#dialogListFilterMultipleSites").dialog('open');  
                $("#listModuleManagerAdmin").data('selected',$(this).attr('id'));
                $("#listModuleManagerAdmin").data('action',"{url_to('modules_manager_ajax_moduleManagerAdmin',['action'=>'UninstallModuleSitesModuleManagerAdmin'])}");
            });
            
            $("#ModuleManagerAdmin-Refresh").click(function() { 
                       $.ajax2({ loading: "#tab-dashboard-superadmin-loading",
                                 target: "#tab-panel-dashboard-superadmin-actions",
                                 errorTarget: ".errors-tab-dashboard-superadmin", 
                                 url:"{url_to('modules_manager_ajax_moduleManagerAdmin',['action'=>'RefreshModuleManagerAdmin'])}"
                             }); 
            }); 
            // {* ACTIONS - end *}
            // Other actions
          
       
            $("#ModuleManagerAdmin-Load").click( function () { 
                 $(".dialogs").dialog("destroy").remove();    
                 return $.ajax2({ 
                                 loading: "#tab-dashboard-superadmin-loading",
                                 target: "#tab-panel-dashboard-superadmin-actions",
                                 errorTarget: ".errors-tab-dashboard-superadmin",                                  
                                 url: "{url_to('modules_manager_ajax_moduleManagerAdmin',['action'=>'LoadModuleManagerAdmin'])}"                                 
                 });    

            });
            
            $("#dialogListFilterMultipleSites").bind('select',function(event) {
              // alert("Event="+event.selected.toSource()+" id="+$("#listModuleManagerAdmin").data('selected').toSource()+" action="+$("#listModuleManagerAdmin").data('action'));              
               return $.ajax2({ 
                                data : { modules: { 
                                             sites : event.selected, 
                                             module : $("#listModuleManagerAdmin").data('selected'),
                                             token : '{mfForm::getToken('moduleSitesForm')}'
                                       } },
                                loading: "#tab-dashboard-superadmin-loading",
                             //   target: "#tab-panel-dashboard-superadmin-actions",
                                errorTarget: ".errors-tab-dashboard-superadmin", 
                                url:$("#listModuleManagerAdmin").data('action'),                       
                                success: function(resp) { 
                                            // alert("resp"+resp.toSource());
                                         }
                                });
            });
            $('.footable').footable();
      
</script>
