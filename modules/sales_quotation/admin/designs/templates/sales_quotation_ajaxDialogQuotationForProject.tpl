{if $project->isLoaded()} 
<div class="modal-header" style="border-bottom: none;padding-bottom: 0px;padding-top: 0px;padding-right: 5px;">
    {*<h5 class="modal-title">{__('Quotation for project [%s] (%s)',[$project->get('reference'),$project->get('name')])}</h5>*}
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<div class="modal-body" style="text-align: center;">
    <h5 class="modal-title">{__('Quotation for project [%s] (%s)',[$project->get('reference'),$project->get('name')])}</h5>
</div>                 
<script type="text/javascript">
      
</script>

{else}
    {__('Project is invalid.')}
{/if}   