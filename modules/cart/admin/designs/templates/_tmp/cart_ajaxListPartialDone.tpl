          <div class="row admin-header-container">
            <div class="col-sm">
              <h3 class="admin-header-big-text">{__('Carts')}</h3>
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
                <a href="#">
                    <i class="fa fa-home" style="color: #37bc9b;"></i>
                </a>
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Done Carts')}                
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
                 <div class="float-right w-50">                   
                        <button  id="filter" class="btn btn-primary btn-color btn-f" >{__("Filter")}</button>   
                        <button  id="init" class="btn-init btn btn-primary btn-color btn-f">{__("Init")}</button>
                 </div>
             </div>
  <div class="table-responsive">               
    <div class="row float-left mt-2 w-100 padd-row">
      <div class="col-sm-12 padd-col">
      <table id="Myliste" class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer w-100 list-user"  role="grid" aria-describedby="Myliste_info">
      <thead class="bg-info thead-color">
        <tr role="row">
              <th></th> 
            <th><span class="mr-1">{__('ID')}</span>
                    <div  class="d-inline-block">         
                             <a href="#" class="order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><i class="fas fa-sort-up acs-desc"></i></a>
                             <a href="#" class="order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><i class="fas fa-sort-down"></i></a>            
                    </div>
            </th>
            <th></th>                      
             <th>{__('Created at')}</span>
                          <div class="d-inline-block">         
                             <a href="#" class="order{$formFilter.order.created_at->getValueExist('asc','_active')}" id="asc" name="created_at"><i class="fas fa-sort-up acs-desc"></i></a>
                             <a href="#" class="order{$formFilter.order.created_at->getValueExist('desc','_active')}" id="desc" name="created_at"><i class="fas fa-sort-down"></i></a>            
                          </div>
            </th>          
              <th>{__('Updated at')}</span>
                         <div class="d-inline-block">         
                             <a href="#" class="order{$formFilter.order.updated_at->getValueExist('asc','_active')}" id="asc" name="updated_at"><i class="fas fa-sort-up acs-desc"></i></a>
                             <a href="#" class="order{$formFilter.order.updated_at->getValueExist('desc','_active')}" id="desc" name="updated_at"><i class="fas fa-sort-down"></i></a>            
                          </div>
            </th>          
            <th><span class="order-margin">{__('Status')}</span></th>
            <th>{__('Actions')}</th>
        </tr>
      </thead>
      <tbody>
          <tr role="row">
              <td></td>
               <td></td>
              <td></td>
              <td>
                   <input class="form-control form-control-sm InputTexte RowBlock Range Date createdAtDate" id="created_at_from" date-id="from" placeholder="{__('From')}" name="created_at" value="{if $formFilter->hasErrors()}{$formFilter.range.created_at.from}{else}{$formFilter.range.created_at.from}{/if}" >
                   <input class="form-control form-control-sm InputTexte RowBlock Range Date createdAtDate" id="created_at_to" date-id="to" placeholder="{__('To')}" name="created_at" value="{if $formFilter->hasErrors()}{$formFilter.range.created_at.to}{else}{$formFilter.range.created_at.to}{/if}" >
              </td> 
              <td>
                   <input class="form-control form-control-sm InputTexte RowBlock Range Date updatedAtDate" id="updated_at_from" date-id="from" placeholder="{__('From')}" name="updated_at" value="{if $formFilter->hasErrors()}{$formFilter.range.updated_at.from}{else}{$formFilter.range.updated_at.from}{/if}" >
                   <input class="form-control form-control-sm InputTexte RowBlock Range Date updatedAtDate" id="updated_at_to" date-id="to" placeholder="{__('To')}" name="updated_at" value="{if $formFilter->hasErrors()}{$formFilter.range.updated_at.to}{else}{$formFilter.range.updated_at.to}{/if}" >
             
              </td>
              <td>
                  {html_options class="equal form-control-sm float-left mx-1 w-100 Select" name="status" options=$formFilter->equal.status->getChoices() selected=$formFilter.equal.status}
              </td> 
                <td></td> 
          </tr>
     
       {foreach $pager as $item} 
      <tr class="list" id="{$item->get('id')}" role="row">
            <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>         
          <td>{$item->get('id')}</td>          
          <td></td>                   
          <td>{$item->getFormatter()->getCreatedAt()->getText()}</td>    
          <td>{$item->getFormatter()->getUpdatedAt()->getText()}</td>              
          <td>
              {$item->getStatusI18n()}
          </td> 
          <td>
              <a href="#" class="list-action text-danger Delete" id="{$item->get('id')}" name="{$item->getReference()}" title="{__('Delete')}"><i class="fa fa-trash-alt"></i></a>            
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
  var updated_at_dates = $( ".Range.updatedAtDate#updated_at_from, .Range.updatedAtDate#updated_at_to" ).datepicker({
			onSelect: function( selectedDate ) {
				var option = this.id == "updated_at_from" ? "minDate" : "maxDate",
					instance = $( this ).data( "datepicker" ),
					date = $.datepicker.parseDate(
						instance.settings.dateFormat ||
						$.datepicker._defaults.dateFormat,
						selectedDate, instance.settings );
				updated_at_dates.not( this ).datepicker( "option", option, date );
    } } );  
   
   
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
                            url:"{url_to('cart_ajax',['action'=>'ListPartialLost'])}" ,                          
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
                return $.ajax2({ url:"{url_to('cart_ajax',['action'=>'ListPartialLost'])}",                                
                         target: "#actions"
                });
        });
        
        $('.order').click(function() {            
                $(".order_active").attr('class','order');
                $(this).attr('class','order_active');
                return updateFilter();
           });
                       
        $(".search").keypress(function(event) {  if (event.keyCode==13)   return updateFilter(); });

        $("[name=nbitemsbypage],.equal.Select").change(function () {  return updateFilter();  });
    
        $(".pager").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('cart_ajax',['action'=>'ListPartialLost'])}?page="+$(this).attr('data-page'),                                
                                 target: "#actions"
                });
        });
          
            $("#filter").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('cart_ajax',['action'=>'ListPartialLost'])}",                                
                                 target: "#actions"
                });
        });
            
     
         
     {*$(".Delete").click( function () { 
                if (!confirm('{__("Cart \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data : { Cart : $(this).attr('id') },        
                                 url :"{url_to('cart_ajax',['action'=>'DeleteCartLost'])}",                               
                                 success : function(resp) {
                                       if (resp.action!='DeleteCart') return ;                                          
                                          $(".list[id="+resp.id+"]").remove();  
                                          if ($('.list').length==0) return updateFilter();  
                                          updatePager(1);
                                 }
                     });                                        
            });    *}
     
</script>
  


