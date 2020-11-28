{if $project->isLoaded()}
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
                        <p class="text-muted mb-0">&nbsp;/&nbsp;{__('Project [%s]' ,$project->getReference())}</p>
                        <a id="Tasks"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('Tasks')}</p></a>                       
                        <p class="text-muted mb-0">&nbsp;/&nbsp;{__('New task')}</p>
                    </div>
                </div> 
                {component name="/site_help/help" help="project-task-new-display"}
            </div>
        </div>
    </div>

    {alerts}
  <div class="row admin-header-container btn-r">    
        <div class="col-sm" style="padding: 0;">
            <div class="buttonSave">
                <a href="#" id="Save" class="btn btn-primary admin-header-button"><i class="fa fa-save mr-2"></i>{__('Save')}</a>                
            </div>
        </div>
    </div> 
            
 <div class="col-12 grid-margin" style="padding: 20px;">
        <div class="card classMargin">
            <div class="card-body">             
             <div class="row">
                <div class="col-md-3">
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">{__('Name')}{if $form->name->getOption('required')}*{/if}</label>                       
                        <div class="col-sm-8">
                            {if $form.name->hasError()}<div class="w-auto alert {if $form.name->hasError()}alert-danger{/if}">{$form.name->getError()}</div>{/if}
                            <input type="text" class="form-control ProjectTask Fields Input" name="name" value="{$item->get('name')}">
                        </div>
                    </div>
                </div>
                 <div class="col-md-3">
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">{__('Priority')}{if $form->priority->getOption('required')}*{/if}</label>                       
                        <div class="col-sm-8">
                            {if $form.priority->hasError()}<div class="w-auto alert {if $form.priority->hasError()}alert-danger{/if}">{$form.priority->getError()}</div>{/if}
                            <input type="text" class="form-control ProjectTask Fields Input" name="priority" value="{$item->get('priority')}">
                        </div>
                    </div>
                </div>
                 <div class="col-md-3">
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">{__('Color')}{if $form->color->getOption('required')}*{/if}</label>                       
                        <div class="col-sm-8">
                            {if $form.color->hasError()}<div class="w-auto alert {if $form.color->hasError()}alert-danger{/if}">{$form.color->getError()}</div>{/if}
                      
                        </div>
                    </div>
                </div>
                 <div class="col-md-3">
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">{__('State')}{if $form->state_id->getOption('required')}*{/if}</label>                       
                        <div class="col-sm-8">                            
                            {if $form.state_id->hasError()}<div class="w-auto alert {if $form.state_id->hasError()}alert-danger{/if}">{$form.state_id->getError()}</div>{/if}
                            {html_options class="form-control ProjectTask Fields Select" name="state_id" options=$form->state_id->getChoices()->toArray() selected=$form.state_id->getValue()}  
                        </div>
                    </div>
                </div>
            </div>    
                        
           <div class="row">
                <div class="col-md-3">
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">{__('Start at')}{if $form->start_at->getOption('required')}*{/if}</label>                       
                        <div class="col-sm-7">
                            {if $form.start_at->hasError()}<div class="w-auto alert {if $form.start_at->hasError()}alert-danger{/if}">{$form.start_at->getError()}</div>{/if}
                            <input type="text" id="start_at" class="form-control ProjectTask Date Fields Input" name="start_at" value="{if $form.start_at->hasError()}{$form.start_at}{else}{if $item->hasStartAt()}{$item->getFormatter()->getStartAt()->getText()}{/if}{/if}">
                        </div>
                    </div>
                </div>
                 <div class="col-md-3">
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">{__('End at')}{if $form->end_at->getOption('required')}*{/if}</label>                       
                        <div class="col-sm-7">
                            {if $form.end_at->hasError()}<div class="w-auto alert {if $form.end_at->hasError()}alert-danger{/if}">{$form.end_at->getError()}</div>{/if}
                            <input type="text"  id="end_at"  class="form-control ProjectTask Fields Input" name="end_at" value="{if $form.end_at->hasError()}{$form.end_at}{else}{if $item->hasEndAt()}{$item->getFormatter()->getEndAt()->getText()}{/if}{/if}">
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">{__('Before at')}{if $form->before_at->getOption('required')}*{/if}</label>                       
                        <div class="col-sm-7">
                            {if $form.before_at->hasError()}<div class="w-auto alert {if $form.before_at->hasError()}alert-danger{/if}">{$form.before_at->getError()}</div>{/if}
                            <input type="text" id="before_at" class="form-control ProjectTask Date Fields Date Input" name="before_at" value="{if $form.before_at->hasError()}{$form.before_at}{else}{if $item->hasBeforeAt()}{$item->getFormatter()->getBeforeAt()->getText()}{/if}{/if}">
                        </div>
                    </div>
                </div>
                 <div class="col-md-3">
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">{__('Requested at')}{if $form->requested_at->getOption('required')}*{/if}</label>                       
                        <div class="col-sm-7">
                            {if $form.requested_at->hasError()}<div class="w-auto alert {if $form.requested_at->hasError()}alert-danger{/if}">{$form.requested_at->getError()}</div>{/if}
                            <input type="text" id="requested_at" class="form-control ProjectTask Fields Date Input" name="requested_at" value="{if $form.requested_at->hasError()}{$form.requested_at}{else}{if $item->hasRequestedAt()}{$item->getFormatter()->getRequestedAt()->getText()}{/if}{/if}">
                        </div>
                    </div>
                </div>
            </div> 
                        
                        
                <div class="row">
                    <div class="col-md-12">

                                {if $form.description->hasError()}<div class="w-auto alert {if $form.description->hasError()}alert-danger{/if}">{$form.description->getError()}</div>{/if}
                                <textarea cols="80" rows="20" class="form-control ProjectTask Fields Input" name="description" >{$item->get('description')|escape}</textarea>

                    </div>
                  
                
            </div>             
            </div>         
        </div>
    </div>
                                    
<script type="text/javascript">      
       var start_at = $("#start_at,#end_at").datepicker({
                            onSelect: function( selectedDate ) {
                                    var option = this.id == "start_at" ? "minDate" : "maxDate",
                                            instance = $( this ).data( "datepicker" ),
                                            date = $.datepicker.parseDate(
                                                    instance.settings.dateFormat ||
                                                    $.datepicker._defaults.dateFormat,
                                                    selectedDate, instance.settings );
                                    start_at.not( this ).datepicker( "option", option, date );
        } } ); 
    
      $(".Date").datepicker();
    
     
      
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
        
      $("#Save").click(function () { 
        var params = {  Project: '{$project->get('id')}', ProjectTask :  {  token : '{$form->getCSRFToken()}' } };             
       
        $(".ProjectTask.Input").each(function () { params.ProjectTask[$(this).attr('name')]=$(this).val(); });
        $(".ProjectTask.Select option:selected").each(function () { params.ProjectTask[$(this).parent().attr('name')]=$(this).val(); });
       // console.log(params); return ;
        return $.ajax2({
            data : params,
            url: "{url_to('projects_ajax',['action'=>'NewTaskForEmployee'])}",           
            target: "#actions"
        });
    
      });
</script>

{else}
   {__('Project is invalid.') } 
{/if}

