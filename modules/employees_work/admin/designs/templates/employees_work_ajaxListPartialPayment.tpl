
          <div class="row admin-header-container">
            <div class="col-sm">
              <h3 class="admin-header-big-text">{__('Works')}</h3>
              <h3 class="admin-header-small-text">{__('Work payment request management')}</h3>
            </div>
            <div class="col-sm" style="padding: 0;">
                <div style="float: right;">                    
                    <button type="button" class="btn btn-warning">
                     <a id="Process" class="" href="#"><i class="fa fa-cog"></i> {__('Process')}                    
                    </a> 
                    <input type="text" class="" size="8" id="Date" value="{if $date}{$date->getText()}{/if}"/>
                    </button>
                     
                </div> 
            </div>
          </div>
          
          <div class="breadcrumb-title">
            <p>            
                <i class="fa fa-home" style="color: #37bc9b;"></i>              
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Work Payment Requests')}              
            </p>
          </div>         
{alerts}
         <div class="table-responsive bg-white px-1 py-2">
             <div class="col-md-12">
                
                <div class="float-left w-50">
                      {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager}  
                </div>       
    <button type="button" id="All" class="btn btn-{$formFilter.in.status->in(null,'','outline-')}warning {$formFilter.in.status->in(null,'Selected')}" data-name="status">{__('All')}</button>
    <button type="button" class="btn btn-{$formFilter.in.status->in('INPROGRESS','','outline-')}warning in Status Button {$formFilter.in.status->in('INPROGRESS','Selected')}" data-type="warning" data-name="status" data-value="INPROGRESS">{__('In progress')}</button>
    <button type="button" class="btn btn-{$formFilter.in.status->in('ACCEPTED','','outline-')}success in Status Button {$formFilter.in.status->in('ACCEPTED','Selected')}" data-type="success" data-name="status" data-value="ACCEPTED">{__('Accepted')}</button>
    <button type="button" class="btn btn-{$formFilter.in.status->in('ACTIVE','','outline-')}primary in Status Button {$formFilter.in.status->in('ACTIVE','Selected')}" data-type="primary" data-name="status" data-value="ACTIVE">{__('Active')}</button>
    <button type="button" class="btn btn-{$formFilter.in.status->in('PLANNED','','outline-')}secondary in Status Button {$formFilter.in.status->in('PLANNED','Selected')}" data-type="secondary" data-name="status" data-value="PLANNED">{__('Planned')}</button>
    <button type="button" class="btn btn-{$formFilter.in.status->in('REFUSED','','outline-')}danger in Status Button {$formFilter.in.status->in('REFUSED','Selected')}" data-type="danger" data-name="status" data-value="REFUSED">{__('Refused')}</button>
    <button type="button" class="btn btn-{$formFilter.in.status->in('PAID','','outline-')}info in Status Button {$formFilter.in.status->in('PAID','Selected')}" data-type="info" data-name="status" data-value="PAID">{__('Paid')}</button>

    <button type="button" class="btn btn-{$formFilter.equal.confirmed_at->getValueExist('IS_NULL','','outline-')}info equal ConfirmedAt Button {$formFilter.equal.confirmed_at->getValueExist('IS_NULL','Selected')}" data-type="info" data-name="confirmed_at"  data-value="IS_NULL">{__('Not confirmed')}</button>
    <button type="button" class="btn btn-{$formFilter.equal.confirmed_at->getValueExist('IS_NOT_NULL','','outline-')}info equal ConfirmedAt Button {$formFilter.equal.confirmed_at->getValueExist('IS_NOT_NULL','Selected')}" data-name="confirmed_at"  data-type="info" data-value="IS_NOT_NULL">{__('Confirmed')}</button>

                <button id="filter" class="btn btn-primary" style="float: right; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Filter")}</button>   
                <button id="init" class="btn btn-primary" style="float: right; margin-right: 10px; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Init")}</button>
             </div>
   
      <table class="table table-bordered table-hover table-striped" cellpadding="0" cellspacing="0"> 
        <thead class="bgSpec">
        <tr class="list-header">
            <th>#</th>
            <th>{__('Ref.')}           
              
            </th>
            <th>
                {__('Work')}
            </th>
            <th>
                {__('Order')}
            </th>
            <th>{__('Date')}</span>  
               
            </th>
             <th>{__('Request Date')}</span>  
               
            </th>
            <th>{__('Employee')}</span>  
            </th>
              <th>{__('Employer')}           
               
            </th> 
             <th>{__('Amount')}</th>                                   
             <th>
                {__('State')}
            </th>
             <th>
                <span>{__('Created At')}</span>   
               {* <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.created_at->getValueExist('asc','_active')}" id="asc" name="created_at"><i class="fas fa-sort-up {if $formFilter.order.created_at->getValue()=='asc'}text-dark{/if}"></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.created_at->getValueExist('desc','_active')}" id="desc" name="created_at"><i class="fas fa-sort-down {if $formFilter.order.created_at->getValue()=='desc'}text-dark{/if}"></i></a>           
                </div> *}
            </th>           
            <th>{__('Actions')}</th>
         </tr>
      </thead>
      <tbody>
          <tr role="row">
              <td></td>
              <td>
                   <input  placeholder="{__('Reference')}" class="search form-control Input" type="text" size="5" name="request_reference" value="{$formFilter.search.request_reference}">
              </td>
              <td>
                     <input  placeholder="{__('Reference')}" class="search form-control Input" type="text" size="5" name="work_reference" value="{$formFilter.search.work_reference}">
              </td>
              <td>
                     <input  placeholder="{__('Reference')}" class="search form-control Input" type="text" size="5" name="order_reference" value="{$formFilter.search.order_reference}">
              </td>
                     <td></td>
              <td></td>
              <td></td>
               <td></td>
              <td></td>
              <td></td>
               <td>                   
                </td> 
              <td>
                  {*  <input class="form-control form-control-sm ml-1 InputTexte RowBlock Range Date CreatedAtDate" id="created_at_from" date-id="from" placeholder="{__('From')}" name="created_at" value="{if $formFilter->hasErrors()}{$formFilter.range.created_at.from}{else}{format_date($formFilter.range.created_at.from,'a')}{/if}">
                    <input class="form-control form-control-sm ml-1  InputTexte RowBlock Range Date CreatedAtDate" id="created_at_to" date-id="to" placeholder="{__('To')}" name="created_at" value="{if $formFilter->hasErrors()}{$formFilter.range.created_at.to}{else}{format_date($formFilter.range.created_at.to,'a')}{/if}"> *}
                </td>
               
          </tr>
      
       {foreach $pager as $item} 
       <tr class="list" id="{$item->get('id')}" role="row">
          <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>
          <td>
              {$item->get('reference')}          
              <a href="#"  {if $item->getStatus()->isAccepted() || $item->getStatus()->isActive()}style="display:none"{/if} title="{__('Active payment')}" class="list-action text-alert EmployeeWorkPayments-Active" id="{$item->get('id')}"><i class="fa fa-cog"></i></a>
              <a href="#"  {if !$item->getStatus()->isActive()}style="display:none"{/if} title="{__('Planned status')}" class="list-action text-alert EmployeeWorkPayments-Planned" id="{$item->get('id')}"><i class="fa fa-calendar"></i></a>             
              <div>
                  {$item->getProject()->get('reference')}
              </div>
          </td>
           <td>             
              <a href="#" class="Works" id="{$item->getWork()->get('id')}">{$item->getWork()->get('reference')}</a>
          </td>
            <td>              
                <a href="#" class="Orders" id="{$item->getWork()->getOrder()->get('id')}">{$item->getWork()->getOrder()->get('reference')}</a>
          </td>
           <td>
               <span class="{if $item->getFormatter()->getDate()->isOver()}text-danger{/if}">{$item->getFormatter()->getDate()->getText()}</span>
          </td> 
          <td>
              <span class="{if $item->getFormatter()->getRequestedAt()->isOver()}text-danger{/if}">{$item->getFormatter()->getRequestedAt()->getText()}</span>
          </td>
          <td>
              {$item->getEmployeeUser()} 
          </td>  
           <td>
              {$item->getEmployerUser()} 
          </td>  
            <td>
                 {$item->getFormatter()->getTotalPriceWithTax()->getAmount()} 
             </td>               
             <td class="EmployeeWorkPaymentStatus" id="{$item->get('id')}">
                  {$item->getStatus()}
             </td>
               <td>
               {$item->getFormatter()->getCreatedAt()->getText()}
             </td>
             <td>          
                 {*if !$item->isConfirmed() && ($item->getStatus()->isActive() || $item->getStatus()->isRefused() || $item->getRequestedAt()->isOver())*}
                <button  {if !$item->getStatus()->hasConfirmed()}style="display:none"{/if} id="{$item->get('id')}" class="EmployeeWorkPayments-Confirm btn btn-outline-success btn-sm">{__('Confirmed')}</button>               
                <div class="EmployeeWorkPaymentConfirmed" id="{$item->get('id')}">
                    {if $item->isConfirmed()}
                    {__("Confirmed at %s",$item->getFormatter()->getConfirmedAt()->getText())}                    
                    {/if}    
                </div>                
                 <div class="EmployeeWorkPaymentStatus-Actions" id="{$item->get('id')}">
                    {if $item->getStatus()->isRefused()}
                    {__("Refused at %s",$item->getFormatter()->getRefusedAt()->getText())}
                    {elseif $item->getStatus()->isAccepted() && $item->hasAcceptedAt()}
                     {__("Accepted at %s by employer",$item->getFormatter()->getAcceptedAt()->getText())}
                    {elseif $item->getStatus()->isAccepted()}
                     {__("Accepted at %s by default",$item->getFormatter()->getAcceptedAt()->getText())}                   
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
         {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager}
      </div>
  
<script type="text/javascript">
    
     $("#Date").datepicker();
      
      var created_at_dates = $( ".Range.CreatedAtDate#created_at_from, .Range.CreatedAtDate#created_at_to" ).datepicker({
                            onSelect: function( selectedDate ) {
                                    var option = this.id == "created_at_from" ? "minDate" : "maxDate",
                                            instance = $( this ).data( "datepicker" ),
                                            date = $.datepicker.parseDate(
                                                    instance.settings.dateFormat ||
                                                    $.datepicker._defaults.dateFormat,
                                                    selectedDate, instance.settings );
                                    created_at_dates.not( this ).datepicker( "option", option, date );
        } } );
       
     function getFilterParameters()
        {
            var params={ filter: {  order : { }, 
                                    search : { },
                                    equal : { },
                                    in : {  status : [ ] },                                                                                                                                                                         
                                nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                token:'{$formFilter->getCSRFToken()}'
                         } };
            if ($(".order_active").attr("name"))
                 params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");   
            $(".search.Input").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); });  
            $(".equal.Select option:selected").each(function () { params.filter.equal[$(this).parent().attr('name')]=$(this).val(); });         
            $(".in.Button.Selected").each(function () { params.filter.in[$(this).attr('data-name')].push($(this).attr('data-value')); }); 
            $(".equal.Button.Selected").each(function () { params.filter.equal[$(this).attr('data-name')]=$(this).attr('data-value'); }); 
            $(".Range.Date").each(function () {
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
                            url:"{url_to('employees_work_ajax',['action'=>'ListPartialPayment'])}" ,                          
                            target: "#actions"
                             });
        }
        
        $(".search").keypress(function(event) {  if (event.keyCode==13)   return updateFilter(); });

        $("[name=nbitemsbypage],.equal").change(function () {  return updateFilter();  });
    
        $(".pager").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('employees_work_ajax',['action'=>'ListPartialPayment'])}?page="+$(this).attr('data-page'),                                
                                 target: "#actions"
                });
        });
             
           $("#init").click(function() {                   
              return $.ajax2({ url:"{url_to('employees_work_ajax',['action'=>'ListPartialPayment'])}",                                    
                         target: "#actions"}); 
           }); 
    
          $('.order').click(function() {            
                $(".order_active").attr('class','order');
                $(this).attr('class','order_active');
                return updateFilter();
           });                 
            
        $("#filter").click(function() { return updateFilter(); });                                   
     
      
 $(".EmployeeWorkPayments-Confirm").click(function(){                                       
          return $.ajax2({ data : { EmployeeWorkPaymentRequest : $(this).attr('id') },
                           url: "{url_to('employees_work_ajax',['action'=>'RequestConfirmed'])}",    
                           success : function (resp)
                                {   
                                     if (resp.action !='RequestConfirmed') return ;
                                     $(".EmployeeWorkPayments-Confirm[id="+resp.id+"]").remove();                                    
                                     $(".EmployeeWorkPaymentConfirmed[id="+resp.id+"]").html(resp.confirmed);
                                     $(".EmployeeWorkPaymentStatus[id="+resp.id+"]").html(resp.status);
                                     $(".EmployeeWorkPaymentStatus-Actions[id="+resp.id+"]").html(resp.status_actions);
                                }
                         }); 
        }); 
        
        
         $(".EmployeeWorkPayments-Active").click(function(){                                       
          return $.ajax2({ data : { EmployeeWorkPaymentRequest : $(this).attr('id') },
                           url: "{url_to('employees_work_ajax',['action'=>'RequestActive'])}",    
                           success : function (resp)
                                {   
                                     if (resp.action !='RequestActive') return ;
                                     $(".EmployeeWorkPayments-Active[id="+resp.id+"]").hide();                                                                     
                                     $(".EmployeeWorkPaymentStatus[id="+resp.id+"]").html(resp.status); 
                                     $(".EmployeeWorkPayments-Confirm[id="+resp.id+"],.EmployeeWorkPayments-Planned[id="+resp.id+"]").show();                                        
                                }
                         }); 
        }); 
        
       $(".EmployeeWorkPayments-Planned").click(function(){                                       
          return $.ajax2({ data : { EmployeeWorkPaymentRequest : $(this).attr('id') },
                           url: "{url_to('employees_work_ajax',['action'=>'RequestPlanned'])}",    
                           success : function (resp)
                                {   
                                     if (resp.action !='RequestPlanned') return ;
                                      $(".EmployeeWorkPayments-Active[id="+resp.id+"]").show();                                                                     
                                      $(".EmployeeWorkPaymentStatus[id="+resp.id+"]").html(resp.status); 
                                      $(".EmployeeWorkPayments-Planned[id="+resp.id+"]").hide();  
                                      if (resp.confirmed)
                                        $(".EmployeeWorkPayments-Confirm[id="+resp.id+"]").show();       
                                      else
                                        $(".EmployeeWorkPayments-Confirm[id="+resp.id+"]").hide();       
                                }
                         }); 
        });
        
        $("#All").click(function () {            
             $(".in.Button").toggleClass('Selected');
             return updateFilter();
        });
        
        $(".in.Button").click(function () {            
              $(this).toggleClass('Selected');
             return updateFilter();
        });
        
         $(".equal.Button").click(function () { 
              $(".equal.Button[data-name="+$(this).attr('data-name')+"]").removeClass('Selected');
              $(this).addClass('Selected');
              return updateFilter();
        });
        
       $("#Process").click(function() {                   
              return $.ajax2({           
                         data : { EmployeeProcessRequests : {  date: $("#Date").val(), token: '{mfForm::getToken('ProcessRequestsForm')}' } },
                         url:"{url_to('employees_work_ajax',['action'=>'ProcessRequests'])}",                                    
                         target: "#actions"}); 
           });
   
</script>

