<div class="comment-form-wrap">
    <h3 class="mb-5" style="margin-bottom: 25px !important;">{__('Comment from %s',$project->getEmployerUser()->get('username'))}</h3>   
{if $project->isLoaded()}
    <div>  
        
    </div>
</div>
<script type="text/javascript">
    
</script>      
{else}
    {__('Project is invalid')}
{/if}    

