<div class="row RowTop">
    <div class="col-md-12 grid-margin classConducteurTop">
      <div class="d-flex justify-content-between flex-wrap">
        <div class="d-flex align-items-end flex-wrap">
          <div class="mr-md-3 mr-xl-5 styleWidth">
            <h2>{__('My orders')}</h2>                   
          </div>
          <div class="d-flex">
            <i class="mdi mdi-home text-muted hover-cursor"></i>
            <a id="Dashboard"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('Dashboard')}</p></a>
            <p class="text-muted mb-0">&nbsp;/&nbsp;{__('My orders')}</p>
          </div>
        </div> 
          {component name="/site_help/help" help="employer-list-orders"}
      </div>
    </div>
</div>
{alerts}
{include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter}
<div class="col-lg-12 pt-2 stretch-card">       
    <div class="card classMargin">
        <div class="card-body pr-2 pl-2">               
            <div class="table-responsive pt-3">
                <table class="table table-bordered table-striped">
                    <thead class="">
                        <tr role="row">
                            <th> #</th>                        
                            <th>{__('Ref/Desc.')}</th>        
                            <th>{__('Number of items')}</th>        
                            <th>{__('Number of events')}</th>   
                            <th>{__('Price')}</th>                                                                       
                            <th>{__('State')}</th>   
                            <th>{__('Created At')}</th>   
                            <th>{__('Actions')}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $pager as $item} 
                            <tr class="list" id="{$item->get('id')}" role="row">
                                <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>                                                                                   
                                <td>{$item->get('reference')} 
                                    <a href="#" class="Details" id="{$item->get('id')}"><i class="fa fa-list"></i></a>                             
                                        {if $item->isPaid()}                             
                                        <a target="_blank" href="{url_to('sales_order',['action'=>'ExportPdf'])}?order={$item->get('reference')}" title="{__('Order')}"><i class="fa fa-file-pdf-o"></i></a>
                                        {/if} 
                                </td>
                                <td>
                                    {$item->getFormatter()->getNumberOfItems()->getText()}                            
                                </td>
                                  <td>
                                    {$item->getFormatter()->getNumberOfEvents()->getText()}                            
                                </td>
                                <td>
                                    {$item->getFormatter()->getGlobalSalePriceWithTax()->getAmount()}
                                </td>                                                                     
                                <td id="{$item->get('id')}" class="SiteEvent" name="state">
                                    {$item->getStateI18n()}
                                </td> 
                                <td>
                                    {$item->getFormatter()->getCreatedAt()->getText()} 
                                </td> 
                                <td>
                                    {if $item->getState()->isInProgress()}
                                        <button type="button" id="{$item->get('id')}" class="Actions btn btn-success btn-sm ProceedToPayment">{__('Proceed to payment')}</button>
                                        <button id="{$item->get('id')}" class="Actions btn btn-danger btn-sm CancelPayment">{__('Cancel')}</button>
                                    {/if} 
                                    {if $item->getState()->isPaid()}                               
                                        {*component name="/sales_billing/export" payment=$item*}
                                    {/if}
                                </td> 
                            </tr>
                        {/foreach}
                        {if !$pager->hasItems()}
                            <tr role="row" >
                                <td  colspan="9">{__('No order available')}</td>
                            </tr>
                        {/if}                                
                    </tbody>         
                </table>
                <div id="DetailsModal" class="modal fade" role="dialog">
                    <div class="modal-dialog modal-lg" style="width: 60% !important;max-width: 60%;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div id="details-modal-ctn" class="modal-body">                      
                            </div>
                        </div>
                    </div>
                </div>
            </div>                       
        </div>
    </div>     
</div> 
{include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager}          
 <script type="text/javascript">      
     
       function getFilterParameters()
        {
            var params={ filter: {  order : { }, 
                                    search : { },
                                    equal: { },
                                    range : { },                                                                                                                                  
                                nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                token:'{$formFilter->getCSRFToken()}'
                         } };
                         return params; 
        }
     
        function updateFilter()
        {          
           return $.ajax2({ data: getFilterParameters(), 
                            url:"{url_to('site_event_order_ajax',['action'=>'ListPartialOrderForUser'])}" ,                          
                            target: "#actions"
                             });
        }
        
      function updatePager(n)
        {
           page_active=$(".pager .active").html()?parseInt($(".pager .active").html()):1;
           records_by_page=$("[name=nbitemsbypage]").val();
           start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
           $(".count").each(function(id) { $(this).html(start+id) }); // Update index column           
           nb_results=parseInt($("#nb_results").html())-n;
           $("#nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
           $("#end_result").html($(".count:last").html());
        }
        $("[name=nbitemsbypage]").change(function () {  return updateFilter();  });
    
        $(".pager").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('site_event_order_ajax',['action'=>'ListPartialOrderForUser'])}?page="+$(this).attr('data-page'),                                
                                 target: "#actions"
                });
        });
     
    
    $(".ProceedToPayment").click(function () {          
        return $.ajax2({ data : { SiteEventOrder : $(this).attr('id') },
                         url :"{url_to('site_event_order_ajax',['action'=>'Order'])}",            
                         target : "#actions"
             });
    });
    
    
   /* $(".OpenDetailsMoadl").click(function () {    
        $("#DetailsModal").modal('show');
    });*/
    
    $(".Details").click(function () { 
             return $.ajax2({ data : { SiteEventOrder : $(this).attr('id') },
                         url :"{url_to('site_event_order_ajax',['action'=>'ListPartialDebitDetailForUser'])}",            
                         target : "#details-modal-ctn",
                         success : function () { $("#DetailsModal").modal('show'); }
             });
    
    });  
    
    $(".CancelPayment").click(function () { 
             return $.ajax2({ data : { SiteEventOrder : $(this).attr('id') },
                         url :"{url_to('site_event_order_ajax',['action'=>'CancelPaymentForUser'])}",                                     
                         success : function (resp) { 
                              if (resp.action !='CancelPaymentForUser') return ;
                              $(".Actions[id="+resp.id+"]").remove();
                              $(".SiteEvent[id="+resp.id+"][name=state]").html(resp.state);
                         }
             });
    
    });  
</script>     
