{if $project->isLoaded()}
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
                        <a id="Projects"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('Projects')}</p></a>
                        <p class="text-muted mb-0">&nbsp;/&nbsp;{__('Project n°[%s]' ,$project->getReference())}</p>
                    </div>
                </div> 
                {component name="/site_help/help" help="project-display"}
            </div>
        </div>
    </div>

    {alerts}
    <div class="row">
        <div class="col-md-3 stretch-card">
            <div class="card classMargin">
                <div class="card-body">               
                    <div class="table-responsive pt-3">
                        <h5>{__('Project')}</h5>
                        <table id="PaymentRequests" class="table table-bordered table-striped">
                            <thead class="">
                                <tr role="row">
                                    <th>{__('Ref.')}</th>          
                                    <th>{__('Employer')}</th>                            
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>{$project->get('reference')}</td>
                                    <td>{$project->getEmployerUser()->get('username')}</td>
                                </tr>
                            </tbody>      
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6 stretch-card">
            <div class="card classMargin">
                <div class="card-body">               
                    <div class="table-responsive pt-3">
                        <h5>{__('Work')}</h5>
                        <table id="PaymentRequests" class="table table-bordered table-striped">
                            <thead class="">
                                <tr role="row">
                                    <th>{__('Ref.')}</th>          
                                    <th>{__('Order ref')}</th>  
                                    <th>{__('Number of days')}</th>
                                    <th>{__('Total')}</th>
                                    <th>{__('Paid')}</th>
                                    <th>{__('Unpaid')}</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>{$project->getWork()->get('reference')}</td>
                                    <td>{$project->getWork()->getOrder()->get('reference')}</td>
                                    <td>{$project->getWork()->getOrder()->get('reference')}</td>
                                    <td>{$project->getWork()->getFormatter()->getTotalPriceWithTax()->getAmount()}</td>
                                    <td>{$project->getWork()->getFormatter()->getTotalPaidWithTax()->getAmount()}</td>
                                    <td>{$project->getWork()->getFormatter()->getTotalUnPaidWithTax()->getAmount()}</td>
                                </tr>
                            </tbody>      
                        </table>
                    </div>
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
          return $.ajax2({  url: "{url_to('projects_ajax',['action'=>'ListPartialProjectForEmployee'])}",                           
                           target: "#actions"});
        }); 
    
</script>

{else}
   {__('Project is invalid.') } 
{/if}
