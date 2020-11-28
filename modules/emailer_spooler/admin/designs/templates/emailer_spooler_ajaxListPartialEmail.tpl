<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__('Communication')}</h3>
        <h3 class="admin-header-small-text">{__('Email Spooler')}</h3>
    </div>
</div>       
<!-- End page heading -->
          
<!-- Begin breadcrumb -->
<div class="breadcrumb-title">
    <p>              
        <i class="fa fa-home" style="color: #37bc9b;"></i>               
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Communication')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Email Spooler')}
    </p>
</div>
<!-- End breadcrumb -->

<!-- Begin Add User -->
<div class="table-responsive bg-white px-1 py-2">
    <div class="col-md-12">
        <div class="float-left w-50">
            {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter class="Email"}
        </div>
        <button id="Email-filter" class="btn btn-primary" style="float: right; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Filter")}</button>   
        <button id="Email-init" class="btn btn-primary" style="float: right; margin-right: 10px; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Init")}</button>
    </div>
    
    
{*<div class="containerDivResp">*}
 <table class="table table-bordered table-hover table-striped" cellpadding="0" cellspacing="0"> 
     <thead> 
     <tr class="bgSpec">    
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
            <span>{__('Created at')}</span>          
        </th>
        <th data-hide="phone" style="display: table-cell;">{__('Actions')}</th>
    </tr>
</thead>
    {* search/equal/range *}
     <tr class="input-list">
       <td>{* # *}</td>    
       <td>
           <input class="form-control Email-search" type="text" size="5" name="to" value="{$formFilter.search.to}">
       </td>
       <td>{* post code *}</td>
       <td>{* city *}</td>
       <td>{* phone *}</td> 
        <td>{* is_active *}</td> 
         <td>{* is_active *}</td> 
       <td>{* actions *}</td>
    </tr>
        {foreach $pager as $item}
    <tr class="Email list" id="Email-{$item->get('id')}"> 
        <td class="Email-count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>
        <td>
            {$item->get('to')}
        </td>
            <td>                
                 {$item->get('subject')}   
            </td>
            <td> 
                {$item->get('body')|strip_tags:false|truncate:200}    
            </td>
            <td>{__($item->get('is_sent'))}   
            </td>
             <td> 
                  {if $item->get('is_sent')=='YES'}
                    {if $item->get('sent_at')}
                       {format_date($item->get('sent_at'),['d','q'])}          
                    {else}
                        {format_date($item->get('updated_at'),['d','q'])}
                    {/if}   
                 {/if}
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
                                    equal: { 
                                         name : $("[name=Email-name] option:selected").val()  
                                    },
                                lang: $("img.Email").attr('id'),                                                                                                               
                                nbitemsbypage: $("[name=Email-nbitemsbypage]").val(),
                                token:'{$formFilter->getCSRFToken()}'
                         } };
            if ($(".Email-order_active").attr("name"))
                 params.filter.order[$(".Email-order_active").attr("name")] =$(".Email-order_active").attr("id");   
            $(".Email-search").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); });            
            return params;                  
        }
        
        function updateSiteEmailFilter()
        {
         //  $(".dialogs").dialog("destroy").remove();   
           return $.ajax2({ data: getSiteEmailFilterParameters(), 
                            url:"{url_to('emailer_spooler_ajax',['action'=>'ListPartialEmail'])}" , 
                            errorTarget: ".site-errors",
                            loading: "#tab-site-dashboard-x-settings-loading",
                            target: "#actions"
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
               $.ajax2({ url:"{url_to('emailer_spooler_ajax',['action'=>'ListPartialEmail'])}",
                         errorTarget: ".site-errors",
                         loading: "#tab-site-dashboard-x-settings-loading",                         
                         target: "#actions"}); 
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
          
          $("[name=Email-nbitemsbypage]").change(function() { return updateSiteEmailFilter(); }); 
          
         // $("[name=Email-name]").change(function() { return updateSiteEmailFilter(); }); 
           
           $(".Email-pager").click(function () {      
                $(".-dialogs").dialog("destroy").remove();   
                return $.ajax2({ data: getSiteEmailFilterParameters(), 
                                 url:"{url_to('emailer_spooler_ajax',['action'=>'ListPartialEmail'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length),
                                 errorTarget: ".site-errors",
                                 loading: "#tab-site-dashboard-x-settings-loading",
                                 target: "#actions"
                });
        });
          {* =====================  A C T I O N S =============================== *}  
      
        
         
         $(".Email-View").click( function () {                    
                return $.ajax2({ data : { Email : $(this).attr('id') },
                                loading: "#tab-site-dashboard-x-settings-loading",
                                url:"{url_to('emailer_spooler_ajax',['action'=>'ViewEmail'])}",
                                errorTarget: ".site-errors",
                                target: "#actions"});
         });
      
                    
         
          $(".Email-Delete").click( function () { 
                if (!confirm('{__("Email \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ Email: $(this).attr('id') },
                                 url :"{url_to('emailer_spooler_ajax',['action'=>'DeleteEmail'])}",
                                 errorTarget: ".site-errors",    
                                 loading: "#tab-site-dashboard-x-settings-loading",
                                 success : function(resp) {
                                       if (resp.action=='deleteEmail')
                                       {    
                                          $("tr#Email-"+resp.id).remove();  
                                          if ($('.Email').length==0)
                                              return $.ajax2({ url:"{url_to('emailer_spooler_ajax',['action'=>'ListPartialEmail'])}",
                                                               errorTarget: ".site-errors",
                                                               target: "#tab-dashboard-site-x-settings"});
                                          updateSitePager(1);
                                        }       
                                 }
                     });                                        
            });        
            
            
            
          
      
 
 </script>    