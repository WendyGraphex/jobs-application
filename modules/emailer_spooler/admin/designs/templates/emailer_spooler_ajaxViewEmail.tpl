{messages class="email-spooler-errors"}
<h3>{__('Email')}</h3>    
<div>  
    <a href="#" id="EmailSpooler-Cancel" class="btn"><i class="fa fa-times" style="color:#000;margin-right:10px;"></i>
        {__('Cancel')}</a>
</div>   
        {if $item->isLoaded()}   
            <fieldset>
    {$item->getBodyContent()}
            </fieldset>
{else}
    {__('Email is invalid.')}
{/if}    
<script type="text/javascript">
 
         $("#EmailSpooler-Cancel").click(function() {                
               $.ajax2({   url:"{url_to('emailer_spooler_ajax',['action'=>'ListPartialEmail'])}" , 
                             errorTarget: ".site-errors",
                            loading: "#tab-site-dashboard-x-settings-loading",
                            target: "#actions"
                       }); 
           }); 
    
</script>

