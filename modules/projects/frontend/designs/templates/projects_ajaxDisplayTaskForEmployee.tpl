<td class="count"  id="{$item->get('id')}"></td>  
       <td>                            
                    <input class="Selection ProjectTask-Selection-{$item->get('id')}" type="checkbox" id="{$item->get('id')}" name="{$item->get('name')}"/>                       
                </td>
      <td>                
           <div title="{$item->get('description')}">
               <a href="#" class="ChangeIsActive-{$item->get('id')}" id="{$item->get('id')}" name="{$item->get('is_active')}"><i class="fa fa-check Color{if $item->isActive()}Green{else}Red{/if}"/></a>  
               <a href="#" class="ProjectTask-EditInLine-{$item->get('id')}"><i class="fa fa-edit"/></a>[{$item->get('reference')}] {$item->get('name')}
                 </div>
     </td> 
      <td>
          <div> {$item->get('requested_by')}  </div>          
                <div>{if $item->hasRequestedAt()}{$item->getFormatter()->getRequestedAt()->getText()}{/if}  </div>
     </td>    
      <td>
         <div>{if $item->hasStartAt()}{$item->getFormatter()->getStartAt()->getText()}{/if}  </div>

         <div>{if $item->hasEndAt()}{$item->getFormatter()->getEndAt()->getText()}{/if} </div>

         <div>{if $item->hasBeforeAt()}{$item->getFormatter()->getBeforeAt()->getText()}{/if} </div>
     </td> 
      <td>                
          <div>{$item->getFormatter()->getDuration()->getHourMinute()} </div>                          
          <div>{if $item->hasEstimatedDuration()}({$item->getFormatter()->getEstimatedDuration()->getHourMinute()}){else}{__('---')}{/if}</div>
     </td>             
       <td class="Priority-ctn" id="{$item->get('id')}">
         {if $item->hasPriority()}{$item->getFormatter()->getPriority()}{else}{__('---')}{/if}
          <a href="#" title="{__('Edit')}" class="PriorityEdit-{$item->get('id')}">
                <i class="fa fa-edit"></i></a> 
     </td>
     <td>
          <select class="selectColors State" id="{$item->get('id')}">
                 <option data-content="<span class='btn selectColors-btn'></span>----" value="">----</option>                       
                 {foreach $states as $state}
                      <option value="{$state->get('id')}" {if $state->get('id')==$item->get('state_id')}selected=""{/if} data-content="<span {if $state->hasColor()}style='background:{$state->get('color')}'{/if} class='btn selectColors-btn'></span>{$state->getI18n()->get('value')}">{$state->getI18n()->get('value')}</option>
                 {/foreach}    
             </select>   
     </td>
     <td>               
 <a href="#" title="{__('Edit')}" class="ProjectTask-View-{$item->get('id')}">
                       <i class="fa fa-edit"></i></a>               
                           
                <a {if $item->isDisable()}style="display:none"{/if} href="#" title="{__('Enable')}" class="Enable-{$item->get('id')}"  name="{$item->get('name')}">
                   <i class="fa fa-recycle"></i>
                </a> 
                    <a {if $item->isEnable()}style="display:none"{/if} href="#" title="{__('Disable')}" class="Disable-{$item->get('id')}"  name="{$item->get('name')}">
                   <i class="fa fa-remove"></i>
                </a> 
                <a href="#" title="{__('Delete')}" class="ProjectTask-Delete-{$item->get('id')}"  name="{$item->get('name')}">
                   <i class="fa fa-trash"></i>
                </a>  
     </td>
<script type="text/javascript">
      //  $('.selectColors').selectpicker();   
     
        $(".ProjectTask-View-{$item->get('id')}").click( function () {                
                return $.ajax2({ data : { ProjectTask :  "{$item->get('id')}" },                                
                                url:"{url_to('projects_ajax',['action'=>'ViewTaskForEmployee'])}",                              
                                target: "#actions"
                            });
         });
                    
         $(".ProjectTask-EditInLine-{$item->get('id')}").click( function () {                            
                var count=$(".count[id={$item->get('id')}]").html();
                return $.ajax2({ data : { ProjectTask : "{$item->get('id')}" },                                
                                url:"{url_to('projects_ajax',['action'=>'EditTaskForEmployee'])}",                              
                                target: ".Task[id={$item->get('id')}]",
                                success: function ()
                                        {
                                            $(".count[id={$item->get('id')}]").html(count);
                                        }
                    });
         });
         
          $(".ProjectTask-Delete-{$item->get('id')}").click( function () { 
                if (!confirm('{__("Task \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ ProjectTask: "{$item->get('id')}" },
                                 url :"{url_to('projects_ajax',['action'=>'DeleteTask'])}",                                
                                 success : function(resp) {
                                       if (resp.action=='DeleteTask')
                                       {    
                                          $("tr#"+resp.id).remove();  
                                          if ($('.Task').length==0)
                                              return $.ajax2({ data : { Project: '{$item->getProject()->get('id')}' },
                                                               url:"{url_to('projects_ajax',['action'=>'ListPartialTaskForProject'])}",                                                             
                                                               target: "#actions"});
                                          updatePager(1);
                                        }       
                                 }
                     });                                        
            });
            

        

        $(".ProjectTask-Selection-{$item->get('id')}").click(function () {             
              $(".actions_items").css('opacity',($(".Selection:checked").length?'1':'0.5'));                
              if ($(this).prop('checked'))                                                  
                  $("#ProjetTaskForProjectList").data("selection").push($(this).attr("id"));                                 
              else              
                  $("#ProjetTaskForProjectList").data("selection").splice($.inArray($(this).attr("id"),$("#ProjetTaskForProjectList").data("selection")),1);                                                                         
        });
        
         $(".ChangeIsActive-{$item->get('id')}").click(function() { 
                        return $.ajax2({ 
                            data : { 
                                        ProjectTask : { 
                                                id: '{$item->get('id')}' , 
                                                value:$(this).attr('name'), 
                                                token: '{mfForm::getToken('ChangeForm')}' } },                            
                            url: "{url_to('projects_ajax',['action'=>'ChangeIsActiveTask'])}",                          
                            success: function(resp) { 
                                        if (resp.action=='ChangeIsActiveTask')
                                            changeIsActiveState(resp);
                                     }
                    });
         });
         
          $(".Enable-{$item->get('id')}").click( function () {               
                return $.ajax2({ data :{ ProjectTask: '{$item->get('id')}' },
                                 url :"{url_to('projects_ajax',['action'=>'EnableTask'])}",                                
                                 success : function(resp) {
                                       if (resp.action!='EnableTask') return ;
                                        $(".Disable[id={$item->get('id')}]").show();     
                                        $(".Enable[id={$item->get('id')}]").hide();
                                 }
                     });                                        
            });     
            
        $(".Disable-{$item->get('id')}").click( function () {            
                return $.ajax2({ data :{ ProjectTask: '{$item->get('id')}' },
                                 url :"{url_to('projects_ajax',['action'=>'DisableTask'])}",                                
                                 success : function(resp) {
                                       if (resp.action!='DisableTask') return ;
                                         $(".Enable[id={$item->get('id')}]").show();     
                                        $(".Disable[id={$item->get('id')}]").hide();       
                                 }
                     });                                        
            });  
            
        $(".PriorityEdit-{$item->get('id')}").click( function () {                
                return $.ajax2({ data : { ProjectTask :  '{$item->get('id')}' },                                
                                url:"{url_to('projects_ajax',['action'=>'EditTaskPriority'])}",                              
                                target: $(".Priority-ctn[id='{$item->get('id')}']") });
         }); 
</script>    

