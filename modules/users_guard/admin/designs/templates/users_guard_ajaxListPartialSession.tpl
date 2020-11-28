<div class="row admin-header-container">
  <div class="col-sm">
              <h3 class="admin-header-big-text">{__('Sessions')}</h3>
              <h3 class="admin-header-small-text">{__('Users management')}</h3>
            </div>
  <div class="col-sm" style="padding: 0;">
      <div style="float: right;">        
        <a class="btn btn-warning admin-header-button" href="#"><i class="fa fa-file-excel"></i> {__('Export XLS')}</a>
      </div> 
  </div>
</div>


<div class="breadcrumb-title">
  <p>              
      <i class="fa fa-home" style="color: #37bc9b;"></i>               
      <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Users')}
      <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Sessions')}
  </p>
</div>

{alerts}
          <!-- Begin Add User -->
         <div class="table-responsive bg-white px-1 py-2">
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
           <th>{__('Username')}           
             <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.username->getValueExist('asc','_active')}" id="asc" name="username"><i class="fas fa-sort-up {if $formFilter.order.username->getValue()=='asc'}text-dark{/if}" style=""></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.username->getValueExist('desc','_active')}" id="desc" name="username"><i class="fas fa-sort-down {if $formFilter.order.username->getValue()=='desc'}text-dark{/if}"></i></a>            
                </div>
            </th>
      
            <th>{__('IP')}           
             <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.ip->getValueExist('asc','_active')}" id="asc" name="id"><i class="fas fa-sort-up {if $formFilter.order.ip->getValue()=='asc'}text-dark{/if}" style=""></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.ip->getValueExist('desc','_active')}" id="desc" name="id"><i class="fas fa-sort-down {if $formFilter.order.ip->getValue()=='desc'}text-dark{/if}"></i></a>            
                </div>
            </th>
            <th style="width: 230px;" class="footable-first-column" data-toggle="true">
                <span>{__('Start time')}</span>   
                <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.start_time->getValueExist('asc','_active')}" id="asc" name="start_time"><i class="fas fa-sort-up {if $formFilter.order.start_time->getValue()=='asc'}text-dark{/if}"></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.start_time->getValueExist('desc','_active')}" id="desc" name="start_time"><i class="fas fa-sort-down {if $formFilter.order.start_time->getValue()=='desc'}text-dark{/if}"></i></a>           
                </div>
            </th>
            <th style="width: 230px;" class="footable-first-column" data-toggle="true">
                <span>{__('Last time')}</span>   
                <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.last_time->getValueExist('asc','_active')}" id="asc" name="last_time"><i class="fas fa-sort-up {if $formFilter.order.last_time->getValue()=='asc'}text-dark{/if}"></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.last_time->getValueExist('desc','_active')}" id="desc" name="last_time"><i class="fas fa-sort-down {if $formFilter.order.last_time->getValue()=='desc'}text-dark{/if}"></i></a>           
                </div>
            </th>
            {*<th class="footable-first-column" data-toggle="true">
                <span>{__('Action')}</span>   
            </th>*}
    </tr>  
</thead>
    {* search/equal/range *}
    <tr class="input-list">
       <td>{* # *}</td>         
       <td>{* username *}
           <input type="text" name="username" value="{$formFilter.search.username}" size="5" class="search form-control">
       </td>      
       <td>{* ip *}
           <input type="text" name="ip" value="{$formFilter.search.ip}" size="5" class="search form-control">
       </td>  
        <td>
            <input class="form-control form-control-sm ml-1 InputTexte RowBlock Range Date CreatedAtDate" id="start_time_from" date-id="from" placeholder="{__('From')}" name="start_time" value="{if $formFilter->hasErrors()}{$formFilter.range.start_time.from}{else}{format_date($formFilter.range.start_time.from,'a')}{/if}">
            <input class="form-control form-control-sm ml-1  InputTexte RowBlock Range Date CreatedAtDate" id="start_time_to" date-id="to" placeholder="{__('To')}" name="start_time" value="{if $formFilter->hasErrors()}{$formFilter.range.start_time.to}{else}{format_date($formFilter.range.start_time.to,'a')}{/if}">
        </td>
        <td> 
            <input class="form-control form-control-sm ml-1  InputTexte RowBlock Range Date UpdatedAtDate" id="last_time_from" date-id="from" placeholder="{__('From')}" name="last_time" value="{if $formFilter->hasErrors()}{$formFilter.range.last_time.from}{else}{format_date($formFilter.range.last_time.from,'a')}{/if}">
            <input class="form-control form-control-sm ml-1  InputTexte RowBlock Range Date UpdatedAtDate" id="last_time_to" date-id="to" placeholder="{__('To')}" name="last_time" value="{if $formFilter->hasErrors()}{$formFilter.range.last_time.to}{else}{format_date($formFilter.range.last_time.to,'a')}{/if}">
        </td>
        {*<td>               
          
        </td> *}
    </tr>   
    {foreach $pager as $item}
    <tr class="Session list"> 
        <td class="Session-count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>                
            <td>                
                     {$item->getUser()->get('username')}                
            </td>  
            <td>
                     {$item->get('ip')}  
            </td> 
            <td>
                     {format_date($item->get('start_time'),['d','q'])}  
            </td> 
            <td>
                     {format_date($item->get('last_time'),['d','q'])}  
            </td> 
            
    </tr>    
    {/foreach}    
</table> 
</div>
{if !$pager->getNbItems()}
     <span>{__('No session')}</span>
{else}
  {*  {if $pager->getNbItems()>5}
        <input type="checkbox" id="Session-all" /> 
          <a style="opacity:0.5" class="Session-actions_items" href="#" title="{__('delete')}" id="Session-Delete">
              <img  src="{url('/icons/delete.gif','picture')}" alt='{__("Delete")}'/>
          </a>         
    {/if} *}
{/if}    
 {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager class="Session"}  
<script type="text/javascript">
 
     {* =================================== METHODS ======================================================== *}
     
        function change(action,resp) {
               $.each(resp.selection ? resp.selection : [resp.id], function (id) {                
                    $("."+action+"[id="+this+"] i").removeClass('text-'+(resp.value=='YES'?'danger':'success')).addClass('text-'+(resp.value=='YES'?'success':'danger'));
                    $("."+action+"[id="+this+"]").attr('name',resp.value);
               });
       }
    
    
        var start_time_dates = $( ".Range.CreatedAtDate#start_time_from, .Range.CreatedAtDate#start_time_to" ).datepicker({
                            onSelect: function( selectedDate ) {
                                    var option = this.id == "start_time_from" ? "minDate" : "maxDate",
                                            instance = $( this ).data( "datepicker" ),
                                            date = $.datepicker.parseDate(
                                                    instance.settings.dateFormat ||
                                                    $.datepicker._defaults.dateFormat,
                                                    selectedDate, instance.settings );
                                    start_time_dates.not( this ).datepicker( "option", option, date );
        } } );

        var last_time_dates = $( ".Range.UpdatedAtDate#last_time_from, .Range.UpdatedAtDate#last_time_to" ).datepicker({
                            onSelect: function( selectedDate ) {
                                    var option = this.id == "last_time_from" ? "minDate" : "maxDate",
                                            instance = $( this ).data( "datepicker" ),
                                            date = $.datepicker.parseDate(
                                                    instance.settings.dateFormat ||
                                                    $.datepicker._defaults.dateFormat,
                                                    selectedDate, instance.settings );
                                    last_time_dates.not( this ).datepicker( "option", option, date );
        } } );
 
 
 
 
        function getSiteSessionFilterParameters()
        {
            var params={ filter: {  order : { }, 
                                    search : { },
                                    equal: { },
                                    token:'{$formFilter->getCSRFToken()}',
                                    nbitemsbypage: $("[name=Session-nbitemsbypage]").val()
                         } };
            if ($(".Session-order_active").attr("name"))
                 params.filter.order[$(".Session-order_active").attr("name")] =$(".Session-order_active").attr("id");   
            $(".Session-search").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); });            
            return params;                  
        }
        
        function updateSiteSessionFilter()
        {  
           return $.ajax2({ data: getSiteSessionFilterParameters(), 
                            url:"{url_to('users_guard_ajax',['action'=>'ListPartialSession'])}" , 
                            errorTarget: ".site-errors",
                            loading: "#tab-site-dashboard-x-settings-loading",
                            target: "#actions"
                             });
        }
    
        function updateSitePager(n)
        {
           page_active=$(".Session-pager .Session-active").html()?parseInt($(".Session-pager .Session-active").html()):1;
           records_by_page=$("[name=Session-nbitemsbypage]").val();
           start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
           $(".Session-count").each(function(id) { $(this).html(start+id) }); // Update index column           
           nb_results=parseInt($("#Session-nb_results").html())-n;
           $("#Session-nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
           $("#Session-end_result").html($(".Session-count:last").html());
        }
        
         function updateFilter()
        {          
           return $.ajax2({ data: getFilterParameters(), 
                             url:"{url_to('users_guard_ajax',['action'=>'ListPartialSession'])}",                          
                            target: "#actions"
                             });
        }
            
          {* =====================  P A G E R  A C T I O N S =============================== *}  
          
          $(".search").keypress(function(event) {  if (event.keyCode==13)   return updateFilter(); });

        $("[name=nbitemsbypage]").change(function () {  return updateFilter();  });
          
          $('.order').click(function() {            
                $(".order_active").attr('class','order');
                $(this).attr('class','order_active');
                return updateFilter();
           });
          
          
      
           $("#Session-init").click(function() {      
               $.ajax2({ url:"{url_to('users_guard_ajax',['action'=>'ListPartialSession'])}",
                         errorTarget: ".site-errors",
                         loading: "#tab-site-dashboard-x-settings-loading",                         
                         target: "#actions"}); 
           }); 
    
          $('.Session-order').click(function() {
                $(".Session-order_active").attr('class','Session-order');
                $(this).attr('class','Session-order_active');
                return updateSiteSessionFilter();
           });
           
            $(".Session-search").keypress(function(event) {
                if (event.keyCode==13)
                    return updateSiteSessionFilter();
            });
            
          $("#Session-filter").click(function() { return updateSiteSessionFilter(); }); 
          
          $("[name=Session-nbitemsbypage]").change(function() { return updateSiteSessionFilter(); }); 
          
         // $("[name=Session-name]").change(function() { return updateSiteSessionFilter(); }); 
           
           $(".Session-pager").click(function () {        
                return $.ajax2({ data: getSiteSessionFilterParameters(), 
                                 url:"{url_to('users_guard_ajax',['action'=>'ListPartialSession'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length),
                                 errorTarget: ".site-errors",
                                 loading: "#tab-site-dashboard-x-settings-loading",
                                 target: "#actions"
                });
        });
          {* =====================  A C T I O N S =============================== *}  

        $("#Session-Cancel").click(function() {      
               $.ajax2({ url:"{url_to('users_ajax',['action'=>'ListPartial'])}",
                         errorTarget: ".site-errors",
                         loading: "#tab-site-dashboard-x-settings-loading",                         
                         target: "#actions"}); 
           }); 
           
        $(".Delete").click( function () { 
             if (!confirm('{__("Session \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
             return $.ajax2({ data :{ Session: $(this).attr('id') },
                              url :"{url_to('users_guard_ajax',['action'=>'DeleteSession'])}",                               
                              success : function(resp) {
                                    if (resp.action!='DeleteSession') return ;                                          
                                       $(".list[id="+resp.id+"]").remove();  
                                       if ($('.list').length==0) return updateFilter();                                          
                              }
            });                                        
        });
           
</script>    