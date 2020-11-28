<div class="row RowTop">
    <div class="col-md-12 grid-margin classConducteurTop">
      <div class="d-flex justify-content-between flex-wrap">
        <div class="d-flex align-items-end flex-wrap">
          <div class="mr-md-3 mr-xl-5 styleWidth">
            <h2>{__('My searches')}</h2>                   
          </div>
          <div class="d-flex">
            <i class="mdi mdi-home text-muted hover-cursor"></i>
            <p class="text-muted mb-0 hover-cursor">&nbsp;/&nbsp;{__('Dashboard')}&nbsp;/&nbsp;</p>
            <p class="text-primary mb-0 hover-cursor">{__('My searches')}</p>
          </div>
        </div>      
      </div>
          {component name="/site_help/help" help="employee-list-search"}
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
                            <th class="sorting">#</th> 
                            <th class="sorting">{__('Query')}</th> 
                            <th class="sorting">{__('Category')}</th> 
                            <th class="sorting">{__('Location')}</th> 
                             <th class="sorting">{__('Number of results')}</th> 
                            <th class="sorting">{__('Created At')}</th>                                                                               
                            <th>{__('Actions')}</th>
                        </tr>
                      </thead>
                      <tbody>
                         {foreach $pager as $item} 
                            <tr class="list" id="{$item->get('id')}" role="row">
                                <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>                                                            
                                <td>{$item->getQuery()|escape}</td>
                                <td>{if $item->hasCategory()} 
                                        {$item->getCategory()->getI18n()->getFormatter()->getTitle()}
                                    {else}
                                        {__('---')}
                                    {/if}
                                </td>
                                <td>{$item->getLocation()|escape}</td>  
                                 <td> {$item->getFormatter()->getNumberOfResults()->getText()}  </td>   
                                <td> {$item->getFormatter()->getCreatedAt()->getText()}  </td>                                
                                  <td>   
                                      <a href="{$item->getUrl()}" target="_blank" id="{$item->get('id')}"><i class="fa fa-search"></i></a>
                                      <a href="#" class="Delete" id="{$item->get('id')}" name="{$item->getQuery()|escape}"><i class="fa fa-trash"></i></a>
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
                            url:"{url_to('employees_ajax',['action'=>'ajaxListPartialSearch'])}" ,                          
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
                                 url:"{url_to('employees_ajax',['action'=>'ajaxListPartialSearch'])}?page="+$(this).attr('data-page'),                                
                                 target: "#actions"
                });
        });
            
            
           $(".Delete").click( function () { 
                if (!confirm('{__("Search \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ EmployeeSearch: $(this).attr('id') },
                                 url :"{url_to('employees_ajax',['action'=>'DeleteSearch'])}",                               
                                 success : function(resp) {
                                       if (resp.action!='DeleteSearch') return ;                                          
                                          $(".list[id="+resp.id+"]").remove();  
                                         // if ($('.list').length==0) return updateFilter();   
                                          updatePager(1);
                                 }
                     });                                        
            });  
</script> 
