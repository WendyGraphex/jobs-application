<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__('Freelancer')}</h3>
        <h3 class="admin-header-small-text">{__('Freelancer notation management')}</h3>
    </div>
    <div class="col-sm" style="padding: 0;">
        <div style="float: right;"> 
            {*     <a class="btn btn-success admin-header-button"  href="#" id="New"><i class="fa fa-plus"></i> {__('New Notation')}</a>
            <a class="btn btn-warning admin-header-button" href="#"><i class="fa fa-file-excel"></i> {__('Export XLS')}</a> *}
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
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Freelancers')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Notations')}
    </p>
</div>
<!-- End breadcrumb -->
{alerts}
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
        <thead class="bgSpec" {*class="bg-info thead-color"*}>
            <tr role="row">
                <th>#</th>
                <th>{__('ID')}        
                    <div style="float: right;">
                        <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><i class="fas fa-sort-up {if $formFilter.order.id->getValue()=='asc'}text-dark{/if}" style=""></i></a>
                        <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><i class="fas fa-sort-down {if $formFilter.order.id->getValue()=='desc'}text-dark{/if}"></i></a>            
                    </div>
                </th>            
                <th class="sorting">{__('From')}</span>  
                    <div style="float: right;">

                    </div></th>
                <th class="sorting">{__('To')}</span>  
                    <div style="float: right;">

                    </div></th>
                <th class="sorting">{__('Advert')}</span>  
                    <div style="float: right;"></div>
                </th>               
                  <th class="sorting">{__('Criteria')}</span>  
                    <div style="float: right;"></div>
                </th>  
                <th class="sorting">{__('Notation')}</span>  
                    <div style="float: right;"></div>
                </th>               
                <th style="width: 230px;" class="footable-first-column" data-toggle="true">
                    <span>{__('Created At')}</span>   
                    <div style="float: right;">
                        <a href="#" class="position-absolute order{$formFilter.order.created_at->getValueExist('asc','_active')}" id="asc" name="created_at"><i class="fas fa-sort-up {if $formFilter.order.created_at->getValue()=='asc'}text-dark{/if}"></i></a>
                        <a href="#" class="position-absolute order{$formFilter.order.created_at->getValueExist('desc','_active')}" id="desc" name="created_at"><i class="fas fa-sort-down {if $formFilter.order.created_at->getValue()=='desc'}text-dark{/if}"></i></a>           
                    </div>
                </th>
                <th style="width: 230px;" class="footable-first-column" data-toggle="true">
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
                <td><input class="form-control form-control-sm ml-1 search" placeholder="{__('Firstname, lastname, email, username')}" name="from" value="{$formFilter.search.from}"></td>
                <td><input class="form-control form-control-sm ml-1 search" placeholder="{__('Firstname, lastname, email, username')}" name="to" value="{$formFilter.search.to}"></td>
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
            </tr>
            {foreach $pager as $item} 
                <tr class="list" id="{$item->get('id')}" role="row">
                     <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td> 
                    <td class="list">{$item->get('id')}</td>        
                    <td>
                        {if $item->isEmployeeSender()} 
                            <div><strong>{$item->getEmployeeUser()->getFormatter()->getUsername()}</strong></div>
                            <div>{$item->getEmployeeUser()->getFormatter()->getFirstname()} {$item->getEmployeeUser()->getFormatter()->getLastname()}</div>
                            <div>{$item->getEmployeeUser()->getEmail()}</div>
                        {else}
                            <div><strong>{$item->getEmployerUser()->getFormatter()->getUsername()}</strong></div>
                            <div>{$item->getEmployerUser()->getFormatter()->getFirstname()} {$item->getEmployerUser()->getFormatter()->getLastname()}</div>
                            <div>{$item->getEmployerUser()->getEmail()}</div>
                        {/if}    
                    </td>
                    <td>
                        {if $item->isEmployerSender()} 
                            <div><strong>{$item->getEmployeeUser()->getFormatter()->getUsername()}</strong></div>
                            <div>{$item->getEmployeeUser()->getFormatter()->getFirstname()} {$item->getEmployeeUser()->getFormatter()->getLastname()}</div>
                            <div>{$item->getEmployeeUser()->getEmail()}</div>
                        {else}
                            <div><strong>{$item->getEmployerUser()->getFormatter()->getUsername()}</strong></div>
                            <div>{$item->getEmployerUser()->getFormatter()->getFirstname()} {$item->getEmployerUser()->getFormatter()->getLastname()}</div>
                            <div>{$item->getEmployerUser()->getEmail()}</div>
                        {/if}
                    </td>
                    <td> 
                        <div><a href="{$item->getAdvertI18n()->getUrl()}" target="_blank">{$item->getAdvertI18n()->getFormatter()->getReference()}</a></div>
                        <div>{$item->getAdvertI18n()->getFormatter()->getTitle()}</div> 
                    </td>  
                    <td>
                        {$item->getEmployeeCriteria()->getI18n()}
                    </td>
                    <td>
                        {$item->getFormatter()->getNotation()|escape} 
                    </td>
                    <td>       
                        {$item->getFormatter()->getCreatedAt()->getFormatted()}
                    </td> 
                    <td>                
                        {$item->getFormatter()->getUpdatedAt()->getFormatted()}
                    </td> 
                    <td>
                        {*$item->getFormatter()->getNotation()->ucfirst()|escape*} <i id="ShowNotations" class="fa fa-search" aria-hidden="true" style="font-size: 12px;cursor: pointer;"></i> 
                        {* <a href="#" class="list-action text-info View" id="{$item->get('id')}"  title="{__('Edit')}"><i class="fa fa-pencil-alt"></i></a>*}
                      {*  <a href="#" class="list-action text-danger Delete" id="{$item->get('id')}" name="{$item->get('message')|truncate:80}" title="{__('Delete')}"><i class="fa fa-trash-alt"></i></a> *}
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

{*-------------------------- Notations -----------------------------*} 
<div id="ModalNotation" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="border-bottom: none;padding-bottom: 0px;">
                <button type="button" class="close" data-dismiss="modal">×</button>
            </div>
            <div class="modal-body" style="padding-top: 0px;">
                <h4 style="margin-bottom: 20px;">{__('Leave your review for xxxx')}</h4>
                <div>
                    <span class="classCategoryStyle">xxxx</span>
                    <ul class="ulCategory">
                        <li>
                            <span>xxxxx</span>
                            <div>
                                <ul class="allStars Notation" data-rate="0" data-criteria="{*$criteria->get('id')*}" data-category="{*$category->get('id')*}">
                                    {*section name=note start=0 loop=$criteria->get('max')*}
                                    <li>
                                        <a href="#" id="{*$smarty.section.note.index*}" class="Criteria-{*$criteria->get('id')*} Criteria" data-criteria="{*$criteria->get('id')*}" data-category="{*$category->get('id')*}" style="color:#222;">
                                            <i class="fa fa-star"></i>
                                        </a>
                                    </li>                  
                                        {*/section*}                   
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
                <div style="text-align: center;">
                    <button type="button" id="SaveReview-btn" class="btn btn-success">{__('Save')}</button>
                </div> 
            </div>
        </div>
    </div>
</div>
    
<script type="text/javascript">
    
    $("#ShowNotations").click(function () {
        $("#ModalNotation").modal('show');
    });
    
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
                            url:"{url_to('employees_notation_ajax',['action'=>'ListPartialNotation'])}" ,                          
                            target: "#actions"
                             });
        }
        
        $(".search").keypress(function(event) {  if (event.keyCode==13)   return updateFilter(); });

        $("[name=nbitemsbypage]").change(function () {  return updateFilter();  });
    
        $(".pager").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('employees_notation_ajax',['action'=>'ListPartialNotation'])}?page="+$(this).attr('data-page'),                                
                                 target: "#actions"
                });
        });
        
         $("#init").click(function () {                     
                return $.ajax2({   url:"{url_to('employees_notation_ajax',['action'=>'ListPartialNotation'])}",
                                 target: "#actions"
                });
        });
        
         $("#filter").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('employees_notation_ajax',['action'=>'ListPartialNotation'])}",
                                 target: "#actions"
                });
        });
          
          
      $(".View").click( function () {                    
                  return $.ajax2({ data : { Employee : $(this).attr('id') },                               
                                  url:"{url_to('employees_notation_ajax',['action'=>'ViewEmployee'])}", 
                                                      
                                  target: "#actions"});
          });
    
     
         
     $(".Delete").click( function () { 
                if (!confirm('{__("Employee notation \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ EmployeeNotationI18n: $(this).attr('id') },
                                 url :"{url_to('employees_notation_ajax',['action'=>'DeleteNotationI18n'])}",                               
                                 success : function(resp) {
                                       if (resp.action!='DeleteNotationI18n') return ;                                          
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
</script>
  