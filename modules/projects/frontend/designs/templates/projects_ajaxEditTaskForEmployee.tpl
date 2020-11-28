<td class="count"  id="{$item->get('id')}"></td>          
        <td>                            
           
         </td> 
         <td>
             {$item->getProject()->get('name')}
         </td>           
      <td>
          <div><input class="ProjectTask-{$item->get('id')} Input" placeholder="{__('Requested by')}" name="requested_by" size="8" value="{$item->get('requested_by')}"/></div>
          <div><input class="ProjectTask-{$item->get('id')} Input Date" placeholder="{__('Requested at')}" name="requested_at" size="8" value="{if $item->hasRequestedAt()}{$item->getFormatter()->getRequestedAt()->getText()}{/if}"/></div>         
     </td>       
      <td>
         <div><input class="ProjectTask-{$item->get('id')} Input Date" placeholder="{__('Start at')}" id="start_at" name="start_at" size="6" value="{if $item->hasStartAt()}{$item->getFormatter()->getStartAt()->getText()}{/if}"/></div>
         <div><input class="ProjectTask-{$item->get('id')} Input Date" placeholder="{__('End at')}" id="end_at" name="end_at" size="6" value="{if $item->hasEndAt()}{$item->getFormatter()->getEndAt()->getText()}{/if}"/></div>
         <div><input class="ProjectTask-{$item->get('id')} Input Date" placeholder="{__('Before at')}" name="before_at" size="6" value="{if $item->hasBeforeAt()}{$item->getFormatter()->getBeforeAt()->getText()}{/if}"/></div>
     </td> 
      <td>                
          <div>{$item->getFormatter()->getDuration()->getHourMinute()} </div>                          
          <div>{if $item->hasEstimatedDuration()}({$item->getFormatter()->getEstimatedDuration()->getHourMinute()}){else}{__('---')}{/if}</div>
     </td>             
       <td class="Priority-ctn" id="{$item->get('id')}">
         {if $item->hasPriority()}{$item->getFormatter()->getPriority()}{else}{__('---')}{/if}          
     </td>
     <td>
          <select class="selectColors State ProjectTask-{$item->get('id')} Select" name="state_id">
                 <option data-content="<span class='btn selectColors-btn'></span>----" value="">----</option>                       
                 {foreach $form->state_id->getChoices() as $state}
                      {if $state}
                      <option value="{$state->get('id')}" {if $state->get('id')==$item->get('state_id')}selected=""{/if} data-content="<span {if $state->hasColor()}style='background:{$state->get('color')}'{/if} class='btn selectColors-btn'></span>{$state->getI18n()->get('value')}">{$state->getI18n()->get('value')}</option>
                      {else}
                      <option value="" {if $state==$item->get('state_id')}selected=""{/if} data-content="<span class='btn selectColors-btn'></span>{$state}">{__('')}</option>
                      {/if}    
                 {/foreach}    
             </select>  
     </td>
     <td>               
<div>
    <a href="#" id="Save-{$item->get('id')}" class=""><i class="fa fa-floppy-o"></i></a>
    <a href="#" id="Cancel-{$item->get('id')}" class=""><i class="fa fa-times"></i></a>
</div>
     </td>
<script type="text/javascript">
     //$('.selectColors').selectpicker();         
     
      $( ".Date" ).datepicker();
     
     var dates = $( "#start_at, #end_at" ).datepicker({
			onSelect: function( selectedDate ) {
				var option = this.id == "start_at" ? "minDate" : "maxDate",
					instance = $( this ).data( "datepicker" ),
					date = $.datepicker.parseDate(
						instance.settings.dateFormat ||
						$.datepicker._defaults.dateFormat,
						selectedDate, instance.settings );
				dates.not( this ).datepicker( "option", option, date );
    } } );

     $('#Cancel-{$item->get('id')}').click(function(){    
             var count=$(".count[id={$item->get('id')}]");
             return $.ajax2({ data : { ProjectTask: '{$item->get('id')}' },
                              url : "{url_to('projects_ajax',['action'=>'DisplayTaskForEmployee'])}",                                              
                              target: ".Task[id={$item->get('id')}]", 
                              success: function ()
                                        {
                                            $(".count[id={$item->get('id')}]").html(count);
                                        }
                  }); 
      });
      
      $('#Save-{$item->get('id')}').click(function(){      
            var count=$(".count[id={$item->get('id')}]");
            var  params= {       
                               ProjectTask: {  
                                   id : "{$item->get('id')}",
                                   token :'{$form->getCSRFToken()}'
                                } };          
          $(".ProjectTask-{$item->get('id')}.Input").each(function() {  params.ProjectTask[this.name]=$(this).val();  });  // Get foreign key  
          $(".ProjectTask-{$item->get('id')}.Select option:selected").each(function() {  params.ProjectTask[$(this).parent().attr('name')]=$(this).val();  });  // Get foreign key  
        //      alert("Params="+params.toSource());   return ;        
          return $.ajax2({ data : params,                          
                           url: "{url_to('projects_ajax',['action'=>'SaveEditTask'])}",
                           target: ".Task[id={$item->get('id')}]", 
                           success: function ()
                                    {
                                        $(".count[id={$item->get('id')}]").html(count);
                                    } 
                    }); 
        });  
</script>    

