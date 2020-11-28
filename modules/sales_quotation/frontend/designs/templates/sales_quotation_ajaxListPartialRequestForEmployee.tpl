<div class="row RowTop">
    <div class="col-md-12 grid-margin classConducteurTop">
      <div class="d-flex justify-content-between flex-wrap">
        <div class="d-flex align-items-end flex-wrap">
          <div class="mr-md-3 mr-xl-5 styleWidth">
            <h2>{__('My requests')}</h2>                   
          </div>
          <div class="d-flex">
            <i class="mdi mdi-home text-muted hover-cursor"></i>
            <a id="Dashboard"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('Dashboard')}</p></a>
            <p class="text-muted mb-0">&nbsp;/&nbsp;{__('My requests')}</p>
          </div>
        </div>      
      </div>
         {component name="/site_help/help" help="employee-list-request"}
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
                            <th>#</th>                                                 
                            <th>{__('Ref.')}</th>                             
                            <th>{__('Project')}</th> 
                            <th>{__('Employer')}</th> 
                            <th>{__('Number of projects')}</th>   
                            <th>{__('Quoted At')}</th>   
                             <th>{__('Price')}</th>     
                            <th>{__('Created At')}</th>                                                                                                                                      
                           {* <th>{__('Actions')}</th>*}
                        </tr>
                      </thead>
                      <tbody>
                         {foreach $pager as $item} 
                            <tr class="list" id="{$item->get('id')}" role="row">
                                <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>                                                            
                                <td>{$item->get('reference')}
                                </td> 
                                <td>                                       
                                    <a href="{$item->getAdvert()->getI18n()->getUrl()}" style="color: black;">{__('Job')} : {$item->getAdvert()->getI18n()->getFormatter()->getTitle()->ucfirst()}</a>
                                    <div>{__('Description')} : {$item->get('description')|escape}</div>   
                                </td>                               
                                <td>
                                    <div>
                                        <img height="32px" src="{$item->getEmployerUser()->getAvatar()->getThumb()->getUrl()}"/>
                                        {$item->getEmployerUser()->getFormatter()->getUsername()->ucfirst()}
                                        <label>                                    
                                            <a href="javascript:void(0);" style="font-size: 16px;color: black;" class="DialogMessage" id="{$item->get('id')}"><i class="mdi  mdi-email-outline"></i></a>
                                        </label>
                                    </div>
                                </td>                                                           
                                  <td>
                                    {$item->getFormatter()->getNumberOfProjects()->getText()}
                                </td>  
                                <td class="EmployerQuotationRequest" name="quoted_at" id="{$item->get('id')}">                                         
                                     {if $item->getProjectRequests()->isEmpty() && $item->hasQuotation()}  
                                       {$item->getFormatter()->getQuotedAt()->getText()}   
                                     {/if}
                                </td> 
                                 <td class="EmployerQuotationRequest" name="price" id="{$item->get('id')}">                                         
                                     {if $item->getProjectRequests()->isEmpty() && !$item->hasQuotation()}   
                                     <button type="button" class="btn btn-primary btn-sm SendRequest" id="{$item->get('id')}" title="{__('Send a quote')}">{__('Send a quote')}</button>                                           
                                     {elseif $item->hasQuotation()}
                                          {$item->getQuotation()->getFormatter()->getPrice()->getAmount()}
                                     {/if}   
                                </td>
                                <td>
                                  {$item->getFormatter()->getCreatedAt()->getText()}
                                </td>
                              {*  <td>                                         
                                </td>                                    *}
                            </tr>  
                            {foreach $item->getProjectRequests() as $project_request}
                                <tr>
                                    <td></td>
                                     <td></td>
                                     <td><a href="{$project_request->getProject()->getUrl()}" target="_blank">{$project_request->getProject()->getFormatter()->getName()->ucfirst()}</a></td>                                   
                                    <td></td>
                                    <td></td> 
                                     <td class="EmployeeProjectRequest" name="quoted_at" id="{$project_request->get('id')}">                                         
                                        {if $project_request->hasQuotation()}
                                            {$project_request->getFormatter()->getQuotedAt()->getText()}
                                        {else}
                                          
                                        {/if}
                                </td>
                                    <td class="EmployeeProjectRequest" name="price" id="{$project_request->get('id')}">            
                                        {if $project_request->hasQuotation()}
                                            {$project_request->getQuotation()->getFormatter()->getPrice()->getAmount()}
                                        {else}
                                            <button type="button" class="btn btn-primary btn-sm SendQuote" id="{$project_request->get('id')}" title="{__('Send a quote')}">{__('Send a quote')}</button>                                           
                                        {/if}
                                  </td>
                                  <td></td>
                                    {* <td>
                                        <a href="#" class="list-action text-info Display" id="{$project_request->get('id')}" title="{__('Edit')}"><i class="fa fa-search" {*></i></a>                                                                                                                  
                                   
                                      
                                    </td> *}
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
                        
                        
<div id="ModalRequest" class="modal fade" role="dialog">
    <div class="modal-dialog modal-lg">
        <div id="ModalRequest-ctn" class="modal-content">
            
        </div>
    </div>
</div> 

{*-----------------------------------------------------------------------------------------*}
<div id="ModalRequestSuccess" class="modal fade" role="dialog" style="top: 40%;">
    <div class="ModalMessage modal-dialog modal-lg" style="width: 50%;">
        <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="Modal-close close" data-dismiss="modal">&times;</button>
            </div>              
            <div class="modal-body" style="text-align: center;color: green;">
                <i class="mdi mdi-check-circle" style="font-size: 45px;"></i>
                <p style="font-size: 19px;">{__('Your Message has been sent to')}
                    <span style="font-weight: 700;color: #187d28;" class="NameUserRequest"></span>
                </p>
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
                            url:"{url_to('sales_quotation_ajax',['action'=>'ListPartialRequestForEmployee'])}" ,                          
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
                                 url:"{url_to('sales_quotation_ajax',['action'=>'ListPartialRequestForEmployee'])}?page="+$(this).attr('data-page'),                                
                                 target: "#actions"
                });
        });
     
     
     
     
   
    $(".Display").click( function () {                 
        return $.ajax2({ data :{ EmployeeProjectRequest: $(this).attr('id') },
                         url :"{url_to('employers_project_ajax',['action'=>'DisplayProjectRequestForEmployee'])}",                               
                         target :"#actions"
             });                                        
    });
       
    $(".SendQuote").click( function () {                 
        return $.ajax2({ data :{ EmployeeProjectRequest: $(this).attr('id') },
                         url :"{url_to('sales_quotation_ajax',['action'=>'SendQuoteDialogForEmployee'])}",   
                         success: function () { $("#ModalRequest").modal('show'); },
                         target :"#ModalRequest-ctn"
             });                                        
    });
    
     $(".SendRequest").click( function () {                 
        return $.ajax2({ data :{ EmployerQuotationRequest: $(this).attr('id') },
                         url :"{url_to('sales_quotation_ajax',['action'=>'SendRequestDialogForEmployee'])}",   
                         success: function () { $("#ModalRequest").modal('show'); },
                         target :"#ModalRequest-ctn"
             });                                        
    });
    
    
   $(".DialogMessage").click(function () {       
        return $.ajax2({ data : { SaleEmployerQuotationRequest : $(this).attr('id') },
                         url :"{url_to('employees_messager_ajax',['action'=>'DialogMessageForRequest'])}",            
                          success : function () { $("#ModalRequest").modal('show'); },
                         target : "#ModalRequest-ctn"
                         
             });
    });
</script>