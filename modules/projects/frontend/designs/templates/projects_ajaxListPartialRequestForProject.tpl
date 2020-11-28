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
            <a id="Projects"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('Project manager')}</p></a>
            <p class="text-muted mb-0">&nbsp;/&nbsp;{__('Payment requests for project [%s]',$project->get('reference'))}</p>
          </div>
        </div>      
      </div>
    </div>
</div>
{alerts}
{if $project->isLoaded()}
    
  
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
                            <th>{__('Actions')}</th>
                        </tr>
                      </thead>
                      <tbody>
                      <tr>
                        <td></td>                       
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                      </tr>
                      </tbody>
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
                                   <td> 
                                      
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

             $('#Projects').click(function(){                                       
              return $.ajax2({ url: "{url_to('projects_ajax',['action'=>'ListPartialProjectForEmployee'])}",                           
                               target: "#actions"}); 
           });
           
    </script>    
    
{else}
    {__('Project is invalid')}
{/if}    

