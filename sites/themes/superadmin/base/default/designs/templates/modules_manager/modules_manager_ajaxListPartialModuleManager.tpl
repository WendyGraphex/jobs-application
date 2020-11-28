{messages class="errors-tab-dashboard-superadmin"}
<div>
    <a id="ModuleManager-Build" class="btn" title="{__('build')|capitalize}" href="#"><i class="fa fa-cog" style="margin-right:10px;"></i>{*<img  src="{url('/icons/exec.gif','picture')}" alt="{__('build')}"/>*}{__('build')|capitalize}</a> 
    <a id="ModuleManager-UpdateSite" class="btn" title="{__('update')|capitalize}" href="#"><i class="fa fa-refresh" style="margin-right:10px;"></i>
{*<img  src="{url('/icons/refresh.png','picture')}" alt="{__('update')}"/>*}{__('update')|capitalize}</a> 
</div>
{include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter class="ModuleManager"}
<button id="ModuleManager-filter" class="btn-table">{__("filter")|capitalize}</button>   <button id="ModuleManager-init" class="btn-table">{__("init")|capitalize}</button>
        
   <table cellpadding="0" cellspacing="0" class="tabl-list footable table">
       <thead>
<tr class="list-header">
    <tr class=" list-header">
        <th>#</th>
        {if $pager->getNbItems()>5}<th data-hide="phone" style="display: table-cell;">&nbsp;</th>{/if}
         
            <th data-hide="phone" style="display: table-cell;">
            <span>{__('id')|capitalize}</span>
             
            <div>
                <a href="#" class="ModuleManager-order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><img  src='{url("/icons/sort_asc`$formFilter.order.id->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                <a href="#" class="ModuleManager-order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><img  src='{url("/icons/sort_desc`$formFilter.order.id->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
            </div> 
                        </th>
 
            <th data-hide="phone" style="display: table-cell;">
            <span>{__('logo')|capitalize}</span>
                        </th>
 
            <th class="footable-first-column" data-toggle="true">
            <span>{__('name')|capitalize}</span>
             
            <div>
                <a href="#" class="ModuleManager-order{$formFilter.order.name->getValueExist('asc','_active')}" id="asc" name="name"><img  src='{url("/icons/sort_asc`$formFilter.order.name->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                <a href="#" class="ModuleManager-order{$formFilter.order.name->getValueExist('desc','_active')}" id="desc" name="name"><img  src='{url("/icons/sort_desc`$formFilter.order.name->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
            </div> 
                        </th>
 
            <th data-hide="phone" style="display: table-cell;">
            <span>{__('version')|capitalize}</span>
                        </th>
                           <th data-hide="phone" style="display: table-cell;">
            <span>{__('active')|capitalize}</span>
                        </th>
                        <th data-hide="phone" style="display: table-cell;">
            <span>{__('available')|capitalize}</span>
                        </th>
                        <th data-hide="phone,tablet" style="display: table-cell;">
            <span>{__('type')|capitalize}</span>
            <div>
                <a href="#" class="ModuleManager-order{$formFilter.order.type->getValueExist('asc','_active')}" id="asc" name="type"><img  src='{url("/icons/sort_asc`$formFilter.order.type->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                <a href="#" class="ModuleManager-order{$formFilter.order.type->getValueExist('desc','_active')}" id="desc" name="type"><img  src='{url("/icons/sort_desc`$formFilter.order.type->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
            </div> 
                        </th>
                        <th data-hide="phone,tablet" style="display: table-cell;">
                            <span>{__('site')|capitalize}</span>
                        </th>
                        <th data-hide="phone,tablet" style="display: table-cell;">
            <span>{__('status')|capitalize}</span>
                        </th>
                    <th class="footable-last-column" data-hide="phone" style="display: table-cell;">{__('actions')|capitalize}</th>
            </tr> 
</thead>        
    <tr class="input-list">
          <td></td>
          {if $pager->getNbItems()>5}<td></td>{/if}
          
      <td>
                                <input class="ModuleManager-search" type="text" size="5" name="id" value="{$formFilter.search.id}">
                    </td>
     <td>
        </td>
     <td>
                                <input class="ModuleManager-search" type="text" size="5" name="name" value="{$formFilter.search.name}">
                    </td>
     <td>
        </td>
         <td>             {html_options_format class="ModuleManager" name="is_active" options=$formFilter->equal.is_active->getOption('choices') selected=(string)$formFilter.equal.is_active format='__'}</td>  
          <td>             {html_options_format class="ModuleManager" name="is_available" options=$formFilter->equal.is_available->getOption('choices') selected=(string)$formFilter.equal.is_available format='__'}</td>  
          <td> {html_options_format class="ModuleManager" name="type" options=$formFilter->equal.type->getOption('choices') selected=(string)$formFilter.equal.type format='__'}</td>
           <td>             {html_options_format class="ModuleManager" name="in_site" options=$formFilter->equal.in_site->getOption('choices') selected=(string)$formFilter.equal.in_site format='__'}</td>  
         <td>{html_options_format class="ModuleManager" name="status" options=$formFilter->equal.status->getOption('choices') selected=(string)$formFilter.equal.status format='__'}</td>  
          <td></td>  
    </tr>       
    {foreach $pager as $item}
    <tr class="ModuleManager list" id="ModuleManager-{$item->get('id')}">
        <td class="ModuleManager-count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>
        {if $pager->getNbItems()>5}
            <td>  
              <input class="ModuleManager-selection" type="checkbox" id="{$item->get('name')}" name="{$item->get('id')}"/> 
            </td>
        {/if}
                <td>
            <span>{$item->get('id')|escape|truncate:20}</span>
   
        </td>
        <td class="icon">
              {if $item->get('logo')}<img id="ModuleManager-logo" src="{$item->getLogo()->getURL('superadmin')}" height="32" width="32" alt="{__('logo')}"/>{/if}
   
        </td>
                <td>
            <span>{__("module_`$item->get('name')`",[],'messages',$item->get('name'))}</span>
   
        </td>
                <td>
            <span>{$item->get('version')|escape|truncate:32}</span>
   
        </td>
        <td>
           {* {if $item->IsActiveNotAuthorized()}
               <img class="module" id="IsActive_{$item->get('id')}" style="opacity: 0.5;" src="{url('/icons/','picture')}{$item->get('is_active')}.gif" alt='{__($item->get("is_active"))}' title='{__($item->get("is_active"))}'/>             
            {else}
               <a href="#" class="ChangeIsActive" name="{$item->get('id')|escape}" id="{$item->get('is_active')|escape}" title='{__("`$item->get("is_active")`")}'><img class="module" id="IsActive_{$item->get('id')}" src="{url('/icons/','picture')}{$item->get('is_active')}.gif" alt='{__($item->get("is_active"))}' title='{__($item->get("is_active"))}'/></a> 
            {/if} *}
           
           <a href="#" {if $item->IsActiveNotAuthorized()}style="cursor:default;"{/if} class="ModuleManager-ChangeIsActive {if $item->IsActiveNotAuthorized()}NotAuthorized{/if}" name="{$item->get('id')|escape}" id="{$item->get('is_active')|escape}" title='{__("`$item->get("is_active")`")}'>
               <img {if $item->IsActiveNotAuthorized()}style="opacity:0.5;"{/if} class="Module" id="IsActive-{$item->get('id')}" src="{url('/icons/','picture')}{$item->get('is_active')}.gif" alt='{__($item->get("is_active"))}' title='{__($item->get("is_active"))}'/>
           </a> 
           
        </td>
           <td>
               {if $item->IsAvailableNotAuthorized()}
                 <img style="opacity: 0.5;" src="{url('/icons/','picture')}{$item->get('is_available')}.gif" alt='{__("`$item->get("is_available")`")}' title='{__("`$item->get("is_available")`")}'/>  
               {else}    
                <a href="#" class="ModuleManager-ChangeIsAvailable" name="{$item->get('id')|escape}" id="{$item->get('is_available')|escape}" title='{__("`$item->get("is_available")`")}'><img src="{url('/icons/','picture')}{$item->get('is_available')}.gif" alt='{__("`$item->get("is_available")`")}' title='{__("`$item->get("is_available")`")}'/></a> 
               {/if}
        </td>
        <td> <span>{$item->get('type')|escape|truncate:32}</span></td>
         <td>
            <span>{$item->get('in_site')}</span>
   
        </td>
        <td>
            <span class="Module" id="status_{$item->get('id')}">{$item->get('status')|escape}</span>
   
        </td>
                <td> 
                    {if $item->isInstallable()}
                    <a href="#" title="{__('install')}"  class="ModuleManager-Update Installable {if $item->get('is_available')=='YES'}Install{/if}" {if $item->get('is_available')=='NO'}style="opacity:0.5"{/if} id="{$item->get('id')}" >
                    <img  src="{url('/icons/exec.gif','picture')}" alt='{__("install")}'/></a> 
                    {elseif $item->isUninstallable()}
                    <a href="#" title="{__('uninstall')}" class="ModuleManager-Update Uninstallable {if $item->get('is_available')=='YES'}Uninstall{/if}" id="{$item->get('id')}" {if $item->get('is_available')=='NO'}style="opacity:0.5"{/if}>
                       <img src="{url('/icons/cancel.gif','picture')}" alt='{__("uninstall")}'/>
                    </a>{else}<img  src="{url('/icons/forbidden.png','picture')}" alt='{__("forbidden")}' title='{__("forbidden")}'/>
                    {/if}
                     <a href="#" title="{__('delete')}" class="ModuleManager-Delete" id="{$item->get('id')}" name="{$item->get('name')}" >
                         <img  src="{url('/icons/delete.gif','picture')}" alt='{__("physical")}'/>
                    </a>
            </td>
</tr>  
    {/foreach}
</table>     
         
{if !$pager->getNbItems()}  
    {__("no result")}
{else}
    {if $pager->getNbItems()>5}
        <input type="checkbox" id="ModuleManager-all"/> 
        
        
            <div>
            <span>{__("active")|capitalize}</span>
                                     <a href="#" style="opacity:0.5" title="{__('enable')}" id="IsActiveEnable" class="ModuleManager-actions_items"><img  src="{url('/icons/YES.gif','picture')}" alt='{__("Enable")}'/></a>
                            <a href="#" style="opacity:0.5" title="{__('disable')}" id="IsActiveDisable" class="ModuleManager-actions_items"><img  src="{url('/icons/NO.gif','picture')}" alt='{__("Disable")}'/></a>
              
                </div>
             <div>
            <span>{__("available")|capitalize}</span>
                                     <a href="#" style="opacity:0.5" title="{__('enable')}" id="IsAvailableEnable" class="ModuleManager-actions_items"><img  src="{url('/icons/YES.gif','picture')}" alt='{__("Enable")}'/></a>
                            <a href="#" style="opacity:0.5" title="{__('disable')}" id="IsAvailableDisable" class="ModuleManager-actions_items"><img  src="{url('/icons/NO.gif','picture')}" alt='{__("Disable")}'/></a>
              
                </div>
    {/if}
{/if}    
{include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager class="ModuleManager"}

<script type="text/javascript">
        
          function changeModuleManagerIsActiveState(resp) 
            {
                $.each(resp.selection?resp.selection:[resp.id], function () {                   
                    sel="a.ModuleManager-ChangeIsActive[name="+this+"]";
                    if (resp.state=='YES'||resp.state=='NO') 
                    {    
                        $(sel+" img").attr({
                            src :"{url('/icons/','picture')}"+resp.state+".gif",
                            alt : (resp.state=='YES'?'{__("YES")}':'{__("NO")}'),
                            title : (resp.state=='YES'?'{__("YES")}':'{__("NO")}')
                        });
                        $(sel).attr("id",resp.state);
                    }
                });  
            }    
             
            function changeModuleManagerIsAvailableState(resp) 
            {
                $.each(resp.selection?resp.selection:[resp.id], function (id) { 
                    //sel="a.ChangeIsActive#"+this;
                    sel="a.ModuleManager-ChangeIsAvailable[name="+this+"]";
                    if (resp.state=='YES'||resp.state=='NO') 
                    {    
                        $(sel+" img").attr({
                            src :"{url('/icons/','picture')}"+resp.state+".gif",
                            alt : (resp.state=='YES'?'{__("YES")}':'{__("NO")}'),
                            title : (resp.state=='YES'?'{__("YES")}':'{__("NO")}')
                        });
                        $(sel).attr("id",resp.state);
                       
                        if (resp.state=='YES')
                        {    
                            $(".ModuleManager-Update.Installable#"+this).css('opacity','1').addClass('Install');
                            $(".ModuleManager-Update.Uninstallable#"+this).css('opacity','1').addClass('Uninstall');
                        }    
                        else
                        {    
                            $(".ModuleManager-Update.Installable#"+this).css('opacity','0.5').removeClass('Install');
                            $(".ModuleManager-Update.Uninstallable#"+this).css('opacity','0.5').removeClass('Uninstall');
                        }
                    }
                });  
            }    
        function getModuleManagersFilterParameters()
        {
            params={ filter: {  order : { },                                                                           
                                equal : {  is_active : $(".ModuleManager[name=is_active] option:selected").val(),
                                           in_site : $(".ModuleManager[name=in_site] option:selected").val(),
                                           status : $(".ModuleManager[name=status] option:selected").val(),    
                                           type : $(".ModuleManager[name=type] option:selected").val(),
                                           is_available : $(".ModuleManager[name=is_available] option:selected").val()
                                        },
                                search: { },                                            
                                nbitemsbypage: $("[name=ModuleManager-nbitemsbypage]").val(),
                                token:'{$formFilter->getCSRFToken()}'
                    } };
            if ($(".ModuleManager-order_active").attr("name"))
                    params.filter.order[$(".ModuleManager-order_active").attr("name")] =$(".ModuleManager-order_active").attr("id");
            $(".ModuleManager-search").each(function(id) { params.filter.search[this.name] =this.value; });                               
            return params;                  
        }
        
        function updateModuleManagersFilter()
        {
           return $.ajax2({ data: getModuleManagersFilterParameters(), 
                            url:"{url_to('modules_manager_ajax',['action'=>'ListPartialModuleManager'])}" , 
                            loading: "#tab-dashboard-superadmin-loading",
                            errorTarget: ".errors-tab-dashboard-superadmin", 
                            target: "#tab-panel-dashboard-superadmin-actions"  
                             });
        }
        
        function updatePager(n)
        {
           page_active=$(".ModuleManager-pager .ModuleManager-active").html()?parseInt($(".ModuleManager-pager .ModuleManager-active").html()):1;
           records_by_page=$("[name=ModuleManager-nbitemsbypage]").val();
           start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
           $(".ModuleManager-count").each(function(id) { $(this).html(start+id) }); // Update index column           
           nb_results=parseInt($("#ModuleManager-nb_results").html())-n;
           $("#ModuleManager-nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
           $("#ModuleManager-end_result").html($(".ModuleManager-count:last").html());
        }
           
      
             
                                                             
            // {* PAGER - begin *}
            $('.ModuleManager-order').click(function() {
                $(".ModuleManager-order_active").attr('class','ModuleManager-order');
                $(this).attr('class','ModuleManager-order_active');
                return updateModuleManagersFilter();
            });

            $(".ModuleManager-search").keypress(function(event) {
                if (event.keyCode==13)
                    return updateModuleManagersFilter();
            });
            
            $("[name=ModuleManager-nbitemsbypage],.ModuleManager[name=is_active],.ModuleManager[name=is_available],.ModuleManager[name=in_site],.ModuleManager[name=type],.ModuleManager[name=status]").change(function() { return updateModuleManagersFilter(); });                                                
            
            $("#ModuleManager-filter").click(function() { return updateModuleManagersFilter(); }); 

            $("#ModuleManager-init").click(function() { $.ajax2({ 
                    url:"{url_to('modules_manager_ajax',['action'=>'ListPartialModuleManager'])}",
                     loading: "#tab-dashboard-superadmin-loading",
                            errorTarget: ".errors-tab-dashboard-superadmin", 
                            target: "#tab-panel-dashboard-superadmin-actions" });
                }); 

            $(".ModuleManager-pager").click(function () {
                return $.ajax2({ data: getModuleManagersFilterParameters(), 
                url:"{url_to('modules_manager_ajax',['action'=>'ListPartialModuleManager'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length),
                 loading: "#tab-dashboard-superadmin-loading",
                            errorTarget: ".errors-tab-dashboard-superadmin", 
                            target: "#tab-panel-dashboard-superadmin-actions"  });
            });

            $("#ModuleManager-all").click(function () {  $(".ModuleManager-selection").attr("checked",($(this).attr("checked")=="checked"));  });

         // {* PAGER - end *}   

         // {* ACTIONS - begin *}
         
         $(".ModuleManager#IsActiveEnable,.ModuleManager#IsActiveDisable").click( function () {         
                var params={ moduleManagers: { selection : {  } , value :(this.id=='IsActiveDisable'?'NO':'YES'),token: "{mfForm::getToken('moduleManagerIsActiveChangesForm')}" } };  
                idx=0;
                $(".ModuleManager-selection:checked").each(function (id) {         
                    if ($(".ModuleManager-ChangeIsActive[name="+this.name+"]").attr('id')!=undefined && $(".ModuleManager-ChangeIsActive[name="+this.name+"]").attr('id')!=params.moduleManagers.value)
                       params.moduleManagers.selection[idx++]= this.name;
                });             
                if ($.isEmptyObject(params.moduleManagers.selection))
                   return ;
                return $.ajax2({ data: params ,
                                 url:"{url_to('modules_manager_ajax',['action'=>'IsActiveChangesModuleManager'])}",
                                 loading: "#tab-dashboard-superadmin-loading",
                                 errorTarget: ".errors-tab-dashboard-superadmin",                            
                                 success: function(resp) { 
                                                 if (resp.action=='IsActiveChangesModuleManager')
                                                        changeModuleManagerIsActiveState(resp);
                                          }
                });
            }); 
   

            $(".ModuleManager#IsAvailableEnable,.ModuleManager#IsAvailableDisable").click( function () {             
                var params={ moduleManagers: { selection : {  } , value :(this.id=='IsAvailableDisable'?'NO':'YES'),token: "{mfForm::getToken('moduleManagerIsAvailableChangesForm')}" } };  
                idx=0;
                $(".ModuleManager-selection:checked").each(function (id) {                 
                    if ($(".ModuleManager-ChangeIsAvailable[name="+this.name+"]").attr('id')!=params.moduleManagers.value)
                       params.moduleManagers.selection[idx++]= this.name;
                });
                if ($.isEmptyObject(params.moduleManagers.selection))
                   return ;
                return $.ajax2({ data: params ,
                                 url:"{url_to('modules_manager_ajax',['action'=>'IsAvailableChangesModuleManager'])}",
                                 loading: "#tab-dashboard-superadmin-loading",
                                 errorTarget: ".errors-tab-dashboard-superadmin",                             
                                 success: function(resp) { 
                                                 if (resp.action=='IsAvailableChangesModuleManager')
                                                        changeModuleManagerIsAvailableState(resp);
                                          }
                });
            }); 
            
          $(".ModuleManager-ChangeIsActive").click( function () { 
                if ($(this).hasClass("NotAuthorized"))                    
                     return ;
                return $.ajax2({ data: { moduleManager : { id: this.name, value: this.id, token: '{mfForm::getToken("moduleManagerChangeForm")}' } },
                                 url: "{url_to('modules_manager_ajax',['action'=>'ChangeIsActiveModuleManager'])}",
                                 loading: "#tab-dashboard-superadmin-loading",
                                 errorTarget: ".errors-tab-dashboard-superadmin",                             
                                 success: function(resp) {
                                               if (resp.action=='ChangeIsActiveModuleManager')
                                                    changeModuleManagerIsActiveState(resp);
                                          }
                });    
            });
            
          $(".ModuleManager-ChangeIsAvailable").click( function () { 
                return $.ajax2({ data: { moduleManager : { id: this.name, value: this.id, token: '{mfForm::getToken("moduleManagerChangeForm")}' } },
                                 url: "{url_to('modules_manager_ajax',['action'=>'ChangeIsAvailableModuleManager'])}",
                                 loading: "#tab-dashboard-superadmin-loading",
                                 errorTarget: ".errors-tab-dashboard-superadmin",                             
                                 success: function(resp) {
                                               if (resp.action=='ChangeIsAvailableModuleManager')
                                                    changeModuleManagerIsAvailableState(resp);                                                    
                                          }
                });    
            });   
            
             $(".ModuleManager-Delete").click( function () { 
                if (!confirm('{__("Module \"#0#\" will be deleted physically. Confirm ?")}'.format(this.name))) return false; 
                return $.ajax2({ data: { ModuleManager : $(this).attr('id')  },
                                 url: "{url_to('modules_manager_ajax',['action'=>'DeleteModuleManager'])}",
                                 loading: "#tab-dashboard-superadmin-loading",
                                 errorTarget: ".errors-tab-dashboard-superadmin",                             
                                 success: function(resp) {
                                               if (resp.action=='DeleteModuleManager')
                                               {
                                                   if ($(".moduleManagers").length==0)
                                                   {
                                                      $.ajax2({ url:"{url_to('modules_manager_ajax',['action'=>'ListModuleManager'])}",target: "#middle"}); 
                                                   }
                                                   $(".moduleManagers#moduleManager_"+resp.id).remove();
                                                   updatePager(1);
                                               }                                                   
                                          }
                });    
            });  
            
            $(".ModuleManager-selection,#ModuleManager-all").click(function (){               
                $(".ModuleManager-actions_items").css('opacity',($(".ModuleManager-selection:checked").length?'1':'0.5'));
            });
                      
            // {* ACTIONS - end *}      
            
            $("#ModuleManager-Build").click( function () {                
                 return $.ajax2({ 
                                  url: "{url_to('modules_manager_ajax',['action'=>'BuildModuleManager'])}",
                                  loading: "#tab-dashboard-superadmin-loading",
                                  errorTarget: ".errors-tab-dashboard-superadmin"                             
                 });    
            });
            
           $(".ModuleManager-Update").click( function () {      
                var action=$(this);
                if ($(this).hasClass('Installable') && $(this).hasClass('Install'))
                {                     
                    // Install module                   
                    return $.ajax2({ data : { id: action.attr('id') },
                                     url:"{url_to('modules_manager_ajax',['action'=>'InstallModuleManager'])}",
                                     loading: "#tab-dashboard-superadmin-loading",
                                     errorTarget: ".errors-tab-dashboard-superadmin",                             
                                     success:function(resp) {
                                                if (resp.action=='InstallModuleManager') 
                                                {                                    
                                                     action.attr('title','{__("uninstall")}');
                                                     action.addClass('Uninstallable Uninstall');
                                                     action.removeClass('Installable Install');
                                                     action.children('img').attr({ title:"{__("uninstall")}", src : "{url('/icons/cancel.gif','picture')}" } );
                                                     $(".module#status_"+action.attr('id')).html("{__("installed")}");
                                                     // IsActive
                                                     $(".module#IsActive-"+action.attr('id')).css('opacity',1);
                                                     $(".ModuleManager-ChangeIsActive[name="+action.attr('id')+"]").css("cursor","");
                                                     $(".ModuleManager-ChangeIsActive[name="+action.attr('id')+"]").removeClass("NotAuthorized");
                                                } 
                                            }                                       
                                   });                                          
                }  
                if ($(this).hasClass('Uninstallable') && $(this).hasClass('Uninstall'))
                {                                   
                    return $.ajax2({ data : { id: action.attr('id') },
                                     url:"{url_to('modules_manager_ajax',['action'=>'UninstallModuleManager'])}",
                                     loading: "#tab-dashboard-superadmin-loading",
                                     errorTarget: ".errors-tab-dashboard-superadmin",                             
                                     success:function(resp) {                                                                             
                                                if (resp.action=='UninstallModuleManager') 
                                                {                                    
                                                     {*action.attr('title','{__("install")}');
                                                     action.addClass('Installable Install');
                                                     action.removeClass('Uninstallable Uninstall');
                                                     action.children('img').attr({ title:"{__("install")}", src : "{url('/icons/exec.gif','picture')}" } );
                                                     $(".Module#status_"+action.attr('id')).html("{__("loaded")}");
                                                     // IsActive
                                                     $(".Module#IsActive-"+action.attr('id')).attr({ alt: "{__("NO")}",title: "{__("NO")}",src :"{url('/icons/NO.gif','picture')}" } ).css('opacity',0.5);                                                     
                                                     $(".ModuleManager-ChangeIsActive[name="+action.attr('id')+"]").css("cursor","default");
                                                     $(".ModuleManager-Change IsActive[name="+action.attr('id')+"]").addClass("NotAuthorized");*}
                                                     action.attr('title','{__("install")}');
                                                     action.addClass('Installable Install');
                                                     action.removeClass('Uninstallable Uninstall');
                                                     action.children('img').attr({ title:"{__("install")}", src : "{url('/icons/exec.gif','picture')}" } );
                                                     $(".Module#status_"+action.attr('id')).html("{__("loaded")}");
                                                     // IsActive
                                                     $(".Module#IsActive-"+action.attr('id')).attr({ alt: "{__("NO")}",title: "{__("NO")}",src :"{url('/icons/NO.gif','picture')}" } ).css('opacity',0.5);                                                     
                                                     $(".ModuleManager-ChangeIsActive[name="+action.attr('id')+"]").css("cursor","default");
                                                     $(".ModuleManager-ChangeIsActive[name="+action.attr('id')+"]").addClass("NotAuthorized");
                                                } 
                                            }
                                   });
                }
            });
            
            $("#ModuleManager-UpdateSite").click( function () {                
                 return $.ajax2({ 
                                  url: "{url_to('modules_manager_ajax',['action'=>'UpdateSiteModuleManager'])}",
                                  loading: "#tab-dashboard-superadmin-loading",
                                  errorTarget: ".errors-tab-dashboard-superadmin",                             
                 });    
            });
       
           
        
      
		$('.footable').footable();
	
      
</script>
