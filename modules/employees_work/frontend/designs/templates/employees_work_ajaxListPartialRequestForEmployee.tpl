<div class="row RowTop">
    <div class="col-md-12 grid-margin classConducteurTop">
      <div class="d-flex justify-content-between flex-wrap">
        <div class="d-flex align-items-end flex-wrap">
          <div class="mr-md-3 mr-xl-5 styleWidth">
            <h2>{__('My Payment advises')}</h2>                   
          </div>
          <div class="d-flex">
            <i class="mdi mdi-home text-muted hover-cursor"></i>
            <a id="Dashboard"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('Dashboard')}</p></a>       
            <p class="text-muted mb-0">&nbsp;/&nbsp;{__('My Payment advises')}</p>
          </div>
        </div>      
      </div>
          {component name="/site_help/help" help="employee-list-payment-request"}
    </div>
</div>
{alerts}
{include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter}
<div style="text-align: right;">      
   {* <button type="button" class="btn btn-{if $formFilter.equal.status->getValue()!='REQUESTED'}outline-{/if}dark equal Status" data-type="dark" name="REQUESTED">{__('Requested')}</button> *}
   {* <button type="button" class="btn btn-{if $formFilter.equal.status->getValue()!='INPROGRESS'}outline-{/if}warning equal Status" data-type="warning" name="INPROGRESS">{__('In progress')}</button> *}
   {if $pager->hasItems()} 
        <button type="button" class="btn btn-{if $formFilter.equal.status->getValue()!='ACCEPTED'}outline-{/if}success equal Status" data-type="success" name="ACCEPTED">{__('Accepted')}</button>
        <button type="button" class="btn btn-{if $formFilter.equal.status->getValue()!='ACTIVE'}outline-{/if}primary equal Status" data-type="primary" name="ACTIVE">{__('Active')}</button>
        <button type="button" class="btn btn-{if $formFilter.equal.status->getValue()!='PLANNED'}outline-{/if}secondary equal Status" data-type="secondary" name="PLANNED">{__('Planned')}</button>
        <button type="button" class="btn btn-{if $formFilter.equal.status->getValue()!='REFUSED'}outline-{/if}danger equal Status" data-type="danger" name="REFUSED">{__('Refused')}</button>
        <button type="button" class="btn btn-{if $formFilter.equal.status->getValue()!='PAID'}outline-{/if}info equal Status" data-type="info" name="PAID">{__('Paid')}</button>
   {/if}
</div>
<div class="col-lg-12 pt-2 stretch-card">
    <div class="card classMargin">
        <div class="card-body">               
            <div class="table-responsive pt-3">
                <table id="PaymentRequests" class="table table-bordered table-striped">
                    <thead class="">
                        <tr role="row">
                            <th>#</th>
                            <th style="text-align: center;">
                               <div class="custom-control custom-checkbox">
                                    {if $formFilter.equal.status->getValue()=='ACCEPTED'}
                                    <input type="checkbox" class="custom-control-input" id="check-all">                                   
                                    <label class="custom-control-label" for="check-all"></label>
                                     {/if}
                                </div> 
                            </th>
                            <th>{__('Ref.')}           

                            </th>
                            <th>{__('Date')}</span>  

                            </th>          
                            <th>{__('Employer')}</span>  
                            </th>                            
                            <th>{__('Amount')}</th>                                                                                                  
                            <th>{__('Actions')}</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>                    
                            <td></td>
                        </tr>
                    </tbody>
                    <tbody>
                        {foreach $pager as $item} 
                            <tr class="list" id="{$item->get('id')}" role="row">
                                <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>  
                                <td style="text-align: center;">
                                    {if $item->getStatus()->isAccepted()}
                                        <div class="custom-control custom-checkbox">
                                            <input value="{$item->get('id')}" type="checkbox" class="custom-control-input Selection {if $formFilter->getSelection()->in($item->get('id'))}Selected{/if}" {if $formFilter->getSelection()->in($item->get('id'))}checked=""{/if} id="check-{$item->get('id')}">
                                            <label class="custom-control-label" for="check-{$item->get('id')}"></label>
                                        </div>
                                        {* <input type="checkbox" class="Selection {if $formFilter->getSelection()->in($item->get('id'))}Selected{/if}" id="{$item->get('id')}"/>*}
                                    {/if}    
                                </td>
                                <td>
                                    {$item->get('reference')}
                                </td> 
                                <td>
                                    {$item->getFormatter()->getDate()->getText()}
                                </td> 
                                <td>
                                    {$item->getEmployerUser()} 
                                </td>                                     
                                <td>
                                    {$item->getFormatter()->getTotalPriceWithTax()->getAmount()} 
                                </td>                                                                                    
                                <td> 

                                </td>                                   
                            </tr>  

                        {/foreach}
                        {if !$pager->hasItems()}
                            <tr role="row" >
                                <td  colspan="13">{__('No payment advise')}</td>
                            </tr>
                        {/if}  
                    </tbody>         
                </table>
                {if $pager->hasItems() && $formFilter.equal.status->getValue()=='ACCEPTED'}
                    <div style="text-align: center;margin-top: 20px;">
                        <button id="ProcessCredit" {if $formFilter->getSelection()->isEmpty()}style="opacity:50%"{/if} class="btn btn-primary">{__('Proceed to credit')}</button>
                    </div>  
                {/if}
            </div>
        </div>
    </div>
</div>
{include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager}

<script type="text/javascript">
    
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
    
           
    $("#PaymentRequests").data('selection',{$formFilter->getSelection()->toJson()});
          
        $(".Selection").click(function () {
           $(this).toggleClass("Selected");        
           if ($(this).hasClass("Selected"))                                                  
                $("#PaymentRequests").data("selection").push($(this).val());        
            else
             $("#PaymentRequests").data("selection").splice($.inArray($(this).val(),$("#PaymentRequests").data("selection")),1);          
           $("#ProcessCredit").css('opacity',$(".Selection.Selected").length?1:0.5);          
        });  
        
    
        $('#Dashboard').click(function(){                                       
          return $.ajax2({ url: "{url_to('employees_ajax',['action'=>'Dashboard'])}",                           
                           target: "#actions"}); 
        }); 
        
         
        $('#ProcessCredit').click(function(){
          if (!$(".Selection.Selected").length) return ;
          var params = { EmployeePaymentCredit : { selection : $("#PaymentRequests").data('selection'), token :'{mfForm::getToken('ProceedToCreditPaymentRequestSelectionForm')}' } };
          return $.ajax2({ data : params,
                           url: "{url_to('employees_work_ajax',['action'=>'ProceedToCredit'])}",                             
                           target: "#actions"
                        }); 
        });  
        
        
        function getFilterParameters()
        {
            var params={ filter: {  order : { }, 
                                    search : { },
                                    equal: {  },                                                                                                                                                                         
                                nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                selection : $("#PaymentRequests").data('selection'),
                                token:'{$formFilter->getCSRFToken()}'
                         } };
            if ($(".order_active").attr("name"))
                 params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");   
            $(".search.Input").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); });  
            $(".equal.Select option:selected").each(function () { params.filter.equal[$(this).parent().attr('name')]=$(this).val(); });
            $(".equal.Status.Selected").each(function () { params.filter.equal.status=$(this).attr('name'); });
            $(".range.Date").each(function () {
               // params.filter.range[$(this).attr('name')]= { }
                if(!params.filter.range[$(this).attr('name')])
                    params.filter.range[$(this).attr('name')]= { };
                params.filter.range[$(this).attr('name')][$(this).attr('date-id')]= $(this).val();
            });
            return params;                  
        }
        function updateFilter()
        {                   
           return $.ajax2({ data: getFilterParameters(), 
                            url:"{url_to('employees_work_ajax',['action'=>'ListPartialRequestForEmployee'])}" ,                          
                            target: "#actions"
                             });
        }
        
        $("#init").click(function() {                   
            return $.ajax2({ 
                      data : { filter: {  order : { }, 
                                    search : { },
                                    equal: {  },                                                                                                                                                                                                    
                                selection : $("#PaymentRequests").data('selection'),
                                token:'{$formFilter->getCSRFToken()}'
                         } },
                      url:"{url_to('employees_work_ajax',['action'=>'ListPartialRequestForEmployee'])}",                                    
                      target: "#actions"}); 
        }); 

       $('.order').click(function() {           
             $(".order_active").attr('class','order');
             $(this).attr('class','order_active');
             return updateFilter();
        });
                    
        $("#filter").click(function() { return updateFilter(); });                                             
        
        $(".search").keypress(function(event) {  if (event.keyCode==13)   return updateFilter(); });

        $("[name=nbitemsbypage],.equal").change(function () {  return updateFilter();  });
    
        $(".pager").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('employees_work_ajax',['action'=>'ListPartialRequestForEmployee'])}?page="+$(this).attr('data-page'),                                
                                 target: "#actions"
                });
        });
       
        $(".equal.Status").click(function () { 
              $(".equal.Status").removeClass('Selected');
              $(this).addClass('Selected');
              return updateFilter();
        });
        
        $('#check-all').click(function() {
            $(".Selection").prop('checked',$(this).prop('checked'));  
            if ($(this).prop('checked'))                   
                $(".Selection").addClass("Selected");                                                     
            else                   
                $(".Selection").removeClass("Selected");                               
            $(".Selection").each(function () {  
                if ($(this).hasClass('Selected'))
                {                       
                    if ($.inArray($(this).val(),$("#PaymentRequests").data("selection")) == -1)
                       $("#PaymentRequests").data("selection").push($(this).val());         
                }
                else
                {                    
                     if ($.inArray($(this).val(),$("#PaymentRequests").data("selection")) != -1)
                        $("#PaymentRequests").data("selection").splice($.inArray($(this).val(),$("#PaymentRequests").data("selection")),1);
                }
             });                          
             $("#ProcessCredit").css('opacity',$(".Selection.Selected").length?1:0.5);        
        }); 
        
        
</script> 
 
