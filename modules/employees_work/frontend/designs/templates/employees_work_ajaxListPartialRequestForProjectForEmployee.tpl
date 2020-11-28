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
            <a id="Project"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('Project Manager [%s]',$project->get('name'))}</p></a>
            <p class="text-muted mb-0">&nbsp;/&nbsp;{__('Payments')}</p>
          </div>
        </div>      
      </div>
          {component name="/site_help/help" help="employee-list-payments"}
    </div>
</div>
{if $project->isLoaded()}
{alerts}

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
                               {*if $item->getStatus()->isActive()}
                               <i class="mdi mdi-pencil EditPayment" id="{$item->get('reference')}" style="font-size: 15px;padding-left: 5px;color: #0040ff;cursor: pointer;"></i>
                               {/if*}
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
        
        $('#Project').click(function(){                                       
          return $.ajax2({ url: "{url_to('projects_ajax',['action'=>'ListPartialProjectForEmployee'])}",                           
                           target: "#actions"}); 
        }); 
       
       
        
        
</script> 
{else}
    {__('Project is invalid.')}
{/if}   
