<label class="saveAdEmpl">    
    <i {if $alert->isNotLoaded()}style="display:none"{/if} class="mdi mdi-bell Disable-alert"></i>
    <i {if $alert->isLoaded()}style="display:none"{/if} class="mdi mdi-bell-outline Enable-alert"></i>
    <a href="javascript:void();" class="Disable-alert" id="Alert-Delete" {if $alert->isNotLoaded()}style="display:none"{/if}>{__('Delete')}</a>
    <a href="javascript:void();" class="Enable-alert" id="Alert-Save" {if $alert->isLoaded()}style="display:none"{/if}>{__('Save')}</a>

</label>
    
    
<script type="text/javascript">
    {JqueryScriptsReady}  

        $("#Alert-Save").click(function () { 
            return $.ajax2({ data: { EmployerAdvertI18n : '{$advert_i18n->get('id')}' }, 
                                 url:"{url_to('employers_alert_ajax',['action'=>'SaveEmployerAdvertAlert'])}",                                                                 
                                 success : function (resp)
                                {
                                    if (resp.action !='SaveEmployerAdvertAlert') return ;
                                    $(".Disable-alert").show();
                                    $(".Enable-alert").hide();
                                }
                });
        });
        
         $("#Alert-Delete").click(function () { 
            return $.ajax2({ data: { EmployerAdvertI18n : '{$advert_i18n->get('id')}' }, 
                                 url:"{url_to('employers_alert_ajax',['action'=>'DeleteEmployerAdvertAlert'])}",                                                                 
                                 success : function (resp)
                                {
                                    if (resp.action !='DeleteEmployerAdvertAlert') return ;
                                     $(".Disable-alert").hide();
                                    $(".Enable-alert").show();
                                }
                });
        });


    {/JqueryScriptsReady}        
</script>    