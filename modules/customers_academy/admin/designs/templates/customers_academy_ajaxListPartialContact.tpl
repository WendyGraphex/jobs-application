
          <div class="row admin-header-container">
            <div class="col-sm">
              <h3 class="admin-header-big-text">{__('Academy')}</h3>
              <h3 class="admin-header-small-text">{__('Contact accounts management')}</h3>
            </div>
            <div class="col-sm" style="padding: 0;">
                <div style="float: right;"> 
                  <a class="btn btn-warning admin-header-button" href="{url_to('customers_academy',['action'=>'ExportCsvContact'])}?{$formFilter->getParametersForUrl(['equal','in','begin','search','range'])}"><i class="fa fa-file-excel"></i> {__('Export XLS')}</a>
                </div> 
            </div>
          </div>
          
          <!-- End page heading -->
{alerts}
          <!-- Begin breadcrumb -->
          <div class="breadcrumb-title">
            <p>             
                <i class="fa fa-home" style="color: #37bc9b;"></i>              
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Academy')}
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Contacts')}
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Accounts')}
            </p>
          </div>
          <!-- End breadcrumb -->
          <!-- Begin Add User -->
<div class=" bg-white px-2 py-2">
             <div class="col-md-12">
                
                <div class="float-left w-50">
                      {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager}  
                </div>
                <button id="filter" class="btn btn-primary" style="float: right; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Filter")}</button>   
                <button id="init" class="btn btn-primary" style="float: right; margin-right: 10px; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Init")}</button>
             </div>

      <table class="table table-bordered table-hover table-striped" cellpadding="0" cellspacing="0"> 
      <thead class="bgSpec">{*<thead class="bg-info thead-color">*}
         <tr role="row">
             <th  class="sorting_asc">#</th>
            <th>{__('ID')}           
             <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><i class="fas fa-sort-up {if $formFilter.order.id->getValue()=='asc'}text-dark{/if}" style=""></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><i class="fas fa-sort-down {if $formFilter.order.id->getValue()=='desc'}text-dark{/if}"></i></a>            
                </div>
            </th>            
            <th>{__('Firstname/Lastname')}</span>  
              <div style="float: right;">
                <a href="#" class="position-absolute order{$formFilter.order.firstname->getValueExist('asc','_active')}" id="asc" name="firstname"><i class="fas fa-sort-up"></i></a>
                <a href="#" class="position-absolute order{$formFilter.order.firstname->getValueExist('desc','_active')}" id="desc" name="firstname"><i class="fas fa-sort-down"></i></a>            
              </div></th>           
            <th>{__('Email')}</span>  
              <div style="float: right;">
                <a href="#" class="position-absolute order{$formFilter.order.email->getValueExist('asc','_active')}" id="asc" name="email"><i class="fas fa-sort-up"></i></a>
                <a href="#" class="position-absolute order{$formFilter.order.email->getValueExist('desc','_active')}" id="desc" name="email"><i class="fas fa-sort-down"></i></a>            
              </div></th>
            <th>{__('Phone')}</span>  
              <div style="float: right;">
                <a href="#" class="position-absolute order{$formFilter.order.phone->getValueExist('asc','_active')}" id="asc" name="phone"><i class="fas fa-sort-up"></i></a>
                <a href="#" class="position-absolute order{$formFilter.order.phone->getValueExist('desc','_active')}" id="desc" name="phone"><i class="fas fa-sort-down"></i></a>            
              </div></th>           
             <th>
                <span>{__('Created At')}</span>   
                <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.created_at->getValueExist('asc','_active')}" id="asc" name="created_at"><i class="fas fa-sort-up {if $formFilter.order.created_at->getValue()=='asc'}text-dark{/if}"></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.created_at->getValueExist('desc','_active')}" id="desc" name="created_at"><i class="fas fa-sort-down {if $formFilter.order.created_at->getValue()=='desc'}text-dark{/if}"></i></a>           
                </div>
            </th>
            <th>
                <span>{__('Updated At')}</span>   
                <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.updated_at->getValueExist('asc','_active')}" id="asc" name="updated_at"><i class="fas fa-sort-up {if $formFilter.order.updated_at->getValue()=='asc'}text-dark{/if}"></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.updated_at->getValueExist('desc','_active')}" id="desc" name="updated_at"><i class="fas fa-sort-down  {if $formFilter.order.updated_at->getValue()=='desc'}text-dark{/if}" ></i></a>           
                </div>
            </th>
            <th>{__('Actions')}</th>
         </tr>
      </thead>
      <tbody>
          <tr role="row">
              <td></td>
              <td></td>
              <td><input class="form-control form-control-sm ml-1 search" name="firstname" value="{$formFilter.search.firstname}"></td>           
              <td><input class="form-control form-control-sm ml-1 search InputTexte" name="email" value="{$formFilter.search.email}"></td>
              <td><input class="form-control form-control-sm ml-1 search" name="phone" value="{$formFilter.search.phone}"></td>             
               <td>
                    <input class="form-control form-control-sm ml-1 InputTexte RowBlock Range Date CreatedAtDate" id="created_at_from" date-id="from" placeholder="{__('From')}" name="created_at" value="{if $formFilter->hasErrors()}{$formFilter.range.created_at.from}{else}{format_date($formFilter.range.created_at.from,'a')}{/if}">
                    <input class="form-control form-control-sm ml-1  InputTexte RowBlock Range Date CreatedAtDate" id="created_at_to" date-id="to" placeholder="{__('To')}" name="created_at" value="{if $formFilter->hasErrors()}{$formFilter.range.created_at.to}{else}{format_date($formFilter.range.created_at.to,'a')}{/if}">
                </td>
                <td> 
                    <input class="form-control form-control-sm ml-1  InputTexte RowBlock Range Date UpdatedAtDate" id="updated_at_from" date-id="from" placeholder="{__('From')}" name="updated_at" value="{if $formFilter->hasErrors()}{$formFilter.range.updated_at.from}{else}{format_date($formFilter.range.updated_at.from,'a')}{/if}">
                    <input class="form-control form-control-sm ml-1  InputTexte RowBlock Range Date UpdatedAtDate" id="updated_at_to" date-id="to" placeholder="{__('To')}" name="updated_at" value="{if $formFilter->hasErrors()}{$formFilter.range.updated_at.to}{else}{format_date($formFilter.range.updated_at.to,'a')}{/if}">
                </td>
              <td></td>
          </tr>
      
       {foreach $pager as $item} 
      <tr class="list" id="{$item->get('id')}" role="row">
          <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>
        <td class="list">{$item->get('id')}</td>        
        <td>{$item->getFormatter()->getGender()} {$item->getFormatter()->getFirstname()->ucfirst()} {$item->getFormatter()->getLastname()->ucfirst()}</td>
        <td>{$item->get('email')}</td>       
        <td>{$item->get('phone')}</td> 
        <td>     
            {$item->getFormatter()->getCreatedAt()->getFormatted()}
        </td> 
        <td>                
            {$item->getFormatter()->getUpdatedAt()->getFormatted()}
        </td>
            <td>
              <a href="#" class="list-action text-info View" id="{$item->get('id')}"  title="{__('Edit')}"><i class="fa fa-pencil-alt"></i></a>
              <a href="#" class="list-action text-danger Delete" id="{$item->get('id')}" name="{$item->get('firstname')} {$item->get('lastname')}" data-toggle="tooltip" title="{__('Delete')}"><i class="fa fa-trash-alt"></i></a>
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

{* =================================== PAGER/FILTER ======================================================== *}
    
     function getFilterParameters()
        {
            var params={ filter: {  order : { }, 
                                    search : { },
                                    equal: {   },                                                                                                                                   
                                nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                token:'{$formFilter->getCSRFToken()}'
                         } };
            if ($(".order_active").attr("name"))
                 params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");   
            $(".search").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); });            
            $(".equal options:selected").each(function() { params.filter.equal[$(this).parent().attr('name')] =$(this).val(); });     
            return params;                  
        }
        
        function updateFilter()
        {          
           return $.ajax2({ data: getFilterParameters(), 
                            url:"{url_to('customers_academy_ajax',['action'=>'ListPartialContact'])}" ,                          
                            target: "#actions"
                             });
        }
        
        $(".search").keypress(function(event) {  if (event.keyCode==13)   return updateFilter(); });

        $("[name=nbitemsbypage]").change(function () {  return updateFilter();  });
    
        $('.order').click(function() {
                $(".order_active").attr('class','order');
                $(this).attr('class','order_active');
                return updateFilter();
        });
           
        $(".pager").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('customers_academy_ajax',['action'=>'ListPartialContact'])}?page="+$(this).attr('data-page'),                                
                                 target: "#actions"
                });
        });
        
         $("#init").click(function () {                     
                return $.ajax2({   url:"{url_to('customers_academy_ajax',['action'=>'ListPartialContact'])}",
                                 target: "#actions"
                });
        });
        
         $("#filter").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('customers_academy_ajax',['action'=>'ListPartialContact'])}",
                                 target: "#actions"
                });
        });
        
{* =================================== ACTIONS ======================================================== *}
          
          
      $(".View").click( function () {                    
                  return $.ajax2({ data : { Customer : $(this).attr('id') },                               
                                  url:"{url_to('customers_academy_ajax',['action'=>'ViewContact'])}", 
                                                      
                                  target: "#actions"});
          });
    
    
     $(".Delete").click( function () { 
                if (!confirm('{__("Customer contact \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ CustomerAcademyContact: $(this).attr('id') },
                                 url :"{url_to('customers_academy_ajax',['action'=>'DeleteContact'])}",                               
                                 success : function(resp) {
                                       if (resp.action!='DeleteContact') return ;                                          
                                          $(".list[id="+resp.id+"]").remove();  
                                          if ($('.list').length==0) return updateFilter();                                          
                                 }
                     });                                        
            });   
                 
</script>
  