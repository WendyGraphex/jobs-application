<div class="row RowTop">
    <div class="col-md-12 grid-margin classConducteurTop">
      <div class="d-flex justify-content-between flex-wrap">
        <div class="d-flex align-items-end flex-wrap">
          <div class="mr-md-3 mr-xl-5 styleWidth">
            <h2>{__('Project Manager')}</h2>                   
          </div>
          <div class="d-flex">
            <i class="mdi mdi-home text-muted hover-cursor"></i>
            <a id="Dashboard"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('Dashboard')}</p></a>
            <a id="Project"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('Project Manager [%s]',$project->get('reference'))}</p></a>
            <p class="text-muted mb-0">&nbsp;/&nbsp;{__('Payments')}</p>
          </div>
        </div>      
      </div>
          {component name="/site_help/help" help="employer-list-payments"}
    </div>
</div>
{if $project->isLoaded()}
{alerts}
{if !$project->getWork()->isAccepted() && $project->getStatus()->isActive()}
<div class="row admin-header-container btn-r">    
    <div class="col-sm p-0">
        <div class="pull-right">
                <a href="#" id="PayAll" class="btn btn-primary admin-header-button"><i class="fa fa-plus mr-2"></i>{__('Pay all')}</a>                
        </div>
    </div>
</div> 
{/if}        
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
                    <th>{__('Freelancer')}</span>  
                    </th>                            
                     <th>{__('Amount')}</th>                                   
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
                           {$item->getFormatter()->getDate()->getText()}
                        </td> 
                        <td>
                            {$item->getEmployeeUser()} 
                        </td>                                     
                          <td>
                              <span class="EmployeeWorkPayments" name="amount" id="{$item->get('reference')}">{$item->getFormatter()->getTotalPriceWithTax()->getAmount()}</span>
                               {if $item->getStatus()->isActive()}
                               <i class="mdi mdi-pencil EditPayment" id="{$item->get('reference')}" style="font-size: 15px;padding-left: 5px;color: #0040ff;cursor: pointer;"></i>
                               {/if}
                           </td>               
                           <td>
                                {$item->getStatus()}
                           </td>                                    
                           <td> 
                              {if !$item->getStatus()->isPlanned() && !$item->getStatus()->isAccepted() && ($item->getStatus()->isActive() || $item->getStatus()->isRefused() || $item->getRequestedAt()->isOver())}
                               <button id="{$item->get('reference')}" class="EmployeeWorkPayments-Accepted btn btn-outline-success btn-sm">{__('Accepted')}</button> 
                              {/if}

                              {if !$item->getStatus()->isPlanned() && !$item->getStatus()->isAccepted() && ($item->getStatus()->isActive()  || $item->getRequestedAt()->isOver())}
                               <button id="{$item->get('reference')}" class="EmployeeWorkPayments-Refused btn btn-outline-danger btn-sm">{__('Refused')}</button> 
                              {/if}
                              {if $item->getStatus()->isActive()}
                                  <button id="{$item->get('reference')}" class="EmployeeWorkPayments-Closed btn btn-outline-warning btn-sm">{__('Paid all')}</button> 
                              {/if}    
                              <div class="EmployeeWorkPaymentStatus" id="{$item->get('reference')}">
                                  {if $item->isConfirmed()}
                                        {__("Confirmed by administrator at %s",$item->getFormatter()->getConfirmedAt()->getText())}
                                  {else}    
                                    {if $item->getStatus()->isRefused()}
                                    {__("Refused at %s",$item->getFormatter()->getRefusedAt()->getText())}
                                    {elseif $item->getStatus()->isAccepted()}
                                     {__("Accepted at %s",$item->getFormatter()->getRefusedAt()->getText())}
                                    {/if} 
                                  {/if}
                              </div>
                             {*   <a href="#" class="list-action text-info Payment" id="{$item->get('id')}"  title="{__('Payment')}"><i class="fa fa-list"></i></a>                                     
                                <a href="#" class="list-action text-alert Paid" id="{$item->get('id')}"  title="{__('Paid')}"><i class="fa fa-dollar-sign"></i></a>  *}  
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
<!-- Modal -->
<div class="modal" id="ModalAmountRequest" role="dialog">
    <div class="modal-dialog" style="top: 30%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div id="ModalAmountRequest-ctn" class="modal-body" style="top: 30%;">
                
            </div>
        </div>
    </div>
</div>
  
<script type="text/javascript">
    
       $(".EditPayment").click(function() { 
            return $.ajax2({ data : { EmployeeWorkPaymentRequest : { reference : $(this).attr('id') } },
                           url: "{url_to('employees_work_ajax',['action'=>'DialogAmountRequestForEmployer'])}",  
                           success : function () { $('#ModalAmountRequest').modal('show'); },
                           target: "#ModalAmountRequest-ctn"}); 
       });
        
        $('#Dashboard').click(function(){                                       
          return $.ajax2({ url: "{url_to('employers_ajax',['action'=>'Dashboard'])}",                           
                           target: "#actions"}); 
        }); 
        
        $('#Project').click(function(){                                       
          return $.ajax2({ url: "{url_to('projects_ajax',['action'=>'ListPartialProjectForEmployer'])}",                           
                           target: "#actions"}); 
        }); 
       
       
        $('.EmployeeWorkPayments-Refused').click(function(){                                       
          return $.ajax2({ data : { EmployeeWorkPaymentRequest : $(this).attr('id') },
                           url: "{url_to('employees_work_ajax',['action'=>'RequestRefused'])}",
                           success : function (resp)
                                {   
                                     if (resp.action !='RequestRefused') return ;                                   
                                     $(".EmployeeWorkPayments-Refused[id="+resp.reference+"]").remove();
                                     $(".EmployeeWorkPaymentStatus[id="+resp.reference+"]").html(resp.status);
                                }
                         }); 
        }); 
        
        $(".EmployeeWorkPayments-Accepted").click(function(){                                       
          return $.ajax2({ data : { EmployeeWorkPaymentRequest : $(this).attr('id') },
                           url: "{url_to('employees_work_ajax',['action'=>'RequestAccepted'])}",    
                           success : function (resp)
                                {   
                                     if (resp.action !='RequestAccepted') return ;
                                     $(".EmployeeWorkPayments-Accepted[id="+resp.reference+"]").remove();
                                     $(".EmployeeWorkPayments-Refused[id="+resp.reference+"]").remove();
                                     $(".EmployeeWorkPaymentStatus[id="+resp.reference+"]").html(resp.status);
                                     $(".EmployeeWorkPayments-Closed[id="+resp.reference+"]").remove();
                                     $(".EditPayment[id="+resp.reference+"]").remove();
                                }
                         }); 
        }); 
        
        
         $(".EmployeeWorkPayments-Closed").click(function(){                                       
          return $.ajax2({ data : { EmployeeWorkPaymentRequest : $(this).attr('id') },
                           url: "{url_to('employees_work_ajax',['action'=>'RequestClosed'])}",    
                           target: "#actions" 
                         }); 
        }); 
       

        $("#PayAll").click( function () {                 
                return $.ajax2({ data :{ Project: '{$project->get('id')}' },
                                url: "{url_to('employees_work_ajax',['action'=>'DialogPayAllForEmployer'])}",  
                                success : function () { $('#ModalAmountRequest').modal('show'); },
                                target: "#ModalAmountRequest-ctn"
                     });                                        
            });  
            
</script> 
{else}
    {__('Project is invalid.')}
{/if}    