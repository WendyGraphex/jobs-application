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
          {component name="/site_help/help" help="employer-list-quotation"}
    </div>
</div>
{alerts}

{include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter}

 <div class="col-lg-12 pt-2 stretch-card">
              <div class="card classMargin">
                <div class="card-body">               
                  <div class="table-responsive pt-3">
                    <table class="table table-bordered table-striped ItemsFly">
                      <thead class="">
                        <tr role="row">
                            <th> #</th>                                                 
                            <th>{__('Ref.')}</th>                             
                            <th style="width: 100px">{__('Job/Project')}</th> 
                            <th>{__('Freelancer')}</th> 
                            <th>{__('Price')}</th> 
                            <th>{__('Start at/Work')}</th>
                            <th>{__('Iteration')}</th> 
                            <th>{__('Quoted At')}</th>                                                        
                            <th>{__('State')}</th>                            
                            <th style="width: 120px;">{__('Payment')}</th>     
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                            <td></td>
                            <td><input placeholder="{__('Ref')}" style="height: 36px;" class="search form-control" type="text" size="5" name="name" value="{$formFilter.search.reference}"></td>
                            <td><input placeholder="{__('Project name')}" style="height: 36px;" class="search form-control" type="text" size="5" name="name" value="">
                            <td>
                                {html_options style="height: 31px;" class="equal Select show-menu-arrow form-control" options=[] name="employee_user_id" }
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
                                <td>
                                     <div>{$item->get('reference')}</div>
                                </td> 
                                <td>                                        
                                    <div>
                                        {if $item->hasEmployerAdvert()}
                                             <a href="{$item->getEmployerAdvert()->getI18n()->getUrl()}" target="_blank">
                                            <div>{__('Ref.')}{$item->getEmployerAdvert()->getI18n()->get('reference')}</div>
                                            <div>
                                                {$item->getEmployerAdvert()->getI18n()->getFormatter()->getTitle()->ucfirst()}                                             
                                            </div>      
                                             </a>
                                        {elseif $item->hasEmployeeAdvert()}     
                                             <a href="{$item->getEmployeeAdvert()->getI18n()->getUrl()}" target="_blank">
                                            <div>{__('Ref.')}{$item->getEmployeeAdvert()->getI18n()->get('reference')}</div>
                                            <div>
                                                {$item->getEmployeeAdvert()->getI18n()->getFormatter()->getTitle()->ucfirst()}                                             
                                            </div>  
                                             </a>
                                            <div>{$item->getProject()->getFormatter()->getName()->ucfirst()}</div> 
                                        {/if}    
                                    </div>
                                    <div>
                                        {if $item->hasHistory()}
                                            <a href="javascript:void();" class="History" id="{$item->get('id')}"><i class="fa fa-list"></i></a>
                                        {/if}
                                        {$item->getFormatter()->getDescription()->ucfirst()|escape|truncate:80}
                                    </div>     
                                </td>     
                                <td class="tdImageProfile">   
                                    <div>
                                        {if $item->getEmployeeUser()->hasAvatar()} 
                                            <img height="32px" src="{$item->getEmployeeUser()->getAvatar()->getThumb()->getUrl()}"/>
                                        {/if}    
                                        {$item->getEmployeeUser()->getFormatter()->getUsername()}
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
                                        <div>{$item->getFormatter()->getInAt()->getFormatted()}</div>
                                        <div>{$item->getFormatter()->getNumberOfDays()->getFormattedNumberOfDays()}</div>
                                   {else}
                                        {if !$item->isAccepted()}
                                            {if $item->isScheduleNeeded()}
                                            {__('Schedule requested to %s',$item->getEmployeeUser()->getFormatter()->getUsername())}
                                            {else}
                                                <button type="button" id="{$item->get('id')}" data-action="SCHEDULE" class="EmployerQuotationActions btn btn-outline-success btn-sm">{__('Need schedule')}</button>
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
                                        {if $item->isEmployeeRefused()}
                                             <div>{__('Refused by %s',(string)$item->getEmployeeUser()->getFormatter()->getUsername())}</div>  
                                        {/if}
                                    {/if}  
                                    
                                    
                                    {if !$item->isAccepted() && !$item->isRefused()}
                                        <div>
                                            {if $item->isEmployeeRefused()}
                                                 <div class="classMarginBottom">{__('Refused by %s',(string)$item->getEmployeeUser()->getFormatter()->getUsername())}</div>                     
                                            {elseif $item->isEmployeeAccepted() && !$item->isEmployerAccepted()}
                                                <div class="classMarginBottom">{__('Accepted by %s',(string)$item->getEmployeeUser()->getFormatter()->getUsername())}</div>                                                                                                                      
                                            {elseif $item->isEmployeeProposed()}
                                                <div class="classMarginBottom">{__('Quote proposed by %s',(string)$item->getEmployeeUser()->getFormatter()->getUsername())}</div>
                                            {elseif $item->isEmployeeNegociated()}
                                                <div class="classMarginBottom">{__('Negociation required by %s',(string)$item->getEmployerUser()->getFormatter()->getUsername())}</div>
                                            {else}    
                                                <div class="classMarginBottom">{__('Waiting answer from %s',(string)$item->getEmployeeUser()->getFormatter()->getUsername())}</div>
                                            {/if}                                                                                                                

                                            {if $item->isEmployerAccepted()}                                                                                                                                                             
                                                 <div>{__('Quote accepted')}</div>   
                                            {elseif $item->isEmployerRefused()}
                                                 <div>{__('Quote refused')}</div> 
                                            {elseif $item->isEmployerNegociated()}  
                                                <div>{__('Negociation requested')}</div> 
                                        </div>
                                        {else}                                       
                                            <div>
                                                <button type="button" id="{$item->get('id')}" data-action="ACCEPTED" class="EmployerQuotationActions btn btn-outline-success btn-sm">{__('Accepted')}</button>                                                                               
                                                <button type="button" id="{$item->get('id')}" data-action="NEGOCIATED" class="EmployerQuotationActions btn btn-outline-primary btn-sm">{__('Negotiate')}</button>
                                                <button type="button" id="{$item->get('id')}" data-action="REFUSED" class="EmployerQuotationActions btn btn-outline-danger btn-sm">{__('Refused')}</button>       
                                            </div> 
                                        {/if}
                                   {/if}
                                </td>
                                <td class="SaleEmployeeQuotation-PaymentState" id="{$item->get('id')}">
                                    {if $item->isAccepted()}           
                                        {if $item->isPaid()}
                                            <strong>{__('Paid')}</strong>
                                        {elseif $item->isInCart()}
                                            <strong>{__('In cart')}</strong>
                                        {else}    
                                            <button type="button" id="{$item->get('id')}" class="btn btn-outline-success btn-sm AddToCart">{__('Add to cart')}</button> 
                                        {/if}
                                    {/if}
                                </td>
                             {*   <td>                                         
                                    <label class="IconSearch" data-toggle="modal" data-target="#ModalRequest">
                                        <i class="fa fa-search"></i>
                                    </label>                                    
                                </td>*}
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


<div class="modal fade" id="ModalRefused" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <h3>{__('Quote refused')} !!</h3>
                <textarea placeholder="Describe why you refused ad" style="height: 250px;"></textarea>
                <div style="margin-top: 20px;text-align: center;">
                    <button class="btn btn-danger">{__('Refused')}</button>
                </div>
            </div>
        </div>
    </div>
</div>   
                
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
                            url:"{url_to('sales_quotation_ajax',['action'=>'ListPartialQuotationForEmployer'])}" ,                          
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
                                 url:"{url_to('sales_quotation_ajax',['action'=>'ListPartialQuotationForEmployer'])}?page="+$(this).attr('data-page'),                                
                                 target: "#actions"
                });
        });
     
    
    $(".EmployerQuotationActions[data-action=ACCEPTED]").click(function () {              
        return $.ajax2({ data : { SaleEmployeeQuotation : $(this).attr('id') },
                         url :"{url_to('sales_quotation_ajax',['action'=>'SendQuoteAcceptedEmployer'])}",   
                         target : ".list[id="+$(this).attr('id')+"]"      
                         
             });
    });
    
    $(".EmployerQuotationActions[data-action=REFUSED]").click(function () {
        $("#ModalRefused").modal('show');
        return $.ajax2({ data : { SaleEmployeeQuotation : $(this).attr('id') },
                         url :"{url_to('sales_quotation_ajax',['action'=>'SendQuoteRefusedEmployer'])}",   
                         target : ".SaleEmployeeQuotation-State[id="+$(this).attr('id')+"]"      
                         
             });
    });
    
    $(".EmployerQuotationActions[data-action=NEGOCIATED]").click(function () {         
        return $.ajax2({ data : { SaleEmployeeQuotation : $(this).attr('id') },
                         url :"{url_to('sales_quotation_ajax',['action'=>'SendQuoteNegociatedDialogEmployer'])}",   
                         success : function () { $("#ModalQuotation").modal('show'); },
                         target : "#ModalQuotation"
                         
             });
    });
    
     $(".EmployerQuotationActions[data-action=SCHEDULE]").click(function () {       
        return $.ajax2({ data : { SaleEmployeeQuotation : $(this).attr('id') },
                         url :"{url_to('sales_quotation_ajax',['action'=>'SendQuoteScheduleEmployer'])}",            
                         target : ".SaleEmployeeQuotation-Schedule[id="+$(this).attr('id')+"]"     
                         
             });
    });
    
    $(".AddToCart").click(function () {     
        var params = { AddQuotationToCart : { id : $(this).attr('id'), token :'{mfForm::getToken('AddQuotationToCartForm')}' } };
        return $.ajax2({ data : params,
                         url :"{url_to('cart_ajax',['action'=>'AddQuotationToCart'])}",            
                         success : function (resp)  
                                {
                                        if (resp.action !='AddQuotationToCart') return ;
                                        $(".SaleEmployeeQuotation-PaymentState[id="+resp.id+"]").html("<strong>"+resp.state_text+"</strong>");
                                        var cart = $('#SmartCartBtn');
                                        var imgtodrag = $('.tdImageProfile').find("img").eq(0);
                                        if (imgtodrag) {
                                            var imgclone = imgtodrag.clone()
                                                .offset({
                                                top: imgtodrag.offset().top,
                                                left: imgtodrag.offset().left
                                            })
                                                .css({
                                                'opacity': '0.5',
                                                    'position': 'absolute',
                                                    'height': '150px',
                                                    'width': '150px',
                                                    'z-index': '100'
                                            })
                                                .appendTo($('body'))
                                                .animate({
                                                'top': cart.offset().top + 10,
                                                    'left': cart.offset().left + 10,
                                                    'width': 75,
                                                    'height': 75
                                            }, 1000, 'easeInOutExpo');

                                            setTimeout(function () {
                                                cart.effect("shake", {
                                                    times: 2
                                                }, 200);
                                            }, 1500);

                                            imgclone.animate({
                                                'width': 0,
                                                    'height': 0
                                            }, function () {
                                                $(this).detach()
                                            });
                                        }
                                      //  $("#SmartCartBtn").trigger('addtocart',[resp.number_of_items]);                                     
                                      $("#SmartCartBtn").trigger('addtocart',resp.number_of_quotations);
                                }
                         
             });
    });
    
    $(".History").click(function () {       
        return $.ajax2({ data : { SaleEmployeeQuotation : $(this).attr('id') },
                         url :"{url_to('sales_quotation_ajax',['action'=>'DialogHistoryEmployer'])}",            
                          success : function () { $("#ModalQuotation").modal('show'); },
                         target : "#ModalQuotation"
                         
             });
    });
    
    
    $('#DescriptionQuote').keyup(function () {                         
        $('#charNumQuote').text($(this).val().length >= {$max_characters}?"{__('you have reached the limit')}": {$max_characters} - $(this).val().length + "{__(' characters left')}");        
    });
    
    
  $(".DialogMessage").click(function () {       
        return $.ajax2({ data : { SaleEmployeeQuotation : $(this).attr('id') },
                         url :"{url_to('employers_messager_ajax',['action'=>'DialogMessageForQuotation'])}",            
                          success : function () { $("#ModalQuotation").modal('show'); },
                         target : "#ModalQuotation"
                         
             });
    });
</script>