{messages}
    <div class="row admin-header-container">
      <div class="col-sm">
        <h3 class="admin-header-big-text">{__('Email Models')}</h3>
        <h3 class="admin-header-small-text">{__('Email Models management')}</h3>
      </div>
      <div class="col-sm" style="padding: 0;">
          <div style="float: right;">                                     
            <a class="btn btn-success admin-header-button"  href="#" id="New"><i class="fa fa-plus"></i> {__('New email model')}</a>
          </div> 
      </div>
    </div>
          
          <!-- End page heading -->
          
          <!-- Begin breadcrumb -->
    <div class="breadcrumb-title">
      <p>         
              <i class="fa fa-home" style="color: #37bc9b;"></i>    
          <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('System')}
          <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Email Models')}
      </p>
    </div>
          
    <div class="table-responsive bg-white px-1 py-2">
          <div>                    
             {component name="/site_languages/selectListLanguagesFrontend" selected=$formFilter.lang}
         </div>
        <div class="col-md-12">

           <div class="float-left w-50">
                 {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter}  
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
            {if $pager->getNbItems()>5}<th>&nbsp;</th>{/if}           
            <th>
                <span>{__('Name')}</span>    
                <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.name->getValueExist('asc','_active')}" id="asc" name="name"><i class="fas fa-sort-up {if $formFilter.order.name->getValue()=='asc'}text-dark{/if}"></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.name->getValueExist('desc','_active')}" id="desc" name="name"><i class="fas fa-sort-down {if $formFilter.order.name->getValue()=='desc'}text-dark{/if}"></i></a>            
                </div> 
            </th>         
            <th>
                <span>{__('Value')}</span>      
                <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.value->getValueExist('asc','_active')}" id="asc" name="value"><i class="fas fa-sort-up {if $formFilter.order.value->getValue()=='asc'}text-dark{/if}"></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.value->getValueExist('desc','_active')}" id="desc" name="value"><i class="fas fa-sort-down {if $formFilter.order.value->getValue()=='desc'}text-dark{/if}"></i></a>            
                </div> 
            </th> 
            <th>
                <span>{__('Subject')}</span>      
               
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
        {* search/equal/range *}
         <tr class="input-list">
           <td>{* # *}</td>
            <td>{* ID *}</td>
           {if $pager->getNbItems()>5}<td></td>{/if}     
           <td><input  style="height: 31px;" class="search form-control" type="text" size="5" name="name" value="{$formFilter.search.name}"/></td>      
           <td><input  style="height: 31px;" class="search form-control" type="text" size="5" name="value" value="{$formFilter.search.value}"/></td> 
           <td></td>
           <td>
                <input class="form-control form-control-sm ml-1 InputTexte RowBlock Range Date CreatedAtDate" id="created_at_from" date-id="from" placeholder="{__('From')}" name="created_at" value="{if $formFilter->hasErrors()}{$formFilter.range.created_at.from}{else}{format_date($formFilter.range.created_at.from,'a')}{/if}">
                <input class="form-control form-control-sm ml-1  InputTexte RowBlock Range Date CreatedAtDate" id="created_at_to" date-id="to" placeholder="{__('To')}" name="created_at" value="{if $formFilter->hasErrors()}{$formFilter.range.created_at.to}{else}{format_date($formFilter.range.created_at.to,'a')}{/if}">
            </td>
            <td> 
                <input class="form-control form-control-sm ml-1  InputTexte RowBlock Range Date UpdatedAtDate" id="updated_at_from" date-id="from" placeholder="{__('From')}" name="updated_at" value="{if $formFilter->hasErrors()}{$formFilter.range.updated_at.from}{else}{format_date($formFilter.range.updated_at.from,'a')}{/if}">
                <input class="form-control form-control-sm ml-1  InputTexte RowBlock Range Date UpdatedAtDate" id="updated_at_to" date-id="to" placeholder="{__('To')}" name="updated_at" value="{if $formFilter->hasErrors()}{$formFilter.range.updated_at.to}{else}{format_date($formFilter.range.updated_at.to,'a')}{/if}">
            </td>
           <td>{* actions *}</td>
        </tr>   
        {foreach $pager as $item}
        <tr class="EmailModel-list list" id="{$item->get('id')}"> 
            <td class="EmailModel-count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>
            <td>{$item->get('id')}</td>    
            {if $pager->getNbItems()>5}
                    <td>        
                        {if $item->hasSystemModelEmailI18n()}
                        <input class="EmailModel-selection" type="checkbox" id="{$item->getSystemModelEmailI18n()->get('id')}" name="{$item->getSystemModelEmailI18n()->get('name')}"/>   
                        {/if}
                    </td>
                {/if}          
                <td>                
                        {$item->getSystemModelEmail()->get('name')}
                </td>            
                <td>
                    {if $item->hasSystemModelEmailI18n()}
                         {$item->getSystemModelEmailI18n()->get('value')}
                    {else}
                        {__('----')}
                    {/if}    
                </td>  
                <td>
                    {if $item->hasSystemModelEmailI18n()}
                         {$item->getSystemModelEmailI18n()->get('subject')}
                    {else}
                        {__('----')}
                    {/if}    
                </td>
                <td>
                    {if $item->hasSystemModelEmailI18n()}
                         {$item->getSystemModelEmailI18n()->getFormatter()->getCreatedAt()->getFormatted()}
                    {else}
                        {__('----')}
                    {/if}    
                </td> 
                <td>
                    {if $item->hasSystemModelEmailI18n()}
                         {$item->getSystemModelEmailI18n()->getFormatter()->getUpdatedAt()->getFormatted()}
                    {else}
                        {__('----')}
                    {/if}    
                </td> 
                <td>             
                    <a href="#" class="list-action text-info View" id="{$item->getSystemModelEmail()->get('id')}"  data-toggle="modal"  data-target="#exampleModal" title="{__('Edit')}"><i class="fa fa-pencil-alt"></i></a>
                    <a href="#" class="list-action text-danger Delete" id="{$item->get('id')}" name="{if $item->hasSystemModelEmailI18n()}{$item->getSystemModelEmailI18n()->get('value')}{/if}" title="{__('Delete')}"><i class="fa fa-trash-alt"></i></a>                   
                    </td>
                    {*<a href="#" title="{__('Edit')}" class="View" id="{$item->getSystemModelEmail()->get('id')}">
                        <i class="fa fa-edit"></i>{*<img  src="{url('/icons/edit.gif','picture')}" alt='{__("Edit")}'/>*}</a>              
                    {*if $item->hasSystemModelEmailI18n()}<a href="#" title="{__('Delete')}" class="Delete" id="{$item->getSystemModelEmailI18n()->get('id')}"  name="{$item->getSystemModelEmailI18n()->get('value')}">
                      <i class="fa fa-trash"></i> {*<img  src="{url('/icons/delete.gif','picture')}" alt='{__("Delete")}'/>*}
                    {*</a>
                    {/if*}
        </tr>    
        {/foreach}    
    </table>    
    {if !$pager->getNbItems()}
         <span>{__('No email model')}</span>
    {else}
        {if $pager->getNbItems()>5}
            <input type="checkbox" id="EmailModel-all" /> 
              <a style="opacity:0.5" class="EmailModel-actions_items" href="#" title="{__('delete')}" id="EmailModel-Delete">
                  <img  src="{url('/icons/delete.gif','picture')}" alt='{__("Delete")}'/>
              </a>         
        {/if}
    {/if}
    </div>
{include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager} 
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
                            url:"{url_to('system_emails_ajax',['action'=>'ListPartialModel'])}" ,                           
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
        
              
            
          {* =====================  P A G E R  A C T I O N S =============================== *}  
      
           $("#init").click(function() {                 
               return $.ajax2({ url:"{url_to('system_emails_ajax',['action'=>'ListPartialModel'])}",                                              
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
          
          $("[name=nbitemsbypage],#SelectListLanguages").change(function() { return updateFilter(); }); 
          
         // $("[name=EmailModel-name]").change(function() { return updateSiteEmailModelFilter(); }); 
           
           $(".pager").click(function () {                    
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('system_emails_ajax',['action'=>'ListPartialModel'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length),                                
                                 target: "#actions"
                });
        });
          {* =====================  A C T I O N S =============================== *}  
      
          $("#New").click( function () {             
            return $.ajax2({
                data : { lang : {     lang: $("#SelectListLanguages option:selected").attr('id') ,token: "{mfForm::getToken('LanguageFrontendForm')}" } },                
                url: "{url_to('system_emails_ajax',['action'=>'NewModelI18n'])}",              
                target: "#actions"
           });
         });
         
         $(".View").click( function () {                
                return $.ajax2({ data : { SystemModelEmailI18n : { 
                                                model_id: $(this).attr('id'),
                                                lang: $("#SelectListLanguages option:selected").attr('id')                                              
                                    } },                              
                                url:"{url_to('system_emails_ajax',['action'=>'ViewModelI18n'])}",                              
                                target: "#actions"});
         });                        
         
        $(".list").dblclick( function () {                            
                return $.ajax2({ data : { SystemModelEmailI18n : { 
                                                model_id: $(this).attr('name'),
                                                lang: $("#SelectListLanguages option:selected").attr('id')                          
                                    } },                                
                                url:"{url_to('system_emails_ajax',['action'=>'ViewModelI18n'])}",                             
                                target: "#actions"});
         });    
         
          $(".Delete").click( function () { 
                if (!confirm('{__("Model \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ SystemModelEmail: $(this).attr('id') },
                                 url :"{url_to('system_emails_ajax',['action'=>'DeleteModel'])}",                              
                                 success : function(resp) {
                                       if (resp.action=='DeleteModel')
                                       {    
                                          $(".list[id="+resp.id+"]").remove();  
                                          if ($('.').length==0)
                                           return updateFilter();        
                                          updatePager(1);
                                        }       
                                 }
                     });                                        
            });
     
     
      $("#Cancel").click( function () {                  
                return $.ajax2({                             
                                url: "{url_to('employees_ajax',['action'=>'PartialSettings'])}",                         
                                target: "#actions"});
         });        
</script>    