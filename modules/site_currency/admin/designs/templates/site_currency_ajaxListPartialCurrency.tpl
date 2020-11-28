
<div class="row admin-header-container">
  <div class="col-sm">
       <h3 class="admin-header-big-text">{__('Systéme')}</h3>
       <h3 class="admin-header-small-text">{__('Currencies')}</h3>
    </div>
  
  <div class="col-sm" style="padding: 0;">
       <div style="float: right;">
              <a href="#" id="New" class="btn btn-danger admin-header-button btn-color" title="{__('New currency')}" ><i class="fa fa-plus" style=""></i>{__('New currency')}</a>   
       </div>   
  </div>
</div>
  <!-- End page heading -->
          
          <!-- Begin breadcrumb -->
          <div class="breadcrumb-title">
            <p>
                <a href="/admin">
                    <i class="fa fa-home" style="color: #37bc9b;"></i>
                </a>
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Systéme')}
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Currencies')}
            </p>
          </div>
          <!-- End breadcrumb -->


 {alerts}
 
 <div class=" bg-white px-2 py-2">
    <div class="col-md-12 padd-col">

        <div class="float-left w-50">
           {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter}
        </div>
        <div class="float-right w-50">                   
            <button id="filter" class="btn btn-primary" style="float: right; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Filter")}</button>   
            <button id="init" class="btn btn-primary" style="float: right; margin-right: 10px; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Init")}</button>
        </div>
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
                    <th class="sorting" style="width: 100px;"><span class="mr-1">{__('state')}</span></th>
                  <th><span class="mr-1">{__('Rate')}</span> 
                    <div style="float: right;">
                        <a href="#" class="position-absolute order{$formFilter.order.rate->getValueExist('asc','_active')}" id="asc" name="rate"><i class="fas fa-sort-up acs-desc {if $formFilter.order.rate->getValue()=='asc'}text-dark{/if}"></i></a>
                        <a href="#" class="position-absolute order{$formFilter.order.rate->getValueExist('desc','_active')}" id="desc" name="rate"><i class="fas fa-sort-down {if $formFilter.order.rate->getValue()=='desc'}text-dark{/if}"></i></a>            
                    </div>
                  </th>
                  <th>
                       <span>{__('Currency')}</span>
                        <div style="float: right;">
                            <a href="#" class="position-absolute order{$formFilter.order.code->getValueExist('asc','_active')}" id="asc" name="code"><i class="fas fa-sort-up acs-desc {if $formFilter.order.code->getValue()=='asc'}text-dark{/if}"></i></a>
                            <a href="#" class="position-absolute order{$formFilter.order.code->getValueExist('desc','_active')}" id="desc" name="code"><i class="fas fa-sort-down {if $formFilter.order.code->getValue()=='desc'}text-dark{/if}"></i></a>            
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
         <tr>
         <td></td>
         <td></td>   
         <td>
                  {html_options class="equal Select form-control form-control-sm float-left mx-1 w-100" name="is_active" options=$formFilter->equal.is_active->getOption('choices') selected=$formFilter.equal.is_active}
         </td>
         <td>
             <input  class="form-control form-control-sm ml-1 search" name="rate" value="{$formFilter.search.rate}" placeholder="{__('Rate')}"/>
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
          <td></td>  
    </tr>       
    {foreach $pager as $item}
        <tr class="list" id="{$item->get('id')}">
        <td class="count">
            {(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}
        </td>
        <td>
           <span>{$item->get('id')}</span>
        </td>
        <td>
            <a href="#" class="ChangeIsActive" name="{$item->get('is_active')}" id="{$item->get('id')}"><i class="fa fa-circle text-{if $item->isActive()}success{else}danger{/if}"></i></a>
        </td>
        <td>
          <span>{$item->getRate()}</span>
        </td>
        <td>
            {*<div class="custom-control custom-checkbox">
                <input type="checkbox" class="selection Checkbox custom-control-input" id="{$item->get('code')}" name="{$item->get('id')}"/> 
                <label class="custom-control-label" for="{$item->get('code')}"></label>
            </div>*}
            <span>{$item->getCode()->getValue()} - {$item->getCode()->getText()->ucfirst()} - {$item->getCode()->getSymbol()}</span>
        </td>
        <td>       
                {$item->getFormatter()->getCreatedAt()->getFormatted()}
        </td> 
        <td>                
                {$item->getFormatter()->getUpdatedAt()->getFormatted()}
        </td>
        
        <td> 
           <a href="#" title="{__('Edit')}" class="View" id="{$item->get('id')}">
                <i class="fa fa-pencil-alt icon-font"></i>
           </a> 
           <a href="#" title="{__('Delete')}" class="Delete" id="{$item->get('id')}"  name="{$item->getCode()->getText()->ucfirst()}">
                <i class="fa fa-trash-alt icon-font delete-color"></i>
           </a>    
      </td>
</tr>  
    {/foreach}
</table>     
         
{if !$pager->getNbItems()}  
    {__("no result")}
{else}
      <div class="col-10 custom-control custom-checkbox ml-2">
            <input type="checkbox" class="currencies Checkbox custom-control-input" id="all" name="currencies" /> 
            <label class="custom-control-label" for="all" >
                <a style="opacity:0.5" class="actions_items" href="#" title="{__('delete')}" id="Delete"><i class="fa fa-trash-alt icon-font delete-color delete-all-trash"></i></a>
            </label>
      </div>
   
{/if}    
{include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager}
       </div>
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
            
        function change(action,resp) {
            $.each(resp.selection ? resp.selection : [resp.id], function (id) {                
                 $("."+action+"[id="+this+"] i").removeClass('text-'+(resp.value=='YES'?'danger':'success')).addClass('text-'+(resp.value=='YES'?'success':'danger'));
                 $("."+action+"[id="+this+"]").attr('name',resp.value);
            });
        }
    
        function getFilterParameters()
        {
            var params={ filter: {   order : { },                                                                                                                
                                     equal : { },
                                     search: { },
                                     range : { },
                                     nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                     token:'{$formFilter->getCSRFToken()}'
                                  }};
            if ($(".order_active").attr("name"))
                    params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");
            $(".search").each(function() { params.filter.search[this.name] =this.value; });  
            $(".Range.Date").each(function () {
               // params.filter.range[$(this).attr('name')]= { }
                if(!params.filter.range[$(this).attr('name')])
                    params.filter.range[$(this).attr('name')]= { };
                params.filter.range[$(this).attr('name')][$(this).attr('date-id')]= $(this).val();
            });
             $(".equal option:selected").each(function() { params.filter.equal[$(this).parent().attr('name')] =$(this).val(); });
            return params;                  
        }
        
        function updateFilter()
        {              
           return $.ajax2({ data: getFilterParameters(), url:"{url_to('site_currency_ajax',['action'=>'ListPartialCurrency'])}" , target: "#actions" });
        }
        
        function updatePager(n)
        {
           var page_active=$(".pager .active").html()?parseInt($(".pager .active").html()):1;
           var records_by_page=$("[name=nbitemsbypage]").val();
           var start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
           $(".count").each(function(id) { $(this).html(start+id) }); // Update index column           
           nb_results=parseInt($("#nb_results").html())-n;
           $("#nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
           $("#end_result").html($(".count:last").html());
        }
           

            $('.order').click(function() {
                $(".order_active").attr('class','order');
                $(this).attr('class','order_active');
                return updateFilter();
            });

            $(".search").keypress(function(event) {
                if (event.keyCode==13)
                    return updateFilter();
            });
            $("[name=nbitemsbypage],.equal.Select").change(function() { return updateFilter(); }); 
                                                     
                
            $("#filter").click(function() { return updateFilter(); }); 

            $("#init").click(function() {                               
               $.ajax2({ url:"{url_to('site_currency_ajax',['action'=>'ListPartialCurrency'])}",target: "#actions"}); 
            }); 

            $(".pager").click(function () {                        
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('site_currency_ajax',['action'=>'ListPartialCurrency'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length),target: "#actions"});
            });

            $("#all").click(function () {  $(".selection").attr("checked",($(this).attr("checked")=="checked")) ;});

         // {* PAGER - end *}   

         // {* ACTIONS - begin *}
                          
            
            $("#Delete").click( function () { 
                params={ selection : {  } };
                text="";
                $(".selection:checked").each(function (id) { 
                   params.selection[id]=this.name;
                   text+=this.id+",\n";
                });
                if ($.isEmptyObject(params.selection))
                   return ;
                if (!confirm("{__('Currencies :\u000A\u000A\"#0#\"\u000A\u000A will be deleted. Confirm ?')}".format(text.substring(0,text.lastIndexOf(","))))) 
                    return false; 
                return $.ajax2({ data: params,
                                 url: "{url_to('site_currency_ajax',['action'=>'DeleteMultipleCurrency'])}",
                                 success:function(resp) {
                                           if (resp.action=='DeleteMultipleCurrency')
                                           {                                    
                                               if ($(".list").length-resp.parameters.length==0)
                                                  return $.ajax2({ url:"{url_to('site_currency_ajax',['action'=>'ListPartialCurrency'])}",target: "#actions"});
                                               $.each(resp.parameters, function (id) {  $(".list[id="+this+"]").remove(); });
                                               updatePager(resp.parameters.length);
                                               $("input#all").attr("checked",false);                                    
                                           }       
                                         }
                });    
        });                           

        $(".View").click( function () {                    
                return $.ajax2({ data : { SiteCurrency: $(this).attr('id') },
                                url:"{url_to('site_currency_ajax',['action'=>'ViewCurrency'])}",
                                target: "#actions"});
        });
                                 
        $(".Delete").click( function () { 
                if (!confirm('{__("Currency \"#0#\" will be deleted. Confirm ?")}'.format(this.name))) return false; 
                return $.ajax2({ data :{ SiteCurrency: this.id },
                                 url :"{url_to('site_currency_ajax',['action'=>'DeleteCurrency'])}",
                                 success : function(resp) {
                                          if (resp.action!='DeleteCurrency') return ;                                           
                                          $(".list[id="+resp.id+"]").remove();  
                                          if ($('.list').length==0)
                                              return updateFilter();
                                          updatePager(1);                                            
                                 }
                     });                                        
        });
        
        $(".list").dblclick( function () {                    
                  return $.ajax2({ data : { ProductI18n : { product_id: $(this).attr('id'),lang: $("#SelectListLanguages option:selected").attr('id') } },                               
                                  url:"{url_to('site_currency_ajax',['action'=>'ViewCurrency'])}", 
                                  target: "#actions"});
          });
    
        $("#New").click( function () {                                  
                return $.ajax2({
                    url: "{url_to('site_currency_ajax',['action'=>'NewCurrency'])}",
                    target: "#actions"
               });
        });
                
        $(".selection,#all").click(function (){               
                $(".actions_items").css('opacity',($(".selection:checked").length?'1':'0.5'));
        });            
           

        $(".ChangeIsActive").click(function () {
            return $.ajax2({
                 data: {  SiteCurrencyChangeIsActive : { id: $(this).attr('id'), value: $(this).attr('name'), token: '{mfForm::getToken('ChangeForm')}' } },                  
                url: "{url_to('site_currency_ajax',['action'=>'ChangeCurrencyIsActive'])}",              
                success: function (resp) {
                    if (resp.action != 'ChangeCurrencyIsActive') return ;
                    change('ChangeIsActive',resp);
                }
            });
     });
</script>
