
          <div class="row admin-header-container">
            <div class="col-sm">
              <h3 class="admin-header-big-text">{__('Payments')}</h3>
              <h3 class="admin-header-small-text">{__('Payment management')}</h3>
            </div>
            <div class="col-sm" style="padding: 0;">
                <div style="float: right;"> 
                   <a class="btn btn-success admin-header-button" id="Add" href="#"><i class="fa fa-plus"></i> {__('Add methods')}</a>  
                </div> 
            </div>
          </div>
          
          <!-- End page heading -->
          
          <!-- Begin breadcrumb -->
          <div class="breadcrumb-title">
            <p>               
                <i class="fa fa-home" style="color: #37bc9b;"></i>             
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Payments')}
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Debits')}
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Methods')}
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
            <th>{__('Name')}</span>  
              <div style="float: right;">
                <a href="#" class="position-absolute order{$formFilter.order.name->getValueExist('asc','_active')}" id="asc" name="name"><i class="fas fa-sort-up {if $formFilter.order.name->getValue()=='asc'}text-dark{/if}"></i></a>
                <a href="#" class="position-absolute order{$formFilter.order.name->getValueExist('desc','_active')}" id="desc" name="name"><i class="fas fa-sort-down {if $formFilter.order.name->getValue()=='desc'}text-dark{/if}"></i></a>            
              </div></th>  
              <th style="width: 100px;">{__('Active')}</span>  
              {*<div class="position-relative float-right mr-2">
                <a style="float: right;" href="#" class="position-absolute order{$formFilter.order.is_active->getValueExist('asc','_active')}" id="asc" name="is_active"><i class="fas fa-sort-up"></i></a>
                <a style="float: right;" href="#" class="position-absolute order{$formFilter.order.is_active->getValueExist('desc','_active')}" id="desc" name="is_active"><i class="fas fa-sort-down"></i></a>            
              </div>*}
            </th>
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
              <td><input class="form-control form-control-sm ml-1 search Input" placeholder="{__('Name')}" name="name" value="{$formFilter.search.name}"></td>
               <td>
                    {html_options style="height: 31px;" class="equal Select show-menu-arrow form-control" name="is_active" options=$formFilter->equal.is_active->getOption('choices') selected=(string)$formFilter.equal.is_active}
                </td> 
              <td>
                    <input class="form-control form-control-sm ml-1 InputTexte RowBlock Range Date CreatedAtDate" id="created_at_from" date-id="from" placeholder="{__('From')}" name="created_at" value="{if $formFilter->hasErrors()}{$formFilter.range.created_at.from}{else}{format_date($formFilter.range.created_at.from,'a')}{/if}">
                    <input class="form-control form-control-sm ml-1  InputTexte RowBlock Range Date CreatedAtDate" id="created_at_to" date-id="to" placeholder="{__('To')}" name="created_at" value="{if $formFilter->hasErrors()}{$formFilter.range.created_at.to}{else}{format_date($formFilter.range.created_at.to,'a')}{/if}">
                </td>                                  
          </tr>
      
       {foreach $pager as $item} 
      <tr class="list" id="{$item->get('id')}" role="row">
          <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>         
            <td>{$item->getMethod()->getFormatter()->getI18n()->ucfirst()}</td>
            <td class="align-middle text-center"> <a href="#" class="ChangeIsActive" name="{$item->get('is_active')}" id="{$item->get('id')}"><i class="fa fa-circle text-{if $item->isActive()}success{else}danger{/if}"></i></a>
            </td>
            <td>       
                    {$item->getCreatedAt()->getFormatted()}
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
       
     function getFilterParameters()
        {
            var params={ filter: {  order : { }, 
                                    search : { },
                                    equal: {  is_active:$(".equal[name=is_active] option:selected").val()
                                           },                                                                                                                                                                         
                                nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                token:'{$formFilter->getCSRFToken()}'
                         } };
            if ($(".order_active").attr("name"))
                 params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");   
            $(".search.Input").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); });  
            $(".equal.Select option:selected").each(function () { params.filter.equal[$(this).parent().attr('name')]=$(this).val(); });
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
                            url:"{url_to('payments_event_user_ajax',['action'=>'ListPartialDebitMethod'])}" ,                          
                            target: "#actions"
                             });
        }
        
        $("#init").click(function() {                   
            $.ajax2({ url:"{url_to('payments_event_user_ajax',['action'=>'ListPartialDebitMethod'])}",                                    
                      target: "#actions"}); 
        }); 

       $('.order').click(function() {           
             $(".order_active").attr('class','order');
             $(this).attr('class','order_active');
             return updateFilter();
        });
                    
        $("#filter").click(function() { return updateFilter(); });                                             
        
        $(".search").keypress(function(event) {  if (event.keyCode==13)   return updateFilter(); });

        $("[name=nbitemsbypage],.equal").change(function () {  return updateFilter();  });
    
        $(".pager").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('payments_event_user_ajax',['action'=>'ListPartialDebitMethod'])}?page="+$(this).attr('data-page'),                                
                                 target: "#actions"
                });
        });
          
          
         $("#Add").click(function() {                   
            $.ajax2({ url:"{url_to('payments_event_user_ajax',['action'=>'AddDebitMethod'])}",                                    
                      target: "#actions"}); 
        });
        
        $(".ChangeIsActive").click(function () {
            return $.ajax2({
                 data : { PaymentDebitEventUserMethod : { id: $(this).attr('id') , value:$(this).attr('name'),token :'{mfForm::getToken('ChangeForm')}' } },                  
                url: "{url_to('payments_event_user_ajax',['action'=>'ChangeIsActiveDebitMethod'])}",              
                success: function (resp) {
                    if (resp.action != 'ChangeIsActiveDebitMethod') return ;
                    change('ChangeIsActive',resp);
                }
            });
        });

   
     
</script>

