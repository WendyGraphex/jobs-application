{if !$form->getSelection()->isEmpty()}       
    <span id="EmployerProject-ProjectText">{__('Projects selected')}:</span>
    {foreach $form->getSelection() as $item}
        <div class="col-md-3 EmployerProject" id="{$item->get('id')}">
            <div class="btn btn-secondary-perso" style="width: 100%;">{if $item->hasI18n()}
                         {$item->getI18n()}
                    {else}
                         {$item->getFormatter()->getName()}
                    {/if} 
                    <i class="mdi mdi-delete EmployerProject-Delete-btn" id="{$item->get('id')}" style="font-size: 18px;"></i>
            </div>     
        </div>
    {/foreach}    
{/if}   
<span id="EmployerProject-NoProjectText" {if !$form->getSelection()->isEmpty()}style="display:none"{/if}>{__('No project')}</span>
<script type="text/javascript">
    
     $(".EmployerProject-Delete-btn").click(function () {           
           $(".EmployerProject[id="+$(this).attr('id')+"]").remove();    
           if ($(".EmployerProject").length==0)
           {    
               $("#EmployerProject-NoProjectText").show();
               $("#EmployerProject-ProjectText").hide();
           }
     });  
     
      
</script>     