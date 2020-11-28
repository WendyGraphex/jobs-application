<div class="row">  
     {foreach $pager as $item_i18n}               
        {component name="/employers/advertDisplay" tpl="home" item_i18n=$item_i18n}                                                        
    {/foreach}   
 </div>  

{include file="./_pagers/_employer_default_pager_bottom.tpl" pager=$pager class="employer-recent"}
{component name="/sales_quotation/makeoffer"}
     
<script type="text/javascript">

{JqueryScriptsReady}

     $(".employer-recent-pager").click(function () {                     
            return $.ajax2({ url:"{url_to('employers_ajax',['action'=>'ListPartialBlockAdvert'])}?page="+$(this).attr('data-page'),                                
                             target: "#employer-list-advert-recents"
            });
    });


{/JqueryScriptsReady}
</script>

 