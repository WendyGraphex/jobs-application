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
            <a id="Payments"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('My payments')}</p></a>       
            <p class="text-muted mb-0">&nbsp;/&nbsp;{__('My requests for payment [%s]',$payment->get('reference'))}</p>
          </div>
        </div>      
      </div>
          {component name="/site_help/help" help="employee-request-for-payment"}
    </div>
</div>
{alerts}
{if  $payment->isLoaded()}

   
  
 <div class="col-lg-12 pt-2 stretch-card">
              <div class="card classMargin">
                <div class="card-body">               
                  <div class="table-responsive pt-3">
                    <table id="PaymentRequests" class="table table-bordered table-striped">
                      <thead class="">
                        <tr role="row">
                            <th>#</th>                           
                            <th>{__('Ref.')}           

                            </th>
                            <th>{__('Date')}</span>  

                            </th>          
                            <th>{__('Employer')}</span>  
                            </th>                            
                             <th>{__('Amount')}</th>                                   
                             <th>
                                {__('Status')}
                            </th>                                                               
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
                                   {$item->getFormatter()->getDate()->getText()}
                                </td> 
                                <td>
                                    {$item->getEmployerUser()} 
                                </td>                                     
                                  <td>
                                       {$item->getFormatter()->getTotalPriceWithTax()->getAmount()} 
                                   </td>               
                                   <td>
                                        {$item->getStatus()}
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
    
     
<script type="text/javascript">
             
        $('#Dashboard').click(function(){                                       
          return $.ajax2({ url: "{url_to('employees_ajax',['action'=>'Dashboard'])}",                           
                           target: "#actions"}); 
        }); 
        
         
       $("#Payments").click(function() {                   
              return $.ajax2({   url:"{url_to('payments_employee_ajax',['action'=>'ListPartialPaymentForEmployee'])}",                                    
                         target: "#actions"}); 
        });  
        
</script> 
{else}
    {__('Payment is invalid')}
{/if}    