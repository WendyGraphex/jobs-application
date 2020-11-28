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
          {component name="/site_help/help" help="employer-list-request"}
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
                            <th>{__('Freelancer')}</th> 
                            <th>{__('Number of projects')}</th>       
                            <th>{__('Quoted at')}</th>     
                            <th>{__('Price')}</th>       
                            <th>{__('Created At')}</th>                                                                                                                                      
                             {* <th>{__('Actions')}</th> *}
                        </tr>
                      </thead>
                      <tbody>
                         {foreach $pager as $item} 
                            <tr class="list" id="{$item->get('id')}" role="row">
                                <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>                                                            
                                <td>{$item->get('reference')}
                                </td> 
                                <td>                                       
                                    <div><a href="{$item->getAdvert()->getI18n()->getUrl()}" style="color: black;">{__('Job')} : {$item->getAdvert()->getI18n()->getFormatter()->getTitle()->ucfirst()}</a></div>
                                    <div>{__('Description')} : {$item->get('description')|escape}</div>                                    
                                </td>                               
                                <td>
                                    <div>
                                        <img height="32px" src="{$item->getEmployeeUser()->getAvatar()->getThumb()->getUrl()}"/>
                                        {$item->getEmployeeUser()->getFormatter()->getUsername()->ucfirst()}
                                        <label>                                    
                                            <a href="javascript:void(0);" style="font-size: 16px;color: black;" class="DialogMessage" name="" id="{$item->get('id')}"><i class="mdi  mdi-email-outline"></i></a>
                                        </label>
                                    </div>
                                </td>                                                           
                                  <td>
                                    {$item->getFormatter()->getNumberOfProjects()->getText()}
                                </td>
                                <td>
                                   {if $item->getProjectRequests()->isEmpty() &&  $item->hasQuotation()}                                      
                                          {$item->getFormatter()->getQuotedAt()->getText()}
                                     {/if}    
                                </td>
                                <td>                                         
                                    {if $item->getProjectRequests()->isEmpty() &&  $item->hasQuotation()}                                      
                                          {$item->getQuotation()->getFormatter()->getPrice()->getAmount()}
                                     {/if}   
                                  </td>
                                  <td>
                                  {$item->getFormatter()->getCreatedAt()->getText()}
                                </td>
                                {* <td>                                         
                                <label class="IconSearch" data-toggle="modal" data-target="#ModalRequest">
                                     <i class="fa fa-search"></i>
                                </label>                                
                              </td>     *}                              
                            </tr>  
                            {foreach $item->getProjectRequests() as $project_request}
                                <tr>
                                    <td></td>
                                     <td></td>
                                     <td><a href="{$project_request->getProject()->getUrl()}">{$project_request->getProject()->getFormatter()->getName()->ucfirst()}</a></td>                                   
                                    <td></td>
                                    <td></td>   
                                    <td>
                                        {if $project_request->hasQuotation()}
                                            {$project_request->getQuotation()->getFormatter()->getCreatedAt()->getText()}   
                                      {else}
                                          {__('No quote')}
                                        {/if}
                                    </td>
                                     <td>  
                                      {if $project_request->hasQuotation()}
                                            {$project_request->getQuotation()->getFormatter()->getPrice()->getAmount()}   
                                      {else}
                                          {__('No quote')}
                                        {/if}    
                                  </td>
                                  <td>
                                     {* <a href="#" class="list-action text-info View" id="{$project_request->get('id')}" title="{__('Edit')}"><i class="fa fa-edit"></i></a> *}
                                  </td>
                                  {*  <td>
                                       
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
  {*                      
<div id="ModalRequest" class="modal fade" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <span class="ModalRequestImg">
                    <img height="50px" src="/web/pictures/person_1.jpg"/>
                    <label><h5>{__('Flan Ben Flan')}</h5></label>
                </span>
                <div style="text-align: center;">
                    <div style="position: relative;margin-bottom: 38px;margin-top: 10px;">
                        <textarea id="Description" placeholder="{__('Message')}" class="Input" style="height: 135px !important;position: relative;"></textarea>
                        <label id="charNum" class="charNum">{__('Max characters is 500')}</label>
                    </div>
                    <label style="position: relative;">
                        <input id="" type="text" class="form-control EmployeeAdvertOffer Input" name="price" placeholder="{__('Enter your price')}" style="height: 40px !important;"/>
                        <span class="SpanPrice">$</span>
                    </label>
                    <div>
                        <button type="button" class="btn btn-success btnClickGeneral">{__('Accepted')}</button>
                        <button type="button" class="btn btn-danger btnClickGeneral">{__('Refused')}</button>
                        <button type="button" class="btn btn-primary btnClickGeneral">{__('Negotiate')}</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> *}
                    
<div id="ModalRequestContactEmployee" class="modal fade" role="dialog"></div>
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
                            url:"{url_to('sales_quotation_ajax',['action'=>'ListPartialRequestForEmployer'])}" ,                          
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
                                 url:"{url_to('sales_quotation_ajax',['action'=>'ListPartialRequestForEmployer'])}?page="+$(this).attr('data-page'),                                
                                 target: "#actions"
                });
        });
     
     
   
    $(".Display").click( function () {                 
                return $.ajax2({ data :{ EmployerProjectRequest: $(this).attr('id') },
                                 url :"{url_to('employers_project_ajax',['action'=>'DisplayProjectRequest'])}",                               
                                 target :"#actions"
                     });                                        
            });
    
    $('#Description').keyup(function () {                         
        $('#charNum').text($(this).val().length >= {$max_characters}?"{__('you have reached the limit')}": {$max_characters} - $(this).val().length + "{__(' characters left')}");        
    });        
     
    $(".DialogMessage").click(function () {       
        return $.ajax2({ data : { SaleEmployerQuotationRequest : $(this).attr('id') },
                         url :"{url_to('employers_messager_ajax',['action'=>'DialogMessageForRequest'])}",            
                          success : function () { $("#ModalRequest").modal('show'); },
                         target : "#ModalRequest"
                         
             });
    });
    
    $(".View").click( function () {                 
        return $.ajax2({ data :{ SaleEmployerQutation: $(this).attr('id') },
                         url :"{url_to('sales_quotation_ajax',['action'=>'ViewQuotationForEmployer'])}",                               
                         target :"#actions"
             });                                        
    });
    
</script>