<div class="row RowTop">
    <div class="col-md-12 grid-margin classConducteurTop">
        <div class="d-flex justify-content-between flex-wrap">
            <div class="d-flex align-items-end flex-wrap">
                <div class="mr-md-3 mr-xl-5 styleWidth">
                    <h2>{__('Project Manager')}</h2>                   
                </div>
                <div class="d-flex">
                    <i class="mdi mdi-home text-muted hover-cursor"></i>
                    <a id="Dashboard"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('Dashboard')}</p></a>
                    <a id="Projects"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('Project Manager')}</p></a>
                    <p class="text-muted mb-0">&nbsp;/&nbsp;{__('Project [%s]',$project->get('reference'))}</p>
                      <a id="Tasks"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('Tasks')}</p></a>                       
                        <p class="text-muted mb-0">&nbsp;/&nbsp;{__('Multiple tasks')}</p>
                </div>
            </div>      
        </div>
        {component name="/site_help/help" help="employee-list-project-tasks"}
    </div>
</div>
{alerts}
{if $project->isLoaded()}    
    {if $form}
    <div>    
        {format_number_choice('[0] no selected element|[1]one selected element|(1,Inf]%s selected elements',$form->getSelection()->count(),$form->getSelection()->count())} 
    </div>
    <fieldset>    
    <table>
        <tr>
            <td>{__('Actions')}</td>
            <td>{__('Parameters')}</td>
        </tr>  

         {if $form->actions->getChoices()->in('state')} 
          <tr>
               <td>
                <input type="checkbox" class="MultipleActions" name="state" value="" {if $form->getActions()->in('state')}checked=""{/if}/>
            </td>
            <td>{__('State')}</td>
            <td>
                  {html_options class="Multiple Select" name="state_id" options=$form->state_id->getOption('choices') selected=(string)$form.state_id} 
            </td>       
        </tr>
        {/if}               
         {if $form->actions->getChoices()->in('requested_by')} 
          <tr>
               <td>
                <input type="checkbox" class="MultipleActions" name="requested_by" value="" {if $form->getActions()->in('requested_by')}checked=""{/if}/>
            </td>
            <td>{__('Requested by')}</td>
            <td>
                  <input type="text" class="Multiple Input" name="requested_by" value="{$form.requested_by}"/>
            </td>       
        </tr>
        {/if}                
         {if $form->actions->getChoices()->in('requested_at')} 
          <tr>
               <td>
                <input type="checkbox" class="MultipleActions" name="requested_at" value="" {if $form->getActions()->in('requested_at')}checked=""{/if}/>
            </td>
            <td>{__('Requested at')}</td>
            <td>
                  <input type="text" class="Multiple Date Input" name="requested_at" value="{$form.requested_at}"/>
            </td>       
        </tr>
        {/if}
         {if $form->actions->getChoices()->in('before_at')} 
          <tr>
               <td>
                <input type="checkbox" class="MultipleActions" name="before_at" value="" {if $form->getActions()->in('before_at')}checked=""{/if}/>
            </td>
            <td>{__('Before at')}</td>
            <td>
                  <input type="text" class="Multiple Date Input" name="before_at" value="{$form.before_at}"/>
            </td>       
        </tr>
        {/if} 
        {if $form->actions->getChoices()->in('start_at')} 
          <tr>
               <td>
                <input type="checkbox" class="MultipleActions" name="start_at" value="" {if $form->getActions()->in('start_at')}checked=""{/if}/>
            </td>
            <td>{__('Start at')}</td>
            <td>
                  <input type="text" class="Multiple Date Input" name="start_at" value="{$form.start_at}"/>
            </td>       
        </tr>
        {/if}
         {if $form->actions->getChoices()->in('end_at')} 
          <tr>
               <td>
                <input type="checkbox" class="MultipleActions" name="end_at" value="" {if $form->getActions()->in('end_at')}checked=""{/if}/>
            </td>
            <td>{__('End at')}</td>
            <td>
                  <input type="text" class="Multiple Date Input" name="end_at" value="{$form.end_at}"/>
            </td>       
        </tr>
        {/if}
        {if $form->actions->getChoices()->in('reference')} 
          <tr>
               <td>
                <input type="checkbox" class="MultipleActions" name="reference" value="" {if $form->getActions()->in('reference')}checked=""{/if}/>
            </td>
            <td>{__('Reference process')}</td>
            <td>
             
            </td>       
        </tr>
        {/if}
         {if $form->actions->getChoices()->in('priority_delete')} 
          <tr>
               <td>
                <input type="checkbox" class="MultipleActions" name="priority_delete" value="" {if $form->getActions()->in('priority_delete')}checked=""{/if}/>
            </td>
            <td>{__('Priority delete')}</td>
            <td>
             
            </td>       
        </tr>
        {/if}
    </table>
    <a href="#" id="MutipleProcess" class="btn btn-default">{__('Process')}</a>  
    </fieldset>

    <script type="text/javascript">
    $('#Dashboard').click(function(){                                       
          return $.ajax2({ url: "{url_to('employees_ajax',['action'=>'Dashboard'])}",                           
                           target: "#actions"}); 
        }); 
    
     $('#Projects').click(function(){                                       
          return $.ajax2({  url: "{url_to('projects_ajax',['action'=>'ListPartialProjectForEmployee'])}",                           
                           target: "#actions"});
        }); 
    
     $('#Tasks').click(function(){                                       
          return $.ajax2({  data : { Project : '{$project->get('id')}'},
                            url: "{url_to('projects_ajax',['action'=>'ListPartialTaskForProjectForEmployee'])}",                           
                           target: "#actions"});
        }); 
        
        
        $(".Date").datepicker();
        
        $('#Cancel').click(function(){              
                 return $.ajax2({ data : { Project :'{$project->get('id')}' },
                                  url : "{url_to('projects_ajax',['action'=>'ListPartialTaskForProjectForEmployee'])}",                                                    
                                  target: "#actions"}); 
          });


          $("#MutipleProcess").click(function() { 
               var params={ 
                       Project :'{$project->get('id')}',
                       MultipleSelection : {
                        actions: [],                               
                        selection : {$form->getSelection()->getKeys()->toJson()},
                        count : '{$form->getSelection()->count()}',
                        token :'{$form->getCSRFToken()}'
                            }
               };                              
               $(".MultipleActions:checked").each(function() { params.MultipleSelection.actions.push($(this).attr('name')); }); 
               $(".Multiple.Select option:selected").each(function() { params.MultipleSelection[$(this).parent().attr('name')]=$(this).val(); });                 
               $(".Multiple.Input").each(function() { params.MultipleSelection[$(this).attr('name')]=$(this).val(); });                 
               return $.ajax2({                   
                        data : params,
                        url: "{url_to('projects_ajax',['action'=>'MultipleSelectionTaskProcessForProjectForEmployee'])}",                   
                        target: "#actions"
                   });
            });
    </script>   

    {/if}
{else}
    {__('Project is invalid.')}
{/if}    
