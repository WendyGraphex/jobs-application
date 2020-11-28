 <div class="row">  
     {foreach $pager as $item_i18n}       
        {component name="/employees/advertDisplay" tpl="home" item_i18n=$item_i18n}                                                        
    {/foreach}   
 </div>  

{include file="./_pagers/_employee_default_pager_bottom.tpl" pager=$pager class="employee-recent"} 
     {component name="/sales_quotation/getquote"}
<script type="text/javascript">

{JqueryScriptsReady}

        $(".employee-recent-pager").click(function () {                     
            return $.ajax2({ url:"{url_to('employees_ajax',['action'=>'ListPartialBlockAdvert'])}?page="+$(this).attr('data-page'),                                
                             target: "#employee-list-advert-recents"
            });
        });


{/JqueryScriptsReady}
</script>