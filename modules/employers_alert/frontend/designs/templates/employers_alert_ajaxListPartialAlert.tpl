<div class="row RowTop">
    <div class="col-md-12 grid-margin classConducteurTop">
      <div class="d-flex justify-content-between flex-wrap">
        <div class="d-flex align-items-end flex-wrap">
          <div class="mr-md-3 mr-xl-5 styleWidth">
            <h2>{__('My alerts')}</h2>                   
          </div>
          <div class="d-flex">
            <i class="mdi mdi-home text-muted hover-cursor"></i>
            <p class="text-muted mb-0 hover-cursor">&nbsp;/&nbsp;{__('Dashboard')}&nbsp;/&nbsp;</p>
            <p class="text-primary mb-0 hover-cursor">{__('My alerts')}</p>
          </div>
        </div>      
      </div>
          {component name="/site_help/help" help="employer-list-alert"}
    </div>
</div>

{alerts}
<div class="row admin-header-container btn-r">    
    <div class="col-sm p-0">
       {* <div class="pull-right">
                <a href="#" id="New" class="btn btn-primary admin-header-button"><i class="fa fa-plus mr-2"></i>{__('New')}</a>                
        </div>*}
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
                            <th>{__('#')}</th> 
                            <th>{__('Alert')}</th>                            
                            <th>{__('Created At')}</th>                                                                                 
                            <th>{__('Actions')}</th>
                        </tr>
                      </thead>
                      <tbody>
                         {foreach $pager as $item} 
                            <tr class="list" id="{$item->get('id')}" role="row">
                                <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>                                                            
                                <td>{if $item->hasEmployeeUser()}
                                    <a href="{$item->getEmployeeUser()->getUrl()}" target="_blank">{$item->getEmployeeUser()->getFormatter()->getUsername()}</a>
                                    {/if}
                                    {if $item->hasEmployerUser()}
                                    <a href="{$item->getEmployerUser()->getUrl()}" target="_blank">{$item->getEmployerUser()->getFormatter()->getUsername()}</a>
                                    {/if}                                     
                                        {if $item->hasEmployerAdvert()}
                                            <a href="{$item->getEmployerAdvertI18n()->getUrl()}" target="_blank">{$item->getEmployerAdvertI18n()->getFormatter()->getTitle()->ucfirst()}</a>
                                    {/if}
                                   
                                           {if $item->hasEmployeeAdvert()}
                                        <a href="{$item->getEmployeeAdvertI18n()->getUrl()}" target="_blank">{$item->getEmployeeAdvertI18n()->getFormatter()->getTitle()->ucfirst()}</a>
                                    {/if}
                                  </td>                                 
                                <td>{$item->getFormatter()->getCreatedAt()->getText()}</td>                                              
                                  <td>   
                                      <a href="#" class="list-action text-info Delete" id="{$item->get('id')}" name="{$item->getFormatter()->getText()}" title="{__('Delete')}"><i class="fa fa-trash"></i></a>                                   
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
                            url:"{url_to('employers_alert_ajax',['action'=>'ListPartialAlert'])}" ,                          
                            target: "#actions"
                             });
        }
        
        function updatePager(n)
        {
           var page_active=$(".pager .active").html()?parseInt($(".pager .active").html()):1;
           var records_by_page=$("[name=nbitemsbypage]").val();
           var start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
           $(".count").each(function(id) { $(this).html(start+id) }); // Update index column           
           var nb_results=parseInt($("#nb_results").html())-n;
           $("#nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
           $("#end_result").html($(".count:last").html());
        }
      
        $("[name=nbitemsbypage]").change(function () {  return updateFilter();  });
    
        $(".pager").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('employers_alert_ajax',['action'=>'ListPartialAlert'])}?page="+$(this).attr('data-page'),                                
                                 target: "#actions"
                });
        });
        
        $(".Delete").click( function () { 
                if (!confirm('{__("Alert \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ EmployerAlert: $(this).attr('id') },
                                 url :"{url_to('employers_alert_ajax',['action'=>'DeleteAlert'])}",                               
                                 success : function(resp) {
                                       if (resp.action!='DeleteAlert') return ;                                          
                                          $(".list[id="+resp.id+"]").remove();  
                                          //if ($('.list').length==0) return updateFilter();   
                                          updatePager(1);
                                 }
                     });                                        
            });  
        
     
</script> 
