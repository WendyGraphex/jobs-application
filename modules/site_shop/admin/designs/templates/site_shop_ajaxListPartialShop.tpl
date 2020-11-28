
        <div class="row admin-header-container">
            <div class="col-sm">
              <h3 class="admin-header-big-text">{__('Site')}</h3>
              <h3 class="admin-header-small-text">{__('Site shops management')}</h3>
            </div>
            <div class="col-sm" style="padding: 0;">
                <div style="float: right;"> 
                    {*<a class="btn btn-success admin-header-button"  href="#" id="New"><i class="fa fa-plus"></i> {__('Add Gallery')}</a>*}
                    <a class="btn btn-success admin-header-button"  href="#" id="New"><i class="fa fa-plus"></i> {__('New')}</a>
                </div> 
            </div>
          </div>
                <div class="breadcrumb-title">
            <p>              
                <i class="fa fa-home" style="color: #37bc9b;"></i>               
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Site')}
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Shops')}
            </p>
          </div>

{*<div class="breadcrumb-meta_title">
    <p>
        <a href="#"><i class="fa fa-home" style="color: #37bc9b;"></i></a>
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Configurations')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Shops')}
    </p>
</div>*}

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
         <thead class="bgSpec">{*bg-info thead-color*}
            <tr class="list-header">    
            <th>#</th>   
            <th>{__('ID')}           
                <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><i class="fas fa-sort-up {if $formFilter.order.id->getValue()=='asc'}text-dark{/if}" style=""></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><i class="fas fa-sort-down {if $formFilter.order.id->getValue()=='desc'}text-dark{/if}"></i></a>            
                </div>
            </th>
          <th> <span>{__('Lang')}</span>  </th>   
          <th data-hide="phone">
            <span>{__('Title')}</span>  
            <div style="float: right;">
                <a href="#" class="position-absolute order{$formFilter.order.meta_title->getValueExist('asc','_active')}" id="asc" name="meta_title"><i class="fas fa-sort-up {if $formFilter.order.meta_title->getValue()=='asc'}text-dark{/if}"></i></a>
                <a href="#" class="position-absolute order{$formFilter.order.meta_title->getValueExist('desc','_active')}" id="desc" name="meta_title"><i class="fas fa-sort-down {if $formFilter.order.meta_title->getValue()=='desc'}text-dark{/if}"></i></a>            
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
            <input style="height: 31px;" class="search form-control form-control-sm ml-1" name="meta_title" value="{$formFilter.search.lang}"/>
        </td>               
        <td>
             <input style="height: 31px;" class="search form-control form-control-sm ml-1" name="meta_title" value="{$formFilter.search.meta_title}"/>
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
          <tr class="list" id="{$item->getI18n()->get('id')}"> 
              <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>   
              <td>{$item->getI18n()->get('lang')}</td>
              <td>
                  <img id="{$item->getI18n()->get('lang')}" name="lang" src="{url("/flags/`$item->getI18n()->get('lang')`.png","picture")}" meta_title="{$item->getI18n()->getLanguage()->getFormatted()}" />       
              </td>                  
              <td>                                           
               {if $item->hasIcon()} 
                   <img src="{$item->getIcon()->getURL()}" style="margin-left: 5px;margin-right: 5px;" height="32" width="32" alt="{__('Icon')}"/>
               {/if}    
                             
                         {$item->getI18n()->get('meta_title')}                  
              </td>
                <td>       
                    {$item->getFormatter()->getCreatedAt()->getFormatted()}
                </td> 
                <td>                
                    {$item->getFormatter()->getUpdatedAt()->getFormatted()}
                </td>
              <td>               
                    <a href="#" meta_title="{__('Edit')}" class="View" id="{$item->getI18n()->get('id')}">
                        <i class="fa fa-pencil-alt icon-font"></i></a>                 
                    <a href="#" meta_title="{__('Delete')}" class="Delete" id="{$item->getI18n()->get('id')}"  name="{$item->getI18n()->get('meta_title')}">
                        <i  class="fa fa-trash-alt delete-color icon-font"></i>
                    </a>                                                       
              </td>
          </tr>    
        {/foreach}  
       </tbody>
     </table>
      {if !$pager->getNbItems()}
         <span>{__('No shop')}</span>
      {/if}
    </div>   
       {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager}
<script application="text/javascript">
    
    
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
    
    
    
        $("#lang").chosen();
        
        function getFilterParameters()
        {
            var params={ filter: {  order : { }, 
                                    search : { },
                                    equal: {  },
                                    range : { },
                                lang: $("[name=lang]").val(),                                                                                                             
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
                            url:"{url_to('site_shop_ajax',['action'=>'ListPartialShop'])}" ,                                                      
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
        
           {* ===================== L A N G U A G E =============================== *}
                    
            $("#SelectListLanguages").change(function() {  updateFilter();   });
            
          {* =====================  P A G E R  A C T I O N S =============================== *}  
      
           $("#init").click(function() {                   
               return $.ajax2({ url:"{url_to('site_shop_ajax',['action'=>'ListPartialShop'])}",                                    
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
                                 url:"{url_to('site_shop_ajax',['action'=>'ListPartialShop'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length),
                                target: "#actions"
                });
        });
          {* =====================  A C T I O N S =============================== *}  
      
        
         
          $("#New").click( function () {             
            return $.ajax2({              
                url: "{url_to('site_shop_ajax',['action'=>'NewShopI18n'])}",              
                target: "#actions"
           });
         });
         
         $(".View").click( function () {                
                return $.ajax2({ data : { SiteShopI18n : $(this).attr('id') },                                
                                url:"{url_to('site_shop_ajax',['action'=>'ViewShopI18n'])}",                              
                                target: "#actions"});
         });
         
       $(".list").dblclick( function () {                    
                  return $.ajax2({ data : { SiteShopI18n : { shop_id: $(this).attr('id'),lang: $("#SelectListLanguages option:selected").attr('id') } },                               
                                  url:"{url_to('site_shop_ajax',['action'=>'ViewShopI18n'])}", 
                                  target: "#actions"});
          });
         
            
        $(".Delete").click( function () { 
                if (!confirm('{__("Shop \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ SiteShopI18n: $(this).attr('id') },
                                 url :"{url_to('site_shop_ajax',['action'=>'DeleteShopI18n'])}",                                
                                 success : function(resp) {
                                          if (resp.action != 'DeleteShopI18n')  return ;                                                                              
                                          $(".list[id="+resp.id+"]").remove();  
                                          if ($('.list').length==0) return updateFilter();
                                          updatePager(1);                                    
                                 }
                     });                                        
            });
            
  
</script>    
