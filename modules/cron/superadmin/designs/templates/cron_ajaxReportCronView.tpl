{messages class="errors"}
<h3>{__("cron report")|capitalize}</h3>
{if $cron->isLoaded()}<a href="#" title="{__('delete')}" id="Delete" name="{$cron->getReport()->getFile()->getName()}"><img  src="{url('/icons/delete.gif','picture')}" alt='{__("delete")}'/>{__('delete')|capitalize}</a> {/if}
<a href="#" title="{__('cancel')}" id="Cancel"><img  src="{url('/icons/cancel.gif','picture')}" alt="{__('cancel')}"/>{__('cancel')|capitalize}</a>
<div id="ReportContent"> 
    {if $cron->isLoaded() && $cron->getReport()->getFile()->isExist()}
        <span>{$cron->getReport()->getFile()->getName()}</span>
        <textarea rows="20" cols="116" readonly style="resize: none;">{$cron->getReport()->getFile()->getContent()}</textarea>
    {else}
        <div>{__("report doesn't exist.")}</div>
    {/if}
</div>
<script type="text/javascript">
      
        $('#Cancel').click(function(){  
            $.ajax2( { url:"{url('/module/cron/ListPartial')}",  loading: "#tab-dashboard-superadmin-loading", target:"#tab-panel-dashboard-superadmin-actions"}); 
        });
        
        $("#Delete").click( function () { 
               if (!confirm('{__("Cron report \"#0#\" will be deleted. Confirm ?")}'.format(this.name))) return false; 
               return $.ajax2({
                    data: { cron: "{$cron->get('id')}" },
                    loading: "#tab-dashboard-superadmin-loading",
                    url: "{url('/module/cron/DeleteCron')}",
                    success: function(resp) {
                            if (resp.action=='deleteCron')
                            {    
                                $("#ReportContent").html("{__("report doesn't exist.")}");
                            }
                        }
               });
          });
        
</script> 