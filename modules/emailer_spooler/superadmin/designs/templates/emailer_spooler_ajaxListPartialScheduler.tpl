{messages class="site-emailer-spooler-errors"}
<h3>{__('Emailer Spooler Scheduler')}</h3>    
<div>
  <a href="#" class="btn" id="Cancel" title="{__('Cancel')}" ><i class="fa fa-plus"></i>{__('Cancel')}</a>
  <a href="#" class="btn" id="StartScheduler" title="{__('Start')}" ><i class="fa fa-plus"></i>{__('Start')}</a>
</div>
{include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter class="EmailerSpoolerScheduler"}
<div>
        <button style="width:135px" id="EmailerSpoolerScheduler-filter" class="btn-table">{__("Filter")}</button> 
<button style="width:135px" id="EmailerSpoolerScheduler-init" class="btn-table">{__("Init")}</button>
    </div>
<div class="containerDivResp">
 <table class="tabl-list  footable table" cellpadding="0" cellspacing="0"> 
     <thead> 
     <tr class="list-header">    
        <th>#</th>          
         <th class="footable-first-column" data-toggle="true">
            <span>{__('Number of emails')}</span>                
        </th>
        <th class="footable-first-column" data-toggle="true">
            <span>{__('Number of emails sent')}</span>                
        </th>
         <th data-hide="phone" style="display: table-cell;">
            <span>{__('Error')}</span>               
        </th> 
          <th data-hide="phone" style="display: table-cell;">
            <span>{__('Error code')}</span>               
        </th> 
       
        <th data-hide="phone" style="display: table-cell;">
            <span>{__('Created at')}</span>          
        </th>
        <th data-hide="phone" style="display: table-cell;">{__('Actions')}</th>
    </tr>
</thead>
    {* search/equal/range *}
     <tr class="input-list">
       <td>{* # *}</td>    
        <td>{* name *}</td>
      
       <td>{* name *}</td>
       <td>{* post code *}</td>
       <td>{* city *}</td>
       <td>{* phone *}</td> 
       
       <td>{* actions *}</td>
    </tr>
        {foreach $pager as $item}
    <tr class="EmailerSpoolerScheduler list" id="EmailerSpoolerScheduler-{$item->get('id')}"> 
        <td class="EmailerSpoolerScheduler-count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>
         <td>
            {$item->get('number_of_emails')}
        </td>
        <td>
            {$item->get('number_of_emails_sent')}
        </td>
            <td>                
                 {$item->get('has_error')}   
            </td>
            <td> 
                {$item->get('error_code')}    
            </td>
         
            <td>                
                {$item->get('created_at')}          
            </td>              
            <td>               
                           
            </td>
    </tr>    
    {/foreach}  
</table> 
</div>
 {if !$pager->getNbItems()}
     <span>{__('No scheduler')}</span>
{else}
  
{/if}    
{include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager class="EmailerSpoolerScheduler"} 

<script type="text/javascript">
     $('.buttonSlide').click(function(){
            $('#body').toggleClass('close-slide');
        });    
    
        
        function getSiteEmailerSpoolerSchedulerFilterParameters()
        {
            var params={ filter: {  order : { }, 
                                    search : { },
                                    equal: { 
                                         name : $("[name=EmailerSpoolerScheduler-name] option:selected").val()  
                                    },
                                lang: $("img.EmailerSpoolerScheduler").attr('id'),                                                                                                               
                                nbitemsbypage: $("[name=EmailerSpoolerScheduler-nbitemsbypage]").val(),
                                token:'{$formFilter->getCSRFToken()}'
                         } };
            if ($(".EmailerSpoolerScheduler-order_active").attr("name"))
                 params.filter.order[$(".EmailerSpoolerScheduler-order_active").attr("name")] =$(".EmailerSpoolerScheduler-order_active").attr("id");   
            $(".EmailerSpoolerScheduler-search").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); });            
            return params;                  
        }
        
        function updateSiteEmailerSpoolerSchedulerFilter()
        {
         //  $(".dialogs").dialog("destroy").remove();   
           return $.ajax2({ data: getSiteEmailerSpoolerSchedulerFilterParameters(), 
                            url:"{url_to('emailer_spooler_ajax',['action'=>'ListPartialScheduler'])}" , 
                            errorTarget: ".site-emailer-spooler-errors",
                            loading: "#tab-dashboard-superadmin-loading",
                            target: "#superadmin-actions"
                             });
        }
    
        function updateSitePager(n)
        {
           page_active=$(".EmailerSpoolerScheduler-pager .EmailerSpoolerScheduler-active").html()?parseInt($(".EmailerSpoolerScheduler-pager .EmailerSpoolerScheduler-active").html()):1;
           records_by_page=$("[name=EmailerSpoolerScheduler-nbitemsbypage]").val();
           start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
           $(".EmailerSpoolerScheduler-count").each(function(id) { $(this).html(start+id) }); // Update index column           
           nb_results=parseInt($("#EmailerSpoolerScheduler-nb_results").html())-n;
           $("#EmailerSpoolerScheduler-nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
           $("#EmailerSpoolerScheduler-end_result").html($(".EmailerSpoolerScheduler-count:last").html());
        }
                   
            
          {* =====================  P A G E R  A C T I O N S =============================== *}  
      
           $("#EmailerSpoolerScheduler-init").click(function() {   
              // $(".dialogs").dialog("destroy").remove();   
               return $.ajax2({ url:"{url_to('emailer_spooler_ajax',['action'=>'ListPartialScheduler'])}",
                         errorTarget: ".site-emailer-spooler-errors",
                         loading: "#tab-dashboard-superadmin-loading",                         
                         target: "#superadmin-actions"}); 
           }); 
    
          $('.EmailerSpoolerScheduler-order').click(function() {
                $(".EmailerSpoolerScheduler-order_active").attr('class','EmailerSpoolerScheduler-order');
                $(this).attr('class','EmailerSpoolerScheduler-order_active');
                return updateSiteEmailerSpoolerSchedulerFilter();
           });
           
            $(".EmailerSpoolerScheduler-search").keypress(function(event) {
                if (event.keyCode==13)
                    return updateSiteEmailerSpoolerSchedulerFilter();
            });
            
          $("#EmailerSpoolerScheduler-filter").click(function() { return updateSiteEmailerSpoolerSchedulerFilter(); }); 
          
          $("[name=EmailerSpoolerScheduler-nbitemsbypage]").change(function() { return updateSiteEmailerSpoolerSchedulerFilter(); }); 
          
         // $("[name=EmailerSpoolerScheduler-name]").change(function() { return updateSiteEmailerSpoolerSchedulerFilter(); }); 
           
           $(".EmailerSpoolerScheduler-pager").click(function () {      
                $(".-dialogs").dialog("destroy").remove();   
                return $.ajax2({ data: getSiteEmailerSpoolerSchedulerFilterParameters(), 
                                 url:"{url_to('emailer_spooler_ajax',['action'=>'ListPartialScheduler'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length),
                                 errorTarget: ".site-emailer-spooler-errors",
                                 loading: "#tab-dashboard-superadmin-loading",
                                target: "#superadmin-actions"
                });
        });
          {* =====================  A C T I O N S =============================== *}  
      
        
         $("#Cancel").click(function() {                 
               return $.ajax2({ url:"{url_to('emailer_spooler_ajax',['action'=>'ListPartialEmail'])}",
                         errorTarget: ".site-emailer-spooler-errors",
                         loading: "#tab-dashboard-superadmin-loading",                         
                         target: "#superadmin-actions"}); 
           });  
             
        
         $("#StartScheduler").click( function () {         
           
            return $.ajax2({                
                url: "{url_to('emailer_spooler_ajax',['action'=>'StartScheduler'])}",
                errorTarget: ".site-emailer-spooler-errors",       
                loading: "#tab-dashboard-superadmin-loading",
                success : function (resp)
                        {
                            
                        }    
           });
    }); 
 </script>    