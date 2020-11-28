<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="{$_request->getCountry()}" xml:lang="{$_request->getCountry()}">
    <head>{header}</head>
    <body>
        <div id="body">
            <div id="banner">{banner class="banner"}</div>
            <div id="top">{reference name="top"}</div>
            <div id="user">{reference name="user"}</div>
            {component name="/dashboard/sublink"}              
            <div style="height: 15px; width: 15px"><img id="loading" style="display:none;" src="{url('/icons/loader.gif','picture')}" alt="loader"/></div>
            <div id="middle">
                {messages class="errors"}
                {if $cron}
                    <div id="ReportContent"> 
                       {if $cron->getReport()->getFile()->isExist()}
                             <a href="#" title="{__('delete')}" id="Delete" name="{$cron->getReport()->getFile()->getName()}"><img  src="{url('/icons/delete.gif','picture')}" alt='{__("delete")}'/>{__('delete')|capitalize}</a>                       
                             <div>{$cron->getReport()->getFile()->getName()}</div>
                             <textarea rows="20" cols="116" readonly style="resize: none;">{$cron->getReport()->getFile()}</textarea>
                      {/if}   
                    </div>
                      <script type="text/javascript">
                        {JqueryScriptsReady}
                            $("#Delete").click( function () { 
                               if (!confirm('{__("Cron report \"#0#\" will be deleted. Confirm ?")}'.format(this.name))) return false; 
                               return $.ajax2({
                                    data: { cron: "{$cron->get('id')}" },
                                    url: "{url('/module/cron/DeleteCron')}",
                                    success: function(resp) {
                                            if (resp.action=='deleteCron')
                                            {    
                                                $("#ReportContent").html("{__("report doesn't exist.")}");
                                            }
                                        }
                               });
                          });
                      {/JqueryScriptsReady}
                     </script>
                {/if}
            </div>
            <div id="bottom"></div> 
        </div>
    </body>
</html>