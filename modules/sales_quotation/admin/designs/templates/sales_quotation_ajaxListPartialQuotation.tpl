<div class="row admin-header-container">
  <div class="col-sm">
    <h3 class="admin-header-big-text">{__('Sales')}</h3>
    <h3 class="admin-header-small-text">{__('Quotations')}</h3>
  </div>
  <div class="col-sm" style="padding: 0;">
      <div style="float: right;"> 
        {* <a class="btn btn-success admin-header-button"  href="#" id="New"><i class="fa fa-plus"></i> {__('Add Quotation')}</a>*}
        <a class="btn btn-warning admin-header-button" href="#"><i class="fa fa-file-excel"></i> {__('Export XLS')}</a>
      </div> 
  </div>
</div>

<!-- End page heading -->

<!-- Begin breadcrumb -->
<div class="breadcrumb-title">
  <p>              
      <i class="fa fa-home" style="color: #37bc9b;"></i>               
      <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Sales')}
      <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Quotations')}
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
                <span>{__('Advert/Project')}</span>     
                 
            </th> 
           <th class="footable-first-column" data-toggle="true">
                <span>{__('Freelancer')}</span>   
                
            </th>
            <th class="footable-first-column" data-toggle="true">
                <span>{__('Employer')}</span>   
               
            </th>
             <th class="footable-first-column" data-toggle="true">
                <span>{__('In At/Out At')}</span>   
                
            </th>
            <th class="footable-first-column" data-toggle="true">
                <span>{__('Iteration')}</span>   
                
            </th>            
             <th style="width: 230px;" class="footable-first-column" data-toggle="true">
                <span>{__('Created At')}</span>   
                <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.created_at->getValueExist('asc','_active')}" id="asc" name="created_at"><i class="fas fa-sort-up {if $formFilter.order.created_at->getValue()=='asc'}text-dark{/if}"></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.created_at->getValueExist('desc','_active')}" id="desc" name="created_at"><i class="fas fa-sort-down {if $formFilter.order.created_at->getValue()=='desc'}text-dark{/if}"></i></a>           
                </div>
            </th>
             <th class="footable-first-column" data-toggle="true">
                <span>{__('State')}</span>   
               {* <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.statuts->getValueExist('asc','_active')}" id="asc" name="statuts"><i class="fas fa-sort-up"></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.statuts->getValueExist('desc','_active')}" id="desc" name="statuts"><i class="fas fa-sort-down"></i></a>            
                </div>*}
            </th>
            <th class="footable-first-column" data-toggle="true">
                <span>{__('Status')}</span>   
               {* <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.statuts->getValueExist('asc','_active')}" id="asc" name="statuts"><i class="fas fa-sort-up"></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.statuts->getValueExist('desc','_active')}" id="desc" name="statuts"><i class="fas fa-sort-down"></i></a>            
                </div>*}
            </th>         
        </tr>
      </thead>
      <tr class=" input-list">
                <td></td>
                <td><input placeholder="{__('ID')}" style="height: 36px;" class="search form-control" type="text" size="1" name="id" value="{$formFilter.search.id}"</td>
                <td><input placeholder="{__('Reference')}" style="height: 36px;" class="search form-control" type="text" size="5" name="reference" value="{$formFilter.search.reference}"</td>
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
                <td></td>             
            </tr>
      <tbody>
        {foreach $pager as $item}
    <tr class="list"  id="{$item->get('id')}">
        <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>
        <td>{$item->get('id')}</td>
        <td>{$item->get('reference')}</td>
         <td>                
            <div>
            {if $item->hasEmployerAdvert()}
                <div>{__('Ref.')}{$item->getEmployerAdvert()->getI18n()->get('reference')}</div>
                <div>
                    {$item->getEmployerAdvert()->getI18n()->getFormatter()->getTitle()->ucfirst()}                                             
                </div>                                                                                                                    
            {elseif $item->hasEmployeeAdvert()}      
                <div>{__('Ref.')}{$item->getEmployeeAdvert()->getI18n()->get('reference')}</div>
                <div>
                    {$item->getEmployeeAdvert()->getI18n()->getFormatter()->getTitle()->ucfirst()}                                             
                </div>                                       
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
        <td>  
             {if $item->getEmployeeUser()->hasAvatar()} 
            <img height="32px" src="{$item->getEmployeeUser()->getAvatar()->getThumb()->getUrl()}"/>
            {/if}
           {$item->getEmployeeUser()->getFormatter()->getUsername()->ucfirst()}
        </td>
         <td>      
            {if $item->getEmployerUser()->hasAvatar()} 
            <img height="32px" src="{$item->getEmployerUser()->getAvatar()->getThumb()->getUrl()}"/>
            {/if}
            {$item->getEmployerUser()->getFormatter()->getUsername()->ucfirst()}
        </td>
          <td>                
                {if $item->hasInAt()} 
                    <div>{$item->getFormatter()->getInAt()->getFormatted()}</div>
                    <div>{$item->getFormatter()->getNumberOfDays()->getFormattedNumberOfDays()}</div>  
               {else}
                    {if $item->isScheduleNeeded()}
                         {__('Schedule requested')}                         
                    {/if}
               {/if}               
                                     
        </td>
        <td>
             {$item->get('version')} 
        </td>             
        <td>                
                {$item->getFormatter()->getCreatedAt()->getFormatted()}
        </td>
        <td>                
            {if $item->isAccepted()}
                <strong>{__('Accepted')}</strong>                                        
            {elseif $item->isRefused()}
                <div><strong>{__('Refused')}</strong></div>
                {if $item->isEmployeeRefused()}
                     <div>{__('Refused by %s',(string)$item->getEmployeeUser()->getFormatter()->getUsername())}</div>  
                {/if}
                {if $item->isEmployerRefused()}
                     <div>{__('Refused by %s',(string)$item->getEmployerUser()->getFormatter()->getUsername())}</div>  
                {/if}
            {/if}                           

            {if $item->isEmployerAccepted()}                                                                                                                                                             
                 <div>{__('Quote accepted by %s',(string)$item->getEmployerUser()->getFormatter()->getUsername())}</div>   
            {/if}
            {if $item->isEmployeeAccepted()}                                                                                                                                                             
                 <div>{__('Quote accepted by %s',(string)$item->getEmployeeUser()->getFormatter()->getUsername())}</div>   
            {/if}
            
            {if $item->isEmployerNegociated()}  
                <div>{__('Negociation requested by %s',(string)$item->getEmployerUser()->getFormatter()->getUsername())}</div> 
            {/if}
            {if $item->isEmployeeNegociated()}  
                <div>{__('Negociation requested by %s',(string)$item->getEmployeeUser()->getFormatter()->getUsername())}</div> 
            {/if}         
        </td>
        <td>
            {if $item->isAccepted()}           
                {if $item->isPaid()}
                    <strong>{__('Paid')}</strong>
                {elseif $item->isInCart()}
                    <strong>{__('In cart')}</strong>
                {else}    
                   
                {/if}
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
      </div>
    </div>
       {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager} 
<!--     <div class="row">
      <div class="col-sm-5"><div class="dataTables_info" id="Myliste_info" role="status" aria-live="polite">Showing 1 to 10 of 2,222 entries</div></div><div class="col-sm-7"><div class="dataTables_paginate paging_simple_numbers" id="Myliste_paginate"><ul class="pagination"><li class="paginate_button previous disabled" id="Myliste_previous"><a href="#" aria-controls="Myliste" data-dt-idx="0" tabindex="0">Previous</a></li><li class="paginate_button active"><a href="#" aria-controls="Myliste" data-dt-idx="1" tabindex="0">1</a></li><li class="paginate_button "><a href="#" aria-controls="Myliste" data-dt-idx="2" tabindex="0">2</a></li><li class="paginate_button "><a href="#" aria-controls="Myliste" data-dt-idx="3" tabindex="0">3</a></li><li class="paginate_button "><a href="#" aria-controls="Myliste" data-dt-idx="4" tabindex="0">4</a></li><li class="paginate_button "><a href="#" aria-controls="Myliste" data-dt-idx="5" tabindex="0">5</a></li><li class="paginate_button disabled" id="Myliste_ellipsis"><a href="#" aria-controls="Myliste" data-dt-idx="6" tabindex="0">…</a></li><li class="paginate_button "><a href="#" aria-controls="Myliste" data-dt-idx="7" tabindex="0">223</a></li><li class="paginate_button next" id="Myliste_next"><a href="#" aria-controls="Myliste" data-dt-idx="8" tabindex="0">Next</a></li></ul></div></div>
    </div> 
    </div>-->
  </div><!--End list-->


     

<script type="text/javascript">
    
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
                            url:"{url_to('sales_quotation_ajax',['action'=>'ListPartialQuotation'])}" ,                          
                            target: "#actions"
                             });
        }
        
{* =================================== PAGER/FILTER ======================================================== *}
        
        $(".search").keypress(function(event) {  if (event.keyCode==13)   return updateFilter(); });

        $("[name=nbitemsbypage]").change(function () {  return updateFilter();  });
    
        $(".pager").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('sales_quotation_ajax',['action'=>'ListPartialQuotation'])}?page="+$(this).attr('data-page'),                                
                                 target: "#actions"
                });
        });
          
{* =================================== ACTIONS ======================================================== *}
        
       $(".Delete").click( function () { 
                if (!confirm('{__("Quotation \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ SaleQuotation: $(this).attr('id') },
                                 url :"{url_to('sales_quotation_ajax',['action'=>'DeleteQuotation'])}",                               
                                 success : function(resp) {
                                       if (resp.action!='DeleteQuotation') return ;                                          
                                          $(".list[id="+resp.id+"]").remove();  
                                          if ($('.list').length==0) return updateFilter();                                          
                                 }
                     });                                        
            });


  {* =====================  P A G E R  A C T I O N S =============================== *}  
      
           $("#init").click(function() {                   
               $.ajax2({ url:"{url_to('sales_quotation_ajax',['action'=>'ListPartialQuotation'])}",                                    
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
                                 url:"{url_to('sales_quotation_ajax',['action'=>'ListPartialQuotation'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length),
                                target: "#actions"
                });
        });    
        
        $(".equal").change(function() { return updateFilter(); });  
     
</script>
  