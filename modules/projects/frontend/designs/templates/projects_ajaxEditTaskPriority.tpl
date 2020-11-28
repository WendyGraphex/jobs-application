{if $item->isLoaded()}
    {if $form->hasErrors()}<div>{$form.priority->getError()}</div>{/if}
<input type="text" class="ProjectTask-Priority-{$item->get('id')} Input" name="priority" size="2" value="{if $form->hasErrors()}{$item->get('priority')}{else}{if $item->hasPriority()}{$item->getFormatter()->getPriority()}{/if}{/if}"/>
 <a href="#" id="ProjectTask-Priority-Save-{$item->get('id')}" title="{__('Save')}" >
                   <i class="fa fa-save"></i></a>                 
            <a href="#" id="ProjectTask-Priority-Cancel-{$item->get('id')}" title="{__('Cancel')}">
               <i class="fa fa-remove"></i>
            </a> 
<script type="text/javascript">
    
    $('#ProjectTask-Priority-Cancel-{$item->get('id')}').click(function(){              
             return $.ajax2({ data : { ProjectTask:  '{$item->get('id')}' },
                              url : "{url_to('projects_ajax',['action'=>'DisplayTaskPriority'])}",                                              
                              target: ".Priority-ctn[id={$item->get('id')}]" }); 
       });
      
       $('#ProjectTask-Priority-Save-{$item->get('id')}').click(function(){              
             var params =  { 
                                ProjectTask : { 
                                    id : '{$item->get('id')}',
                                    token : '{$form->getCSRFToken()}'
                                }
             };             
             $(".ProjectTask-Priority-{$item->get('id')}.Input").each(function () { params.ProjectTask[$(this).attr('name')]=$(this).val(); });        
             return $.ajax2({ data : params,
                              url : "{url_to('projects_ajax',['action'=>'SaveTaskPriority'])}",                                              
                              target: ".Priority-ctn[id={$item->get('id')}]" }); 
      });
</script>  
{/if}

