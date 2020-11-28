
          <div class="row admin-header-container">
            <div class="col-sm">
              <h3 class="admin-header-big-text">{__('Projects')}</h3>
              <h3 class="admin-header-small-text">{__('Project management')}</h3>
            </div>
            <div class="col-sm" style="padding: 0;">
                <div style="float: right;"> 
                {*  <a class="btn btn-warning admin-header-button" href="#"><i class="fa fa-file-excel"></i> {__('Export XLS')}</a> *}
                </div> 
            </div>
          </div>
          
          <div class="breadcrumb-title">
            <p>            
                <i class="fa fa-home" style="color: #37bc9b;"></i>              
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Projects')}              
            </p>
          </div>         
{alerts}
       
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
            <th>{__('Name')}</span>  
               
            </th>
            <th>{__('Employer')}           
               
            </th> 
            <th>{__('Freelancer')}</span>  
            </th>   
             <th>{__('Quotation/Order/Work')}</span>                 
            </th>
           <th>{__('Start at')}</th>       
            <th>{__('End at')}</th> 
             <th>{__('Tasks')}</th> 
               <th>{__('Total')}</th> 
               <th>{__('Unpaid')}</th> 
               <th>{__('Paid')}</th> 
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
                <td> 
                   
                </td>
                 <td> 
                   
                </td>
          </tr>
      
       {foreach $pager as $item} 
      <tr class="list" id="{$item->get('id')}" role="row">
          <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>
          <td>
              {$item->get('reference')}
          </td> 
           <td>
              {$item->get('name')}
          </td> 
          <td>
              {$item->getEmployerUser()} 
          </td>
          <td>
               {$item->getEmployeeUser()}  
          </td>   
          <td>
              <div><a href="#" title="{__('Quotation')}" class="Quotation" id="{$item->get('id')}">{$item->getQuotation()->get('reference')}</a></div>
              <div><a href="#" title="{__('Order')}" class="Order" id="{$item->get('id')}">{$item->getOrder()->get('reference')}</a></div>
              <div><a href="#" title="{__('Work')}" class="Work" id="{$item->get('id')}">{$item->getWork()->get('reference')}</a></div>
          </td>
           <td> 
                {if $item->hasStartAt()}
                     {$item->getFormatter()->getStartAt()->getText()}               
                {/if}  
           </td>
           <td>
                {if $item->hasEndAt()}
                    {$item->getFormatter()->getEndAt()->getText()}                                        
                {/if}
           </td>
            <td>{$item->getFormatter()->getNumberOfTasks()->getText("#")}</td>           
            <td>
                <div>{$item->getWork()->getFormatter()->getTotalPriceWithTax()->getAmount()}</div>
                <div>{$item->getWork()->getFormatter()->getNumberOfPayments()->getChoices("[0]no payment|[1]one payment|(1,Inf]%s payments")}</div>
            </td>
             <td>
               {$item->getWork()->getFormatter()->getTotalUnPaidWithTax()->getAmount()}
            </td>
            <td>
                  {$item->getWork()->getFormatter()->getTotalPaidWithTax()->getAmount()}
            </td>
              <td>{$item->getStatus()->getI18n()}</td>
             <td>       
                 {$item->getFormatter()->getCreatedAt()->getFormatted()}  
            </td> 
            <td>                
                 <a href="#" id="{$item->get('id')}" class="list-action Requests" title="{__('Payment requests')}"><i class="fa fa-dollar-sign"></i></a>               
                 <a href="#" id="{$item->get('id')}" class="list-action Details" title="{__('Details')}"><i class="fa fa-search"></i></a>
                 <a href="#" id="{$item->get('id')}" class="list-action Tasks" title="{__('Tasks')}"><i class="fa fa-list"></i></a>                
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
  
<div id="ProjectDialog" class="modal fade" role="dialog">
   <div class="modal-dialog" role="document" style="top: 30%;">
    <div class="modal-content" id="ProjectDialog-ctn">     
    </div>
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
                                    equal: {  is_active:$(".equal[name=is_active] option:selected").val()
                                           },                                                                                                                                                                         
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
                            url:"{url_to('projects_ajax',['action'=>'ListPartialProject'])}" ,                          
                            target: "#actions"
                             });
        }
        
        $(".search").keypress(function(event) {  if (event.keyCode==13)   return updateFilter(); });

        $("[name=nbitemsbypage],.equal").change(function () {  return updateFilter();  });
    
        $(".pager").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('projects_ajax',['action'=>'ListPartialProject'])}?page="+$(this).attr('data-page'),                                
                                 target: "#actions"
                });
        });
             
           $("#init").click(function() {                   
              return $.ajax2({ url:"{url_to('projects_ajax',['action'=>'ListPartialProject'])}",                                    
                         target: "#actions"}); 
           }); 
    
          $('.order').click(function() {            
                $(".order_active").attr('class','order');
                $(this).attr('class','order_active');
                return updateFilter();
           });                 
            
        $("#filter").click(function() { return updateFilter(); });                                   
     
     
        $('.Requests').click(function(){                                       
          return $.ajax2({ data : { Project : $(this).attr('id') },
                           url: "{url_to('projects_ajax',['action'=>'ListPartialRequestForProject'])}",                           
                           target: "#actions"}); 
        }); 
        
         $('.Tasks').click(function(){                                       
          return $.ajax2({ data : { Project : $(this).attr('id') },
                           url: "{url_to('projects_ajax',['action'=>'ListPartialTaskForProject'])}",                           
                           target: "#actions"}); 
        });
        
        $('.Details').click(function(){                                       
          return $.ajax2({ data : { Project : $(this).attr('id') },
                           url: "{url_to('projects_ajax',['action'=>'DetailsForProject'])}",                           
                           target: "#actions"}); 
        });
        
        
        $('.Order').click(function(){                                       
          return $.ajax2({ data : { Project : $(this).attr('id') },
                           url: "{url_to('sales_order_ajax',['action'=>'DialogOrderForProject'])}",                           
                            success : function () { $("#ProjectDialog").modal('show') },
                           target: "#ProjectDialog-ctn"}); 
        });
        
         $('.Quotation').click(function(){                                       
          return $.ajax2({ data : { Project : $(this).attr('id') },
                           url: "{url_to('sales_quotation_ajax',['action'=>'DialogQuotationForProject'])}",                           
                           success : function () { $("#ProjectDialog").modal('show') },
                           target: "#ProjectDialog-ctn"}); 
        });
        
          $('.Work').click(function(){                                       
          return $.ajax2({ data : { Project : $(this).attr('id') },
                           url: "{url_to('employees_work_ajax',['action'=>'DialogWorkForProject'])}",   
                           success : function () { $("#ProjectDialog").modal('show') },
                           target: "#ProjectDialog-ctn"}); 
        });
</script>

