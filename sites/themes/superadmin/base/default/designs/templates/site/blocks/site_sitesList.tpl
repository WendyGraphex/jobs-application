{messages class="errors-tab-dashboard-sites"}   
<div>
    <a href="#" class="ClearCache btn" id="ALL"><i class="fa fa-database" style="margin-right:10px;"></i>
{*<img  src="{url('/icons/cache.gif','picture')}" alt="{__('Clear cache')}"/>*}{__('cache')|capitalize}</a>
    <a href="#" class="btn" id="ClearCacheSuperAdmin" class="fa fa-database"><i class="fa fa-database" style="margin-right:10px;"></i>{*<img  src="{url('/icons/cache.gif','picture')}" alt="{__('Clear superadmin cache')}"/>*}{__('superadmin cache')|capitalize}</a>
    <a href="#" class="btn" id="ClearHostCache" class="fa fa-database"><i class="fa fa-database" style="margin-right:10px;"></i>{*<img  src="{url('/icons/cache.gif','picture')}" alt="{__('Clear Host cache')}"/>*}{__('host cache')|capitalize}</a>  
    <a id="NewHost" class="btn" href="#"><i class="fa fa-plus" style="margin-right:10px;"></i>{*<img  src="{url('/icons/add.gif','picture')}" alt="{__('new')}"/>*}{__('host')|capitalize}</a>      
   <a href="#" title="{__('disable')}" class="btn" id="DisabledGlobalSites">
        <i class="fa fa-circle" style=" margin-right: 10px"></i>
        {*<img  src="{url('/icons/NO.gif','picture')}" alt='{__("no")}'/>*}{__('disable all sites')|capitalize}</a> 
    {foreach $actions as $name=>$action}
        {if $action.component}
        {component name=$action.component pager=$pager nocached=true}
        {/if}
    {/foreach}
</div>
{* PAGER *}
{include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter}
<button id="filter" class="btn-table">{__("filter")|capitalize}</button>   <button id="init" class="btn-table">{__("init")|capitalize}</button>
<table class="tabl-list tabl-list footable table" cellpadding="0" cellspacing="0">
    <thead>
    <tr class="list-header">
        <th rowspan="2">#</th>
        {if $pager->getNbItems()>5}<th rowspan="2">&nbsp;</th>{/if}
        <th data-hide="phone" style="display: table-cell;" rowspan="2"><span>{__("id")}</span></th>
        <th class="footable-first-column" data-toggle="true" rowspan="2"><span>{__("Name")}</span>
          <div>
           <a href="#" class="order{$formFilter.order.site_id->getValueExist('asc','_active')}" id="asc" name="site_id"><img  src='{url("/icons/sort_asc`$formFilter.order.site_id->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>               
           <a href="#" class="order{$formFilter.order.site_id->getValueExist('desc','_active')}" id="desc" name="site_id"><img  src='{url("/icons/sort_desc`$formFilter.order.site_id->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
          </div>     
        </th>
        <th data-hide="phone,tablet" style="display: table-cell;" rowspan="2"><span>{__("Host")}</span>
         <div>
           <a href="#" class="order{$formFilter.order.site_host->getValueExist('asc','_active')}" id="asc" name="site_host"><img  src='{url("/icons/sort_asc`$formFilter.order.site_host->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>               
           <a href="#" class="order{$formFilter.order.site_host->getValueExist('desc','_active')}" id="desc" name="site_host"><img  src='{url("/icons/sort_desc`$formFilter.order.site_host->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
        </div>
        </th>
        <th data-hide="phone,tablet" style="display: table-cell;" colspan="2" style=" border-bottom: 1px solid #fff;">{__("admin")|capitalize}
         
        </th>
        <th data-hide="phone,tablet" style="display: table-cell;" colspan="2" style=" border-bottom: 1px solid #fff;">{__("frontend")|capitalize}</th>
      {*  <th rowspan="2"><span>{__("type")|capitalize}</span></th>     *}
        <th data-hide="phone,tablet" style="display: table-cell;" rowspan="2"><span>{__("global")|capitalize}</span>
        <div>
           <a href="#" class="order{$formFilter.order.site_db_name->getValueExist('asc','_active')}" id="asc" name="site_db_name"><img  src='{url("/icons/sort_asc`$formFilter.order.site_db_name->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>               
           <a href="#" class="order{$formFilter.order.site_db_name->getValueExist('desc','_active')}" id="desc" name="site_db_name"><img  src='{url("/icons/sort_desc`$formFilter.order.site_db_name->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
        </div>
        </th>  
        <th data-hide="phone,tablet" style="display: table-cell;" rowspan="2" width="20%">{__("actions"|capitalize)}</th>
    </tr>
    
    <tr class="list-header">            
        <th width="15%">{__("theme")|capitalize}
         <div>
           <a href="#" class="order{$formFilter.order.site_db_name->getValueExist('asc','_active')}" id="asc" name="site_db_name"><img  src='{url("/icons/sort_asc`$formFilter.order.site_db_name->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>               
           <a href="#" class="order{$formFilter.order.site_db_name->getValueExist('desc','_active')}" id="desc" name="site_db_name"><img  src='{url("/icons/sort_desc`$formFilter.order.site_db_name->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
        </div>
        </th>
        <th  width="15%">{__("state")|capitalize}
         <div>
           <a href="#" class="order{$formFilter.order.site_db_name->getValueExist('asc','_active')}" id="asc" name="site_db_name"><img  src='{url("/icons/sort_asc`$formFilter.order.site_db_name->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>               
           <a href="#" class="order{$formFilter.order.site_db_name->getValueExist('desc','_active')}" id="desc" name="site_db_name"><img  src='{url("/icons/sort_desc`$formFilter.order.site_db_name->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
        </div>
        </th>
        <th  width="15%">{__("theme")|capitalize}
        <div>
           <a href="#" class="order{$formFilter.order.site_db_name->getValueExist('asc','_active')}" id="asc" name="site_db_name"><img  src='{url("/icons/sort_asc`$formFilter.order.site_db_name->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>               
           <a href="#" class="order{$formFilter.order.site_db_name->getValueExist('desc','_active')}" id="desc" name="site_db_name"><img  src='{url("/icons/sort_desc`$formFilter.order.site_db_name->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
        </div>
        </th>
        <th  width="15%">{__("state")|capitalize}
        <div>
           <a href="#" class="order{$formFilter.order.site_db_name->getValueExist('asc','_active')}" id="asc" name="site_db_name"><img  src='{url("/icons/sort_asc`$formFilter.order.site_db_name->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>               
           <a href="#" class="order{$formFilter.order.site_db_name->getValueExist('desc','_active')}" id="desc" name="site_db_name"><img  src='{url("/icons/sort_desc`$formFilter.order.site_db_name->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
        </div>
        </th>
    </tr>
</thead>
    
    
    <tr class="input-list">
        <td></td>
        <td></td>
        <td><input class="search" type="text" size="5" name="site_id" value="{$formFilter.search.site_id}"></td>
        <td><input class="search" type="text" size="5" name="site_host" value="{$formFilter.search.site_host}"></td>
        <td><input class="search" type="text" size="5" name="site_db_name" value="{$formFilter.search.site_db_name}"></td>
        <td></td>
        <td>{html_options_format format="__" name="site_admin_available" options=$formFilter->search.site_admin_available->getOption('choices') selected=(string)$formFilter.search.site_admin_available}</td>
        <td></td>
        <td>{html_options_format format="__" name="site_frontend_available" options=$formFilter->search.site_frontend_available->getOption('choices') selected=(string)$formFilter.search.site_frontend_available}</td>
    {*    <td></td>           *}
        <td>{html_options_format format="__" name="site_available" options=$formFilter->search.site_available->getOption('choices') selected=(string)$formFilter.search.site_available}</td>
        <td></td>
    </tr>
    {foreach $pager as $site}
        <tr class="sites list" id="sites-{$site->get('site_id')}" name="{$site->get('site_id')}">  
            <td class="sites-count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$site@iteration}</td>
            {if $pager->getNbItems()>5}<td><input class="selection" type="checkbox" id="" /></td>{/if}   
            <td>{$site->get('site_id')}</td>
            <td>{$site->get('site_db_name')}</td>   
            <td>{$site->get('site_host')}    
            <td>{$site->get('site_admin_theme')}    
            </td>
            <td>
                <a href="#" class="ChangeAdmin" id="{$site->get('site_host')|escape}" name="{$site->get('site_admin_available')}">
                    <img  src="{url('/icons/','picture')}{$site->get('site_admin_available')}.gif" alt='{__("site_`$site->get("site_admin_available")`")}' title='{__("site_`$site->get("site_admin_available")`")}'/>
                </a>
            </td>
            <td>{$site->get('site_frontend_theme')}   
            </td>
            <td> 
                <a href="#" class="ChangeFrontend" id="{$site->get('site_host')|escape}" name="{$site->get('site_frontend_available')}">
                    <img  src="{url('/icons/','picture')}{$site->get('site_frontend_available')}.gif" alt='{__("site_`$site->get("site_frontend_available")`")}' title='{__("site_`$site->get("site_frontend_available")`")}'/>
                </a>
            </td>
            <td>
                  <a href="#" class="ChangeGlobal" id="{$site->get('site_host')|escape}" name="{$site->get('site_available')}"><img src="{url('/icons/','picture')}{$site->get('site_available')}.gif" alt='{__("site_`$site->get("site_available")`")}' title='{__("site_`$site->get("site_available")`")}'/></a>
            </td>
            <td style="text-align:left;">               
                <a href="#" title="{__('Edit')|capitalize}" class="ViewAdminSite" id="{$site->get('site_id')}" name="{$site->get('site_host')}"><img  src="{url('/icons/edit.gif','picture')}" alt='{__("edit")}'/></a>
                <a href="#" title="{__('clear cache')|capitalize}" class="ClearCache" id="{$site->get('site_host')|escape}"><img  src="{url('/icons/cache.gif','picture')}" alt="{__('clear cache')}"/></a>                   
                {foreach $action_item as $name=>$action}
                    {if $action.component}
                    {component name=$action.component site=$site pager=$pager nocached=true}
                    {/if}
                {/foreach}                                        
                {if mfConfig::getSuperAdmin('host')!=$site->get('site_host')}  
                    <a href="#" title="{__('delete')|capitalize}" class="DeleteSite" id="{$site->get('site_host')|escape}"><img  src="{url('/icons/delete.gif','picture')}" alt='{__("delete")}'/></a>
                {else}
                    <img  src="{url('/icons/forbidden.png','picture')}" alt='{__("forbidden")}'/>
                {/if}                      
            </td>
        </tr>    
        {foreach $site->getHosts() as $host}
            <tr class="sites list">
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
                <td>{$host->get('site_host')}
                </td>
                <td>{$host->get('site_admin_theme')} 
                </td>
                <td>
                     <a href="#" class="ChangeAdmin" id="{$host->get('site_host')|escape}" name="{$host->get('site_admin_available')}">
                    <img  src="{url('/icons/','picture')}{$host->get('site_admin_available')}.gif" alt='{__("site_`$host->get("site_admin_available")`")}' title='{__("site_`$host->get("site_admin_available")`")}'/>
                </a>
                </td>
                <td>{$host->get('site_frontend_theme')} 
                </td>
                <td>
                     <a href="#" class="ChangeFrontend" id="{$host->get('site_host')|escape}" name="{$host->get('site_frontend_available')}">
                    <img  src="{url('/icons/','picture')}{$host->get('site_frontend_available')}.gif" alt='{__("site_`$host->get("site_frontend_available")`")}' title='{__("site_`$host->get("site_frontend_available")`")}'/>
                </a>
                </td>
                <td>
                      <a href="#" class="ChangeGlobal" id="{$host->get('site_host')|escape}" name="{$site->get('site_available')}"><img src="{url('/icons/','picture')}{$site->get('site_available')}.gif" alt='{__("site_`$host->get("site_available")`")}' title='{__("site_`$host->get("site_available")`")}'/></a>
                </td>
                 <td style="text-align:left;">                      
                <a href="#" title="{__('Edit')|capitalize}" class="ViewAdminSite" id="{$host->get('site_id')}" name="{$host->get('site_host')}"><img  src="{url('/icons/edit.gif','picture')}" alt='{__("edit")}'/></a>
                <a href="#" title="{__('clear cache')|capitalize}" class="ClearCache" id="{$host->get('site_host')|escape}"><img  src="{url('/icons/cache.gif','picture')}" alt="{__('clear cache')}"/></a>                   
              {*  {foreach $action_item as $name=>$action}
                    {if $action.component}
                    {component name=$action.component site=$site pager=$pager nocached=true}
                    {/if}
                {/foreach}  *}                                      
                {if mfConfig::getSuperAdmin('host')!=$host->get('site_host')}  
                    <a href="#" title="{__('delete')|capitalize}" class="DeleteSite" id="{$host->get('site_host')|escape}"><img  src="{url('/icons/delete.gif','picture')}" alt='{__("delete")}'/></a>
                {else}
                    <img  src="{url('/icons/forbidden.png','picture')}" alt='{__("forbidden")}'/>
                {/if}                  
            </td>
            </tr>    
        {/foreach}    
           
    {/foreach}                
</table>
{if !$pager->getNbItems()}   
     {__("no result")}
{else}
   {if $pager->getNbItems()>5}
       <input type="checkbox" id="all" />  
       <a href="#" title="{__('enable')}" id="EnabledSites" style="opacity:0.5" class="actions_items"><img  src="{url('/icons/YES.gif','picture')}" alt='{__("yes")}'/></a>
       <a href="#" title="{__('disable')}" id="DisabledSites" style="opacity:0.5" class="actions_items"><img  src="{url('/icons/NO.gif','picture')}" alt='{__("no")}'/></a>
       <a href="#" title="{__('delete')}" id="DeleteSites" style="opacity:0.5" class="actions_items"><img  src="{url('/icons/delete.gif','picture')}" alt='{__("delete")}'/></a>       
       <table cellpadding="0" cellspacing="0">
           <tr>
               <th>{__("admin")}</th>
               <td><a href="#" title="{__('enable')}" id="EnabledSitesAdmin" style="opacity:0.5" class="actions_items"><img  src="{url('/icons/YES.gif','picture')}" alt='{__("yes")}'/></td>
               <td><a href="#" title="{__('disable')}" id="DisabledSitesAdmin" style="opacity:0.5" class="actions_items"><img  src="{url('/icons/NO.gif','picture')}" alt='{__("no")}'/></td>
           </tr>
           <tr>
               <th>{__("frontend")}</th>
               <td><a href="#" title="{__('enable')}" id="EnabledSitesFrontend" style="opacity:0.5" class="actions_items"><img  src="{url('/icons/YES.gif','picture')}" alt='{__("yes")}'/></td>
               <td><a href="#" title="{__('disable')}" id="DisabledSitesFrontend" style="opacity:0.5" class="actions_items"><img  src="{url('/icons/NO.gif','picture')}" alt='{__("no")}'/></td>
           </tr>
       </table>
  {/if}
{/if}    
{include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager}
<script type="text/javascript">

        function getSitesFilterParameters()
        {
           var params={ filter: { 
                                     order : { }, 
                                     search: { 
                                         site_admin_available: $("[name=site_admin_available]").val(),
                                         site_frontend_available:$("[name=site_frontend_available]").val(),
                                         site_available:$("[name=site_available]").val()
                                     }, 
                                     nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                     token:'{$formFilter->getCSRFToken()}'
                                  }};
           params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");
           $(".search").each(function() { params.filter.search[this.name] =this.value; }); 
           return params;
        }

        function updateSites()
        {
           return $.ajax2({    data: getSitesFilterParameters(),
                               loading: "#tab-dashboard-site-loading",
                               target: "#tab-Dashboard-Site",
                               errorTarget: ".errors-tab-dashboard-sites",                               
                               url:"{url_to('site_ajax',['action'=>'ListPartial'])}" }); 
        }

        function updateSiteChange(resp) 
        {
          $.each(resp.selection?resp.selection:[resp.host], function (id) { 
            sel="#"+this.replace(/\./g,"\\.")+"."+resp.action;
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

        function changeSiteStatebyId(id,state)
        {
              sel="img#"+id;   
              $(sel).attr({
                    src :"{url('/icons/','picture')}"+state+".gif",
                    alt : (state=='YES'?'{__("site_YES")}':'{__("site_NO")}'),
                    title : (state=='YES'?'{__("site_YES")}':'{__("site_NO")}')
              });
              $(sel).parent().attr('name',state);
        }           

        function updatePager(n)
        {
           page_active=$(".pager .active").html()?parseInt($(".pager .active").html()):1;
           records_by_page=$("[name=nbitemsbypage]").val();
           start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
          // alert("page active="+page_active+" records_by_page="+records_by_page+" start="+start);
           $(".sites-count").each(function(id) { $(this).html(start+id) }); // Update index column           
           nb_results=parseInt($("#nb_results").html())-n;
           $("#nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
           $("#end_result").html($(".sites-count:last").html());
        }

        
        
 {JqueryScriptsReady}

         // {* PAGER - begin *}
         $('.order').click(function() {
            $(".order_active").attr('class','order');
            $(this).attr('class','order_active');
            return updateSites();
         });

         $("[name=site_frontend_available],[name=site_admin_available],[name=site_available],[name=nbitemsbypage]").change(function() {
             return updateSites();
         }); 

         $(".search").keypress(function(event) {
                    if (event.keyCode==13)
                    {
                       return updateSites();
                    }     
         });

         $(".pager").click(function () {                
             return $.ajax2({ data: getSitesFilterParameters(),
                     loading: "#tab-dashboard-superadmin-loading",
                     url: "{url_to('site_ajax',['action'=>'ListPartial'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length),
                     target:"#tab-Dashboard-Site" });               
         });   

         $("#filter").click(function() { return updateSites(); }); 

         $("#init").click(function() {  return $.ajax2({   
                               loading: "#tab-dashboard-site-loading",
                               errorTarget: ".errors-tab-dashboard-sites",    
                               target: "#tab-Dashboard-Site",
                               url: "{url_to('site_ajax',['action'=>'ListPartial'])}" }); 
         }); 

         $("#all").click(function () { $(".selection").attr("checked",($(this).attr("checked")=="checked"));  });

         // {* PAGER - end *}         

         // {* ACTIONS - begin *}

         $('#ClearCacheSuperAdmin').click(function () { 
             return  $.ajax2({   
                               loading: "#tab-dashboard-site-loading",
                               errorTarget: ".errors-tab-dashboard-sites",                               
                               url: "{url_to('site_ajax',['action'=>'ClearCacheSuperAdmin'])}" });
         });

         $('#ClearHostCache').click(function () { 
              return $.ajax2({   
                               loading: "#tab-dashboard-site-loading",
                               errorTarget: ".errors-tab-dashboard-sites",                               
                               url:"{url_to('site_ajax',['action'=>'ClearHostCache'])}" });
         });

         $('.ClearCache').click(function () { 
             return $.ajax2({  data: { Host : this.id },
                               loading: "#tab-dashboard-site-loading",
                               errorTarget: ".errors-tab-dashboard-sites",                               
                               url: "{url_to('site_ajax',['action'=>'ClearCache'])}" });
         });
         
          $('.RemoveDatabase').click(function () { 
             return $.ajax2({  data: { Host : this.id },
                               loading: "#tab-dashboard-site-loading",
                               errorTarget: ".errors-tab-dashboard-sites",                               
                               url: "{url_to('site_ajax',['action'=>'RemoveDatabase'])}" });
         });

         $('.Dashboard-Site').click(function () {           
            return addSiteTab($(this).attr('name'),"{url_to('site_ajax',['action'=>'Dashboard'])}");             
         });

         $('.DeleteSite').click(function () {
              if (!confirm('{__("The site #0# will be deleted. Confirm ?")}'.format(this.id))) return false;
              return $.ajax2({ data:  { Host : this.id },
                               loading: "#tab-dashboard-site-loading",
                               errorTarget: ".errors-tab-dashboard-sites",                               
                               url:"{url_to('site_ajax',['action'=>'DeleteSite'])}",
                               success:  function (resp) { 
                                            if (resp.action=='deleteSite')
                                            {    
                                               $(".sites[id=sites-"+resp.host+"]").remove();      
                                            }
                                            updatePager(1);
                                        }    
                             });
         });

         $('#NewSite').click(function () {  
             return $.ajax2({  loading: "#tab-dashboard-site-loading",
                               errorTarget: ".errors-tab-dashboard-sites", 
                               target: "#tab-Dashboard-Site",
                            {*   url: "{url_to('site_ajax',['action'=>'NewSite'])}" }); *}
                               url: "{url_to('site_ajax',['action'=>'NewSiteLight'])}" });
         });

         $('#NewHost').click(function () {  
             return $.ajax2({   
                               loading: "#tab-dashboard-site-loading",
                               errorTarget: ".errors-tab-dashboard-sites",   
                               target: "#tab-Dashboard-Site",
                               url:"{url_to('site_ajax',['action'=>'NewHost'])}" }) ;
         });

         $('.ViewAdminSite').click(function () {
                return $.ajax2({ data: { Site : this.id }, 
                                 url: "{url_to('site_ajax',['action'=>'ViewAdminSite'])}", 
                                 loading: "#tab-dashboard-site-loading",
                                 errorTarget: ".errors-tab-dashboard-sites",   
                                 target: "#tab-Dashboard-Site",
                               });
         });
         
         $('.ChangeGlobal').click(function () {
             return $.ajax2({  data: { host : this.id, value: this.name },
                               loading: "#tab-dashboard-site-loading",
                               errorTarget: ".errors-tab-dashboard-sites",                               
                               url:"{url_to('site_ajax',['action'=>'ChangeGlobal'])}",
                               success: function (resp) { 
                                    if (resp.action=='ChangeGlobal')
                                        updateSiteChange(resp);
                              }  
                           });
         });

         $('.ChangeAdmin').click(function () {
                return $.ajax2({  data: { host : this.id, value: this.name },
                               loading: "#tab-dashboard-site-loading",
                               errorTarget: ".errors-tab-dashboard-sites",                               
                               url:"{url_to('site_ajax',['action'=>'ChangeAdmin'])}", 
                               success: function (resp) { 
                                    if (resp.action=='ChangeAdmin')
                                        updateSiteChange(resp);
                              }  
                            });
         });

         $('.ChangeFrontend').click(function () {
                 return $.ajax2({  data: { host : this.id, value: this.name },
                               loading: "#tab-dashboard-site-loading",
                               errorTarget: ".errors-tab-dashboard-sites",                               
                               url: "{url_to('site_ajax',['action'=>'ChangeFrontend'])}",                      
                               success: function (resp) { 
                                    if (resp.action=='ChangeFrontend')
                                        updateSiteChange(resp);
                               }  
                            });
         });

         $("#EnabledSites,#DisabledSites").click( function () { 
            var params={ sites: { selection : {  } , 
                                  value :(this.id=='DisabledSites'?'NO':'YES'),
                                  token: "{mfForm::getToken('SitesChangeForm')}" } };
            idx=0;
            $(".selection:checked").each(function (id) { 
                if ($(".ChangeGlobal#"+this.id.replace(/\./g,"\\.")).attr('name')!=params.sites.value)
                   params.sites.selection[idx++]= this.id;
            });
            if ($.isEmptyObject(params.sites.selection))
               return ;
            return $.ajax2({  data: params, 
                              loading: "#tab-dashboard-site-loading",
                              errorTarget: ".errors-tab-dashboard-sites",                               
                              url:"{url_to('site_ajax',['action'=>'ChangeGlobal'])}", 
                              success:function (resp) { 
                                     if (resp.action=='ChangeGlobal')
                                         updateSiteChange(resp); 
                              }  
                            });
         }); 

         $("#EnabledSitesAdmin,#DisabledSitesAdmin").click( function () { 
            var params={ sites : { 
                                    selection : {  } , 
                                    value :(this.id=='DisabledSitesAdmin'?'NO':'YES'),
                                    token : "{mfForm::getToken('SitesChangeForm')}"
                                } 
                       };
            idx=0;
            $(".selection:checked").each(function (id) { 
                if ($(".ChangeAdmin#"+this.id.replace(/\./g,"\\.")).attr('name')!=params.sites.value)
                   params.sites.selection[idx++]= this.id;
            });
            if ($.isEmptyObject(params.sites.selection))
               return ;
            return $.ajax2({   data: params,
                               loading: "#tab-dashboard-site-loading",
                               errorTarget: ".errors-tab-dashboard-sites",                               
                               url: "{url_to('site_ajax',['action'=>'ChangeAdminSites'])}", 
                               success: function (resp) { 
                                     if (resp.action=='ChangeAdmin')
                                          updateSiteChange(resp);
                              } 
                           });
         });

         $("#EnabledSitesFrontend,#DisabledSitesFrontend").click( function () { 
            var params={ sites : { 
                                    selection : {  } , 
                                    value :(this.id=='DisabledSitesFrontend'?'NO':'YES'),
                                    token : "{mfForm::getToken('SitesChangeForm')}"
                                 } 
                             };
            idx=0;
            $(".selection:checked").each(function (id) { 
                if ($(".ChangeFrontend#"+this.id.replace(/\./g,"\\.")).attr('name')!=params.sites.value)
                   params.sites.selection[idx++]= this.id;
            });
            if ($.isEmptyObject(params.sites.selection))
               return ;
            return $.ajax2({   data : params,
                               loading: "#tab-dashboard-site-loading",
                               errorTarget: ".errors-tab-dashboard-sites",                               
                               url:"{url_to('site_ajax',['action'=>'ChangeFrontendSites'])}", 
                               success: function (resp) { 
                                     if (resp.action=='ChangeFrontend')
                                          updateSiteChange(resp);
                              }  
                           });
         });

          $("#DeleteSites").click( function () { 
            var params={ sites : { 
                                   selection : {  } ,
                                   token : "{mfForm::getToken('SitesDeleteForm')}"
                                } 
                       };
            text="";
            error=false;
            $(".selection:checked").each(function (id) { 
                if (this.id=="{mfConfig::getSuperAdmin('host')}")
                {
                   error=true; 
                   return ;
                }   
                params.sites.selection[id]=this.id;
                text+=this.id+",\n";
            });

            if (error)
            {
               $(".errors").messagesManager("error","{__('delete superadmin host [%s] is forbidden.',mfConfig::getSuperAdmin('host'))}");
               return ;
            }

            if ($.isEmptyObject(params.sites.selection))  return ;

            if (!confirm("{__('Sites :\u000A\u000A\"#0#\"\u000A\u000A will be deleted. Confirm ?')}".format(text.substring(0,text.lastIndexOf(","))))) 
                 return false; 
            return $.ajax2({   data: params,
                               loading: "#tab-dashboard-site-loading",
                               errorTarget: ".errors-tab-dashboard-sites",                               
                               url:"{url_to('site_ajax',['action'=>'DeleteSites'])}",
                               success: function(resp) { 
                                    if (resp.action=='DeleteSites')
                                    {  
                                       if ($(".sites").length-resp.selection.length==0)
                                       {    
                                          return ajax2({ errorTarget: ".errors-tab-dashboard-sites",
                                                         url:"{url_to('site_ajax',['action'=>'ListPartial'])}",
                                                         target: "#tab-Dashboard-Site" });
                                       }      
                                       $.each(resp.selection, function (id) {  $("tr#site_"+this.replace(/\./g,"\\.")).remove(); });  // Mette le name
                                       updatePager(resp.selection.length); // Update Number of results
                                       $("input#all").attr("checked",false);                               
                                    }
                               }
                           });          
         });

         $("#DisabledGlobalSites").click( function () { 
            return $.ajax2({   loading: "#tab-dashboard-site-loading",
                               errorTarget: ".errors-tab-dashboard-sites",                               
                               url:"{url_to('site_ajax',['action'=>'DisableGlobalSites'])}", 
                               success: function (resp) { 
                                     if (resp.action=='DisableGlobalSites')
                                     {  
                                            $(".ChangeGlobal img").attr({
                                                    src :"{url('/icons/NO.gif','picture')}",
                                                    alt : '{__("site_NO")}',
                                                    title : '{__("site_NO")}'
                                            });
                                            $(".ChangeGlobal").attr("name","NO");
                                     }
                              }    
                           });
         });

        $(".selection,#all").click(function (){               
            $(".actions_items").css('opacity',($(".selection:checked").length?'1':'0.5'));
        });

        // {* action_item from actions config *}
        {foreach $action_item as $name=>$action}   
             {if $action.component}
             {component name=$action.component JS=true}
             {/if}
        {/foreach}

        // {* ACTIONS - end *}

		$('.footable').footable();
	{/JqueryScriptsReady}
</script>

