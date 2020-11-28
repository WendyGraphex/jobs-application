<div class="row RowTop">
    <div class="col-md-12 grid-margin classConducteurTop">
      <div class="d-flex justify-content-between flex-wrap">
        <div class="d-flex align-items-end flex-wrap">
          <div class="mr-md-3 mr-xl-5 styleWidth">
            <h2>{__('My Projects')}</h2>                   
          </div>
          <div class="d-flex">
            <i class="mdi mdi-home text-muted hover-cursor"></i>
            <a id="Dashboard"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('Dashboard')}</p></a>
            <p class="text-muted mb-0">&nbsp;/&nbsp;{__('My Projects')}</p>
          </div>
        </div>      
      </div>
          {component name="/site_help/help" help="employer-list-projects"}
    </div>
</div>
{alerts}

<div class="row admin-header-container btn-r">    
    <div class="col-sm p-0">
        <div class="pull-right">
                <a href="#" id="New" class="btn btn-primary admin-header-button"><i class="fa fa-plus mr-2"></i>{__('New')}</a>                
        </div>
    </div>
</div>     
        {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter}
    <div class="col-lg-12 pt-2 stretch-card">
              <div class="card classMargin">
                <div class="card-body">               
                  <div class="table-responsive pt-3">
                    <table class="table table-bordered table-striped">
                      <thead class="">
                        <tr role="row">
                            {*<th> #</th> *}                                                
                            <th>{__('ID')}</th>                             
                            <th>{__('Project')}</th> 
                            <th>{__('Budget')}</th> 
                            <th>{__('Created At')}</th>                                                                                                                                      
                            <th>{__('Updated At')}</th>
                            <th>{__('State')}</th> 
                            <th>{__('Actions')}</th>
                        </tr>
                      </thead>
                      <tbody>
                         {foreach $pager as $item} 
                            <tr class="list" id="{$item->get('id')}" role="row">
                                <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>                                                            
                                <td>
                                    {$item->getFormatter()->getName()->ucfirst()}
                                </td> 
                                <td>{$item->getFormatter()->getBudget()->getAmount()}</td>                               
                                <td>{$item->getFormatter()->getCreatedAt()->getText()}</td>                                                           
                                <td>
                                    {$item->getFormatter()->getUpdatedAt()->getText()}
                                </td>
                                <td>
                                </td>                                                                  
                                <td>                                         
                                    <a href="#" class="list-action text-info View" id="{$item->get('id')}" title="{__('Edit')}"><i class="fa fa-edit"></i></a>                                                                                                                                                                                                                                                                                                                                                                                                
                                    <a href="#" class="list-action text-info Delete" id="{$item->get('id')}" name="{$item->get('reference')}" title="{__('Delete')}"><i class="fa fa-trash"></i></a>
                                    &nbsp;                                    
                                </td>
                            </tr>
                            {foreach $item->getProjectsI18n() as $i18n}                                                                   
                            <tr class="list-i18n" id="{$i18n->get('id')}" data-advert="{$item->get('id')}" role="row">
                                <td></td>
                                <td>                                 
                                   <div>{__('Ref.')}: {$i18n->get('reference')}</div>
                                   <div>{$i18n->getFormatter()->getLanguage()->getText()->ucfirst()} - <a target="_blank" href="{$i18n->getUrl()}">{$i18n->get('title')}</a></div>   
                                </td>
                                <td>
                                    
                                </td>
                                 <td>
                                    
                                </td>  
                                <td>
                                    
                                </td> 
                                <td>
                                     {if $i18n->hasPublishedAt()}
                                        {$i18n->getFormatter()->getPublishedAt()->getText()}
                                     {/if}   
                                </td>                                                             
                                <td>                                  
                                </td>
                            </tr>
                             {/foreach}
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
                            url:"{url_to('employers_project_ajax',['action'=>'ListPartialProject'])}" ,                          
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
                                 url:"{url_to('employers_project_ajax',['action'=>'ListPartialProject'])}?page="+$(this).attr('data-page'),                                
                                 target: "#actions"
                });
        });
     
     
     
        $( "#EnterDate" ).datepicker();
        $(".OpenDateDialog").click( function () { 
            $("#ModalDateDialog").modal('show');                       
        });
      
        $(".Delete").click( function () { 
                if (!confirm('{__("Project \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ EmployerProject: $(this).attr('id') },
                                 url :"{url_to('employers_project_ajax',['action'=>'DeleteProject'])}",                               
                                 success : function(resp) {
                                       if (resp.action!='DeleteProject') return ;                                          
                                          $(".list[id="+resp.id+"]").remove();  
                                          $(".list-i18n[data-advert="+resp.id+"]").remove();  
                                          //if ($('.list').length==0) return updateFilter();   
                                          updatePager(1);
                                 }
                     });                                        
            });  
            
                  
        $("#New").click( function () {                 
                return $.ajax2({ url :"{url_to('employers_project_ajax',['action'=>'NewProject'])}",                               
                                 target :"#actions"
                     });                                        
            });  
            
         $(".View").click( function () {                 
                return $.ajax2({ data :{ EmployerProject: $(this).attr('id') },
                                 url :"{url_to('employers_project_ajax',['action'=>'ViewProject'])}",                               
                                 target :"#actions"
                     });                                        
            });  
            
            
        $('#Dashboard').click(function(){                                       
          return $.ajax2({ url: "{url_to('employers_project_ajax',['action'=>'Dashboard'])}",                           
                           target: "#actions"}); 
        }); 
        
        
       
</script> 
