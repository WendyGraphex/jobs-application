{messages class="site-emailer-spooler-errors"}
<h3>{__('Emails spooler')}</h3>    
<div>
  <a href="#" class="btn" id="Scheduler" title="{__('Scheduler')}" ><i class="fa fa-plus"></i>{__('Scheduler')}</a>
  <a href="#" class="btn" id="Settings" title="{__('Settings')}" ><i class="fa fa-plus"></i>{__('Settings')}</a>
</div>
{include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter class="Email"}
<div>
        <button style="width:135px" id="Email-filter" class="btn-table">{__("Filter")}</button> 
<button style="width:135px" id="Email-init" class="btn-table">{__("Init")}</button>
    </div>
<div class="containerDivResp">
 <table class="tabl-list  footable table" cellpadding="0" cellspacing="0"> 
     <thead> 
     <tr class="list-header">    
        <th>#</th>                  
        <th class="footable-first-column" data-toggle="true">
            <span>{__('For')}</span>                
        </th>
         <th data-hide="phone" style="display: table-cell;">
            <span>{__('Subject')}</span>               
        </th> 
          <th data-hide="phone" style="display: table-cell;">
            <span>{__('Body')}</span>               
        </th> 
         <th data-hide="phone" style="display: table-cell;">
            <span>{__('Is sent')}</span>               
        </th> 
         <th data-hide="phone" style="display: table-cell;">
            <span>{__('Sent at')}</span>               
        </th> 
          <th data-hide="phone" style="display: table-cell;">
            <span>{__('Error ?')}</span>               
        </th> 
           <th data-hide="phone" style="display: table-cell;">
            <span>{__('Error')}</span>               
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
      
       <td>{* name *}
           <input type="text" size="10" class="Email-search" name="to" placeholder="{__('For')}" value="{$formFilter.search.to}"/>
       </td>
       <td>{* post code *}</td>
       <td>{* phone *}</td> 
       <td>
           {html_options class="Email-equal" name="is_sent" options=$formFilter->equal.is_sent->getOption('choices') selected=(string)$formFilter.equal.is_sent}
       </td>     
       <td></td>
       <td>
            {html_options class="Email-equal" name="has_error" options=$formFilter->equal.has_error->getOption('choices') selected=(string)$formFilter.equal.has_error}
       </td> 
         <td>{* is_active *}</td> 
          <td>{* is_active *}</td> 
       <td>{* actions *}</td>
    </tr>
        {foreach $pager as $item}
    <tr class="Email list" id="Email-{$item->get('id')}"> 
        <td class="Email-count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>        
        <td>
            {if $item->getEmail()->get('to')}{$item->getEmail()->get('to')}{else}{__('---')}{/if}
        </td>
            <td>                
                 {$item->getEmail()->get('subject')}   
            </td>
            <td> 
                {$item->getEmail()->get('body')|truncate:200}    
            </td>
            <td>{__($item->getEmail()->get('is_sent'))}   
            </td>
             <td> 
                 {if $item->getEmail()->get('is_sent')=='YES'}
                     {format_date($item->get('sent_at'),['d','q'])}   
                 {/if}    
            </td>
            <td>
               {__($item->get('has_error'))} 
            </td>
            <td title="{$item->get('error_code')|escape}">
               {$item->get('error_code')|truncate:20} 
            </td>
            <td>                
                {format_date($item->get('created_at'),['d','q'])}          
            </td>              
            <td>               
                <a href="#" title="{__('Edit')}" class="Email-View" id="{$item->get('id')}">
                     <img  src="{url('/icons/edit.gif','picture')}" alt='{__("Edit")}'/></a>                
                <a href="#" title="{__('Delete')}" class="Email-Delete" id="{$item->get('id')}"  name="{$item->get('name')}">
                   <img  src="{url('/icons/delete.gif','picture')}" alt='{__("Delete")}'/>
                </a>               
            </td>
    </tr>    
    {/foreach}  
</table> 
</div>
 {if !$pager->getNbItems()}
     <span>{__('No email')}</span>
{else}
  
{/if}    
{include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager class="Email"} 

<script type="text/javascript">
     $('.buttonSlide').click(function(){
            $('#body').toggleClass('close-slide');
        });    
    function changeEmailIsActiveState(resp) 
        {
            $.each(resp.selection?resp.selection:[resp.id], function () {              
                sel="a.Email-ChangeIsActive[name="+this+"]";
                if (resp.state=='YES'||resp.state=='NO') 
                {    
                    $(sel+" img").attr({
                        src :"{url('/icons/','picture')}"+resp.state+".gif",
                        alt : (resp.state=='YES'?'{__("YES")}':'{__("NO")}'),
                        title : (resp.state=='YES'?'{__("YES")}':'{__("NO")}')
                    });
                    $(sel).attr("id",resp.state);
                }
            });  
        }
        
        function getSiteEmailFilterParameters()
        {
            var params={ filter: {  order : { }, 
                                    search : { },
                                    equal: { },                                                                                                                                            
                                nbitemsbypage: $("[name=Email-nbitemsbypage]").val(),
                                token:'{$formFilter->getCSRFToken()}'
                         } };
            if ($(".Email-order_active").attr("name"))
                 params.filter.order[$(".Email-order_active").attr("name")] =$(".Email-order_active").attr("id");   
            $(".Email-search").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); });            
            $(".Email-equal option:selected").each(function() { params.filter.equal[$(this).parent().attr('name')] =$(this).val(); }); 
            return params;                  
        }
        
        function updateSiteEmailFilter()
        {
         //  $(".dialogs").dialog("destroy").remove();   
           return $.ajax2({ data: getSiteEmailFilterParameters(), 
                            url:"{url_to('emailer_spooler_ajax',['action'=>'ListPartialEmail'])}" , 
                            errorTarget: ".site-emailer-spooler-errors",
                            loading: "#tab-dashboard-superadmin-loading",
                            target: "#superadmin-actions"
                             });
        }
    
        function updateSitePager(n)
        {
           page_active=$(".Email-pager .Email-active").html()?parseInt($(".Email-pager .Email-active").html()):1;
           records_by_page=$("[name=Email-nbitemsbypage]").val();
           start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
           $(".Email-count").each(function(id) { $(this).html(start+id) }); // Update index column           
           nb_results=parseInt($("#Email-nb_results").html())-n;
           $("#Email-nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
           $("#Email-end_result").html($(".Email-count:last").html());
        }
                   
            
          {* =====================  P A G E R  A C T I O N S =============================== *}  
      
           $("#Email-init").click(function() {   
              // $(".dialogs").dialog("destroy").remove();   
               return $.ajax2({ url:"{url_to('emailer_spooler_ajax',['action'=>'ListPartialEmail'])}",
                         errorTarget: ".site-emailer-spooler-errors",
                         loading: "#tab-dashboard-superadmin-loading",                         
                         target: "#superadmin-actions"}); 
           }); 
    
          $('.Email-order').click(function() {
                $(".Email-order_active").attr('class','Email-order');
                $(this).attr('class','Email-order_active');
                return updateSiteEmailFilter();
           });
           
            $(".Email-search").keypress(function(event) {
                if (event.keyCode==13)
                    return updateSiteEmailFilter();
            });
            
          $("#Email-filter").click(function() { return updateSiteEmailFilter(); }); 
          
          $("[name=Email-nbitemsbypage],[name=site_id],[name=is_sent],[name=has_error]").change(function() { return updateSiteEmailFilter(); }); 
          
         // $("[name=Email-name]").change(function() { return updateSiteEmailFilter(); }); 
           
           $(".Email-pager").click(function () {      
                $(".-dialogs").dialog("destroy").remove();   
                return $.ajax2({ data: getSiteEmailFilterParameters(), 
                                 url:"{url_to('emailer_spooler_ajax',['action'=>'ListPartialEmail'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length),
                                 errorTarget: ".site-emailer-spooler-errors",
                                 loading: "#tab-dashboard-superadmin-loading",
                                target: "#superadmin-actions"
                });
        });
          {* =====================  A C T I O N S =============================== *}  
      
        
         
         $(".Email-View").click( function () {                    
                return $.ajax2({ data : { Email : $(this).attr('id') },                               
                                url:"{url_to('emailer_spooler_ajax',['action'=>'ViewEmail'])}",
                                errorTarget: ".site-emailer-spooler-errors",
                                loading: "#tab-dashboard-superadmin-loading",
                                target: "#superadmin-actions"});
         });
      
            $("#Scheduler").click( function () {                    
                return $.ajax2({ data : { Email : $(this).attr('id') },                                
                                url:"{url_to('emailer_spooler_ajax',['action'=>'ListPartialScheduler'])}",
                                errorTarget: ".site-emailer-spooler-errors",
                                loading: "#tab-dashboard-superadmin-loading",
                                target: "#superadmin-actions"});
         });  
         
             $("#Settings").click( function () {                    
                return $.ajax2({  
                                url:"{url_to('emailer_spooler_ajax',['action'=>'Settings'])}",
                                errorTarget: ".site-emailer-spooler-errors",
                                loading: "#tab-dashboard-superadmin-loading",
                                target: "#superadmin-actions"});
         });  
         
          $(".Email-Delete").click( function () { 
                if (!confirm('{__("Email \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ Email: $(this).attr('id') },
                                 url :"{url_to('emailer_spooler_ajax',['action'=>'DeleteEmail'])}",
                                 errorTarget: ".site-emailer-spooler-errors",    
                                 loading: "#tab-dashboard-superadmin-loading",
                                 success : function(resp) {
                                       if (resp.action=='DeleteEmail')
                                       {    
                                          $("tr#Email-"+resp.id).remove();  
                                          if ($('.Email').length==0)
                                              return $.ajax2({ url:"{url_to('emailer_spooler_ajax',['action'=>'ListPartialEmail'])}",
                                                               errorTarget: ".site-emailer-spooler-errors",       
                                                               loading: "#tab-dashboard-superadmin-loading",
                                                               target: "#tab-dashboard-site-x-settings"});
                                          updateSitePager(1);
                                        }       
                                 }
                     });                                        
            });        
            
            
            
          
     
 
 </script>    