{messages}
          <div class="row admin-header-container">
            <div class="col-sm">
              <h3 class="admin-header-big-text">{__('Site')}</h3>
              <h3 class="admin-header-small-text">{__('Site Cookie management')}</h3>
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
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Site')}
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Cookies')}
            </p>
          </div>
          <!-- End breadcrumb -->

          <!-- Begin Add User -->
 <div class=" bg-white px-2 py-2">
             <div class="col-md-12 padd-col">
                
                 <div class="float-left w-50">
                       {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager}  
                 </div>
                 <div class="float-right w-50">                   
                    <button id="filter" class="btn btn-primary" style="float: right; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Filter")}</button>   
                    <button id="init" class="btn btn-primary" style="float: right; margin-right: 10px; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Init")}</button>
             
                 </div>
             </div>

      <table id="Myliste" class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer w-100 list-user"  role="grid" aria-describedby="Myliste_info">
      <thead class="bgSpec">
        <tr role="row">
            <th  class="sorting_asc">#</th>
            <th>{__('ID')}           
                <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><i class="fas fa-sort-up {if $formFilter.order.id->getValue()=='asc'}text-dark{/if}" style=""></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><i class="fas fa-sort-down {if $formFilter.order.id->getValue()=='desc'}text-dark{/if}"></i></a>            
                </div>
            </th>          
            <th class="sorting">{__('IP')}</th>            
            <th style="width: 230px;" class="footable-first-column" data-toggle="true">
                <span>{__('Created At')}</span>   
                <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.created_at->getValueExist('asc','_active')}" id="asc" name="created_at"><i class="fas fa-sort-up {if $formFilter.order.created_at->getValue()=='asc'}text-dark{/if}"></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.created_at->getValueExist('desc','_active')}" id="desc" name="created_at"><i class="fas fa-sort-down {if $formFilter.order.created_at->getValue()=='desc'}text-dark{/if}"></i></a>           
                </div>
            </th>                   
        </tr>
      </thead>
      <tbody>
          <tr role="row">
              <td></td>                          
               <td></td>     
              <td><input class="form-control form-control-sm ml-1 search input-80" name="ip" value="{$formFilter.search.ip}"></td>              
              <td>                  
                 <input class="form-control form-control-sm ml-1 InputTexte RowBlock Range Date createdAtDate" id="created_at_from" date-id="from" placeholder="{__('From')}" name="created_at" value="{if $formFilter->hasErrors()}{$formFilter.range.created_at.from}{else}{$formFilter.range.created_at.from}{/if}" >
                 <input class="form-control form-control-sm ml-1  InputTexte RowBlock Range Date createdAtDate" id="created_at_to" date-id="to" placeholder="{__('To')}" name="created_at" value="{if $formFilter->hasErrors()}{$formFilter.range.created_at.to}{else}{$formFilter.range.created_at.to}{/if}" >
              </td>                        
          </tr>
      
       {foreach $pager as $item} 
      <tr class="list" id="{$item->get('id')}" role="row">
          <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>
          <td>{$item->get('id')}</td>              
          <td>{$item->get('ip')}</td>          
          <td>{$item->getFormatter()->getCreatedAt()->getFormatted()}</td> 
                       
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

       {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager} 
 
   
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
  var ended_at_dates = $( ".Range.endedAtDate#ended_at_from, .Range.endedAtDate#ended_at_to" ).datepicker({
			onSelect: function( selectedDate ) {
				var option = this.id == "ended_at_from" ? "minDate" : "maxDate",
					instance = $( this ).data( "datepicker" ),
					date = $.datepicker.parseDate(
						instance.settings.dateFormat ||
						$.datepicker._defaults.dateFormat,
						selectedDate, instance.settings );
				ended_at_dates.not( this ).datepicker( "option", option, date );
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
                 params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");
            $(".search").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); });
            $(".Range.Date").each(function () {
                if(!params.filter.range[$(this).attr('name')]) params.filter.range[$(this).attr('name')]= { };
                params.filter.range[$(this).attr('name')][$(this).attr('date-id')]= $(this).val();
            });
            return params;                  
        }
        
        function updateFilter()
        {          
           return $.ajax2({ data: getFilterParameters(), 
                            url:"{url_to('suppliers_ajax',['action'=>'ListPartialUser'])}" ,                          
                            target: "#actions"
                             });
        }
        
        $(".search").keypress(function(event) {  if (event.keyCode==13)   return updateFilter(); });

        $("[name=nbitemsbypage]").change(function () {  return updateFilter();  });
    
        $(".pager").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('suppliers_ajax',['action'=>'ListPartialUser'])}?page="+$(this).attr('data-page'),                                
                                 target: "#actions"
                });
        });
          
          
      $(".View").click( function () {                    
                  return $.ajax2({ data : { Supplier : $(this).attr('id') },                               
                                  url:"{url_to('suppliers_ajax',['action'=>'ViewUser'])}", 
                                  target: "#actions"});
          });
    
     
         
     $(".Delete").click( function () { 
                if (!confirm('{__("Cookie user \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ Cookie: $(this).attr('id') },
                                 url :"{url_to('site_cookie_ajax',['action'=>'DeleteCookie'])}",                               
                                 success : function(resp) {
                                       if (resp.action!='DeleteCookie') return ;                                          
                                          $(".list[id="+resp.id+"]").remove();  
                                          if ($('.list').length==0) return updateFilter();                                          
                                 }
                     });                                        
            });    
     
</script>
  