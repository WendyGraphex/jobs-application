
          <div class="row admin-header-container">
            <div class="col-sm">
              <h3 class="admin-header-big-text">{__('Payments')}</h3>
              <h3 class="admin-header-small-text">{__('Payment management')}</h3>
            </div>
            <div class="col-sm" style="padding: 0;">
                <div style="float: right;"> 
                {*  <a class="btn btn-warning admin-header-button" href="#"><i class="fa fa-file-excel"></i> {__('Export XLS')}</a> *}
                </div> 
            </div>
          </div>
          
          <!-- End page heading -->
          
          <!-- Begin breadcrumb -->
          <div class="breadcrumb-title">
            <p>               
                <i class="fa fa-home" style="color: #37bc9b;"></i>                
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Payments')}
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Freelancers')}
                  <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Bankwire')}
            </p>
          </div>
          <!-- End breadcrumb -->
{alerts}
           <!-- Begin Add User -->
         <div class="table-responsive bg-white px-1 py-2">
             <div class="col-md-12">
                
                <div class="float-left w-50">
                      {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager}  
                </div>
                <button id="filter" class="btn btn-primary" style="float: right; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Filter")}</button>   
                <button id="init" class="btn btn-primary" style="float: right; margin-right: 10px; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Init")}</button>
             </div>
   
      <table class="table table-bordered table-hover table-striped" cellpadding="0" cellspacing="0"> 
        <thead class="bgSpec">
        <tr class="list-header">
        <th>#</th>
            <th>{__('Ref.')}           
               
            </th>
          {*  <th>{__('Order Ref.')}           
               
            </th> *}
            <th>{__('Freelancer')}</span>  
            </th>  
            
            <th>
                {__('Total Order')}
            </th>
         {*    <th>
                {__('Fee')}
            </th> *}
             <th>
                {__('Total')}
            </th>
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
             {*   <td> 
                   
                </td> *}
                 <td> 
                   
                </td>
          </tr>
      
       {foreach $pager as $item} 
      <tr class="list" id="{$item->get('id')}" role="row">
          <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>
          <td>
              {$item->get('reference')}
          </td> 
          {* <td>
              {$item->getOrder()->get('reference')}
          </td> *}
          <td>
              {$item->getEmployeeUser()} 
          </td>
              
           <td>{$item->getFormatter()->getTotalPriceWithTax()->getAmount()}</td>
            {*  <td>{$item->getFormatter()->getPaymentPriceWithTax()->getAmount()}</td> *}
            <td>{$item->getFormatter()->getGeneralPriceWithTax()->getAmount()}</td>           
            <td class="State" id="{$item->get('id')}">
                 {$item->getState()}
            </td>
             <td>       
                 {$item->getFormatter()->getCreatedAt()->getFormatted()}  
            </td> 
            <td>        
                <a href="#" class="list-action Requests" id="{$item->get('id')}"><i class="fa fa-list"></i></a>
                 <a href="#" class="list-action Details" id="{$item->get('id')}"><i class="fa fa-search"></i></a>
                 {if $item->getState()->isTodo()}
                     <button type="button" id="{$item->get('id')}" class="btn btn-success btn-sm Paid">{__('Paid')}</button> 
                 {/if}
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
   </div>    
  

<script type="text/javascript">
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
                                    equal: {  },                                                                                                                                                                         
                                nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                token:'{$formFilter->getCSRFToken()}'
                         } };
            if ($(".order_active").attr("name"))
                 params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");   
            $(".search.Input").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); });  
            $(".equal.Select option:selected").each(function () { params.filter.equal[$(this).parent().attr('name')]=$(this).val(); });
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
                            url:"{url_to('payments_bankwire_ajax',['action'=>'ListPartialCredit'])}" ,                          
                            target: "#actions"
                             });
        }
        
        $(".search").keypress(function(event) {  if (event.keyCode==13)   return updateFilter(); });

        $("[name=nbitemsbypage],.equal").change(function () {  return updateFilter();  });
    
        $(".pager").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('payments_bankwire_ajax',['action'=>'ListPartialCredit'])}?page="+$(this).attr('data-page'),                                
                                 target: "#actions"
                });
        });
             
        $("#init").click(function() {                   
              return $.ajax2({ url:"{url_to('payments_bankwire_ajax',['action'=>'ListPartialCredit'])}",                                    
                         target: "#actions"}); 
        }); 
    
        $('.order').click(function() {            
                $(".order_active").attr('class','order');
                $(this).attr('class','order_active');
                return updateFilter();
        });                 
            
        $("#filter").click(function() { return updateFilter(); });                                   
        
        $(".Paid").click(function() {                   
              return $.ajax2({ 
                         data : { PaymentEmployee : $(this).attr('id') },
                         url:"{url_to('payments_employee_ajax',['action'=>'Paid'])}",                                    
                         success : function (resp) { 
                                    if (resp.action !='PaymentPaid') return ;
                                    $(".State[id="+resp.id+"]").html(resp.state);
                                    $(".Paid[id="+resp.id+"]").hide();
                         }  
              }); 
        }); 
        
        $(".Requests").click(function() {                   
              return $.ajax2({ data : { PaymentEmployee : $(this).attr('id') },
                         url:"{url_to('payments_employee_ajax',['action'=>'ListPartialRequestForPaymentForMethod'])}",                                    
                         target: "#actions"}); 
        });
        
        
           $(".Details").click(function() {                   
              return $.ajax2({ data : { PaymentEmployee : $(this).attr('id') },
                         url:"{url_to('payments_bankwire_ajax',['action'=>'ViewDetails'])}",                                    
                         target: "#actions"}); 
        });
</script>


