<div class="row admin-header-container">
            <div class="col-sm">
              <h3 class="admin-header-big-text">{__('Billings')}</h3>
              <h3 class="admin-header-small-text">{__('Billings')}</h3>
            </div>
            <div class="col-sm" style="padding: 0;">
                <div style="float: right;"> 
                    <a class="btn btn-warning admin-header-button" href="#"><i class="fa fa-file-excel"></i> {__('Export XLS')}</a>
                    {*<a class="btn btn-success admin-header-button"  href="#" id="New"><i class="fa fa-plus"></i> {__('Add Billing')}</a>*}
                </div> 
            </div>
          </div>

<!-- End page heading -->

<!-- Begin breadcrumb -->
<div class="breadcrumb-title">
  <p>              
      <i class="fa fa-home" style="color: #37bc9b;"></i>               
      <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Sales')}
      <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Billings')}
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
        <th>
            <span>{__('ID')}</span>   
            <div style="float: right;">
                <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><i class="fas fa-sort-up {if $formFilter.order.id->getValue()=='asc'}text-dark{/if}"></i></a>
                <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><i class="fas fa-sort-down {if $formFilter.order.id->getValue()=='desc'}text-dark{/if}"></i></a>           
            </div>
        </th>
            <th class="footable-first-column" data-toggle="true">
                <span>{__('Ref.')}</span>                      
            </th>
               <th class="footable-first-column" data-toggle="true">
                <span>{__('Order')}</span>                      
            </th>
           <th class="footable-first-column" data-toggle="true">
                <span>{__('Employer')}</span>   
                
            </th>
            <th class="footable-first-column" data-toggle="true">
                <span>{__('Number of quotations')}</span>   
               
            </th>
            
            <th class="footable-first-column" data-toggle="true">
                <span>{__('Sale')}</span>   
                
            </th>
            <th class="footable-first-column" data-toggle="true">
                <span>{__('Commission')}</span>   
                
            </th>
             <th class="footable-first-column" data-toggle="true">
                <span>{__('Services')}</span>   
                
            </th>
             <th class="footable-first-column" data-toggle="true">
                <span>{__('Total')}</span>   
                
            </th>
             <th style="width: 230px;" class="footable-first-column" data-toggle="true">
                <span>{__('Created At')}</span>   
                <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.created_at->getValueExist('asc','_active')}" id="asc" name="created_at"><i class="fas fa-sort-up {if $formFilter.order.created_at->getValue()=='asc'}text-dark{/if}"></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.created_at->getValueExist('desc','_active')}" id="desc" name="created_at"><i class="fas fa-sort-down {if $formFilter.order.created_at->getValue()=='desc'}text-dark{/if}"></i></a>           
                </div>
            </th>                         
            <th data-hide="phone" style="display: table-cell; background-color: #36bc9a; color: white;">{__('Actions')}</th>
        </tr>
      </thead>
      <tr class=" input-list">
                <td></td>
                <td></td>
                <td></td>
                <td></td> 
                   <td></td> 
                 <td></td> 
                 <td></td> 
                <td>                  
                </td>
                <td></td>
                <td></td>
                <td>
                    <input class="form-control form-control-sm ml-1 InputTexte RowBlock Range Date CreatedAtDate" id="created_at_from" date-id="from" placeholder="{__('From')}" name="created_at" value="{if $formFilter->hasErrors()}{$formFilter.range.created_at.from}{else}{format_date($formFilter.range.created_at.from,'a')}{/if}">
                    <input class="form-control form-control-sm ml-1  InputTexte RowBlock Range Date CreatedAtDate" id="created_at_to" date-id="to" placeholder="{__('To')}" name="created_at" value="{if $formFilter->hasErrors()}{$formFilter.range.created_at.to}{else}{format_date($formFilter.range.created_at.to,'a')}{/if}">
                </td>
               <td></td>               
            </tr>
      <tbody>
        {foreach $pager as $item}
    <tr class="list"  id="{$item->get('id')}">
    <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>
    <td>{$item->get('id')}</td>
                 <td>                
                     {$item->get('reference')}   
                </td>
                <td>                     
                     <a href="#" class="ShowModalOrder list-action text-info Order" id="{$item->getOrder()->get('id')}"  title="{__('View Order')}">{$item->getOrder()->get('reference')}</a>   
                </td> 
                 <td>                
                     {$item->getEmployerUser()}     
                </td>
                <td>             
                   {$item->getFormatter()->getNumberOfQuotations()->getText()}    
                </td>
                 <td>                
                    {$item->getFormatter()->getTotalSalePriceWithTax()->getAmount()}    
                </td>
                 <td>{$item->getFormatter()->getCommissionWithTax()->getAmount()}</td> 
                 <td>
                     {$item->getFormatter()->getPaymentSalePriceWithTax()->getAmount()} 
                 </td>
                 <td>
                    {$item->getFormatter()->getGeneralSalePriceWithTax()->getAmount()} 
                 </td>
                <td>       
                        {$item->getFormatter()->getCreatedAt()->getFormatted()}
                </td>                                 
                <td>     
                    <a href="#" class="list-action text-info Billing" id="{$item->get('id')}"  title="{__('View billing')}"><i class="fa fa-search"></i></a>    
                  <a target="_blank" href="{url_to('sales_billing',['action'=>'ExportPdf'])}?billing={$item->get('id')}" class="list-action text-info" title="{__('Billing')}"><i class="fa fa-file"></i></a>              
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
       {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager} 
<!--     <div class="row">
      <div class="col-sm-5"><div class="dataTables_info" id="Myliste_info" role="status" aria-live="polite">Showing 1 to 10 of 2,222 entries</div></div><div class="col-sm-7"><div class="dataTables_paginate paging_simple_numbers" id="Myliste_paginate"><ul class="pagination"><li class="paginate_button previous disabled" id="Myliste_previous"><a href="#" aria-controls="Myliste" data-dt-idx="0" tabindex="0">Previous</a></li><li class="paginate_button active"><a href="#" aria-controls="Myliste" data-dt-idx="1" tabindex="0">1</a></li><li class="paginate_button "><a href="#" aria-controls="Myliste" data-dt-idx="2" tabindex="0">2</a></li><li class="paginate_button "><a href="#" aria-controls="Myliste" data-dt-idx="3" tabindex="0">3</a></li><li class="paginate_button "><a href="#" aria-controls="Myliste" data-dt-idx="4" tabindex="0">4</a></li><li class="paginate_button "><a href="#" aria-controls="Myliste" data-dt-idx="5" tabindex="0">5</a></li><li class="paginate_button disabled" id="Myliste_ellipsis"><a href="#" aria-controls="Myliste" data-dt-idx="6" tabindex="0">…</a></li><li class="paginate_button "><a href="#" aria-controls="Myliste" data-dt-idx="7" tabindex="0">223</a></li><li class="paginate_button next" id="Myliste_next"><a href="#" aria-controls="Myliste" data-dt-idx="8" tabindex="0">Next</a></li></ul></div></div>
    </div> 
    </div>-->
  </div><!--End list-->


    <div class="modal fade" id="ModalOrder" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="border-bottom: none;padding-bottom: 0px;">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    zetrererererererererererereret
                    <img src="/pictures/Graphex.png"/>
                </div>
            </div>
        </div>
    </div>

     

<script type="text/javascript">
    $(".ShowModalOrder").click(function () {
        $("#ModalOrder").modal('show');
    });
    
{* =================================== METHODS ======================================================== *}
    
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

    var updated_dates = $( ".Range.UpdatedAtDate#updated_at_from, .Range.UpdatedAtDate#updated_at_to" ).datepicker({
			onSelect: function( selectedDate ) {
				var option = this.id == "updated_at_from" ? "minDate" : "maxDate",
					instance = $( this ).data( "datepicker" ),
					date = $.datepicker.parseDate(
						instance.settings.dateFormat ||
						$.datepicker._defaults.dateFormat,
						selectedDate, instance.settings );
				updated_dates.not( this ).datepicker( "option", option, date );
    } } );


    
      function getFilterParameters()
        {
            var params={ filter: {  order : { }, 
                                    search : { },
                                    equal: { },
                                    range : { },                                                                                                                                         
                                nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                token:'{$formFilter->getCSRFToken()}'
                         } };
            if ($(".order_active").attr("name"))
                 params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");   
            $(".search").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); }); 
            $(".Range.Date").each(function () {              
                if(!params.filter.range[$(this).attr('name')])
                    params.filter.range[$(this).attr('name')]= { };
                params.filter.range[$(this).attr('name')][$(this).attr('date-id')]= $(this).val();
            });
            return params;                  
        }
        function updateFilter()
        {          
           return $.ajax2({ data: getFilterParameters(), 
                            url:"{url_to('sales_billing_ajax',['action'=>'ListPartialBilling'])}" ,                          
                            target: "#actions"
                             });
        }
        
{* =================================== ACTIONS ======================================================== *}
        
        $(".search").keypress(function(event) {  if (event.keyCode==13)   return updateFilter(); });

        $("[name=nbitemsbypage]").change(function () {  return updateFilter();  });
    
        $(".pager").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('sales_billing_ajax',['action'=>'ListPartialBilling'])}?page="+$(this).attr('data-page'),                                
                                 target: "#actions"
                });
        });
          
        
       $(".Delete").click( function () { 
                if (!confirm('{__("Billing \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ SaleBilling: $(this).attr('id') },
                                 url :"{url_to('sales_billing_ajax',['action'=>'DeleteBilling'])}",                               
                                 success : function(resp) {
                                       if (resp.action!='DeleteBilling') return ;                                          
                                          $(".list[id="+resp.id+"]").remove();  
                                          if ($('.list').length==0) return updateFilter();                                          
                                 }
                     });                                        
            });


  {* =====================  P A G E R  A C T I O N S =============================== *}  
      
           $("#init").click(function() {                   
               $.ajax2({ url:"{url_to('sales_billing_ajax',['action'=>'ListPartialBilling'])}",                                    
                         target: "#actions"}); 
           }); 
    
          $('.order').click(function() {
                $(".order_active").attr('class','order');
                $(this).attr('class','order_active');
                return updateFilter();
           });
           
            $(".search").keypress(function(event) {
                if (event.keyCode==13)
                    return updateFilter();
            });
            
          $("#filter").click(function() { return updateFilter(); }); 
          
          $("[name=nbitemsbypage]").change(function() { return updateFilter(); }); 
          
         // $("[name=name]").change(function() { return updateFilter(); }); 
           
           $(".pager").click(function () {                      
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('sales_billing_ajax',['action'=>'ListPartialBilling'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length),
                                target: "#actions"
                });
        });    
        
        $(".equal").change(function() { return updateFilter(); });  
     
     
       $(".Display").click(function() {                   
               $.ajax2({ data : { SaleBilling : $(this).attr('id') },
                         url:"{url_to('sales_billing_ajax',['action'=>'DisplayBilling'])}",                                    
                         target: "#actions"}); 
           });
</script>
  