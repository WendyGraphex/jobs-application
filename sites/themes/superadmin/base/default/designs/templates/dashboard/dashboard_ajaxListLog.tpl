{component name="/dashboard/sublink"}  
{messages class="dashboard-superadmin-errors"}
{include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter class="superadmin"}
<button class="btn-table" id="RemoveAll" title="{__('Remove All')}">{__('Remove all')}</button>
<button id="superadmin-filter" class="btn-table">{__("Filter")}</button>   
<button id="superadmin-init" class="btn-table">{__("Init")}</button>
<table class="tabl-list footable table" cellspacing="0">
    <thead>
    <tr class="list-header">
        <th data-hide="phone" style="display: table-cell;">#</th>
        {if $pager->getNbItems()>5}<th data-hide="phone" style="display: table-cell;">&nbsp;</th>{/if} 
        <th class="footable-first-column" data-toggle="true">{__('name')}
            <div>
                <a href="#" class="superadmin-order{$formFilter.order.name->getValueExist('asc','_active')}" id="asc" name="name"><img  src='{url("/icons/sort_asc`$formFilter.order.name->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                <a href="#" class="superadmin-order{$formFilter.order.name->getValueExist('desc','_active')}" id="desc" name="name"><img  src='{url("/icons/sort_desc`$formFilter.order.name->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a> 
            </div> 
        </th>
         <th data-hide="phone" style="display: table-cell;">{__('size')}
            <div>
                <a href="#" class="superadmin-order{$formFilter.order.size->getValueExist('asc','_active')}" id="asc" name="size"><img  src='{url("/icons/sort_asc`$formFilter.order.size->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                <a href="#" class="superadmin-order{$formFilter.order.size->getValueExist('desc','_active')}" id="desc" name="size"><img  src='{url("/icons/sort_desc`$formFilter.order.size->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a> 
            </div> 
        </th>
        <th data-hide="phone" style="display: table-cell;">{__('date')}
            <div>
                <a href="#" class="superadmin-order{$formFilter.order.time->getValueExist('asc','_active')}" id="asc" name="time"><img  src='{url("/icons/sort_asc`$formFilter.order.time->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                <a href="#" class="superadmin-order{$formFilter.order.time->getValueExist('desc','_active')}" id="desc" name="time"><img  src='{url("/icons/sort_desc`$formFilter.order.time->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a> 
            </div> 
        </th>
        <th data-hide="phone" style="display: table-cell;">{__('actions')}</th>
  </thead>
        <tr class="input-list">
            <td></td>
            {if $pager->getNbItems()>5}<td></td>{/if}
            <td><input class="superadmin-search" type="text" size="5" name="name" value="{$formFilter.search.name}"></td>
            <td></td>
            <td>
               <div>
                   {__('from')}<input class="superadmin-range" id="time_from" type="text" size="10" name="time[from]" value="{format_date((string)$formFilter.range.time.from|default:$formFilter->getFileTimeMin(),'a')}"/>
                   {__('to')}<input  class="superadmin-range" id="time_to" type="text" size="10" name="time[to]" value="{format_date((string)$formFilter.range.time.to|default:$formFilter->getFileTimeMax(),'a')}"/>
               </div>
           </td>
        </tr>


    {foreach $pager as $log}
    <tr class="logs list" id="log_{$log->getName('log')}">
        <td class="logs_count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$log@iteration}</td>
        {if $pager->getNbItems()>5}
            <td>  
               <input class="superadmin-selection" type="checkbox" id="{$log->getName('log')}"/>
            </td>
        {/if}
        <td>
            {$log->get('name')|escape}
        </td>
        <td>
            {format_size($log->getSize())}
        </td>
        <td>
            {format_date($log->getTime(),'a')}
        </td>
        <td>
            <a href="#" title="{__('edit')}" class="ViewLog" id="{$log->getName('log')}"><img  src="{url('/icons/edit.gif','picture')}" alt='{__("edit")}'/></a> 
            <a href="#" title="{__('delete')}" class="DeleteLog" id="{$log->getName('log')}" name="{$log->get('name')}"><img  src="{url('/icons/delete.gif','picture')}" alt='{__("delete")}'/></a> 
        </td>
    </tr>
    {/foreach}
</table>
{if !$pager->getNbItems()}  
    {__("no result")}
{else}
    {if $pager->getNbItems()>5}
        <input type="checkbox" id="superadmin-all" />  
        <a href="#" title="{__('delete')}" id="DeleteLogs" style="opacity:0.5" class="superadmin-actions_items"><img  src="{url('/icons/delete.gif','picture')}" alt='{__("delete")}'/></a>
    {/if}
{/if}    
{include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager class="superadmin"}

<script type="text/javascript">
    
        function getLogsFilterParameters()
        {
            params={ filter: {  order : { }, 
                                     search: { 
                                               name : $(".superadmin[name=name]").val(),
                                             }, 
                                     nbitemsbypage: $("[name=superadmin-nbitemsbypage]").val(),
                                     token:'{$formFilter->getCSRFToken()}'
                                  }};
            params.filter.order[$(".superadmin-order_active").attr("name")] =$(".superadmin-order_active").attr("id");
            $(".superadmin-search").each(function(id) { params.filter.search[this.name] =this.value; });                               
            return params;                  
        }
        
        function updateLogsFilter()
        {
           return $.ajax2({ data: getLogsFilterParameters(), 
                            url:"{url_to('dashboard_ajax',['action'=>'ListLog'])}" , 
                            loading: "#tab-dashboard-superadmin-loading",
                            errorTarget: ".dashboard-superadmin-errors",
                            target: "#tab-dashboard-superadmin-content" });
        }
        
        function updatePager(n)
        {
           page_active=$(".superadmin-pager .superadmin-active").html()?parseInt($(".superadmin-pager .superadmin-active").html()):1;
           records_by_page=$("[name=superadmin-nbitemsbypage]").val();
           start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
           $(".logs_count").each(function(id) { $(this).html(start+id) }); // Update index column           
           nb_results=parseInt($("#nb_results").html())-n;
           $("#superadmin-nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
           $("#superadmin-end_result").html($(".logs_count:last").html());
        }
        
       
        var dates = $( "#time_from, #time_to" ).datepicker({
			onSelect: function( selectedDate ) {
				var option = this.id == "time_from" ? "minDate" : "maxDate",
					instance = $( this ).data( "datepicker" ),
					date = $.datepicker.parseDate(
						instance.settings.dateFormat ||
						$.datepicker._defaults.dateFormat,
						selectedDate, instance.settings );
				dates.not( this ).datepicker( "option", option, date );
			}
		});
        // {* PAGER - begin *}
         $('.superadmin-order').click(function() {
                $(".superadmin-order_active").attr('class','superadmin-order');
                $(this).attr('class','superadmin-order_active');
                return updateLogsFilter();
         });
            
         $("[name=superadmin-nbitemsbypage]").change(function() {  return updateLogsFilter();  }); 

        $(".superadmin-search").keypress(function(event) {
            if (event.keyCode==13)
               return updateLogsFilter();
        });

        $("#superadmin-init").click(function() { $.ajax2({ 
                            url: "{url_to('dashboard_ajax',['action'=>'ListLog'])}", 
                            loading: "#tab-dashboard-superadmin-loading",
                            errorTarget: ".dashboard-superadmin-errors",
                            target: "#tab-dashboard-superadmin-content" }); 
         }); 

        $("#superadmin-all").click(function () {  $(".superadmin-selection").attr("checked",($(this).attr("checked")=="checked"));  });

        $("#filter").click(function() { return updateLogsFilter(); }); 
            
        $(".superadmin-pager").click(function () {
             return $.ajax2({ data: getLogsFilterParameters(), 
                              url:"{url_to('dashboard_ajax',['action'=>'ListLog'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length) , 
                              loading: "#tab-dashboard-superadmin-loading",
                              errorTarget: ".dashboard-superadmin-errors",
                              target: "#tab-dashboard-superadmin-content" });
        });  
        
        // {* PAGER - end *}   

        // {* ACTIONS - begin *} 
            
        $('.ViewLog').click(function(){
          $.ajax2( { data : { name: this.id } , 
                     url:"{url_to('dashboard_ajax',['action'=>'ViewLog'])}",
                    loading: "#tab-dashboard-superadmin-loading",
                    errorTarget: ".dashboard-superadmin-errors",
                    target: "#tab-dashboard-superadmin-content" });
        });
        
        $('.DeleteLog').click(function(){
          if (!confirm("{__('Log file [#0#.log] will be deleted. Confirm ?')}".format(this.id))) 
                return false; 
          return $.ajax2({ data : { name: this.id } ,
                    url: "{url_to('dashboard_ajax',['action'=>'DeleteLog'])}",
                    loading: "#tab-dashboard-superadmin-loading",
                    errorTarget: ".dashboard-superadmin-errors",
                    success :function(resp) { 
                                if (resp.action=="delete" && resp.id)
                                {    
                                    $("#log_"+resp.id).remove();
                                    updatePager(1); 
                                }    
                    }
                  }); 
        });
        
        $("#DeleteLogs").click( function () { 
                 var params={ selection : {  } };
                 text="";
                 $(".selection:checked").each(function (id) { 
                    params.selection[id]=this.id;
                    text+=this.id+",\n";
                 });
                 if ($.isEmptyObject(params.selection))
                    return ;
                 if (!confirm("{__('logs :\u000A\u000A\"#0#\"\u000A\u000A will be deleted. Confirm ?')}".format(text.substring(0,text.lastIndexOf(","))))) 
                     return false; 
                 return $.ajax2({ data: params,
                                  url : "{url_to('dashboard_ajax',['action'=>'DeleteLog'])}",
                                  loading: "#tab-dashboard-superadmin-loading",
                                  errorTarget: ".dashboard-superadmin-errors",
                                  success: function(resp) {
                                    if (resp.action=='deleteLogs')
                                    {                                    
                                        if ($(".logs").length-resp.selection.length==0)
                                           return updateLogsFilter();
                                        $.each(resp.selection, function (id) {  $("tr#log_"+this).remove(); });   
                                        updatePager(resp.selection.length); 
                                        $("input#all").attr("checked",false);           
                                    }       
                                  }
                 });    
                 return false;
            });
            
           $(".superadmin-selection,#superadmin-all").click(function (){               
                $(".superadmin-actions_items").css('opacity',($(".superadmin-selection:checked").length?'1':'0.5'));
            });


             $("#RemoveAll").click( function () {                
                 if (!confirm("{__('All logs will be deleted. Confirm ?')}") )
                     return false; 
                 return $.ajax2({ url : "{url_to('dashboard_ajax',['action'=>'RemoveLogs'])}",
                                  loading: "#tab-dashboard-superadmin-loading",
                                  errorTarget: ".dashboard-superadmin-errors",
                                  success: function(resp) {
                                       $.ajax2({ 
                                    url: "{url_to('dashboard_ajax',['action'=>'ListLog'])}", 
                                    loading: "#tab-dashboard-superadmin-loading",
                                    errorTarget: ".dashboard-superadmin-errors",
                                    target: "#tab-dashboard-superadmin-content" });   
                                  }
                 });                   
            });
            
      
</script>