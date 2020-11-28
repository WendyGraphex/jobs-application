          <div class="row admin-header-container">
            <div class="col-sm">
              <h3 class="admin-header-big-text">{__('Events')}</h3>
              <h3 class="admin-header-small-text">{__('Speakers')}</h3>
            </div>
            <div class="col-sm" style="padding: 0;">
                <div style="float: right;"> 
                    <a class="btn btn-success admin-header-button"  href="#" id="New"><i class="fa fa-plus"></i> {__('New Speaker')}</a> 
                {*    <a class="btn btn-warning admin-header-button" href="#"><i class="fa fa-file-excel"></i> {__('Export XLS')}</a>*}
                </div> 
            </div>
          </div>
          
          <!-- End page heading -->
          
          <!-- Begin breadcrumb -->
          <div class="breadcrumb-title">
            <p>              
                <i class="fa fa-home" style="color: #37bc9b;"></i>               
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Events')}
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Speakers')}
            </p>
          </div>
            
{alerts}              
          <!-- End breadcrumb -->

          <!-- Begin Add Speaker -->
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
         {*</div>  *}  
      <table id="tableSiteEventSpeaker" class="table table-bordered table-hover table-striped" cellpadding="0" cellspacing="0"> 
        <thead class="bgSpec">
        <tr class="list-header">    
            <th>#</th>
            <th>{__('ID')}           
             <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><i class="fas fa-sort-up {if $formFilter.order.id->getValue()=='asc'}text-dark{/if}" style=""></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><i class="fas fa-sort-down {if $formFilter.order.id->getValue()=='desc'}text-dark{/if}"></i></a>            
                </div>
            </th>           
              <th class="NonBorder">
                <label class="paddingLabel">
                    <span>{__('Speaker Name')}</span>     
                    <div style="float: right;">
                        <a href="#" class="position-absolute order{$formFilter.order.lastname->getValueExist('asc','_active')}" id="asc" name="lastname"><i class="fas fa-sort-up {if $formFilter.order.lastname->getValue()=='asc'}text-dark{/if}"></i></a>
                        <a href="#" class="position-absolute order{$formFilter.order.lastname->getValueExist('desc','_active')}" id="desc" name="lastname"><i class="fas fa-sort-down {if $formFilter.order.lastname->getValue()=='desc'}text-dark{/if}"></i></a>            
                    </div>
                </label>
              </th>
              <th class="NonBorder">
                <label class="paddingLabel">
                    <span>{__('First Name')}</span>     
                    <div style="float: right;">
                        <a href="#" class="position-absolute order{$formFilter.order.firstname->getValueExist('asc','_active')}" id="asc" name="firstname"><i class="fas fa-sort-up {if $formFilter.order.firstname->getValue()=='asc'}text-dark{/if}"></i></a>
                        <a href="#" class="position-absolute order{$formFilter.order.firstname->getValueExist('desc','_active')}" id="desc" name="firstname"><i class="fas fa-sort-down {if $formFilter.order.firstname->getValue()=='desc'}text-dark{/if}"></i></a>            
                    </div>
                </label>
              </th>
              <th class="NonBorder">
                <label>
                    <span>{__('Last Name')}</span>   
                    <div style="float: right;">
                        <a href="#" class="position-absolute order{$formFilter.order.lastname->getValueExist('asc','_active')}" id="asc" name="lastname"><i class="fas fa-sort-up {if $formFilter.order.lastname->getValue()=='asc'}text-dark{/if}"></i></a>
                        <a href="#" class="position-absolute order{$formFilter.order.lastname->getValueExist('desc','_active')}" id="desc" name="lastname"><i class="fas fa-sort-down {if $formFilter.order.lastname->getValue()=='desc'}text-dark{/if}"></i></a>            
                    </div>   
                </label>
            </th>
            <th class="footable-first-column" data-toggle="true">
                <span>{__('Is active')}</span>   
            </th>           
            <th style="width: 230px;" class="footable-first-column" data-toggle="true">
                <span>{__('Created at')}</span>   
                <div style="float: right;">
                    <a href="#" class="position-absolute order{*$formFilter.order.phone->getValueExist('asc','_active')*}" id="asc" name="created_at"><i class="fas fa-sort-up OrderPosition {if $formFilter.order.created_at->getValue()=='asc'}text-dark{/if}"></i></a>
                    <a href="#" class="position-absolute order{*$formFilter.order.phone->getValueExist('desc','_active')*}" id="desc" name="created_at"><i class="fas fa-sort-down OrderPosition {if $formFilter.order.created_at->getValue()=='desc'}text-dark{/if}"></i></a>            
                </div>
            </th>

            <th style="width: 230px;" class="footable-first-column" data-toggle="true">
                <span>{__('Updated at')}</span>   
                <div style="float: right;">
                    <a href="#" class="position-absolute order{*$formFilter.order.city->getValueExist('asc','_active')*}" id="asc" name="updated_at"><i class="fas fa-sort-up OrderPosition {if $formFilter.order.updated_at->getValue()=='asc'}text-dark{/if}"></i></a>
                    <a href="#" class="position-absolute order{*$formFilter.order.city->getValueExist('desc','_active')*}" id="desc" name="updated_at"><i class="fas fa-sort-down OrderPosition {if $formFilter.order.updated_at->getValue()=='dsc'}text-dark{/if}"></i></a>            
                </div>
            </th>
            
           {* <th data-hide="phone">{__('country')}</th>*}
           
            <th data-hide="phone">{__('Actions')}</th>
        </tr>
      </thead>
           <tr class=" input-list">                
                <td></td>
                <td></td>                              
                <td colspan="3"><input  placeholder="{__('Speakername, Firstname, Lastname, Email, Phone, Mobile, Address')}" class="search form-control" type="text" size="5" name="query" value="{$formFilter.search.query}"></td> 
                <td>
                    {html_options style="height: 31px;" class="equal Select show-menu-arrow form-control" name="is_active" options=$formFilter->equal.is_active->getOption('choices') selected=(string)$formFilter.equal.is_active}
                </td>               
                <td>
                    <input class="form-control form-control-sm ml-1 InputTexte RowBlock Range Date CreatedAtDate" id="created_at_from" date-id="from" placeholder="{__('From')}" name="created_at" value="{if $formFilter->hasErrors()}{$formFilter.range.created_at.from}{else}{format_date($formFilter.range.created_at.from,'a')}{/if}">
                    <input class="form-control form-control-sm ml-1  InputTexte RowBlock Range Date CreatedAtDate" id="created_at_to" date-id="to" placeholder="{__('To')}" name="created_at" value="{if $formFilter->hasErrors()}{$formFilter.range.created_at.to}{else}{format_date($formFilter.range.created_at.to,'a')}{/if}">
                </td>
                <td> 
                    <input class="form-control form-control-sm ml-1  InputTexte RowBlock Range Date UpdatedAtDate" id="updated_at_from" date-id="from" placeholder="{__('From')}" name="updated_at" value="{if $formFilter->hasErrors()}{$formFilter.range.updated_at.from}{else}{format_date($formFilter.range.updated_at.from,'a')}{/if}">
                    <input class="form-control form-control-sm ml-1  InputTexte RowBlock Range Date UpdatedAtDate" id="updated_at_to" date-id="to" placeholder="{__('To')}" name="updated_at" value="{if $formFilter->hasErrors()}{$formFilter.range.updated_at.to}{else}{format_date($formFilter.range.updated_at.to,'a')}{/if}">
                </td>
                {*<td></td>*}
                <td></td>
                  
                 
            </tr>
      <tbody>
       {foreach $pager as $item}
        <tr class="Type list" {if $item->hasI18n()}id="{$item->getI18n()->get('id')}"{/if}>
            <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>
            <td>{$item->get('id')}</td>         
            <td colspan="3">
                {if $item->hasAvatar()}
                    <img class="classIcon" src="{$item->getAvatar()->getMedium()->getUrl()}" style="width: 45px;height: 45px;"/> 
                {/if}
                <div><i class="fa fa-address-card"></i> {$item->getFormatter()->getName()}</div>                                              
                <div>{if $item->hasEmail()}<i class="fa fa-envelope"></i> {$item->get('email')}{/if}{if $item->hasMobile()} -- <i class="fa fa-mobile"></i> {$item->getFormatter()->getMobile()}{/if}</div>
                <div>{if $item->hasPhone()}<i class="fa fa-phone"></i> {$item->getFormatter()->getPhone()}{/if}</div>
                <div>{if $item->hasAddress1()}<i class="fa fa-map-marker"></i> {$item->get('address1')}{/if}{if $item->hasCountry()}-{$item->getFormatter()->getCountry()->getFormatted()->ucfirst()}{/if}</div>
            </td>
            <td class="align-middle text-center"> <a href="#" class="ChangeIsActive" name="{$item->get('is_active')}" id="{$item->get('id')}"><i class="fa fa-circle text-{if $item->isActive()}success{else}danger{/if}"></i></a>
            </td>          
            <td>       
                {$item->getFormatter()->getCreatedAt()->getFormatted()}
            </td> 
            <td>                
                    {$item->getFormatter()->getUpdatedAt()->getFormatted()}
            </td>          
            <td>
              <a href="#" class="list-action text-info View" id="{$item->get('id')}"  title="{__('Edit')}"><i class="fa fa-pencil-alt"></i></a>
              <a href="#" class="list-action text-danger Delete" id="{$item->get('id')}" name="{$item->getFormatter()->getName()}" title="{__('Delete')}"><i class="fa fa-trash-alt"></i></a>
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
<!--     <div class="row">
      <div class="col-sm-5"><div class="dataTables_info" id="Myliste_info" role="status" aria-live="polite">Showing 1 to 10 of 2,222 entries</div></div><div class="col-sm-7"><div class="dataTables_paginate paging_simple_numbers" id="Myliste_paginate"><ul class="pagination"><li class="paginate_button previous disabled" id="Myliste_previous"><a href="#" aria-controls="Myliste" data-dt-idx="0" tabindex="0">Previous</a></li><li class="paginate_button active"><a href="#" aria-controls="Myliste" data-dt-idx="1" tabindex="0">1</a></li><li class="paginate_button "><a href="#" aria-controls="Myliste" data-dt-idx="2" tabindex="0">2</a></li><li class="paginate_button "><a href="#" aria-controls="Myliste" data-dt-idx="3" tabindex="0">3</a></li><li class="paginate_button "><a href="#" aria-controls="Myliste" data-dt-idx="4" tabindex="0">4</a></li><li class="paginate_button "><a href="#" aria-controls="Myliste" data-dt-idx="5" tabindex="0">5</a></li><li class="paginate_button disabled" id="Myliste_ellipsis"><a href="#" aria-controls="Myliste" data-dt-idx="6" tabindex="0">…</a></li><li class="paginate_button "><a href="#" aria-controls="Myliste" data-dt-idx="7" tabindex="0">223</a></li><li class="paginate_button next" id="Myliste_next"><a href="#" aria-controls="Myliste" data-dt-idx="8" tabindex="0">Next</a></li></ul></div></div>
    </div> 
    </div>-->
  </div><!--End list-->


      

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
                                    name : $("[name=name] option:selected").val()  
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
                            url:"{url_to('site_event_ajax',['action'=>'ListPartialSpeakerUser'])}" ,                          
                            target: "#actions"
                             });
        }
        
  {* =====================  P A G E R  A C T I O N S =============================== *}  
      
           $("#init").click(function() {                   
               $.ajax2({ url:"{url_to('site_event_ajax',['action'=>'ListPartialSpeakeruser'])}",                                    
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
          
          $("[name=nbitemsbypage],.equal").change(function() { return updateFilter(); }); 
          
         // $("[name=name]").change(function() { return updateFilter(); }); 
           
           $(".pager").click(function () {                      
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('site_event_ajax',['action'=>'ListPartialSpeakerUser'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length),
                                target: "#actions"
                });
        }); 
                
{* =================================== ACTIONS ======================================================== *}
        
        $(".search").keypress(function(event) {  if (event.keyCode==13)   return updateFilter(); });

        $("[name=nbitemsbypage]").change(function () {  return updateFilter();  });
    
        $(".pager").click(function () {                     
                return $.ajax2({ data: getFilterParameters(), 
                                 url:"{url_to('site_event_ajax',['action'=>'ListPartialSpeakerUser'])}?page="+$(this).attr('data-page'),                                
                                 target: "#actions"
                });
        });
          
          
      $(".View").click( function () {                    
                  return $.ajax2({ data : { SiteEventSpeakerUser : $(this).attr('id') },                               
                                  url:"{url_to('site_event_ajax',['action'=>'ViewSpeakerUser'])}", 
                                  target: "#actions"});
          });
    
      $("#New").click( function () {             
                return $.ajax2({                    
                    url: "{url_to('site_event_ajax',['action'=>'NewSpeakerUser'])}",               
                    target: "#actions"
              });
            });
         
     $(".Delete").click( function () { 
                if (!confirm('{__("Site Event Speaker \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ SiteEventSpeakerUser: $(this).attr('id') },
                                 url :"{url_to('site_event_ajax',['action'=>'DeleteSpeaker'])}",                               
                                 success : function(resp) {
                                       if (resp.action!='DeleteSpeakerUser') return ;                                          
                                          $(".list[id="+resp.id+"]").remove();  
                                          if ($('.list').length==0) return updateFilter();                                          
                                 }
                     });                                        
            });
        
        
        $(".ChangeIsActive").click(function () {
            return $.ajax2({
                 data : { SiteEventSpeaker : { id: $(this).attr('id') , value:$(this).attr('name'),token :'{mfForm::getToken('ChangeForm')}' } },                  
                url: "{url_to('site_event_ajax',['action'=>'ChangeIsActiveSpeakerUser'])}",              
                success: function (resp) {
                    if (resp.action != 'ChangeIsActiveSpeakerUser') return ;
                    change('ChangeIsActive',resp);
                }
            });
        });
         
     
</script>