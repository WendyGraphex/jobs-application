 {if $item->hasPriority()}{$item->getFormatter()->getPriority()}{else}{__('---')}{/if}
                 <a href="#" title="{__('Edit')}" id="PriorityEdit-{$item->get('id')}">
                       <i class="fa fa-edit"></i></a> 
<script type="text/javascript">
    
     $("#PriorityEdit-{$item->get('id')}").click( function () {                
                return $.ajax2({ data : { ProjectTask :  '{$item->get('id')}' },                                
                                url:"{url_to('projects_ajax',['action'=>'EditTaskPriority'])}",                              
                                target: $(".Priority-ctn[id={$item->get('id')}]") });
         }); 
</script>  
