<label class="saveAdEmpl">    
    <i {if $favourite->isNotLoaded()}style="display:none"{/if} class="mdi mdi-heart Disable"></i>
    <i {if $favourite->isLoaded()}style="display:none"{/if} class="mdi mdi-heart-outline Enable"></i>
    <a href="javascript:void();" class="Disable" id="Favourite-Delete" {if $favourite->isNotLoaded()}style="display:none"{/if}>{__('Delete')}</a>
    <a href="javascript:void();" class="Enable" id="Favourite-Save" {if $favourite->isLoaded()}style="display:none"{/if}>{__('Save')}</a>

</label>
    
    
<script type="text/javascript">
    {JqueryScriptsReady}  

        $("#Favourite-Save").click(function () { 
            return $.ajax2({ data: { EmployerAdvertI18n : '{$advert_i18n->get('id')}' }, 
                                 url:"{url_to('employers_ajax',['action'=>'SaveEmployerAdvertFavourite'])}",                                                                 
                                 success : function (resp)
                                {
                                    if (resp.action !='SaveEmployerAdvertFavourite') return ;
                                    $(".Disable").show();
                                    $(".Enable").hide();
                                }
                });
        });
        
         $("#Favourite-Delete").click(function () { 
            return $.ajax2({ data: { EmployerAdvertI18n : '{$advert_i18n->get('id')}' }, 
                                 url:"{url_to('employers_ajax',['action'=>'DeleteEmployerAdvertFavourite'])}",                                                                 
                                 success : function (resp)
                                {
                                    if (resp.action !='DeleteEmployerAdvertFavourite') return ;
                                     $(".Disable").hide();
                                    $(".Enable").show();
                                }
                });
        });


    {/JqueryScriptsReady}        
</script>    