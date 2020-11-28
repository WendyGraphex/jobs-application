    <div class="row admin-header-container">
        <div class="col-sm">
          <h3 class="admin-header-big-text">{__('Employers')}</h3>
          <h3 class="admin-header-small-text">{__('Employer Company management')}</h3>
        </div>
        <div class="col-sm" style="padding: 0;">
            <div style="float: right;"> 
                <a class="btn btn-success admin-header-button"  href="#" id="New"><i class="fa fa-plus"></i> {__('New Company')}</a>
                <a class="btn btn-warning admin-header-button" href="#"><i class="fa fa-file-excel"></i> {__('Export XLS')}</a>
            </div> 
        </div>
    </div>
          
          <!-- End page heading -->
          
          <!-- Begin breadcrumb -->
          <div class="breadcrumb-title">
            <p>              
                <i class="fa fa-home" style="color: #37bc9b;"></i>               
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Employers')}
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Employer Companies management')}
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
                 <div class="float-right w-50">                   
                        <button id="filter" class="btn btn-primary" style="float: right; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Filter")}</button>   
                        <button id="init" class="btn btn-primary" style="float: right; margin-right: 10px; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Init")}</button>
                 </div>
             </div>
    {*<div class="row float-left mt-2 w-100">
      <div class="col-sm-12">*}
      <table id="Myliste" class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer w-100 list-user"  role="grid" aria-describedby="Myliste_info">
      <thead class="bgSpec">   {*bg-info thead-color*}
        <tr role="row">
            <th class="count">#</th>
            <th class="sorting" ><span>{__('ID')}
                <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><i class="fas fa-sort-up {if $formFilter.order.id->getValue()=='asc'}text-dark{/if}"></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><i class="fas fa-sort-down {if $formFilter.order.id->getValue()=='desc'}text-dark{/if}"></i></a>            
                </div>
                </span> 
            {*<th  class="sorting_asc">Logo</th>*}
            <th  class="sorting_asc">Picture</th>
            <th class="sorting" ><span>{__('Name')}</span>  
              <div style="float: right;">
                <a href="#" class="position-absolute order{$formFilter.order.name->getValueExist('asc','_active')}" id="asc" name="name"><i class="fas fa-sort-up {if $formFilter.order.name->getValue()=='asc'}text-dark{/if}"></i></a>
                <a href="#" class="position-absolute order{$formFilter.order.name->getValueExist('desc','_active')}" id="desc" name="name"><i class="fas fa-sort-down {if $formFilter.order.name->getValue()=='desc'}text-dark{/if}"></i></a>            
              </div>
          </th> 
          <th class="sorting" ><span>{__('Is Active')}</span> 
            <th class="sorting" style="width: 114px;"><span>{__('Commercial')}</span>  
              <div style="float: right;">
                <a href="#" class="position-absolute order{$formFilter.order.commercial->getValueExist('asc','_active')}" id="asc" name="commercial"><i class="fas fa-sort-up {if $formFilter.order.commercial->getValue()=='asc'}text-dark{/if}"></i></a>
                <a href="#" class="position-absolute order{$formFilter.order.commercial->getValueExist('desc','_active')}" id="desc" name="commercial"><i class="fas fa-sort-down {if $formFilter.order.commercial->getValue()=='desc'}text-dark{/if}"></i></a>            
              </div>
            </th>   
            {*<th class="sorting">{__('Web')}</th>*}
            <th class="sorting"><span>{__('Email')}</span>
                <div style="float: right;">
                <a href="#" class="position-absolute order{$formFilter.order.email->getValueExist('asc','_active')}" id="asc" name="email"><i class="fas fa-sort-up {if $formFilter.order.email->getValue()=='asc'}text-dark{/if}"></i></a>
                <a href="#" class="position-absolute order{$formFilter.order.email->getValueExist('desc','_active')}" id="desc" name="email"><i class="fas fa-sort-down {if $formFilter.order.email->getValue()=='desc'}text-dark{/if}"></i></a>            
              </div>
            </th>
            <th class="sorting">{__('Phone')}</span>  
              <div style="float: right;">
                <a href="#" class="position-absolute order{$formFilter.order.phone->getValueExist('asc','_active')}" id="asc" name="phone"><i class="fas fa-sort-up {if $formFilter.order.phone->getValue()=='asc'}text-dark{/if}"></i></a>
                <a href="#" class="position-absolute order{$formFilter.order.phone->getValueExist('desc','_active')}" id="desc" name="phone"><i class="fas fa-sort-down {if $formFilter.order.phone->getValue()=='desc'}text-dark{/if}"></i></a>            
              </div>
          </th>              
            {*<th class="sorting">{__('Address')}</span></th> *} 
            <th style="width: 230px;" class="footable-first-column" data-toggle="true">
                <span>{__('Created at')}</span>   
                <div style="float: right;">
                    <a href="#" class="position-absolute order $formFilter.order.created_at->getValueExist('asc','_active')" id="asc" name="created_at"><i class="fas fa-sort-up OrderPosition {if $formFilter.order.created_at->getValue()=='asc'}text-dark{/if}"></i></a>
                    <a href="#" class="position-absolute order $formFilter.order.created_at->getValueExist('desc','_active')" id="desc" name="created_at"><i class="fas fa-sort-down OrderPosition {if $formFilter.order.created_at->getValue()=='desc'}text-dark{/if}"></i></a>            
                </div>
            </th>
               <th style="width: 230px;" class="footable-first-column" data-toggle="true">
                <span>{__('Updated at')}</span>   
                <div style="float: right;">
                    <a href="#" class="position-absolute order $formFilter.order.updated_at->getValueExist('asc','_active')" id="asc" name="updated_at"><i class="fas fa-sort-up OrderPosition {if $formFilter.order.updated_at->getValue()=='asc'}text-dark{/if}"></i></a>
                    <a href="#" class="position-absolute order $formFilter.order.updated_at->getValueExist('desc','_active')" id="desc" name="updated_at"><i class="fas fa-sort-down OrderPosition {if $formFilter.order.updated_at->getValue()=='desc'}text-dark{/if}"></i></a>            
                </div>
            </th>
            
            {*<th class="footable-first-column" data-toggle="true">
                <span>{__('Status')}</span>   
                
            </th>    *}        
            <th>{__('Actions')}</th>
        </tr>
      </thead>
      <tbody>
          <tr role="row">
              <td></td>
              <td></td>
              {*<td></td>*}
              <td></td>
              <td><input placeholder="{__('name')}" class="form-control form-control-sm ml-1 search" name="name" value="{$formFilter.search.name}"></td>
              <td>{html_options style="height: 32px;" class="equal Select show-menu-arrow form-control" name="is_active" options=$formFilter->equal.is_active->getOption('choices') selected=(string)$formFilter.equal.is_active}</td>
              <td><input placeholder="{__('Commercial')}" class="form-control form-control-sm ml-1 search" name="commercial" value="{$formFilter.search.commercial}"></td>
             {* <td></td>*}
              <td><input placeholder="{__('Email')}" class="form-control form-control-sm ml-1 search" name="email" value="{$formFilter.search.email}"></td>

              <td><input placeholder="{__('Phone')}" class="form-control form-control-sm ml-1 search" name="phone" value="{$formFilter.search.phone}"></td></td>              
              {*<td><input class="form-control form-control-sm ml-1 search" name="address" value="{$formFilter.search.address}"></td>*}                          
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
      </tbody>
      <tbody>
       {foreach $pager as $item} 
      <tr class="list" id="{$item->get('id')}" role="row">
          <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>
          <td class="list">{$item->get('id')}</td>
          {*<td>
                {if $item->hasLogo()}
                    {*<label>aaaa</label>*}
                     {*<img class="classIcon" src="{$item->getLogo()->getUrl()}"/> 
                {/if} 
         </td>*}
         <td>
                {*if $item->hasPictureCompany()}
                     <img class="classIcon" src="{$item->getPictureCompany()->getMedium()->getUrl()}"/> 
                {/if*} 
         </td>
          <td>{$item->get('name')}</td>
          <td>
              {*<a href="#" class="ChangeIsActive" name="{$item->get('is_active')}" id="{$item->get('id')}"><i class="fa fa-check text-{if $item->isActive()}success{else}danger{/if}"></i></a> *}
              <a href="#" class="ChangeIsActive" name="{$item->get('is_active')}" id="{$item->get('id')}"><i class="fa fa-circle text-{if $item->isActive()}success{else}danger{/if}"></i></a> 
          </td>
          <td>{$item->get('commercial')}</td>
          {*<td>{$item->get('web')}</td>*}
          <td>{$item->get('email')}</td>
           <td> 
              {if $item->get('phone')}<div>{$item->get('phone')}</div>{/if}
              {if $item->get('mobile')}<div>{$item->get('mobile')}</div>{/if}
          </td>   
            {*<td>
                <div>{$item->get('address1')}</div>
                  <div>{$item->get('address2')} </div>
                  <div>{$item->get('postcode')} {$item->get('city')}  {$item->get('state')}  {$item->getFormatter()->getCountry()->ucfirst()}</div>
            </td>*}
            <td>       
                    {$item->getFormatter()->getCreatedAt()->getFormatted()}
            </td> 
            <td>                
                    {$item->getFormatter()->getUpdatedAt()->getFormatted()}
            </td>
            <td>
                <a href="#" class="list-action text-info View" id="{$item->get('id')}"  title="{__('Edit')}"><i class="fa fa-pencil-alt"></i></a>
                <a href="#" class="list-action text-alert Users" id="{$item->get('id')}"  title="{__('Users')}"><i class="fa fa-users"></i></a>
                <a href="#" class="list-action text-danger Delete" id="{$item->get('id')}" name="{$item->get('firstname')} {$item->get('lastname')}" data-toggle="tooltip" title="{__('Delete')}"><i class="fa fa-trash-alt delete-color icon-font"></i></a>
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
      {*</div>
    </div>*}
       {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager} 
<!--     <div class="row">
      <div class="col-sm-5"><div class="dataTables_info" id="Myliste_info" role="status" aria-live="polite">Showing 1 to 10 of 2,222 entries</div></div><div class="col-sm-7"><div class="dataTables_paginate paging_simple_numbers" id="Myliste_paginate"><ul class="pagination"><li class="paginate_button previous disabled" id="Myliste_previous"><a href="#" aria-controls="Myliste" data-dt-idx="0" tabindex="0">Previous</a></li><li class="paginate_button active"><a href="#" aria-controls="Myliste" data-dt-idx="1" tabindex="0">1</a></li><li class="paginate_button "><a href="#" aria-controls="Myliste" data-dt-idx="2" tabindex="0">2</a></li><li class="paginate_button "><a href="#" aria-controls="Myliste" data-dt-idx="3" tabindex="0">3</a></li><li class="paginate_button "><a href="#" aria-controls="Myliste" data-dt-idx="4" tabindex="0">4</a></li><li class="paginate_button "><a href="#" aria-controls="Myliste" data-dt-idx="5" tabindex="0">5</a></li><li class="paginate_button disabled" id="Myliste_ellipsis"><a href="#" aria-controls="Myliste" data-dt-idx="6" tabindex="0">…</a></li><li class="paginate_button "><a href="#" aria-controls="Myliste" data-dt-idx="7" tabindex="0">223</a></li><li class="paginate_button next" id="Myliste_next"><a href="#" aria-controls="Myliste" data-dt-idx="8" tabindex="0">Next</a></li></ul></div></div>
    </div> 
    </div>-->
  </div><!--End list-->


      <!--modal -->

        
      <!-- -->

<script type="text/javascript">
    
{* =================================== METHODS ======================================================== *}
    
     function change(action,resp) {
            $.each(resp.selection ? resp.selection : [resp.id], function (id) {                
                 $("."+action+"[id="+this+"] i").removeClass('text-'+(resp.value=='YES'?'danger':'success')).addClass('text-'+(resp.value=='YES'?'success':'danger'));
                 $("."+action+"[id="+this+"]").attr('name',resp.value);
            });
    }
    
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
                                    equal: {   
                                        is_active:$(".equal[name=is_active] option:selected").val(),
                                    }, 
                                    range : { },
                                nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                token:'{$formFilter->getCSRFToken()}'
                         } };
            if ($(".order_active").attr("name"))
                 params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");   
            $(".search").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); });
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
                            url:"{url_to('employers_ajax',['action'=>'ListPartialCompany'])}" ,                          
                            target: "#actions"
                             });
        }
        
{* =================================== PAGER/FILTER ======================================================== *}
        
        $(".search").keypress(function(event) {  if (event.keyCode==13)   return updateFilter(); });

        $("[name=nbitemsbypage]").change(function () {  return updateFilter();  });
    
        $(".pager").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('employers_ajax',['action'=>'ListPartialCompany'])}?page="+$(this).attr('data-page'),                                
                                 target: "#actions"
                });
        });
        
         $("#filter").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('employers_ajax',['action'=>'ListPartialCompany'])}",                                
                                 target: "#actions"
                });
        });
         
          $("#init").click(function () {                     
                return $.ajax2({ url:"{url_to('employers_ajax',['action'=>'ListPartialCompany'])}",                                
                                 target: "#actions"
                });
        });
        
{* =================================== ACTIONS ======================================================== *}
          
      $(".View").click( function () {                    
                  return $.ajax2({ data : { EmployerCompany : $(this).attr('id') },                               
                                  url:"{url_to('employers_ajax',['action'=>'ViewCompany'])}", 
                                                      
                                  target: "#actions"});
          });
          
           $(".list").dblclick( function () {                    
                  return $.ajax2({ data : { EmployerCompany : $(this).attr('id') },                               
                                  url:"{url_to('employers_ajax',['action'=>'ViewCompany'])}", 
                                                      
                                  target: "#actions"});
          });
          
            $(".Users").click( function () {                    
                  return $.ajax2({ data : { EmployerCompany : $(this).attr('id') },                               
                                  url:"{url_to('employers_ajax',['action'=>'ListPartialUserForCompany'])}",                                                       
                                  target: "#actions"});
          });
    
      $("#New").click( function () {             
                return $.ajax2({                    
                    url: "{url_to('employers_ajax',['action'=>'NewCompany'])}",               
                    target: "#actions"
              });
            });
         
     $(".Delete").click( function () { 
                if (!confirm('{__("Company \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ EmployerCompany: $(this).attr('id') },
                                 url :"{url_to('employers_ajax',['action'=>'DeleteCompany'])}",                               
                                 success : function(resp) {
                                       if (resp.action!='DeleteCompany') return ;                                          
                                          $(".list[id="+resp.id+"]").remove();  
                                          if ($('.list').length==0) return updateFilter();                                          
                                 }
                     });                                        
            }); 
            
            $(".equal").change(function() { return updateFilter(); });   
            
            
            
            
    $(".ChangeIsActive").click(function () {
            return $.ajax2({
                data : { EmployerCompany: { id: $(this).attr('id') , value:$(this).attr('name'),token :'{mfForm::getToken('ChangeForm')}' } },                              
                url: "{url_to('employers_ajax',['action'=>'ChangeIsActiveCompany'])}",              
                success: function (resp) {
                    if (resp.action != 'ChangeIsActiveCompany') return ;
                    change('ChangeIsActive',resp);
                }
            });
    });
     
</script>
  