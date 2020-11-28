<div class="row RowTop">
    <div class="col-md-12 grid-margin classConducteurTop">
      <div class="d-flex justify-content-between flex-wrap">
        <div class="d-flex align-items-end flex-wrap">
          <div class="mr-md-3 mr-xl-5 styleWidth">
            <h2>{__('My Works')}</h2>                   
          </div>
          <div class="d-flex">
            <i class="mdi mdi-home text-muted hover-cursor"></i>
            <a id="Dashboard"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('Dashboard')}</p></a>
            <p class="text-muted mb-0">&nbsp;/&nbsp;{__('Works Manager')}</p>
          </div>
        </div>      
      </div>
    </div>
</div>
{alerts}

 <div class="col-lg-12 pt-2 stretch-card">
              <div class="card classMargin">
                <div class="card-body">               
                  <div class="table-responsive pt-3">
                    <table class="table table-bordered table-striped">
                      <thead class="">
                        <tr role="row">
                            <th> #</th>                                                 
                            <th>{__('Ref.')}</th>                             
                            <th>{__('Project')}</th> 
                            <th>{__('Employer')}</th> 
                            <th>{__('Start at')}</th>       
                            <th>{__('End at')}</th> 
                            <th>{__('Number of days')}</th> 
                            <th>{__('Due dates')}</th> 
                            <th>{__('Paid')}</th> 
                            <th>{__('Total')}</th> 
                            <th>{__('Created At')}</th>                                                                                                                                      
                            <th>{__('Actions')}</th>
                        </tr>
                      </thead>
                      <tbody>
                         {foreach $pager as $item} 
                            <tr class="list" id="{$item->get('id')}" role="row">
                                <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>                                                            
                                <td>{$item->get('reference')}
                                </td> 
                                <td>                                       
                                  {$item->get('name')}  
                                </td>                               
                                <td>
                                   {$item->getEmployerUser()}   
                                </td>                                                           
                                  <td>
                                   {if $item->hasStartAt()}
                                   {$item->getFormatter()->getStartAt()->getText()}
                                   {/if}
                                </td>  
                                <td>
                                    {if $item->hasEndAt()}
                                    {$item->getFormatter()->getEndAt()->getText()}                                         
                                    {/if}
                                  </td>
                                  <td></td>
                                   <td></td>
                                     <td></td>
                                       <td></td>
                                  <td>
                                  {$item->getFormatter()->getCreatedAt()->getText()}
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
          return $.ajax2({ url: "{url_to('employers_ajax',['action'=>'Dashboard'])}",                           
                           target: "#actions"}); 
        }); 
        
        
       
</script> 

