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
                         <p class="text-muted mb-0">&nbsp;/&nbsp;{__('Tasks')}</p>
                </div>
            </div>      
        </div>
        {component name="/site_help/help" help="employer-list-project-tasks"}
    </div>
</div>
{alerts}
<div style="float:right;padding-bottom: 20px;">  
    <a href="#" class="btn btn-primary" id="New" title="{__('New task')}" ><i class="fa fa-plus" style="margin-right:10px;font-size: 15px;"></i>{__('New task')}</a>         
</div>
<div style="float:right">  
    {* <a href="{url_to('projects',['action'=>'ExportCsvTasksForProject'])}?Project={$project->get('id')}&{$formFilter->getParametersForUrl(['equal','in','begin','search','range','date_rdv','date_treated','date_creation','date_confirmed'])}" target="_blank"  class="btn btn-primary" title="{__('Export')}" ><i class="fa fa-upload" style="margin-right:10px;"></i>{__('Export')}</a>   
    <a href="#" id="ImportTaskForProject" class="btn btn-primary" title="{__('Import')}" ><i class="fa fa-download" style="margin-right:10px;"></i>{__('Import')}</a>   *}
</div>
<div style="clear:both"></div>   
{if $project->isLoaded()}
    <div id="Dialog" style="display:none"></div>
    {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter}
    <div style="float:right">
        <button id="filter" class="btn btn-secondary" >{__("Filter")}</button>   
        <button id="init" class="btn btn-secondary">{__("Init")}</button>  
    </div>
    <div style="float:right">              
        {*component name="/projects_managers/LinkForManagersForProject" project=$project}
        {component name="/projects_documents/LinkForProjectDocumentsForProject" project=$project}                
        {component name="/projects_documents/LinkForTaskDocumentsForProject" project=$project*}          
    </div>
    <div style="clear:both"></div>
    <div class="col-lg-12 pt-2 stretch-card">
        <div class="card classMargin">
            <div class="card-body">               
                <div class="table-responsive pt-3">
                    <table id="ProjetTaskForProjectList" class="table table-bordered table-striped">
                        <thead class="">
                            <tr role="row">    
                                <th>#</th>                   
                                <th></th>    
                                <th  class="footable-first-column" data-toggle="true">
                                    {*<div style="float:left">
                                        <a href="#" class="order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><img  src='{url("/icons/sort_asc`$formFilter.order.id->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                                        <a href="#" class="order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><img  src='{url("/icons/sort_desc`$formFilter.order.id->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
                                    </div>*}
                                    <div {*style="float:left"*}>
                                        {__('Task')}
                                    {*</div>*}
                                    {*<div style="float:right">*}
                                        <a href="#" class="order{$formFilter.order.name->getValueExist('asc','_active')}" id="asc" name="name"><img  src='{url("/icons/sort_asc`$formFilter.order.name->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                                        <a href="#" class="order{$formFilter.order.name->getValueExist('desc','_active')}" id="desc" name="name"><img  src='{url("/icons/sort_desc`$formFilter.order.name->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
                                    </div>
                                </th>       
                                <th>
                                  {*  <div>{__('Requested by')}
                                        <a href="#" class="order{$formFilter.order.requested_by->getValueExist('asc','_active')}" id="asc" name="requested_by"><img  src='{url("/icons/sort_asc`$formFilter.order.requested_by->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                                        <a href="#" class="order{$formFilter.order.requested_by->getValueExist('desc','_active')}" id="desc" name="requested_by"><img  src='{url("/icons/sort_desc`$formFilter.order.requested_by->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
                                    </div>    *}                   
                                    <div>{__('Requested at')}
                                        <a href="#" class="order{$formFilter.order.requested_at->getValueExist('asc','_active')}" id="asc" name="requested_at"><img  src='{url("/icons/sort_asc`$formFilter.order.requested_at->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                                        <a href="#" class="order{$formFilter.order.requested_at->getValueExist('desc','_active')}" id="desc" name="requested_at"><img  src='{url("/icons/sort_desc`$formFilter.order.requested_at->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
                                    </div>               
                                </th>               
                                <th>
                                    <div>{__('Before')}
                                        <a href="#" class="order{$formFilter.order.before_at->getValueExist('asc','_active')}" id="asc" name="before_at"><img  src='{url("/icons/sort_asc`$formFilter.order.before_at->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                                        <a href="#" class="order{$formFilter.order.before_at->getValueExist('desc','_active')}" id="desc" name="before_at"><img  src='{url("/icons/sort_desc`$formFilter.order.before_at->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
                                    </div>
                                    <div>{__('Start')}
                                        <a href="#" class="order{$formFilter.order.start_at->getValueExist('asc','_active')}" id="asc" name="start_at"><img  src='{url("/icons/sort_asc`$formFilter.order.start_at->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                                        <a href="#" class="order{$formFilter.order.start_at->getValueExist('desc','_active')}" id="desc" name="start_at"><img  src='{url("/icons/sort_desc`$formFilter.order.start_at->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
                                    </div>
                                    <div>{__('End')}
                                        <a href="#" class="order{$formFilter.order.end_at->getValueExist('asc','_active')}" id="asc" name="end_at"><img  src='{url("/icons/sort_asc`$formFilter.order.end_at->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                                        <a href="#" class="order{$formFilter.order.end_at->getValueExist('desc','_active')}" id="desc" name="end_at"><img  src='{url("/icons/sort_desc`$formFilter.order.end_at->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
                                    </div>
                                </th> 
                                <th>
                                    <div>{__('Duration')}

                                        <a href="#" class="order{$formFilter.order.total_duration->getValueExist('asc','_active')}" id="asc" name="total_duration"><img  src='{url("/icons/sort_asc`$formFilter.order.total_duration->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                                        <a href="#" class="order{$formFilter.order.total_duration->getValueExist('desc','_active')}" id="desc" name="total_duration"><img  src='{url("/icons/sort_desc`$formFilter.order.total_duration->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
                                    </div>        
                                    <div>{__('Estimated')}            
                                        <a href="#" class="order{$formFilter.order.estimated_duration->getValueExist('asc','_active')}" id="asc" name="estimated_duration"><img  src='{url("/icons/sort_asc`$formFilter.order.estimated_duration->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                                        <a href="#" class="order{$formFilter.order.estimated_duration->getValueExist('desc','_active')}" id="desc" name="estimated_duration"><img  src='{url("/icons/sort_desc`$formFilter.order.estimated_duration->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
                                    </div>
                                </th>
                                <th>
                                    <span>{__('Priority')}</span>
                                    <div>
                                        <a href="#" class="order{$formFilter.order.priority->getValueExist('asc','_active')}" id="asc" name="priority"><img  src='{url("/icons/sort_asc`$formFilter.order.priority->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                                        <a href="#" class="order{$formFilter.order.priority->getValueExist('desc','_active')}" id="desc" name="priority"><img  src='{url("/icons/sort_desc`$formFilter.order.priority->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
                                    </div>
                                </th>
                                <th>
                                    <span>{__('State')}</span>    

                                </th>
                                <th data-hide="phone" style="display: table-cell;">{__('Actions')}</th>
                            </tr>
                        </thead> 
                        {* search/equal/range *}
                        <tr class="input-list">
                            <td>{* # *}</td>                 
                            <td>                        
                                {if $pager->getNbItems()}     
                                    <a style="{if $formFilter->getSelection()->isEmpty()}opacity:0.5{/if}" class="actions_items Multiple" href="#" title="{__('Multiple update process')}">
                                        <i class="fa fa-refresh fa-1x"></i>
                                    </a>         
                                {/if} 
                                <input type="checkbox" id="all" />
                            </td>  
                            <td>
                                <input type="text" class="search form-control" name="name" value="{$formFilter.search.name}"/>
                            </td>              
                            <td>{* actions *}</td>            
                            <td>{* actions *}</td>
                            <td>{* actions *}</td>  
                             <td>{* actions *}</td>
                            <td>
                                <select class="selectColors equal Select form-control" name="state_id">                                         
                                    {foreach $formFilter->equal.state_id->getOption('choices') as $status}
                                        {if $status==null}
                                            <option {if $status==(string)$formFilter.equal.state_id}selected=""{/if} data-content="<span class='btn selectColors-btn'></span>---" value="">---</option>      
                                        {elseif $status=='IS_NULL'}
                                            <option {if $status==(string)$formFilter.equal.state_id}selected=""{/if} data-content="<span class='btn selectColors-btn'></span>{__('-- Empty --')}" value="IS_NULL">{__('-- Empty --')}</option>      
                                        {else} 
                                            <option value="{$status->get('id')}" {if $status->get('id')==(string)$formFilter.equal.state_id}selected=""{/if} data-content="<span {if $status->hasColor()}style='background:{$status->get('color')}'{/if} class='btn selectColors-btn'></span>{$status->getI18n()->get('value')}">{$status->getI18n()->get('value')}</option> 
                                        {/if} 
                                    {/foreach}    
                                </select> 
                            </td>                          
                            <td>{* actions *}</td>
                        </tr>   
                        {foreach $pager as $item}
                            <tr class="Task list DblClick" id="{$item->get('id')}"> 
                                <td class="count" id="{$item->get('id')}">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>  
                                <td>                            
                                    <input class="Selection" type="checkbox" id="{$item->get('id')}" name="{$item->get('name')}" {if $formFilter->getSelection()->in($item->get('id'))}checked=""}{/if}/>                       
                                </td> 
                                <td>                  
                                    <div title="{$item->get('description')}">
                                        <a href="#" class="ChangeIsActive" id="{$item->get('id')}" name="{$item->get('is_active')}"><i class="fa fa-check Color{if $item->isActive()}Green{else}Red{/if}"/></a>  
                                        <a href="#" class="EditInLine" id="{$item->get('id')}"><i class="fa fa-edit"/></a>[{$item->get('reference')}] {$item->get('name')}
                                    </div>
                                    <div><i style="font-size:11px">{$item->getFormatter()->getCreatedAt()->getText()} -  
                                            {__('created by [%s]',$item->getCreator()->get('username'))}                                     
                                        </i></div>
                                    {if $item->hasCount()}<strong>{$item->getCount()}</strong> <i class="fa fa-file-text-o"/>{/if}
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
                            <a href="#" title="{__('Edit')}" class="PriorityEdit" id="{$item->get('id')}">
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
                            <a href="#" title="{__('Edit')}" class="View" id="{$item->get('id')}">
                                <i class="fa fa-edit"></i></a>              
                              <a href="#" title="{__('Documents')}" class="Documents" id="{$item->get('id')}">
                                <i class="fa fa-file-o"></i></a>  
                            <a {if $item->isDisable()}style="display:none"{/if} href="#" title="{__('Enable')}" class="Enable" id="{$item->get('id')}"  name="{$item->get('name')}">
                                <i class="fa fa-recycle"></i>
                            </a> 
                            <a {if $item->isEnable()}style="display:none"{/if} href="#" title="{__('Disable')}" class="Disable" id="{$item->get('id')}"  name="{$item->get('name')}">
                                <i class="fa fa-remove"></i>
                            </a> 
                            <a href="#" title="{__('Delete')}" class="Delete" id="{$item->get('id')}"  name="{$item->get('name')}">
                                <i class="fa fa-trash"></i>
                            </a>               
                        </td>
                    </tr>    
                {/foreach}    
            </table>
            {if !$pager->getNbItems()}
                <span>{__('No task')}</span>
            {else}
                    
            {/if} 
        </div>
    </div>
</div>
</div>     
{include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager}    
<script type="text/javascript">
    function changeIsActiveState(resp) 
        {
            $.each(resp.selection?resp.selection:[resp.id], function (id) { 
                sel="a.ChangeIsActive[id="+this+"]";
                if (resp.state=='YES') 
                    $(sel+" i").addClass("ColorGreen").removeClass("ColorRed");
                if (resp.state=='NO') 
                    $(sel+" i").addClass("ColorRed").removeClass("ColorGreen");
                $(sel).attr("name",resp.state);
            });  
        }
        
    $("#ProjetTaskForProjectList").data('selection',{$formFilter->getSelection()->toJson()});       
        
    $(".Selection").click(function () {             
              $(".actions_items").css('opacity',($(".Selection:checked").length?'1':'0.5'));
          {* if ($("#ProjetTaskForProjectList").data("selection").length >= 10)
              {
                alert("{__('Maximum by archive is %s files',10)}");
                return false;
              }  *}         
              if ($(this).prop('checked'))                                                  
                  $("#ProjetTaskForProjectList").data("selection").push($(this).attr("id"));                                 
              else              
                  $("#ProjetTaskForProjectList").data("selection").splice($.inArray($(this).attr("id"),$("#ProjetTaskForProjectList").data("selection")),1);                                                                         
    });
    
   // $('.selectColors').selectpicker();                

    $("#all").click(function () {
        $(".Selection").prop("checked",$(this).prop("checked"));
        $(".actions_items").css('opacity',($(this).prop("checked")?'1':'0.5'));
        if ($(this).prop("checked"))
           $(".Selection").each(function () { $("#ProjetTaskForProjectList").data("selection").push($(this).attr("id"));  });
        else
          $("#ProjetTaskForProjectList").data("selection",[]); 
    });
    
      function getFilterParameters()
        {
            var params={  Project: '{$project->get('id')}' ,
                          filter: {  order : { }, 
                                    search : { },
                                    equal: { },   
                                    selection : $("#ProjetTaskForProjectList").data('selection'),
                                nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                token:'{$formFilter->getCSRFToken()}'
                         } };
            if ($(".order_active").attr("name"))
                 params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");   
            $(".search").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); });            
            $(".equal.Select option:selected").each(function() { params.filter.equal[$(this).parent().attr('name')] =$(this).val(); });    
            return params;                  
        }
        
        function updateFilter()
        {           
           return $.ajax2({ data: getFilterParameters(), 
                            url:"{url_to('projects_ajax',['action'=>'ListPartialTaskForProjectForEmployer'])}" ,                                                      
                            target: "#actions"
                             });
        }
    
        function updatePager(n)
        {
           page_active=$(".pager .active").html()?parseInt($(".pager .active").html()):1;
           records_by_page=$("[name=nbitemsbypage]").val();
           start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
           $(".count").each(function(id) { $(this).html(start+id) }); // Update index column           
           nb_results=parseInt($("#nb_results").html())-n;
           $("#nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
           $("#end_result").html($(".count:last").html());
        }
                   
          {* =====================  P A G E R  A C T I O N S =============================== *}  
      
           $("#init").click(function() {                   
               $.ajax2({ data : { Project: '{$project->get('id')}' },
                         url:"{url_to('projects_ajax',['action'=>'ListPartialTaskForProjectForEmployer'])}",                                    
                         target: "#actions"}); 
           }); 
    
          $('.order').click(function() {
                $(".order_active").attr('class','order');
                $(this).attr('class','order_active');
                return updateFilter();
           });
           
            $(".search").keypress(function(event) {
                if (event.keyCode==13)
                    return updateFilter();
            });
            
          $("#filter").click(function() { return updateFilter(); }); 
          
          $("[name=nbitemsbypage],.equal.Select").change(function() { return updateFilter(); });                     
           
           $(".pager").click(function () {                      
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('projects_ajax',['action'=>'ListPartialTaskForProjectForEmployer'])}?page="+$(this).attr('data-page'),
                                target: "#actions"
                });
        });
          {* =====================  A C T I O N S =============================== *}  
      
     
          $("#New").click( function () {             
            return $.ajax2({
                data : { Project: '{$project->get('id')}' },                
                url: "{url_to('projects_ajax',['action'=>'NewTaskForEmployer'])}",              
                target: "#actions"
           });
         });
                 
         
         $(".View").click( function () {                
                return $.ajax2({ data : { ProjectTask :  $(this).attr('id') },                                
                                url:"{url_to('projects_ajax',['action'=>'ViewTaskForEmployer'])}",                              
                                target: "#actions"
                            });
         });
         
         
          $(".Documents").click( function () {                
                return $.ajax2({ data : { ProjectTask :  $(this).attr('id') },                                
                                url:"{url_to('projects_documents_ajax',['action'=>'ListPartialDocumentForTaskForEmployer'])}",                              
                                target: "#actions"
                            });
         });
                    
         $(".EditInLine").click( function () {            
                var id=$(this).attr('id');
                var count=$(".count[id="+id+"]").html();
                return $.ajax2({ data : { ProjectTask : id },                                
                                url:"{url_to('projects_ajax',['action'=>'EditTaskForEmployer'])}",                              
                                target: ".Task[id="+id+"]",
                                success: function ()
                                        {
                                            $(".count[id="+id+"]").html(count);
                                        }
                    });
         });
         
          $(".Delete").click( function () { 
                if (!confirm('{__("Task \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ ProjectTask: $(this).attr('id') },
                                 url :"{url_to('projects_ajax',['action'=>'DeleteTask'])}",                                
                                 success : function(resp) {
                                       if (resp.action=='DeleteTask')
                                       {    
                                          $("tr#"+resp.id).remove();  
                                          if ($('.Task').length==0)
                                              return $.ajax2({ data : { Project: '{$project->get('id')}' },
                                                               url:"{url_to('projects_ajax',['action'=>'ListPartialTaskForProjectForEmployer'])}",                                                             
                                                               target: "#actions"});
                                          updatePager(1);
                                        }       
                                 }
                     });                                        
            });
            
 
    
     {* =================== A C T I O N S ================================ *}
     $('#Cancel').click(function(){              
             return $.ajax2({ url : "{url_to('projects_ajax',['action'=>'ListPartialProjectForEmployer'])}",                                              
                              target: "#actions"}); 
      });
      
       $(".PriorityEdit").click( function () {                
                return $.ajax2({ data : { ProjectTask :  $(this).attr('id') },                                
                                url:"{url_to('projects_ajax',['action'=>'EditTaskPriority'])}",                              
                                target: $(".Priority-ctn[id="+$(this).attr('id')+"]") });
         }); 
         
         $(".State").change(function() { 
             var params = { ProjectTask : {  id: $(this).attr('id'),
                                            state_id: $(this).val(),
                                            token : '{mfForm::getToken('ProjectTaskChangeStateForm')}'
                                          } };
            return $.ajax2({  data : params,
                              url : "{url_to('projects_ajax',['action'=>'ChangeTaskState'])}",                                                    
                              success : function (resp)
                                        { 
                                            
                                        }
                   }); 
    });
    
     $(".Multiple").click(function(){ 
         var params={ Project: '{$project->get('id')}',                    
                      MultipleSelection : {                         
                        selection : $("#ProjetTaskForProjectList").data("selection"), 
                        token: '{mfForm::getToken('MultipleSelectionTaskForProjectForm')}' }
                    };                 
         if ($.isEmptyObject(params.MultipleSelection.selection))
           return ;           
         params.MultipleSelection.count=params.MultipleSelection.selection.length;
         return $.ajax2({   data: params,
                            url:"{url_to('projects_ajax',['action'=>'MultipleSelectionTaskForProjectForEmployer'])}" ,                      
                            target: "#actions" });
    });
    
     

 $(".Enable").click( function () {               
                return $.ajax2({ data :{ ProjectTask: $(this).attr('id') },
                                 url :"{url_to('projects_ajax',['action'=>'EnableTask'])}",                                
                                 success : function(resp) {
                                       if (resp.action!='EnableTask') return ;
                                        $(".Disable[id="+resp.id+"]").show();     
                                        $(".Enable[id="+resp.id+"]").hide();
                                 }
                     });                                        
            });     
            
        $(".Disable").click( function () {            
                return $.ajax2({ data :{ ProjectTask: $(this).attr('id') },
                                 url :"{url_to('projects_ajax',['action'=>'DisableTask'])}",                                
                                 success : function(resp) {
                                       if (resp.action!='DisableTask') return ;
                                         $(".Enable[id="+resp.id+"]").show();     
                                        $(".Disable[id="+resp.id+"]").hide();       
                                 }
                     });                                        
            });  
            
               $(".ChangeIsActive").click(function() { 
                        return $.ajax2({ 
                            data : { 
                                        ProjectTask : { 
                                                id: $(this).attr('id') , 
                                                value:$(this).attr('name'), 
                                                token: '{mfForm::getToken('ChangeForm')}' } },                            
                            url: "{url_to('projects_ajax',['action'=>'ChangeIsActiveTask'])}",                          
                            success: function(resp) { 
                                        if (resp.action=='ChangeIsActiveTask')
                                            changeIsActiveState(resp);
                                     }
                    });
         });
    {*component name="/projects_documents/javascriptForProjectTaskListForTask" JS=true*}

     $('#Projects').click(function(){              
             return $.ajax2({ url : "{url_to('projects_ajax',['action'=>'ListPartialProjectForEmployer'])}",                                              
                              target: "#actions"}); 
      });
      
</script>
{else}
    {__('Project is invalid.')}
{/if}    


