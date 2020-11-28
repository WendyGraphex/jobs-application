
<div class="row admin-header-container">
    <div class="col-sm">
           <h3 class="admin-header-big-text">{__('Configurations|Cities')}</h3>
           <h3 class="admin-header-small-text">{__('Manage Cities')}</h3>
    </div>
    <div class="col-sm" style="padding: 0;">
        <div style="float: right;"> 
            <a href="#" class="btn btn-info admin-header-button btn-color" id="Positions" title="{__('Positions')}">
                <i class="fa fa-bars" style="margin-right: 5px;"></i>
                {__('Positions')}
            </a>

            <a href="#" class="btn btn-success admin-header-button btn-color" id="New" title="{__('New')}">
                <i class="fa fa-plus" style="margin-right: 5px;"></i>
                {__('New')}
            </a> 
        </div>
   </div>
</div>
<div class="breadcrumb-title">
    <p>
        <i class="fa fa-home" style="color: #37bc9b;"></i>
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Configurations')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Cities')}
    </p>
</div>

{alerts}

<div class=" bg-white px-2 py-2">
         <div>                    
             {component name="/site_languages/selectListLanguagesFrontend" selected=$formFilter.lang}
         </div>
    
         <div class="col-md-12 padd-col">               
               <div class="float-left w-50">
                  {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter}
               </div>
               <div class="float-right w-50">     
                   {*<button id="filter" class="btn btn-primary btn-color btn-f">{__("Filter")}</button>   
                   <button id="init" class="btn btn-primary btn-color btn-init btn-f">{__("Init")}</button> *}
                    <button id="filter" class="btn btn-primary" style="float: right; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Filter")}</button>   
                    <button id="init" class="btn btn-primary" style="float: right; margin-right: 10px; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Init")}</button>
             
               </div>    
         </div> 
                    
{*=======================================Table======================================*}
  
        <table class="table table-bordered table-hover table-striped" cellpadding="0" cellspacing="0"> 
         <thead class="bgSpec">  {*class="bg-info thead-color"*}
          <tr class="list-header">    
          <th>#</th>
          <th>{__('ID')}           
             <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><i class="fas fa-sort-up {if $formFilter.order.id->getValue()=='asc'}text-dark{/if}" style=""></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><i class="fas fa-sort-down {if $formFilter.order.id->getValue()=='desc'}text-dark{/if}"></i></a>            
                </div>
        </th>
          <th class="footable-first-column" data-toggle="true">
              <span>{__('Icon')}</span>  
          </th>
          <th class="footable-first-column" data-toggle="true">
              <span>{__('Name')}</span>  
              <div style="float: right;">
                <a href="#" class="position-absolute order{$formFilter.order.name->getValueExist('asc','_active')}" id="asc" name="name"><i class="fas fa-sort-up  {if $formFilter.order.name->getValue()=='asc'}text-dark{/if}"></i></a>
                <a href="#" class="position-absolute order{$formFilter.order.name->getValueExist('desc','_active')}" id="desc" name="name"><i class="fas fa-sort-down  {if $formFilter.order.name->getValue()=='desc'}text-dark{/if}"></i></a>            
              </div>
          </th>   
           <th class="footable-first-column" data-toggle="true">
                         <span>{__('Country')}</span>  
                        {* <div class="position-relative float-right mr-2">
                             <a style="float: right;" href="#" class="position-absolute order{$formFilter.order.name->getValueExist('asc','_active')}" id="asc" name="name"><i class="fas fa-sort-up"></i></a>
                             <a style="float: right;" href="#" class="position-absolute order{$formFilter.order.name->getValueExist('desc','_active')}" id="desc" name="name"><i class="fas fa-sort-down"></i></a>            
                         </div> *}
                     </th> 
          <th data-hide="phone">
            <span>{__('Position')}</span>   
            <div style="float: right;">
                <a href="#" class="position-absolute order{$formFilter.order.position->getValueExist('asc','_active')}" id="asc" position="position"><i class="fas fa-sort-up  {if $formFilter.order.position->getValue()=='asc'}text-dark{/if}"></i></a>
                <a href="#" class="position-absolute order{$formFilter.order.position->getValueExist('desc','_active')}" id="desc" position="position"><i class="fas fa-sort-down  {if $formFilter.order.position->getValue()=='desc'}text-dark{/if}"></i></a>            
            </div>
            
          </th>
           
          <th data-hide="phone">
            <span>{__('Title')}</span>  
            <div style="float: right;">
                <a href="#" class="position-absolute order{$formFilter.order.title->getValueExist('asc','_active')}" id="asc" name="title"><i class="fas fa-sort-up  {if $formFilter.order.title->getValue()=='asc'}text-dark{/if}"></i></a>
                <a href="#" class="position-absolute order{$formFilter.order.title->getValueExist('desc','_active')}" id="desc" name="title"><i class="fas fa-sort-down  {if $formFilter.order.title->getValue()=='desc'}text-dark{/if}"></i></a>            
            </div>
          </th>
          <th style="width: 230px;" class="footable-first-column" data-toggle="true">
                <span>{__('Created At')}</span>   
                <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.created_at->getValueExist('asc','_active')}" id="asc" name="created_at"><i class="fas fa-sort-up  {if $formFilter.order.created_at->getValue()=='asc'}text-dark{/if}"></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.created_at->getValueExist('desc','_active')}" id="desc" name="created_at"><i class="fas fa-sort-down  {if $formFilter.order.created_at->getValue()=='desc'}text-dark{/if}"></i></a>           
                </div>
            </th>
            <th style="width: 230px;" class="footable-first-column" data-toggle="true">
                <span>{__('Updated At')}</span>   
                <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.updated_at->getValueExist('asc','_active')}" id="asc" name="updated_at"><i class="fas fa-sort-up  {if $formFilter.order.updated_at->getValue()=='asc'}text-dark{/if}"></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.updated_at->getValueExist('desc','_active')}" id="desc" name="updated_at"><i class="fas fa-sort-down  {if $formFilter.order.updated_at->getValue()=='desc'}text-dark{/if}"></i></a>           
                </div>
            </th>
          <th>{__('Actions')}</th>
          </tr>
    </thead>
    
    <tbody>
       <tr>
           <td>
            
        </td>
        <td>
            
        </td>
        <td><a href="#" class="list-action Mode" name="NORMAL"><i class="ModeIcon Normal far fa-square"></i></a></td>
        <td>
            <input class="styleInput search form-control form-control-sm ml-1" placeholder="{__('Name')}" name="name" value="{$formFilter.search.name}"/>
        </td>
          <td>
            
        </td>
        <td>
             <input class="styleInput search form-control form-control-sm ml-1" placeholder="{__('Position')}" name="position" value="{$formFilter.search.position}"/>
        </td>
        <td>
             <input class="styleInput search form-control form-control-sm ml-1" placeholder="{__('Title')}" name="title" value="{$formFilter.search.title}"/>
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
            
        </td>
    </tr>
         {foreach $pager as $item}
          <tr class="list" id="{$item->get('id')}"> 
              <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>
              <td>{$item->get('id')}</td>
              <td class="ModeDisplay">
                  {if $item->hasIcon()} 
                    <img src="{$item->getIcon()->getURL('superadmin')}" class="classIcon" alt="{__('Icon')}"/>
                  {/if}
              </td>
              <td>                
                        {$item->get('name')}
              </td> 
               <td>                
                              {$item->getCountry()->getFormatter()->getFormatted()->ucfirst()}
                        </td> 
              <td>                
                        {$item->get('position')}
              </td>                   
              <td>                            
                {*if $item->hasColor()}
                <div class="d-inline-block" style="background:{$item->get('color')}; vertical-align: middle;height:15px; width: 15px;">&nbsp;</div>
                {/if*}
             
                   
           
                    {if $item->hasI18n()}
                         {$item->getI18n()->get('title')} 
                    {else}
                        {__('----')}
                    {/if}    
              </td>
                <td>       
                        {$item->getFormatter()->getCreatedAt()->getFormatted()}
                </td> 
                <td>                
                        {$item->getFormatter()->getUpdatedAt()->getFormatted()}
                </td>             
              <td>               
                    <a href="#" title="{__('Edit')}" class="View" id="{$item->get('id')}">
                        <i class="fa fa-pencil-alt icon-font"></i></a>                 
                    <a href="#" title="{__('Delete')}" class="Delete" id="{$item->get('id')}"  name="{if $item->hasI18n()}{$item->getI18n()->get('title')}{else}{$item->get('name')}{/if}">
                        <i  class="fa fa-trash-alt delete-color icon-font"></i>
                    </a>                                                       
              </td>
          </tr>    
        {/foreach}  
       </tbody>
     </table>
      {if !$pager->getNbItems()}
         <span>{__('No city')}</span>
      {/if}
     
       {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager}
</div>
<script application="text/javascript">
    
    $(".Mode").click(function () {
               if ($(this).attr('name')=='NORMAL')
               {
                   $(this).attr('name','INVERSE');
                   $(".ModeIcon").removeClass('Normal far fa-square').addClass('Inverse fa fa-square-full');
                   $(".ModeDisplay").css('background-color','rgb(147, 138, 138)');
                   
                   
               }
               else
               {
                    $(this).attr('name','NORMAL');
                    $(".ModeIcon").removeClass('Inverse fa fa-square-full').addClass('Normal far fa-square');
                    $(".ModeDisplay").css('background-color','');
               }
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
 
        function getFilterParameters()
        {
            var params={ filter: {  order : { }, 
                                    search : { },
                                    equal: { 
                                         name : $("[name=name] option:selected").val()  
                                    },
                                    range : { },
                                lang: $("#SelectListLanguages option:selected").attr('id'),                                                                                                             
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
                            url:"{url_to('site_city_ajax',['action'=>'ListPartialCity'])}" ,                                                      
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
               return $.ajax2({ url:"{url_to('site_city_ajax',['action'=>'ListPartialCity'])}",                                    
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
                                 url:"{url_to('site_city_ajax',['action'=>'ListPartialCity'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length),
                                target: "#actions"
                });
        });
          {* =====================  A C T I O N S =============================== *}  
      
        
         
          $("#New").click( function () {             
            return $.ajax2({
                data : { lang : { lang: $("#SelectListLanguages option:selected").attr('id'),token: "{mfForm::getToken('LanguageFrontendForm')}" } },                
                url: "{url_to('site_city_ajax',['action'=>'NewCityI18n'])}",              
                target: "#actions"
           });
         });
         
         $(".View").click( function () {                
                return $.ajax2({ data : { SiteCityI18n : { 
                                                city_id: $(this).attr('id'),
                                                lang: $("#SelectListLanguages option:selected").attr('id')                                            
                                    } },                                
                                url:"{url_to('site_city_ajax',['action'=>'ViewCityI18n'])}",                              
                                target: "#actions"});
         });
       $(".list").dblclick( function () {                    
                  return $.ajax2({ data : { SiteCityI18n : { city_id: $(this).attr('id'),lang: $("#SelectListLanguages option:selected").attr('id') } },                               
                                  url:"{url_to('site_city_ajax',['action'=>'ViewCityI18n'])}", 
                                  target: "#actions"});
          });
         
            
        $(".Delete").click( function () { 
                if (!confirm('{__("City \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ SiteCity: $(this).attr('id') },
                                 url :"{url_to('site_city_ajax',['action'=>'DeleteCity'])}",                                
                                 success : function(resp) {
                                          if (resp.action != 'DeleteCity')  return ;                                                                              
                                          $(".list[id="+resp.id+"]").remove();  
                                          if ($('.list').length==0) return updateFilter();
                                          updatePager(1);                                    
                                 }
                     });                                        
            });
            
        $("#Positions").click( function () {                
                return $.ajax2({ url:"{url_to('site_city_ajax',['action'=>'PositionsCity'])}",
                                target: "#actions"});
         });   
      
</script>    
