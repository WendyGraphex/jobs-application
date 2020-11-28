<div class="row admin-header-container">
    <div class="col-sm">
      <h3 class="admin-header-big-text">{__('Configurations')}</h3>
      <h3 class="admin-header-small-text">{__('Sale Employee commissions')}</h3>
    </div>
    <div class="col-sm" style="padding: 0;">
        <div style="float: right;"> 
            <a class="btn btn-success admin-header-button"  href="#" id="New"><i class="fa fa-plus"></i> {__('New')}</a>
        </div> 
    </div>
</div>

{*<div class="row admin-header-container">
    <div class="col-sm">
      <h3>{__('Configurations')}</h3>
      <h3 class="admin-header-small-text">{__('Sale commissions')}</h3>
    </div>
    <div class="col-sm" style="padding: 0;">
        <div style="float: right;"> 
          <a class="btn btn-success admin-header-button"  href="#" id="New"><i class="fa fa-plus"></i> {__('New')}</a>
        </div> 
    </div>
</div>*}
<div class="breadcrumb-title">
    <p>                
        <i class="fa fa-home" style="color: #37bc9b;"></i>              
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Configurations')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Sale Employee Commissions')}
    </p>
</div>
{alerts}

<div class=" bg-white px-2 py-2">         
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
          <th>{__('ID')}           
                <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><i class="fas fa-sort-up {if $formFilter.order.id->getValue()=='asc'}text-dark{/if}" style=""></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><i class="fas fa-sort-down {if $formFilter.order.id->getValue()=='desc'}text-dark{/if}"></i></a>            
                </div>
        </th>   
          <th data-hide="phone">
            <span>{__('Name')}</span>  
            <div style="float: right;">
                <a href="#" class="position-absolute order{$formFilter.order.name->getValueExist('asc','_active')}" id="asc" name="value"><i class="fas fa-sort-up"></i></a>
                <a href="#" class="position-absolute order{$formFilter.order.name->getValueExist('desc','_active')}" id="desc" name="value"><i class="fas fa-sort-down"></i></a>            
            </div>
          </th>
          <th data-hide="phone">
            <span>{__('Number of rates')}</span>            
          </th>
           <th data-hide="phone">
            <span>{__('Active')}</span>             
          </th>
            <th style="width: 230px;" class="footable-first-column" data-toggle="true">
                <span>{__('Started At')}</span>   
                <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.start_at->getValueExist('asc','_active')}" id="asc" name="start_at"><i class="fas fa-sort-up {if $formFilter.order.start_at->getValue()=='asc'}text-dark{/if}"></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.start_at->getValueExist('desc','_active')}" id="desc" name="start_at"><i class="fas fa-sort-down  {if $formFilter.order.start_at->getValue()=='desc'}text-dark{/if}" ></i></a>           
                </div>
            </th>
            <th style="width: 230px;" class="footable-first-column" data-toggle="true">
                <span>{__('Expired At')}</span>   
                <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.expired_at->getValueExist('asc','_active')}" id="asc" name="expired_at"><i class="fas fa-sort-up {if $formFilter.order.expired_at->getValue()=='asc'}text-dark{/if}"></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.expired_at->getValueExist('desc','_active')}" id="desc" name="expired_at"><i class="fas fa-sort-down  {if $formFilter.order.expired_at->getValue()=='desc'}text-dark{/if}" ></i></a>           
                </div>
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
       <tr>
           <td></td>
             <td></td>
             <td>
                  <input style="height: 31px;" class="search Input form-control form-control-sm ml-1" placeholder="{__('Name')}" name="name" value="{$formFilter.search.name}"/>
             </td>
        <td>
            
        </td>  
         <td>
            
        </td>  
        <td>
            <input class="form-control form-control-sm ml-1 InputTexte RowBlock Range Date CreatedAtDate" id="created_at_from" date-id="from" placeholder="{__('From')}" name="created_at" value="{if $formFilter->hasErrors()}{$formFilter.range.created_at.from}{else}{format_date($formFilter.range.created_at.from,'a')}{/if}">
            <input class="form-control form-control-sm ml-1  InputTexte RowBlock Range Date CreatedAtDate" id="created_at_to" date-id="to" placeholder="{__('To')}" name="created_at" value="{if $formFilter->hasErrors()}{$formFilter.range.created_at.to}{else}{format_date($formFilter.range.created_at.to,'a')}{/if}">
        </td>
        <td> 
            <input class="form-control form-control-sm ml-1  InputTexte RowBlock Range Date UpdatedAtDate" id="updated_at_from" date-id="from" placeholder="{__('From')}" name="updated_at" value="{if $formFilter->hasErrors()}{$formFilter.range.updated_at.from}{else}{format_date($formFilter.range.updated_at.from,'a')}{/if}">
            <input class="form-control form-control-sm ml-1  InputTexte RowBlock Range Date UpdatedAtDate" id="updated_at_to" date-id="to" placeholder="{__('To')}" name="updated_at" value="{if $formFilter->hasErrors()}{$formFilter.range.updated_at.to}{else}{format_date($formFilter.range.updated_at.to,'a')}{/if}">
        </td>
       <td>
            <input class="form-control form-control-sm ml-1 InputTexte RowBlock Range Date StartAtDate" id="start_at_from" date-id="from" placeholder="{__('From')}" name="start_at" value="{if $formFilter->hasErrors()}{$formFilter.range.start_at.from}{else}{format_date($formFilter.range.start_at.from,'a')}{/if}">
            <input class="form-control form-control-sm ml-1  InputTexte RowBlock Range Date StartAtDate" id="start_at_to" date-id="to" placeholder="{__('To')}" name="start_at" value="{if $formFilter->hasErrors()}{$formFilter.range.start_at.to}{else}{format_date($formFilter.range.start_at.to,'a')}{/if}">
        </td>
        <td> 
            <input class="form-control form-control-sm ml-1  InputTexte RowBlock Range Date ExpireAtDate" id="expired_at_from" date-id="from" placeholder="{__('From')}" name="expired_at" value="{if $formFilter->hasErrors()}{$formFilter.range.expired_at.from}{else}{format_date($formFilter.range.expired_at.from,'a')}{/if}">
            <input class="form-control form-control-sm ml-1  InputTexte RowBlock Range Date ExpireAtDate" id="expired_at_to" date-id="to" placeholder="{__('To')}" name="expired_at" value="{if $formFilter->hasErrors()}{$formFilter.range.expired_at.to}{else}{format_date($formFilter.range.expired_at.to,'a')}{/if}">
        </td>
        <td></td>
    </tr>
         {foreach $pager as $item}
          <tr class="list" id="{$item->get('id')}"> 
              <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>                                         
              <td>
                {$item->get('id')}
              </td> 
                <td>{$item->getFormatter()->getName()->ucfirst()}</td>
                  <td>{$item->getFormatter()->getNumberOfRates()}</td>
                  <td></td>
              <td>                                           
                   {if $item->hasStarted()}
                       {$item->getFormatter()->getStartedAt()->getFormatted()}
                   {else}
                       {__('---')}
                   {/if}    
              </td>
              <td>
                   {if $item->hasExpired()}
                        {$item->getFormatter()->getExpiredAt()->getFormatted()}
                   {else}
                       {__('---')}
                   {/if}  
              </td>
                <td>       
                    {$item->getFormatter()->getCreatedAt()->getFormatted()}
                </td> 
                <td>                
                    {$item->getFormatter()->getUpdatedAt()->getFormatted()}
                </td>
              <td>               
                    <a href="#" meta_title="{__('Edit')}" class="View" id="{$item->get('id')}">
                        <i class="fa fa-pencil-alt icon-font"></i></a>   
                      <a href="#" meta_title="{__('Rates')}" class="Rates" id="{$item->get('id')}">
                        <i class="fa fa-list icon-font"></i></a>   
                    <a href="#" meta_title="{__('Delete')}" class="Delete" id="{$item->get('id')}"  name="{$item->get('name')}">
                        <i  class="fa fa-trash-alt delete-color icon-font"></i>
                    </a>                                                       
              </td>
          </tr>    
        {/foreach}  
       </tbody>
     </table>
      {if !$pager->getNbItems()}
         <span>{__('No commission')}</span>
      {/if}
    </div>   
       {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager}
<script application="text/javascript">
    
    
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
    
    
    
    
     var start_at_dates = $( ".Range.StartAtDate#start_at_from, .Range.StartAtDate#start_at_to" ).datepicker({
                            onSelect: function( selectedDate ) {
                                    var option = this.id == "start_at_from" ? "minDate" : "maxDate",
                                            instance = $( this ).data( "datepicker" ),
                                            date = $.datepicker.parseDate(
                                                    instance.settings.dateFormat ||
                                                    $.datepicker._defaults.dateFormat,
                                                    selectedDate, instance.settings );
                                    start_at_dates.not( this ).datepicker( "option", option, date );
        } } );

        var expired_at_dates = $( ".Range.ExpireAtDate#expired_at_from, .Range.ExpireAtDate#expired_at_to" ).datepicker({
                            onSelect: function( selectedDate ) {
                                    var option = this.id == "expired_at_from" ? "minDate" : "maxDate",
                                            instance = $( this ).data( "datepicker" ),
                                            date = $.datepicker.parseDate(
                                                    instance.settings.dateFormat ||
                                                    $.datepicker._defaults.dateFormat,
                                                    selectedDate, instance.settings );
                                    expired_at_dates.not( this ).datepicker( "option", option, date );
        } } );
    
    
                  
        function getFilterParameters()
        {
            var params={ filter: {  order : { }, 
                                    search : { },
                                    equal: {  },                                                                                                                                                                  
                                nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                token:'{$formFilter->getCSRFToken()}'
                         } };
            if ($(".order_active").attr("name"))
                 params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");   
            $(".search.Input").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); });           
            $(".equal.Select option:selected").each(function() { params.filter.equal[$(this).parent().attr('name')] =$(this).val(); });                       
            return params;                  
        }
        
        function updateFilter()
        {           
           return $.ajax2({ data: getFilterParameters(), 
                            url:"{url_to('sales_ajax',['action'=>'ListPartialEmployeeCommission'])}" ,                                                      
                            target: "#actions"
                             });
        }
    
        function updatePager(n)
        {
           var page_active=$(".pager .active").html()?parseInt($(".pager .active").html()):1;
           var records_by_page=$("[name=nbitemsbypage]").val();
           var start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
           $(".count").each(function(id) { $(this).html(start+id) }); // Update index column           
           var nb_results=parseInt($("#nb_results").html())-n;
           $("#nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
           $("#end_result").html($(".count:last").html());
        }
                       
          {* =====================  P A G E R  A C T I O N S =============================== *}  
      
           $("#init").click(function() {                   
               return $.ajax2({ url:"{url_to('sales_ajax',['action'=>'ListPartialEmployeeCommission'])}",                                    
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
                   
           $(".pager").click(function () {                      
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('sales_ajax',['action'=>'ListPartialEmployeeCommission'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length),
                                target: "#actions"
                });
        });
        
          {* =====================  A C T I O N S =============================== *}  
      
        
         
          $("#New").click( function () {             
            return $.ajax2({              
                url: "{url_to('sales_ajax',['action'=>'NewEmployeeCommission'])}",              
                target: "#actions"
           });
         });
         
         $(".View").click( function () {                
                return $.ajax2({ data : { SaleEmployeeCommission : $(this).attr('id') },                                
                                url:"{url_to('sales_ajax',['action'=>'ViewEmployeeCommission'])}",                              
                                target: "#actions"});
         });
         
         
          $(".Rates").click( function () {                
                return $.ajax2({ data : { SaleEmployeeCommission : $(this).attr('id') },                                
                                url:"{url_to('sales_ajax',['action'=>'ListPartialRateForEmployeeCommission'])}",                              
                                target: "#actions"});
         });
         
       $(".list").dblclick( function () {                    
                  return $.ajax2({  url:"{url_to('sales_ajax',['action'=>'ViewEmployeeCommission'])}", 
                                  target: "#actions"});
          });
         
            
        $(".Delete").click( function () { 
                if (!confirm('{__("Commission \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ SaleEmployeeCommission: $(this).attr('id') },
                                 url :"{url_to('sales_ajax',['action'=>'DeleteEmployeeCommission'])}",                                
                                 success : function(resp) {
                                          if (resp.action != 'DeleteEmployeeCommission')  return ;                                                                              
                                          $(".list[id="+resp.id+"]").remove();  
                                          if ($('.list').length==0) return updateFilter();
                                          updatePager(1);                                    
                                 }
                     });                                        
            });
            
  
</script>    
