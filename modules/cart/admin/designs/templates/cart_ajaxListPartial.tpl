   <div class="row admin-header-container">
            <div class="col-sm">
                <h3 class="admin-header-big-text">{__('Sales')}</h3>
              <h3 class="admin-header-small-text">{__('Carts management')}</h3>
            </div>
            <div class="col-sm" style="padding: 0;">
                <div style="float: right;">                  
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
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Carts')}                
            </p>
        </div>
          <!-- End breadcrumb -->
{alerts}
          <!-- Begin Add User -->
<div class="bg-white px-2 py-2">            
             <div class="col-md-12 padd-col">
                
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
            <th><span class="mr-1">{__('Reference')}</span>
                <div  class="d-inline-block">         
                             <a href="#" class="position-absolute order{$formFilter.order.reference->getValueExist('asc','_active')}" id="asc" name="reference"><i class="fas fa-sort-up acs-desc {if $formFilter.order.reference->getValue()=='asc'}text-dark{/if}"></i></a>
                             <a href="#" class="position-absolute order{$formFilter.order.reference->getValueExist('desc','_active')}" id="desc" name="reference"><i class="fas fa-sort-down {if $formFilter.order.reference->getValue()=='desc'}text-dark{/if}"></i></a>            
                  </div>
            </th>
            <th>{__('Employer')}</th>  
            <th>{__('Country')}</th>  
            <th>{__('Language')}</th>  
            <th>{__('IP')}</th>    
            <th><span class="mr-1">{__('Number of products')}</span>
                 
            </th>              
            <th>{__('Total with tax')}</th>    
            <th>{__('Currency')}</th> 
            <th><span class="mr-1">{__('Created at')}</span>
                          <div  class="d-inline-block">         
                             <a href="#" class="position-absolute order{$formFilter.order.created_at->getValueExist('asc','_active')}" id="asc" name="created_at"><i class="fas fa-sort-up acs-desc {if $formFilter.order.created_at->getValue()=='asc'}text-dark{/if}"></i></a>
                             <a href="#" class="position-absolute order{$formFilter.order.created_at->getValueExist('desc','_active')}" id="desc" name="created_at"><i class="fas fa-sort-down {if $formFilter.order.created_at->getValue()=='desc'}text-dark{/if}"></i></a>            
                          </div>
            </th>                               
            <th><span class="order-margin">{__('Status')}</span></th>
            <th><span class="order-margin">{__('State')}</span></th>
            <th>{__('Actions')}</th>
        </tr>
      </thead>
      <tbody>
          <tr role="row">
            <td></td>    
            <td>
                 {*<input class="form-control form-control-sm ml-1 search" name="reference" value="{$formFilter.search.reference}">*}
            </td>
            <td></td>
            <td></td>
            <td>
                {html_options class="equal Select form-control form-control-sm" name="lang" options=$formFilter->equal.lang->getChoices()->toArray() selected=$formFilter.equal.lang}
            </td>
            <td></td> 
            <td>
                
            </td>         
            <td></td>
            <td></td> 
            <td>
                 <input class="form-control form-control-sm ml-1 InputTexte RowBlock Range Date createdAtDate" id="created_at_from" date-id="from" placeholder="{__('From')}" name="created_at" value="{if $formFilter->hasErrors()}{$formFilter.range.created_at.from}{else}{$formFilter.range.created_at.from}{/if}" >
                  <input class="form-control form-control-sm ml-1  InputTexte RowBlock Range Date createdAtDate" id="created_at_to" date-id="to" placeholder="{__('To')}" name="created_at" value="{if $formFilter->hasErrors()}{$formFilter.range.created_at.to}{else}{$formFilter.range.created_at.to}{/if}" >
              
            </td>           
            <td>
                {html_options class="equal Select form-control float-left w-80 Select" name="status" options=$formFilter->equal.status->getChoices() selected=$formFilter.equal.status}
            </td> 
            <td></td> 
             <td></td> 
          </tr>     
       {foreach $pager as $item} 
      <tr class="list" id="{$item->get('id')}" role="row">
          <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>                 
          <td>{$item->get('reference')}</td> 
          <td> 
              {$item->getEmployerUser()}               
          </td>      
          <td>
              {$item->getFormatter()->getCountry()}
          </td>
          <td>
              {$item->getFormatter()->getLanguage()->getFormatted()->ucfirst()} 
          </td>
          <td>{$item->get('ip')}</td>
          <td>{$item->getFormatter()->getNumberOfQuotations()}</td>       
          <td>{$item->getFormatter()->getTotalSalePriceWithTax()->getAmount()}</td>
          <td>{$item->getCurrency()->getCode()->getSymbol()}</td>
          <td>{$item->getFormatter()->getCreatedAt()->getText()}</td>              
          <td>
              {$item->getStatus()}
          </td> 
           <td>
              {$item->getState()}
          </td> 
          <td>
            <a href="#" class="list-action Display" id="{$item->get('id')}" title="{__('Display')}"><i class="fa fa-search font-icon"></i></a>   
            <a href="#" class="list-action Products" id="{$item->get('id')}" title="{__('Products')}"><i class="fa fa-list font-icon"></i></a>                                                                                                   
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
   </div>    
  </div><!--End list-->
<script type="text/javascript">
{* =================================== METHODS ======================================================== *}
    
      var created_at_dates = $( ".Range.createdAtDate#created_at_from, .Range.createdAtDate#created_at_to" ).datepicker({
			onSelect: function( selectedDate ) {
				var option = this.id == "created_at_from" ? "minDate" : "maxDate",
					instance = $( this ).data( "datepicker" ),
					date = $.datepicker.parseDate(
						instance.settings.dateFormat ||
						$.datepicker._defaults.dateFormat,
						selectedDate, instance.settings );
				created_at_dates.not( this ).datepicker( "option", option, date );
    } } );  
  
{* =================================== PAGER/FILTER ======================================================== *}
        function getFilterParameters()
        {
            var params={ filter: {  order : { }, 
                                    search : { },
                                    equal: {   },   
                                    range : { },
                                nbitemsbypage: $("[name=nbitemsbypage]").val(),                             
                                token:'{$formFilter->getCSRFToken()}'
                         } };
            if($(".order_active").attr("name"))
                 params.filter.order[$(".order_active").attr("name")] = $(".order_active").attr("id");                   
            $(".search").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); });
            $(".equal option:selected").each(function() { params.filter.equal[$(this).parent().attr('name')] =$(this).val(); });
            $(".Range.Date").each(function () {
                if(!params.filter.range[$(this).attr('name')]) params.filter.range[$(this).attr('name')]= { };
                params.filter.range[$(this).attr('name')][$(this).attr('date-id')]= $(this).val();
            });
            return params;                  
        }
        
        function updateFilter()
        {          
           return $.ajax2({ data: getFilterParameters(), 
                            url:"{url_to('cart_ajax',['action'=>'ListPartial'])}" ,                          
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
        
        $("#init").click(function () { 
                return $.ajax2({ url:"{url_to('cart_ajax',['action'=>'ListPartial'])}",                                
                         target: "#actions"
                });
        });
        
{* =================================== ACTIONS ======================================================== *}
        
        $('.order').click(function() {            
                $(".order_active").attr('class','order');
                $(this).attr('class','order_active');
                return updateFilter();
           });
                       
        $(".search").keypress(function(event) {  if (event.keyCode==13)   return updateFilter(); });

        $("[name=nbitemsbypage],.equal.Select").change(function () {  return updateFilter();  });
    
        $(".pager").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('cart_ajax',['action'=>'ListPartial'])}?page="+$(this).attr('data-page'),                                
                                 target: "#actions"
                });
        });
          
        $("#filter").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('cart_ajax',['action'=>'ListPartial'])}",                                
                                 target: "#actions"
            });
       });
        
      $(".Products").click( function () {                    
                  return $.ajax2({ data : { Cart : $(this).attr('id') },                               
                                  url:"{url_to('cart_ajax',['action'=>'ListPartialProductForCart'])}", 
                                  target: "#actions"});
          });
          
       $(".list").dblclick( function () {                    
                  return $.ajax2({ data : { Cart : $(this).attr('id') },        
                                  url:"{url_to('cart_ajax',['action'=>'ListPartialProductForCart'])}", 
                                  target: "#actions"});
          });
    
     
    $(".Display").click( function () {                    
                  return $.ajax2({ data : { Cart : $(this).attr('id') },                               
                                  url:"{url_to('cart_ajax',['action'=>'DisplayCart'])}", 
                                  target: "#actions"});
          });
     
</script>
  

