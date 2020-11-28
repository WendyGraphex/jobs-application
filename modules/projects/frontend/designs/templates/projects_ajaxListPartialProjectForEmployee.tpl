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
                    <p class="text-muted mb-0">&nbsp;/&nbsp;{__('Project Manager')}</p>
                </div>
            </div>      
        </div>
        {component name="/site_help/help" help="employee-list-project"}
    </div>
</div>
{alerts}
{include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter}
<div class="col-lg-12 pt-2 stretch-card">
    <div class="card classMargin">
        <div class="card-body">               
            <div class="table-responsive pt-3">
                <table class="table table-bordered table-striped">
                    <thead class="">
                        <tr role="row">
                            <th> #</th>                                                 
                            <th>{__('Ref.')}</th>                             
                            <th>{__('Project')}</th> 
                            <th>{__('Employer')}</th> 
                            <th>{__('Start at')}</th>       
                            <th>{__('End at')}</th> 
                            <th>{__('Number of tasks')}</th> 
                            <th>{__('State')}</th> 
                            <th>{__('Created At')}</th>                                                                                                                                      
                            <th>{__('Actions')}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $pager as $item} 
                            <tr class="list" id="{$item->get('id')}" role="row">
                                <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>                                                            
                                <td>{$item->get('reference')}
                                     {if $item->getStatus()->isActive()}
                                    <div>
                                        <button id="{$item->get('id')}" name="{$item->get('reference')}" class="btn btn-outline-primary btn-sm Finish">{__('Close project')}</button>
                                    </div>
                                    {/if}
                                </td> 
                                <td>                                       
                                    <div>{__('Project')}:{$item->get('name')}</div>
                                    <div>{__('Work')}:{$item->getWork()->get('reference')}</div>
                                    <div>{__('Quotation')}:{$item->getQuotation()->get('reference')}</div>
                                    <div>
                                        {__('Job')}:
                                        {if $item->getStatus()->isClose()}  
                                            {if $item->getQuotation()->hasEmployeeAdvert()}
                                                <a href="{$item->getQuotation()->getEmployeeAdvertI18n()->getUrl()}" target="_blank">{$item->getQuotation()->getEmployeeAdvertI18n()->get('reference')}</a>
                                            {else}
                                                <a href="{$item->getQuotation()->getEmployerAdvertI18n()->getUrl()}" target="_blank">{$item->getQuotation()->getEmployerAdvertI18n()->get('reference')}</a>
                                            {/if}
                                        {else}                                          
                                            {if $item->getQuotation()->hasEmployeeAdvert()}
                                                {$item->getQuotation()->getEmployeeAdvertI18n()->get('reference')}
                                            {else}
                                                {$item->getQuotation()->getEmployerAdvertI18n()->get('reference')}
                                            {/if}
                                        {/if}       
                                    </div>                                    
                                </td>                               
                                <td>
                                    {$item->getEmployerUser()}   
                                    {if $item->getStatus()->isClose()}    
                                        <a href="#" id="{$item->get('id')}" class="Comments" title="{__('My comments')}" style="position: relative;">
                                            <i class="fa fa-comment"></i>
                                            <i class="fa fa-plus classPlusIcon"></i>
                                        </a>                                          
                                        {if !$item->hasEmployeeNotation()}
                                            <a href="#" id="{$item->get('id')}" class="Reviews" title="{__('My Reviews')}" style="position: relative;">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-plus classPlusIcon"></i>
                                            </a>                                 
                                        {/if}
                                    {/if}
                                </td>                                                           
                                <td>
                                    <span id="{$item->get('id')}" class="ColumnStartAt">
                                        {if $item->hasStartAt()}
                                            {$item->getFormatter()->getStartAt()->getText()}
                                        {else}                                                                              
                                        {/if}  
                                    </span>
                                    {if (!$item->hasPayments() || !$item->hasStartAt()) && $item->getStatus()->isActive()}
                                        <a href="#" id="{$item->get('id')}" class="OpenDateDialog-startat"><i class="fa fa-calendar"></i></a>
                                        {/if}
                                </td>  
                                <td>
                                    <span id="{$item->get('id')}" class="ColumnEndAt">
                                        {if $item->hasEndAt()}
                                            {$item->getFormatter()->getEndAt()->getText()}   
                                        {else}                                       
                                        {/if}
                                    </span>
                                    {if $item->getStatus()->isActive()}
                                    <a href="#" id="{$item->get('id')}" class="OpenDateDialog-endat"><i class="fa fa-calendar"></i></a>
                                    {/if}                                   
                                </td>
                                <td>{$item->get('number_of_tasks')}</td>
                                 <td>
                                    {$item->getStatus()->getI18n()}
                                </td>
                                <td>
                                    {$item->getFormatter()->getCreatedAt()->getText()}
                                </td>
                                <td>   
                                    <div>
                                    <a href="#" id="{$item->get('id')}" class="Display" title="{__('Details')}"><i class="fa fa-search"></i></a>
                                    <a href="#" id="{$item->get('id')}" class="Requests" title="{__('Payment requests')}"><i class="fa fa-dollar"></i></a>
                                    <a href="#" id="{$item->get('id')}" class="Tasks" title="{__('Tasks')}"><i class="fa fa-list"></i></a>                                   
                                    <a href="#" id="{$item->get('id')}" class="Documents" title="{__('Documents')}"><i class="fa fa-file-o"></i></a>      
                                        {if $item->getStatus()->isClose()}    
                                        <a href="#" id="{$item->get('id')}" class="EmployerComments" title="{__('Employer Comments')}"><i class="fa fa-comment"></i></a>       
                                        <a href="#" id="{$item->get('id')}" class="EmployerReviews" title="{__('Employer Reviews')}"><i class="fa fa-star"></i></a>                                 
                                        {/if}
                                    </div>
                                   
                                </td>                                   
                            </tr>  

                        {/foreach}
                        {if !$pager->hasItems()}
                            <tr role="row" >
                                <td  colspan="13">{__('No result')}</td>
                            </tr>
                        {/if}  
                    </tbody>         
                </table>
            </div>
        </div>
    </div>
</div>
{include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager}           

<div class="modal fade" id="ModalDateDialog" role="dialog" style="top: 30%;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div id="ModalDateDialog-ctn" class="modal-body">
                {* <input type="text" id="EnterDate" placeholder="{__('Enter date')}"/>
                <div style="margin-top: 10px;text-align: center;">
                <button class="btn btn-success">{__('Modify')}</button>
                </div> *}
            </div>
        </div>
    </div>
</div>

{*=============================Comments==============================*}
<div class="modal fade" id="ModalAddCommentReview" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div id="ModalAddCommentReview-ctn" class="modal-body">
                {*  <h3>{__('Add Commnts')}</h3>
                <textarea placeholder="Commnet1"></textarea>
                <textarea placeholder="Commnet2"></textarea>
                <textarea placeholder="Commnet3"></textarea>
                <div style="text-align: center;">
                <button class="btn btn-success">{__('Post')}</button>
                </div> *}
            </div>
        </div>
    </div>
</div>
{*-----------------------------------------------------------------------------*}
<div id="ThanksForComment" class="modal fade" role="dialog">
    <div class="modal-dialog" style="top: 50%;left: 50%;transform: translate(-50%,-50%);position: absolute;width: 60%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body" style="text-align:center;color: #109310;">
                <i class="mdi mdi mdi-check-circle" style="font-size: 45px;"></i>
                <p style="font-size: 19px;">{__('Thanks for you comment')} 
                    <span style="font-weight: 700;color: #187d28;" id="EmployerRequestDialog-text"></span>
                </p>
            </div>
        </div>
    </div>
</div>        
 
<script type="text/javascript">
    
        function getFilterParameters()
        {
            var params={ filter: {  order : { }, 
                                    search : { },
                                    equal: { },
                                    range : { },                                                                                                                                  
                                nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                token:'{$formFilter->getCSRFToken()}'
                         } };
                         return params; 
        }

        function updateFilter()
        {          
           return $.ajax2({ data: getFilterParameters(), 
                            url:"{url_to('projects_ajax',['action'=>'ListPartialProjectForEmployee'])}" ,                          
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
        $("[name=nbitemsbypage]").change(function () {  return updateFilter();  });

        $(".pager").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('projects_ajax',['action'=>'ListPartialProjectForEmployee'])}?page="+$(this).attr('data-page'),                                
                                 target: "#actions"
                });
        });
    
     
{*  $( "#EnterDate" ).datepicker();
        
        
        $(".OpenDateDialog").click( function () { 
            $("#ModalDateDialog").modal('show');                       
        }); *}
        
        
        $('#Dashboard').click(function(){                                       
          return $.ajax2({ url: "{url_to('employees_ajax',['action'=>'Dashboard'])}",                           
                           target: "#actions"}); 
        }); 
        
        
        $('.Tasks').click(function(){                                       
          return $.ajax2({ data : { Project : $(this).attr('id') },
                           url: "{url_to('projects_ajax',['action'=>'ListPartialTaskForProjectForEmployee'])}",                           
                           target: "#actions"});
        }); 
        
          $('.Documents').click(function(){                                       
          return $.ajax2({ data : { Project : $(this).attr('id') },
                           url: "{url_to('projects_documents_ajax',['action'=>'ListPartialDocumentForProjectForEmployee'])}",                           
                           target: "#actions"});
        }); 
        
         $('.Requests').click(function(){                                       
          return $.ajax2({ data : { Project : $(this).attr('id')  },
                           url: "{url_to('employees_work_ajax',['action'=>'ListPartialRequestForProjectForEmployee'])}",                           
                           target: "#actions"}); 
        }); 
               
        $(".OpenDateDialog-startat").click(function(){                                       
          return $.ajax2({ data : { Project : $(this).attr('id') },
                           url: "{url_to('projects_ajax',['action'=>'ModifyStartAtDialogForEmployee'])}",    
                           success : function () { $("#ModalDateDialog").modal('show');     },
                           target: "#ModalDateDialog-ctn"});
        }); 
        
         $(".OpenDateDialog-endat").click(function(){                                       
          return $.ajax2({ data : { Project : $(this).attr('id') },
                           url: "{url_to('projects_ajax',['action'=>'ModifyEndAtDialogForEmployee'])}",   
                           success : function () { $("#ModalDateDialog").modal('show');     },
                           target: "#ModalDateDialog-ctn"});
        });
        
         $('.Display').click(function(){                                       
          return $.ajax2({ data : { Project : $(this).attr('id') },
                           url: "{url_to('projects_ajax',['action'=>'DisplayProjectForEmployee'])}",                           
                           target: "#actions"}); 
        });
        
        
          $('.Comments').click(function(){                 
           return $.ajax2({ data : { Project : $(this).attr('id') },
                           url: "{url_to('employees_comment_ajax',['action'=>'ViewCommentForProjectForEmployee'])}",  
                           success : function () { $("#ModalAddCommentReview").modal('show'); },
                           target: "#ModalAddCommentReview-ctn"});  
        }); 
        
          $('.Reviews').click(function(){                  
           return $.ajax2({ data : { Project : $(this).attr('id') },
                           url: "{url_to('employees_notation_ajax',['action'=>'ViewNotationForProjectForEmployee'])}",   
                           success : function () { $("#ModalAddCommentReview").modal('show'); },
                           target: "#ModalAddCommentReview-ctn"}); 
        });  
        
        
          $('.EmployerComments').click(function(){                 
           return $.ajax2({ data : { Project : $(this).attr('id') },
                           url: "{url_to('employees_comment_ajax',['action'=>'DisplayEmployerCommentForProjectForEmployee'])}",  
                           success : function () { $("#ModalAddCommentReview").modal('show'); },
                           target: "#ModalAddCommentReview-ctn"});  
        }); 
        
          $('.EmployerReviews').click(function(){                  
           return $.ajax2({ data : { Project : $(this).attr('id') },
                           url: "{url_to('employees_notation_ajax',['action'=>'DisplayEmployerNotationForProjectForEmployee'])}",   
                           success : function () { $("#ModalAddCommentReview").modal('show'); },
                           target: "#ModalAddCommentReview-ctn"}); 
        });  
        
        
        $('.Finish').click(function(){ 
           if (!confirm('{__("Project \"#0#\" will be finished. Confirm ?")}'.format($(this).attr('name')))) return false; 
           return $.ajax2({ data : { Project : $(this).attr('id') },
                           url: "{url_to('projects_ajax',['action'=>'FinishProject'])}",   
                           success : function (resp) { 
                                  if (resp.action != 'FinishProject') return ;
                                  $(".Finish[id="+resp.id+"]").remove();
                           }
                           }); 
        });
     
</script> 

