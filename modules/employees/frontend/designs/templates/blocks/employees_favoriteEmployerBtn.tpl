<label class="saveAdEmpl">    
    <i {if $favourite->isNotLoaded()}style="display:none"{/if} class="mdi mdi-heart Disable"></i>
    <i {if $favourite->isLoaded()}style="display:none"{/if} class="mdi mdi-heart-outline Enable"></i>
    <a href="javascript:void();" class="Disable" id="Favourite-Delete" {if $favourite->isNotLoaded()}style="display:none"{/if}>{__('Delete')}</a>
    <a href="javascript:void();" class="Enable" id="Favourite-Save" {if $favourite->isLoaded()}style="display:none"{/if}>{__('Save')}</a>

</label>
    
    
<script type="text/javascript">
    {JqueryScriptsReady}  

        $("#Favourite-Save").click(function () { 
            return $.ajax2({ data: { EmployerUser : '{$employer_user->get('id')}' }, 
                                 url:"{url_to('employees_ajax',['action'=>'SaveEmployerFavourite'])}",                                                                 
                                 success : function (resp)
                                {
                                    if (resp.action !='SaveEmployerFavourite') return ;
                                    $(".Disable").show();
                                    $(".Enable").hide();
                                }
                });
        });
        
         $("#Favourite-Delete").click(function () { 
            return $.ajax2({ data: { EmployerUser : '{$employer_user->get('id')}' }, 
                                 url:"{url_to('employees_ajax',['action'=>'DeleteEmployerFavourite'])}",                                                                 
                                 success : function (resp)
                                {
                                    if (resp.action !='DeleteEmployerFavourite') return ;
                                     $(".Disable").hide();
                                    $(".Enable").show();
                                }
                });
        });


    {/JqueryScriptsReady}        
</script>    
