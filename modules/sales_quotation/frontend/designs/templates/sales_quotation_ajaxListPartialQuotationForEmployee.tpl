<div class="row RowTop">
    <div class="col-md-12 grid-margin classConducteurTop">
      <div class="d-flex justify-content-between flex-wrap">
        <div class="d-flex align-items-end flex-wrap">
          <div class="mr-md-3 mr-xl-5 styleWidth">
            <h2>{__('My offers')}</h2>                   
          </div>
          <div class="d-flex">
            <i class="mdi mdi-home text-muted hover-cursor"></i>
            <a id="Dashboard"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('Dashboard')}</p></a>
            <p class="text-muted mb-0">&nbsp;/&nbsp;{__('My offers')}</p>
          </div>
        </div>      
      </div>
          {component name="/site_help/help" help="employee-list-quotation"}
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
                            <th>{__('Job/Project')}</th> 
                            <th style="width: 190px;">{__('Employer')}</th> 
                            <th>{__('Price')}</th>
                            <th>{__('Start at/Work')}</th>               
                            <th>{__('Iteration')}</th> 
                            <th>{__('Quoted At')}</th>                                                                                  
                            <th>{__('State')}</th> 
                            <th style="width: 100px;">{__('Payment')}</th> 
                        </tr>
                      </thead>
                      <tbody>
                           <tr>
                            <td></td>
                            <td><input placeholder="{__('Ref')}" style="height: 36px;" class="search form-control" type="text" size="5" name="name" value="{$formFilter.search.reference}"></td>
                            <td><input placeholder="{__('Project name')}" style="height: 36px;" class="search form-control" type="text" size="5" name="name" value=""></td>
                            <td>
                                {html_options style="height: 31px;" class="equal Select show-menu-arrow form-control" name="" }
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>
                                 {html_options style="height: 31px;" class="equal Select show-menu-arrow form-control" name="" }
                            </td>
                            <td></td>
                        </tr>
                         {foreach $pager as $item} 
                            <tr class="list" id="{$item->get('id')}" role="row">
                                <td class="count" id="{$item->get('id')}">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>                                                            
                                <td> {$item->get('reference')}
                                </td> 
                                <td>
                                    {if $item->hasEmployerAdvert()}
                                        <div>
                                            <a href="{$item->getEmployerAdvert()->getI18n()->getUrl()}" target="_blank">{__('Ref.')}{$item->getEmployerAdvert()->getI18n()->get('reference')}
                                            {$item->getEmployerAdvert()->getI18n()->getFormatter()->getTitle()->ucfirst()}</a>                                             
                                        </div>                                                                                                                    
                                    {elseif $item->hasEmployeeAdvert()}      
                                        <div>
                                            <a href="{$item->getEmployeeAdvert()->getI18n()->getUrl()}" target="_blank">{__('Ref.')}{$item->getEmployeeAdvert()->getI18n()->get('reference')}
                                            {$item->getEmployeeAdvert()->getI18n()->getFormatter()->getTitle()->ucfirst()}</a>
                                             
                                        </div>                                       
                                        <div>{$item->getProject()->getFormatter()->getName()->ucfirst()}</div> 
                                    {/if}  
                                     <div>
                                          {if $item->hasHistory()}
                                    <a href="javascript:void();" class="History" id="{$item->get('id')}"><i class="fa fa-list"></i></a>
                                    {/if}
                                        {$item->getFormatter()->getDescription()->ucfirst()|escape|truncate:80}
                                    </div> 
                                </td>                               
                                <td><div>
                                     {if $item->getEmployerUser()->hasAvatar()} 
                                    <img height="32px" src="{$item->getEmployerUser()->getAvatar()->getThumb()->getUrl()}"/>
                                    {/if}
                                    {$item->getEmployerUser()->getFormatter()->getUsername()}
                                        <label>                                    
                                            <a href="javascript:void(0);" style="font-size: 16px;color: black;" class="DialogMessage" id="{$item->get('id')}"><i class="mdi  mdi-email-outline"></i></a>
                                        </label>
                                     </div>
                                     
                                </td>                                                           
                                  <td>
                                    {$item->getFormatter()->getPrice()->getAmount()}
                                </td>
                                 <td class="SaleEmployeeQuotation-Schedule" id="{$item->get('id')}">                                        
                                     {if $item->hasInAt()} 
                                    <div class="SaleEmployeeQuotation-InAt" id="{$item->get('id')}">{$item->getFormatter()->getInAt()->getFormatted()}</div>
                                     <div class="SaleEmployeeQuotation-NumberOfDays" id="{$item->get('id')}">{$item->getFormatter()->getNumberOfDays()->getFormattedNumberOfDays()}</div>
                                   {else}
                                        <div class="SaleEmployeeQuotation-InAt" id="{$item->get('id')}"></div>
                                        <div class="SaleEmployeeQuotation-NumberOfDays" id="{$item->get('id')}"></div>
                                        {if !$item->isAccepted()}
                                          {if $item->isScheduleNeeded()}
                                             <button type="button" id="{$item->get('id')}" data-action="SCHEDULE" class="EmployeeQuotationActions btn btn-outline-success btn-sm">{__('Schedule required')}</button>                                         
                                          {else}
                                           
                                            {/if}
                                      {/if}
                                   {/if}  
                                </td>
                                <td>
                                    {$item->get('version')}                                    
                                </td>                                
                                  <td>
                                  {$item->getFormatter()->getCreatedAt()->getText()}
                                </td>
                                <td class="SaleEmployeeQuotation-State" id="{$item->get('id')}">                                                                       
                                    {if $item->isAccepted()}
                                        <strong>{__('Accepted')}</strong>
                                    {elseif $item->isRefused()}
                                        <div><strong>{__('Refused')}</strong></div>
                                        {if $item->isEmployerRefused()}
                                             <div>{__('Refused by %s',(string)$item->getEmployerUser()->getFormatter()->getUsername())}</div>  
                                        {/if}
                                    {/if}    
                                    
                                    
                                    {if !$item->isAccepted() && !$item->isRefused()}
                                        <div class="classMarginBottom">
                                            {if $item->isEmployerRefused()}
                                                 {__('Refused by %s',(string)$item->getEmployerUser()->getFormatter()->getUsername())}                                                                                                                                                
                                            {elseif $item->isEmployerNegociated()}   
                                                <div>{__('Negociation required by %s',(string)$item->getEmployerUser()->getFormatter()->getUsername())}</div>                                       
                                            {elseif $item->isEmployerAccepted() && !$item->isEmployeeAccepted()}
                                                 <div>{__('Accepted by %s',(string)$item->getEmployerUser()->getFormatter()->getUsername())}</div>                                         
                                            {elseif $item->isWaitingEmployerAnwser()}
                                                <label class="classMarginBottom">{__('Waiting answer from %s',(string)$item->getEmployerUser()->getFormatter()->getUsername())}</label>     
                                            {/if}    
                                             {if $item->isEmployeeRefused()}
                                                 <div>{__('Refused')}</div>                     
                                            {elseif $item->isEmployeeAccepted() && !$item->isEmployerAccepted()}
                                                <div>{__('Accepted')}</div>                                                                                                                      
                                            {elseif $item->isEmployeeProposed()}
                                                <div>{__('Quote proposed')}</div>
                                            {elseif $item->isEmployeeNegociated()}
                                                <div>{__('Negociation requested')}</div>
                                            {else}    

                                            {/if} 
                                        </div>
                                        {if $item->isEmployerNegociated() && !$item->isEmployeeProposed()}                                           
                                            <div>
                                            {* <button type="button" id="{$item->get('id')}" data-action="ACCEPTED" class="EmployeeQuotationActions btn btn-outline-success btn-sm" data-toggle="modal" data-target="#ModalNegociate">{__('Accepted')}</button> *}
                                             <button type="button" id="{$item->get('id')}" data-action="NEGOCIATED" class="EmployeeQuotationActions btn btn-outline-primary btn-sm"data-toggle="modal" data-target="#ModalNegociate">{__('Negotiate')}</button>
                                             <button type="button" id="{$item->get('id')}" data-action="REFUSED" class="EmployeeQuotationActions btn btn-outline-danger btn-sm">{__('Refused')}</button>
                                            </div>
                                        {elseif $item->isEmployerAccepted() && !$item->isEmployeeAccepted() && !$item->isEmployeeRefused()}                 
                                            <div>
                                             <button type="button" id="{$item->get('id')}" data-action="ACCEPTED" class="EmployeeQuotationActions btn btn-outline-success btn-sm" data-toggle="modal" data-target="#ModalNegociate">{__('Accepted')}</button>                                                                                
                                             <button type="button" id="{$item->get('id')}" data-action="REFUSED" class="EmployeeQuotationActions btn btn-outline-danger btn-sm">{__('Refused')}</button>
                                             </div>                                    
                                        {/if}                                     
                                    {/if}
                                </td>
                                <td>
                                    {if $item->isPaid()}
                                        {__('Paid')}
                                    {elseif $item->isAccepted()}  
                                        {__('Waiting for payment')}
                                    {/if}
                                </td>
                             {*   <td>                                         
                                    <label class="IconSearch" data-toggle="modal" data-target="#ModalRequest">
                                        <i class="fa fa-search"></i>
                                    </label>
                                  
                                </td> *}
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
<div id="ModalQuotation" class="modal fade" role="dialog"></div> 
{*----------------------------------------------------------------------*}
<div id="ModalQuotationSuccess" class="modal fade" role="dialog" style="top: 40%;">
    <div class="ModalMessage modal-dialog" style="width: 50%;">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="Modal-close close" data-dismiss="modal">&times;</button>
        </div>              
        <div class="modal-body" style="text-align: center;color: green;">
            <i class="mdi mdi-check-circle" style="font-size: 45px;"></i>
            <p style="font-size: 19px;">{__('Your Message has been sent to')}
                <span style="font-weight: 700;color: #187d28;" class="NameUserQuotation"></span>
            </p>
            {*{__('Message send to')}<span class="NameUserQuotation"></span>*}
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
                            url:"{url_to('sales_quotation_ajax',['action'=>'ListPartialQuotationForEmployee'])}" ,                          
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
                                 url:"{url_to('sales_quotation_ajax',['action'=>'ListPartialQuotationForEmployee'])}?page="+$(this).attr('data-page'),                                
                                 target: "#actions"
                });
        }); 
     
     
     $(".EmployeeQuotationActions[data-action=ACCEPTED]").click(function () {           
        return $.ajax2({ data : { SaleEmployeeQuotation : $(this).attr('id') },
                         url :"{url_to('sales_quotation_ajax',['action'=>'SendQuoteAcceptedEmployee'])}",                           
                         target : ".list[id="+$(this).attr('id')+"]"                         
             });
    });
    
    $(".EmployeeQuotationActions[data-action=REFUSED]").click(function () {       
        return $.ajax2({ data : { SaleEmployeeQuotation : $(this).attr('id') },
                         url :"{url_to('sales_quotation_ajax',['action'=>'SendQuoteRefusedEmployee'])}",   
                         target : ".SaleEmployeeQuotation-State[id="+$(this).attr('id')+"]"
                         
             });
    });
    
    $(".EmployeeQuotationActions[data-action=NEGOCIATED]").click(function () {       
        return $.ajax2({ data : { SaleEmployeeQuotation : $(this).attr('id') },
                         url :"{url_to('sales_quotation_ajax',['action'=>'SendQuoteNegociatedDialogEmployee'])}",  
                         success : function () { $("#ModalQuotation").modal('show'); },
                         target : "#ModalQuotation"
                         
             })
    });
    
    
    $(".EmployeeQuotationActions[data-action=SCHEDULE]").click(function () {       
        return $.ajax2({ data : { SaleEmployeeQuotation : $(this).attr('id') },
                         url :"{url_to('sales_quotation_ajax',['action'=>'SendQuoteScheduleDialogEmployee'])}",  
                         success : function () { $("#ModalQuotation").modal('show'); },
                         target : "#ModalQuotation"
                         
             })
    });
  
    $(".History").click(function () {       
        return $.ajax2({ data : { SaleEmployeeQuotation : $(this).attr('id') },
                         url :"{url_to('sales_quotation_ajax',['action'=>'DialogHistoryEmployee'])}",            
                          success : function () { $("#ModalQuotation").modal('show'); },
                         target : "#ModalQuotation"
                         
             });
    });
    
   $(".DialogMessage").click(function () {       
        return $.ajax2({ data : { SaleEmployeeQuotation : $(this).attr('id') },
                         url :"{url_to('employees_messager_ajax',['action'=>'DialogMessageForQuotation'])}",            
                          success : function () { $("#ModalQuotation").modal('show'); },
                         target : "#ModalQuotation"
                         
             });
    });
</script>
