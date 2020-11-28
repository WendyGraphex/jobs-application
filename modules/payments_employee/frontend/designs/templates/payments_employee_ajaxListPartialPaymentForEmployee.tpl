<div class="row RowTop">
    <div class="col-md-12 grid-margin classConducteurTop">
      <div class="d-flex justify-content-between flex-wrap">
        <div class="d-flex align-items-end flex-wrap">
          <div class="mr-md-3 mr-xl-5 styleWidth">
            <h2>{__('My Payments')}</h2>                   
          </div>
          <div class="d-flex">
            <i class="mdi mdi-home text-muted hover-cursor"></i>
            <a id="Dashboard"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('Dashboard')}</p></a>       
            <p class="text-muted mb-0">&nbsp;/&nbsp;{__('My Payments')}</p>
          </div>
        </div>      
      </div>
          {component name="/site_help/help" help="employee-list-payment"}
    </div>
</div>
{alerts}
{include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter}
<div class="col-lg-12 pt-2 stretch-card">
    <div class="card classMargin">
        <div class="card-body">               
            <div class="table-responsive pt-3">
                <table class="table table-bordered table-striped">
                    <thead class="">
                        <tr role="row">
                            <th>#</th>                           
                            <th>{__('Ref.')}           

                            </th>
                            <th>{__('Date')}</span>  

                            </th>
                            <th>{__('Method')}</span>  

                            </th>
                            <th>{__('Amount')}</th>    
                             <th>{__('Paid')}</th>   
                            <th>
                                {__('State')}
                            </th>                                     
                            <th>{__('Actions')}</th> 
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $pager as $item} 
                            <tr class="list" id="{$item->get('id')}" role="row">
                                <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>                                
                                <td>
                                    {$item->get('reference')}
                                </td> 
                                <td>
                                    {$item->getFormatter()->getCreatedAt()->getDate()->getText()}
                                </td>
                                <td>  
                                    {$item->getMethod()->getFormatter()->getName()->ucfirst()}
                                </td>                                                                     
                                <td>
                                    {$item->getFormatter()->getTotalPriceWithTax()->getAmount()} 
                                </td>  
                                  <td>
                                    {$item->getFormatter()->getGeneralPriceWithTax()->getAmount()} 
                                </td>  
                                <td>
                                    {$item->getState()}
                                </td>                                    
                                <td> 
                                    <a href="#" title="{__('Requests')}"class="Requests" id="{$item->get('id')}"><i class="fa fa-list"></i></a>  
                                </td>   
                            </tr>  

                        {/foreach}
                        {if !$pager->hasItems()}
                            <tr role="row" >
                                <td  colspan="13">{__('No result')}</td>
                            </tr>
                        {/if}  
                    </tbody>         
                </table> 
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
                            url:"{url_to('payments_employee_ajax',['action'=>'ListPartialPaymentForEmployee'])}" ,                          
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
                                 url:"{url_to('payments_employee_ajax',['action'=>'ListPartialPaymentForEmployee'])}?page="+$(this).attr('data-page'),                                
                                 target: "#actions"
                });
        });
    
    
             
        $('#Dashboard').click(function(){                                       
          return $.ajax2({ url: "{url_to('employers_ajax',['action'=>'Dashboard'])}",                           
                           target: "#actions"}); 
        }); 
        
         
       $(".Requests").click(function() {                   
              return $.ajax2({ data : { PaymentEmployee : $(this).attr('id') },
                         url:"{url_to('payments_employee_ajax',['action'=>'ListPartialRequestForPayment'])}",                                    
                         target: "#actions"}); 
        });  
        
</script> 
 
