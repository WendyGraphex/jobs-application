
          <div class="row admin-header-container">
            <div class="col-sm">
              <h3 class="admin-header-big-text">{__('Events')}</h3>
              <h3 class="admin-header-small-text">{__('Event management')}</h3>
            </div>
            <div class="col-sm" style="padding: 0;">
                <div style="float: right;"> 
                  <a class="btn btn-success admin-header-button"  href="#" id="New"><i class="fa fa-plus"></i> {__('New event')}</a> 
                {*  <a class="btn btn-warning admin-header-button" href="#"><i class="fa fa-file-excel"></i> {__('Export XLS')}</a> *}
                </div> 
            </div>
          </div>
          
          <!-- End page heading -->
          
          <!-- Begin breadcrumb -->
          <div class="breadcrumb-title">
            <p>             
                <i class="fa fa-home" style="color: #37bc9b;"></i>               
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Events')}
                {*<i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Events')} *}
            </p>
          </div>
          <!-- End breadcrumb -->
{alerts}
           <!-- Begin Add User -->
         <div class="table-responsive bg-white px-1 py-2">
             <div class="col-md-12">
                <div>                    
             {component name="/site_languages/selectListLanguagesFrontend" selected=$formFilter.lang}
         </div>
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
            <th>{__('Creator')}</th>
            <th>{__('Start/End')}</span>  
              
            </th>  
             <th>{__('Title')}</span>  
              
            </th> 
             <th style="width: 100px;">{__('Price')}</span>  
              
            </th> 
              <th style="width: 100px;">{__('Active')}</span>  
               
            </th>
              </th>  
                 <th style="width: 100px;">{__('Committed at')}</span>  
               
            </th>
              <th style="width: 100px;">{__('Published at')}</span>  
               
            </th>
               <th style="width: 100px;">{__('Refused at')}</span>  
               
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
              <td><input class="form-control form-control-sm ml-1 search Input" placeholder="{__('Title/Description/Content')}" name="query" value="{$formFilter.search.query}"></td>
               <td>
                 
                </td> 
                  <td>
                 
                </td> 
                   <td>
                 
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
                <td></td>
                 <td></td>
          </tr>
      
       {foreach $pager as $item} 
      <tr class="list" id="{$item->get('id')}" role="row">
          <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>
          <td>{$item->get('id')}</td>   
           <td>
               {if $item->hasEventUser()}
                   {$item->getEventUser()->getFormatter()->getUsername()} 
               {else}
                   {__('Graphex')}
               {/if}    
          </td>
          <td>
              {if $item->hasInAt()}
                  {$item->getFormatter()->getInAt()->getText()}
              {/if}  
               {if $item->hasOutAt()}
                  - {$item->getFormatter()->getOutAt()->getText()}
              {/if}  
          </td>
         <td>              
             {if $item->hasI18n()}
                 <a href="{$item->getI18n()->getUrl()}" target="_blank">{$item->getI18n()->getFormatter()->getMetaTitle()->ucfirst()}</a>
                    {else}
                        {__('----')}
                    {/if}  
               
        </td>
        <td>
            {$item->getFormatter()->getPrice()->getAmount()} 
        </td>
           <td class="align-middle text-center"> <a href="#" class="ChangeIsActive" name="{$item->get('is_active')}" id="{$item->get('id')}"><i class="fa fa-circle text-{if $item->isActive()}success{else}danger{/if}"></i></a>
            </td>
              <td>
                   {if $item->hasCommittedAt()}
                        {$item->getFormatter()->getCommittedAt()->getFormatted()}
                      {/if}  
                </td> 
                  <td>
                      {if $item->hasPublishedAt()}
                        {$item->getFormatter()->getPublishedAt()->getFormatted()}
                      {/if}  
                </td>
                  <td>
                   {if $item->hasRefusedAt()}
                        {$item->getFormatter()->getRefusedAt()->getFormatted()}
                      {/if} 
                </td> 
            <td>       
                    {$item->getFormatter()->getCreatedAt()->getFormatted()}
            </td> 
            <td>                
                    {$item->getFormatter()->getUpdatedAt()->getFormatted()}
            </td>
             <td>{$item->getStatusI18n()}</td>
            <td>            
              <a href="#" class="list-action View" id="{$item->get('id')}" title="{if $item->hasI18n()}{$item->getI18n()->get('title')}{else}{__('----')}{/if} "><i class="fa fa-edit"></i></a>
              <a href="#" class="list-action text-danger Delete" id="{$item->get('id')}" name="{$item->get('name')}" title="{__('Delete')}"><i class="fa fa-trash-alt"></i></a>
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
                            url:"{url_to('site_event_ajax',['action'=>'ListPartialEvent'])}" ,                          
                            target: "#actions"
                             });
        }
        
        $("#init").click(function() {                   
            $.ajax2({ url:"{url_to('site_event_ajax',['action'=>'ListPartialEvent'])}",                                    
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
                                 url:"{url_to('site_event_ajax',['action'=>'ListPartialEvent'])}?page="+$(this).attr('data-page'),                                
                                 target: "#actions"
                });
        });
          
          
      $(".View").click( function () {                    
                  return $.ajax2({ data : { SiteEventI18n : { 
                                                event_id: $(this).attr('id'),
                                                lang: $("#SelectListLanguages option:selected").attr('id')                                            
                                    } },                               
                                  url:"{url_to('site_event_ajax',['action'=>'ViewEventI18n'])}", 
                                  target: "#actions"});
          });
    
      $("#New").click( function () {             
                return $.ajax2({        
                   data : { lang : { lang: $("#SelectListLanguages option:selected").attr('id'),token: "{mfForm::getToken('LanguageFrontendForm')}" } },    
                    url: "{url_to('site_event_ajax',['action'=>'NewEventI18n'])}",               
                    target: "#actions"
              });
            });
         
     $(".Delete").click( function () { 
                if (!confirm('{__("Event \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ SiteEvent: $(this).attr('id') },
                                 url :"{url_to('site_event_ajax',['action'=>'DeleteEvent'])}",                               
                                 success : function(resp) {
                                          if (resp.action!='DeleteEvent') return ;                                          
                                          $(".list[id="+resp.id+"]").remove();  
                                          if ($('.list').length==0) return updateFilter();                                          
                                 }
                     });                                        
            });
            
        $(".ChangeIsActive").click(function () {
            return $.ajax2({
                 data : { SiteEvent : { id: $(this).attr('id') , value:$(this).attr('name'),token :'{mfForm::getToken('ChangeForm')}' } },                  
                url: "{url_to('site_event_ajax',['action'=>'ChangeIsActiveEvent'])}",              
                success: function (resp) {
                    if (resp.action != 'ChangeIsActiveEvent') return ;
                    change('ChangeIsActive',resp);
                }
            });
        });


  {* =====================  P A G E R  A C T I O N S =============================== *}  
      
        
     
</script>

