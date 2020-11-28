{messages}
<h3>{__("cron list")|capitalize}</h3>
<div>
        <a href="#" id="ClearCache"><img  src="{url('/icons/cache.gif','picture')}" alt="{__('Clear cache')}"/>{__('cache')|capitalize}</a>
        <a href="#" id="Report"><img  src="{url('/icons/cache.gif','picture')}" alt="{__('report')}"/>{__('report')|capitalize}</a>
        <a href="#" id="ClearDatabase"><img  src="{url('/icons/cache.gif','picture')}" alt="{__('report')}"/>{__('clear database')}</a>
</div>
{include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter}
<button id="filter">{__("filter")|capitalize}</button>   <button id="init">{__("init")|capitalize}</button>

<table cellpadding="0" cellspacing="0">
     <tr>
        <th>#</th>
        {if $pager->getNbItems()>5}<th>&nbsp;</th>{/if}
        <th>{__('id')}
             <div>
                 <a href="#" class="order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><img  src='{url("/icons/sort_asc`$formFilter.order.id->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                 <a href="#" class="order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><img  src='{url("/icons/sort_desc`$formFilter.order.id->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
             </div> 
         </th>
         <th>{__('name')}
               <div>
              <a href="#" class="order{$formFilter.order.name->getValueExist('asc','_active')}" id="asc" name="name"><img  src='{url("/icons/sort_asc`$formFilter.order.name->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
              <a href="#" class="order{$formFilter.order.name->getValueExist('desc','_active')}" id="desc" name="name"><img  src='{url("/icons/sort_desc`$formFilter.order.name->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>             
             </div> 
         </th>
         
         <th>{__('title')}
               <div>
              <a href="#" class="order{$formFilter.order.title->getValueExist('asc','_active')}" id="asc" name="title"><img  src='{url("/icons/sort_asc`$formFilter.order.title->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
              <a href="#" class="order{$formFilter.order.title->getValueExist('desc','_active')}" id="desc" name="title"><img  src='{url("/icons/sort_desc`$formFilter.order.title->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
             </div> 
         </th>
         <th>{__('state')}</th>
          <th>{__('period')}
               <div>
              {* <a href="#" class="order{$formFilter.order.title->getValueExist('asc','_active')}" id="asc" name="title"><img  src='{url("/icons/sort_asc`$formFilter.order.title->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
              <a href="#" class="order{$formFilter.order.title->getValueExist('desc','_active')}" id="desc" name="title"><img  src='{url("/icons/sort_desc`$formFilter.order.title->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
              *}
             </div> 
         </th>
          <th>{__('last execution')}
               <div>
              {* <a href="#" class="order{$formFilter.order.title->getValueExist('asc','_active')}" id="asc" name="title"><img  src='{url("/icons/sort_asc`$formFilter.order.title->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
              <a href="#" class="order{$formFilter.order.title->getValueExist('desc','_active')}" id="desc" name="title"><img  src='{url("/icons/sort_desc`$formFilter.order.title->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
              *}
             </div> 
         </th>
          <th>{__('actions')}</th>
     </tr>
     <tr>
            <td></td>
            {if $pager->getNbItems()>5}<td></td>{/if}
            <td><input class="search" type="text" size="5" name="id" value="{$formFilter.search.id}"></td>
            <td><input class="search" type="text" size="5" name="name" value="{$formFilter.search.name}"></td>
            <td><input class="search" type="text" size="5" name="title" value="{$formFilter.search.title}"></td>
            <td>{html_options name="is_active" options=$formFilter->search.is_active->getOption('choices') selected=(string)$formFilter.search.is_active}</td>
            <td></td>  
            <td></td>  
            <td></td>
            <td></td>
        </tr>       
        {foreach $pager as $item}
        <tr class="crons" id="cron_{$item->get('id')}">
            <td class="crons_count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>
            {if $pager->getNbItems()>5}<td><input class="selection" type="checkbox" name="{$item->get('id')}" id="{$item->get('name')} {$item->get('title')}" /></td>{/if}
            <td>
                {$item->get('id')}
            </td>
            <td>
                {$item->get('name')|escape}
            </td>
            <td>
                {$item->get('title')|escape}
            </td>
            <td>
               <a href="#" title="{__('change')}" class="Change" id="{$item->get('id')}" name="{$item->get('is_active')}"><img  src="{url('/icons/','picture')}{$item->get('is_active')}.gif" alt='{__("cron_`$item->get("is_active")`")}'/></a>
            </td>
            <td>
                <span title="{$item->get('period')|escape}">{$item->get('period')|escape|truncate:12}</span>
            </td>
               <td class="CronLastExecution" id="{$item->get('id')}">
                {format_date($item->get('last_execution'),['d','q'])}
            </td>
            <td>
               <a href="#" title="{__('report')}" class="Report" id="{$item->get('id')}"><img src="{url('/icons/report.png','picture')}" alt='{__("report")}'/></a>
               <a href="#" title="{__('Clear')}" class="Clear" id="{$item->get('id')}"><img src="{url('/icons/recycling16x16.png','picture')}" alt='{__("Clear")}'/></a>
               {if $credential}<a href="#" title="{__('execute')}" class="Execute" id="{$item->get('id')}"><img  src="{url('/icons/exec.gif','picture')}" alt='{__("execute")}'/></a>{/if}
               <a href="#" title="{__('report')}" class="Delete" id="{$item->get('id')}"><img src="{url('/icons/delete.gif','picture')}" alt='{__("delete")}'/></a>
            </td>
        </tr>
        {/foreach}
</table>
{if !$pager->getNbItems()} 
     {__("no result")}
{else}
   {if $pager->getNbItems()>5}
       <input type="checkbox" id="all" />  
       <a href="#" title="{__('enable')}" id="EnabledUsers"><img  src="{url('/icons/YES.gif','picture')}" alt='{__("yes")}'/>
       <a href="#" title="{__('disable')}" id="DisabledUsers"><img  src="{url('/icons/NO.gif','picture')}" alt='{__("no")}'/></a>
  {/if}
{/if}    
{include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager}

<script type="text/javascript">
    
      function changeCronState(resp) 
        {
            $.each(resp.selection?resp.selection:[resp.id], function (id) { 
                sel="a.Change#"+this;
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
        
        function getCronsFilterParameters()
        {
            params={ filter: {  order : { }, 
                                     search: { 
                                               is_active : $("[name=is_active]").val(),
                                             }, 
                                     nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                     token:'{$formFilter->getCSRFToken()}'
                                  }};
            params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");
            $(".search").each(function(id) { params.filter.search[this.name] =this.value; });                               
            return params;                  
        }
        
         function updateCronsFilter()
        {
           return $.ajax2({ data: getCronsFilterParameters(),   loading: "#tab-dashboard-superadmin-loading",url:"{url('module/cron/ListPartial')}" , target: "#tab-panel-dashboard-superadmin-actions" });
        }
        
        function updatePager(n)
        {
           page_active=$(".pager .active").html()?parseInt($(".pager .active").html()):1;
           records_by_page=$("[name=nbitemsbypage]").val();
           start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
           $(".crons_count").each(function(id) { $(this).html(start+id) }); // Update index column           
           nb_results=parseInt($("#nb_results").html())-n;
           $("#nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
           $("#end_result").html($(".crons_count:last").html());
        }
        
     {JqueryScriptsReady}
     
          // {* PAGER - begin *}
          $('.order').click(function() {
                 $(".order_active").attr('class','order');
                 $(this).attr('class','order_active');
                 return updateCronsFilter();
          });
             
          $("[name=is_active],[name=nbitemsbypage]").change(function() { return updateCronsFilter(); }); 
          
          $(".search").keypress(function(event) {
                if (event.keyCode==13)
                {
                    return updateCronsFilter();
                }     
          });
                   
          $("#filter").click(function() { return updateCronsFilter(); }); 
          
          $("#init").click(function() {  return $.ajax2({ url :"{url('module/cron/ListPartial')}",   loading: "#tab-dashboard-superadmin-loading",target: "#tab-panel-dashboard-superadmin-actions" });  }); 
          
          $(".pager").click(function () {
             return $.ajax2({ data: getCronsFilterParameters(),   loading: "#tab-dashboard-superadmin-loading",url:"{url('module/cron/ListPartial')}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length) , target: "#tab-panel-dashboard-superadmin-actions" });
          });
          
          $("#all").click(function () {  $(".selection").attr("checked",($(this).attr("checked")=="checked"));  });
           // {* PAGER - end *}         
           
           // {* ACTIONS - begin *}
          $('#Report').click(function () {  
                 return $.ajax2({ url: "{url('/module/cron/ReportView')}", 
                                loading: "#tab-dashboard-superadmin-loading",
                                    target: "#tab-panel-dashboard-superadmin-actions"});
          });
          
          $('#ClearCache').click(function () {  
                 return $.ajax2({ 
                     loading: "#tab-dashboard-superadmin-loading",
                     url: "{url('/module/cron/DeleteCacheCron')}" }
                 );
          });
          
          $('#ClearDatabase').click(function () {  
                 return $.ajax2({ 
                     url: "{url('/module/cron/DeleteDatabase')}",
                     loading: "#tab-dashboard-superadmin-loading",
                     success:function()
                             {                                
                                 return $.ajax2({ url :"{url('module/cron/ListPartial')}", 
                                                  loading: "#tab-dashboard-superadmin-loading",
                                                  target: "#tab-panel-dashboard-superadmin-actions" });
                             }
                 });
          });
          
          $(".Delete").click( function () { 
               if (!confirm('{__("Cron task \"#0#\" will be deleted. Confirm ?")}'.format(this.name))) return false; 
               return $.ajax2({
                    data: { cron: $(this).attr('id') },
                    loading: "#tab-dashboard-superadmin-loading",
                    url: "{url('/module/cron/DeleteCron')}",
                    success: function(resp) {
                            if (resp.action=='deleteCron')
                            {    
                                if ($(".crons").length-1==0)
                                {    
                                   return $.ajax2({ url: "{url('module/cron/ListPartial')}", 
                                                    loading: "#tab-dashboard-superadmin-loading",
                                                    target: "#tab-panel-dashboard-superadmin-actions" });
                                }      
                                $("tr#cron_"+resp.id).remove(); 
                                updatePager(1);
                            }
                        }
               });
          });
          
          $(".Change").click( function () { 
              return $.ajax2({
                   data: { id: this.id , value:this.name },
                   loading: "#tab-dashboard-superadmin-loading",
                   url : "{url('module/cron/ChangeCron')}",
                   success: function(resp) { 
                         if (resp.action=='ChangeCron')
                             changeCronState(resp); 
                   }
              });          
          });
          
           $(".Report").click( function () { 
              return $.ajax2({
                   data: { cron: this.id },
                   url : "{url('module/cron/ReportCronView')}",
                   loading: "#tab-dashboard-superadmin-loading",
                   target: "#tab-panel-dashboard-superadmin-actions"
              });          
          });
          
          $(".Execute").click( function () { 
              return $.ajax2({
                   data: { cron: this.id },
                   loading: "#tab-dashboard-superadmin-loading",
                   url : "{url('module/cron/Execute')}",
                   success: function(resp) { 
                        // if (resp.action=='ChangeCron')
                       //      changeCronState(resp); 
                   }
              });          
          });
          
            $(".Clear").click( function () { 
              return $.ajax2({
                   data: { Cron: $(this).attr('id') },
                   url : "{url_to('cron_ajax',['action'=>'ClearLastExecutionCron'])}",
                   loading: "#tab-dashboard-superadmin-loading",
                   success : function (resp)
                            {
                                if (resp.action=='ClearLastExecutionCron')
                                {    
                                    $(".CronLastExecution[id="+resp.id+"]").html("");
                                }
                            }
              });          
          });
             
    {/JqueryScriptsReady}
</script>



