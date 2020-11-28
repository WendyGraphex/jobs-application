<div class="row admin-header-container">
  <div class="col-sm">
    <h3 class="admin-header-big-text">{__('Projects')}</h3>
    <h3 class="admin-header-small-text">{__('Project management')}</h3>
  </div>
  <div class="col-sm" style="padding: 0;">
      <div style="float: right;"> 
      {*  <a class="btn btn-warning admin-header-button" href="#"><i class="fa fa-file-excel"></i> {__('Export XLS')}</a> *}
      </div> 
  </div>
</div>

<div class="breadcrumb-title">
    <p>            
        <i class="fa fa-home" style="color: #37bc9b;"></i>              
        <a href="#" id="Projects"><i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Projects')}</a>
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Details for project [%s]',$project->get('name'))}                      
    </p>
</div>         
{alerts}
{if $project->isLoaded()}
    <div class="table-responsive bg-white px-1 py-2">
        <div style="column-count: 4;column-gap: 10px;">
            <div style="display: inline-block;">
                <table class="table table-bordered table-hover table-striped" cellpadding="0" cellspacing="0"> 
                    <thead>
                        <tr>
                            <th colspan="2">{__('Project')}</th>            
                        </tr>
                     </thead>
                     <tbody>
                        <tr class="list-header">
                            <th>{__('Ref.')}</th>
                            <td>{$project->get('reference')}</td>
                        </tr>
                        <tr class="list-header">
                            <th>{__('Date')}</th>
                            <td>{$project->getFormatter()->getCreatedAt()->getText()}</td>
                        </tr>             
                    </tbody>
                </table>
            </div>
            <div style="display: inline-block;">
                <table class="table table-bordered table-hover table-striped" cellpadding="0" cellspacing="0"> 
                    <thead>
                        <tr>
                            <th colspan="2">{__('Freelancer')}</th>            
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="list-header">
                            <th>{__('Name')}</th>
                            <td> {$project->getEmployeeUser()}</td>
                        </tr>                      
                    </tbody>
                </table>
            </div>
            <div style="display: inline-block;">
                <table class="table table-bordered table-hover table-striped" cellpadding="0" cellspacing="0"> 
                    <thead>
                        <tr>
                            <th colspan="2">{__('Employer')}</th>            
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="list-header">
                            <th>{__('Name')}</th>
                            <td> {$project->getEmployerUser()}</td>
                        </tr>                      
                   </tbody>
                </table>
            </div>
            <div style="display: inline-block;">
                <table class="table table-bordered table-hover table-striped" cellpadding="0" cellspacing="0"> 
                    <thead>
             <tr>
                <th colspan="2">{__('Advert')}</th>            
            </tr>
         </thead>
         
         <thead>
             <tr>
                <th colspan="2">{__('Order')}</th>            
            </tr>
         </thead>
          <tbody>
            <tr class="list-header">
            <th>{__('Ref.')}</th>
            <td>{$project->getOrder()->get('reference')}</td>
        </tr>
        <tr class="list-header">
            <th>{__('Date')}</th>
            <td>{$project->getOrder()->getFormatter()->getCreatedAt()->getText()}</td>
        </tr>                         
         </tbody>
         
         <thead>
             <tr>
                <th colspan="2">{__('Quotation')}</th>            
            </tr>
         </thead>
         
          <thead>
             <tr>
                <th colspan="2">{__('Works')}</th>            
            </tr>
         </thead>
         
          <thead>
             <tr>
                <th colspan="2">{__('Payments')}</th>            
            </tr>
         </thead>
                </table>
            </div>
        </div>
       
       
       
       
       
   <table class="table table-bordered table-hover table-striped" cellpadding="0" cellspacing="0"> 
        <thead>
            <tr>
                <th colspan="2">{__('Project')}</th>            
            </tr>
         </thead>
         <tbody>
            <tr class="list-header">
                <th>{__('Ref.')}</th>
                <td>{$project->get('reference')}</td>
            </tr>
            <tr class="list-header">
                <th>{__('Date')}</th>
                <td>{$project->getFormatter()->getCreatedAt()->getText()}</td>
            </tr>             
         </tbody>
         
          <thead>
            <tr>
                <th colspan="2">{__('Freelancer')}</th>            
            </tr>
         </thead>
          <tbody>
            <tr class="list-header">
                <th>{__('Name')}</th>
                <td> {$project->getEmployeeUser()}</td>
            </tr>                      
         </tbody>
         
         <thead>
            <tr>
                <th colspan="2">{__('Employer')}</th>            
            </tr>
         </thead>
          <tbody>
            <tr class="list-header">
                <th>{__('Name')}</th>
                <td> {$project->getEmployerUser()}</td>
            </tr>                      
         </tbody>
         
         <thead>
             <tr>
                <th colspan="2">{__('Job')}</th>            
            </tr>
         </thead>
         
         <thead>
             <tr>
                <th colspan="2">{__('Order')}</th>            
            </tr>
         </thead>
          <tbody>
            <tr class="list-header">
            <th>{__('Ref.')}</th>
            <td>{$project->getOrder()->get('reference')}</td>
        </tr>
        <tr class="list-header">
            <th>{__('Date')}</th>
            <td>{$project->getOrder()->getFormatter()->getCreatedAt()->getText()}</td>
        </tr>                         
         </tbody>
         
         <thead>
             <tr>
                <th colspan="2">{__('Quotation')}</th>            
            </tr>
         </thead>
         
          <thead>
             <tr>
                <th colspan="2">{__('Works')}</th>            
            </tr>
         </thead>
         
          <thead>
             <tr>
                <th colspan="2">{__('Payments')}</th>            
            </tr>
         </thead>
  </table> 
   
   </div>
<script type="text/javascript">

        $('#Projects').click(function(){                                       
          return $.ajax2({   url: "{url_to('projects_ajax',['action'=>'ListPartialProject'])}",                           
                           target: "#actions"}); 
        }); 
        
</script>

{else}
    {__('Order is invalid.')}
{/if}    

