<label class="saveAdEmpl">    
    <i {if $alert->isNotLoaded()}style="display:none"{/if} class="mdi mdi-bell Disable-alert"></i>
    <i {if $alert->isLoaded()}style="display:none"{/if} class="mdi mdi-bell-outline Enable-alert"></i>
    <a href="javascript:void();" class="Disable-alert" id="Alert-Delete" {if $alert->isNotLoaded()}style="display:none"{/if}>{__('Delete')}</a>
    <a href="javascript:void();" class="Enable-alert" id="Alert-Save" {if $alert->isLoaded()}style="display:none"{/if}>{__('Save')}</a>

</label>
    
    
<script type="text/javascript">
    {JqueryScriptsReady}  

        $("#Alert-Save").click(function () { 
            return $.ajax2({ data: { EmployeeUser : '{$employee_user->get('id')}' }, 
                                 url:"{url_to('employers_alert_ajax',['action'=>'SaveEmployeeAlert'])}",                                                                 
                                 success : function (resp)
                                {
                                    if (resp.action !='SaveEmployeeAlert') return ;
                                    $(".Disable-alert").show();
                                    $(".Enable-alert").hide();
                                }
                });
        });
        
         $("#Alert-Delete").click(function () { 
            return $.ajax2({ data: { EmployeeUser : '{$employee_user->get('id')}' }, 
                                 url:"{url_to('employers_alert_ajax',['action'=>'DeleteEmployeeAlert'])}",                                                                 
                                 success : function (resp)
                                {
                                    if (resp.action !='DeleteEmployeeAlert') return ;
                                     $(".Disable-alert").hide();
                                    $(".Enable-alert").show();
                                }
                });
        });


    {/JqueryScriptsReady}        
</script>    