<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__('Employer')}</h3>
        <h3 class="admin-header-small-text">{__('Employer requests management')}</h3>
    </div>
    <div class="col-sm" style="padding: 0;">
        <div style="float: right;">                                
            <button id="GenerateRevivals" class="btn btn-info admin-header-button"><i class="fa fa-cog"></i> {__('Generate revivals')}</button> 

        </div> 
    </div>
</div>

<div class="breadcrumb-title">
    <p>
        <a href="#">
            <i class="fa fa-home" style="color: #37bc9b;"></i>
        </a>
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Employers')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Requests')}
    </p>
</div>

{alerts}

<div class="table-responsive bg-white px-1 py-2">
    <div class="col-md-12">
        <div class="float-left w-50">
            {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager}                       
        </div>
        <div class="float-right w-50">                   
            <button id="filter" class="btn btn-primary" style="float: right; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Filter")}</button>   
            <button id="init" class="btn btn-primary" style="float: right; margin-right: 10px; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Init")}</button>
        </div>
    </div>
    <table id="Myliste" class="table table-bordered table-hover table-striped" cellpadding="0" cellspacing="0">
        <thead class="bgSpec" {*class="bg-info thead-color"*}>
            <tr role="row">
                <th  class="sorting_asc">#</th>
                <th  class="sorting_asc">ID
                    <div style="float: right;">
                        <a href="#" class="position-absolute order {$formFilter.order.created_at->getValueExist('asc','_active')}" id="asc" name="created_at"><i class="fas fa-sort-up OrderPosition {if $formFilter.order.created_at->getValue()=='asc'}text-dark{/if}"></i></a>
                        <a href="#" class="position-absolute order {$formFilter.order.created_at->getValueExist('desc','_active')}" id="desc" name="created_at"><i class="fas fa-sort-down OrderPosition {if $formFilter.order.created_at->getValue()=='desc'}text-dark{/if}"></i></a>            
                    </div>
                </th>

                <th>{__('Employee')}</span>  
                    <div class="position-relative float-right mr-2">

                    </div></th>
                <th>{__('Employer')}</span>  
                    <div class="position-relative float-right mr-2">

                    </div></th>
                <th>{__('Number of projects')}</span>  
                    <div class="position-relative float-right mr-2">

                    </div></th>
                <th>{__('Number of quotations')}</span>  
                    <div class="position-relative float-right mr-2">

                    </div></th>
                <th>{__('Description')}</th>
                <th>{__('Job')}</th>            
                <th style="width: 230px;" class="footable-first-column" data-toggle="true">
                    <span>{__('Created at')}</span>   
                    <div style="float: right;">
                        <a href="#" class="position-absolute order {$formFilter.order.created_at->getValueExist('asc','_active')}" id="asc" name="created_at"><i class="fas fa-sort-up OrderPosition {if $formFilter.order.created_at->getValue()=='asc'}text-dark{/if}"></i></a>
                        <a href="#" class="position-absolute order {$formFilter.order.created_at->getValueExist('desc','_active')}" id="desc" name="created_at"><i class="fas fa-sort-down OrderPosition {if $formFilter.order.created_at->getValue()=='desc'}text-dark{/if}"></i></a>            
                    </div>
                </th>

                <th style="width: 230px;" class="footable-first-column" data-toggle="true">
                    <span>{__('Updated at')}</span>   
                    {* <div style="float: right;">
                    <a href="#" class="position-absolute order {$formFilter.order.updated_at->getValueExist('asc','_active')}" id="asc" name="updated_at"><i class="fas fa-sort-up OrderPosition {if $formFilter.order.updated_at->getValue()=='asc'}text-dark{/if}"></i></a>
                    <a href="#" class="position-absolute order {$formFilter.order.updated_at->getValueExist('desc','_active')}" id="desc" name="updated_at"><i class="fas fa-sort-down OrderPosition {if $formFilter.order.updated_at->getValue()=='desc'}text-dark{/if}"></i></a>            
                    </div> *}
                </th>
                <th>{__('State')}</th>
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
                <td>
                    <input class="form-control form-control-sm ml-1 InputTexte RowBlock Range Date CreatedAtDate" id="created_at_from" date-id="from" placeholder="{__('From')}" name="created_at" value="{if $formFilter->hasErrors()}{$formFilter.range.created_at.from}{else}{format_date($formFilter.range.created_at.from,'a')}{/if}">
                    <input class="form-control form-control-sm ml-1  InputTexte RowBlock Range Date CreatedAtDate" id="created_at_to" date-id="to" placeholder="{__('To')}" name="created_at" value="{if $formFilter->hasErrors()}{$formFilter.range.created_at.to}{else}{format_date($formFilter.range.created_at.to,'a')}{/if}">
                </td>
                <td> 
                    <input class="form-control form-control-sm ml-1  InputTexte RowBlock Range Date UpdatedAtDate" id="updated_at_from" date-id="from" placeholder="{__('From')}" name="updated_at" value="{if $formFilter->hasErrors()}{$formFilter.range.updated_at.from}{else}{format_date($formFilter.range.updated_at.from,'a')}{/if}">
                    <input class="form-control form-control-sm ml-1  InputTexte RowBlock Range Date UpdatedAtDate" id="updated_at_to" date-id="to" placeholder="{__('To')}" name="updated_at" value="{if $formFilter->hasErrors()}{$formFilter.range.updated_at.to}{else}{format_date($formFilter.range.updated_at.to,'a')}{/if}">
                </td>
                <td></td>
                <td></td>
            </tr>      
            {foreach $pager as $item} 
                <tr class="list" id="{$item->get('id')}" role="row">
                    <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>        
                    <td>{$item->get('id')}</td>  
                    <td>
                        <div>{$item->getEmployeeUser()->get('username')}</div>
                        <div>{$item->getEmployeeUser()}</div>
                    </td>
                    <td> 
                        <div>{$item->getEmployerUser()->get('username')}</div>
                        <div>{$item->getEmployerUser()}</div>
                    </td>
                    <td>
                        {$item->getFormatter()->getNumberOfProjects()}
                    </td>
                    <td>{$item->getFormatter()->getNumberOfQuotations()}</td>
                    <td>{$item->getFormatter()->getDescription()}</td>
                    <td>
                        <a href="{$item->getAdvertI18n()->getUrl()}" target="_blank">{$item->getFormatter()->getAdvertTitle()}</a>

                    </td>       
                    <td>       
                        {$item->getFormatter()->getCreatedAt()->getFormatted()}
                    </td> 
                    <td>                
                        {$item->getFormatter()->getUpdatedAt()->getFormatted()}
                    </td>          
                    <td></td>
                    <td>
                        <a href="#" class="list-action text-info View" id="{$item->get('id')}"  title="{__('Edit')}"><i class="fa fa-search"></i></a>
                            {* <a href="#" class="list-action text-danger Delete" id="{$item->get('id')}" name="{$item->get('firstname')} {$item->get('lastname')}" data-toggle="tooltip" title="{__('Delete')}"><i class="fa fa-trash-alt"></i></a>*}
                    </td>
                </tr>
            {/foreach}
            {if !$pager->hasItems()}
                <tr role="row" >
                    <td  colspan="13">{__('No request')}</td>
                </tr>
            {/if}  
        </tbody>         
    </table>
    {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager}
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

    var updated_dates = $( " .Range.UpdatedAtDate#updated_at_from, .Range.UpdatedAtDate#updated_at_to" ).datepicker({
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
                                    equal: {   },
                                    range : { },
                                nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                token:'{$formFilter->getCSRFToken()}'
                         } };
            if ($(".order_active").attr("name"))
                 params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");   
            $(".search").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); });            
            $(".equal options:selected").each(function() { params.filter.equal[$(this).parent().attr('name')] =$(this).val(); });
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
                            url:"{url_to('sales_quotation_ajax',['action'=>'ListPartialRequest'])}" ,                          
                            target: "#actions"
                             });
        }
        
        $(".search").keypress(function(event) {  if (event.keyCode==13)   return updateFilter(); });

        $("[name=nbitemsbypage]").change(function () {  return updateFilter();  });
    
        $(".pager").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('sales_quotation_ajax',['action'=>'ListPartialRequest'])}?page="+$(this).attr('data-page'),                                
                                 target: "#actions"
                });
        });
        
         $("#init").click(function () {                     
                return $.ajax2({   url:"{url_to('sales_quotation_ajax',['action'=>'ListPartialRequest'])}",
                                 target: "#actions"
                });
        });
        
         $("#filter").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('sales_quotation_ajax',['action'=>'ListPartialRequest'])}",
                                 target: "#actions"
                });
        });
          
          
      $(".View").click( function () {                    
                  return $.ajax2({ data : { Employer : $(this).attr('id') },                               
                                  url:"{url_to('employers_ajax',['action'=>'ViewEmployer'])}", 
                                                      
                                  target: "#actions"});
          });
    
     
         
     $(".Delete").click( function () { 
                if (!confirm('{__("Employer contact \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ EmployerRequest: $(this).attr('id') },
                                 url :"{url_to('sales_quotation_ajax',['action'=>'DeleteRequest'])}",                               
                                 success : function(resp) {
                                       if (resp.action!='DeleteEmployer') return ;                                          
                                          $(".list[id="+resp.id+"]").remove();  
                                          if ($('.list').length==0) return updateFilter();                                          
                                 }
                     });                                        
            });   
            
      $('.order').click(function() {
                $(".order_active").attr('class','order');
                $(this).attr('class','order_active');
                return updateFilter();
           });
           
      $("#GenerateRevivals").click(function() {                   
              return $.ajax2({ url:"{url_to('sales_quotation_ajax',['action'=>'GenerateRevival'])}",                                    
                         target: "#actions"}); 
        }); 
</script>
  