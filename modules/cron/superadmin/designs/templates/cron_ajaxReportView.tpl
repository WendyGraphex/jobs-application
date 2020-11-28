{messages class="errors"}
<h3>{__("cron report")|capitalize}</h3>
<a href="#" title="{__('delete')}" id="Delete"><img  src="{url('/icons/delete.gif','picture')}" alt='{__("delete")}'/>{__('delete')|capitalize}</a> 
<a href="#" title="{__('cancel')}" id="Cancel"><img  src="{url('/icons/cancel.gif','picture')}" alt="{__('cancel')}"/>{__('cancel')|capitalize}</a>
<a href="#" title="{__('refresh')}" id="Refresh"><img  src="{url('/icons/refresh.png','picture')}" alt="{__('refresh')}"/>{__('refresh')|capitalize}</a>
<span>{__('last update')}:</span><span id="time">{format_date(time(),"I")}</span>
<div id="ReportContent"> 
    {if $report->isExist()}
        <textarea rows="20" cols="116" readonly style="resize: none;">{$report->getContent()}</textarea>
    {else}
        <div>{__("report doesn't exist.")}</div>
    {/if}
</div>
<script type="text/javascript">          

        $('#Cancel').click(function(){  
           // clearTimeout(update);
            $.ajax2( { url:"{url('/module/cron/ListPartial')}",   loading: "#tab-dashboard-superadmin-loading",target:"#tab-panel-dashboard-superadmin-actions"}); 
        });
        
        $('#Refresh').click(function () {  
                 return $.ajax2({ url: "{url('/module/cron/ReportView')}",   loading: "#tab-dashboard-superadmin-loading",target: "#tab-panel-dashboard-superadmin-actions"});
        });

        $('#Delete').click(function(){  
              //  clearTimeout(update);
                $.ajax2( { 
                url:"{url('/module/cron/ReportDelete')}", 
                loading: "#tab-dashboard-superadmin-loading",
                success : function (response)
                          {
                              if (response.action=='ReportDelete')
                              {    
                                $("#Delete").hide();
                                $("#ReportContent").html("{__("report doesn't exist.")}");
                              }  
                          }
                });
         });
        
</script> 