{if $project->isLoaded()} 
<div class="modal-header">
    <h5 class="modal-title">{__('Work for project [%s] (%s)',[$project->get('reference'),$project->get('name')])}</h5>
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
</div>
<div class="modal-body">

</div>
<div class="modal-footer">

</div>                  
<script type="text/javascript">
     
     
       
        
        
</script>

{else}
    {__('Project is invalid.')}
{/if} 