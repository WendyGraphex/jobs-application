{if $project->isLoaded()} 
<div class="modal-header">
    <h5 class="modal-title">{__('Order for project [%s] (%s)',[$project->get('reference'),$project->get('name')])}</h5>
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
</div>
<div class="modal-body">
  <table class="table table-bordered table-hover table-striped" cellpadding="0" cellspacing="0"> 
        <thead>
        <tr class="list-header">
            <th>{__('Ref.')}</th>
            <td>{$project->getOrder()->get('reference')}</td>
        </tr>
        <tr class="list-header">
            <th>{__('Date')}</th>
            <td>{$project->getOrder()->getFormatter()->getCreatedAt()->getText()}</td>
        </tr>
        <tr class="list-header">
            <th>{__('Freelancer')}</th>
            <td>{$project->getEmployeeUser()}</td>
        </tr>
        <tr class="list-header">
            <th>{__('Employer')}</th>
            <td>{$project->getEmployerUser()}</td>
        </tr>
        </thead>
  </table>
</div>
<div class="modal-footer">

</div>                  
<script type="text/javascript">
     
     
       
        
        
</script>

{else}
    {__('Project is invalid.')}
{/if}    