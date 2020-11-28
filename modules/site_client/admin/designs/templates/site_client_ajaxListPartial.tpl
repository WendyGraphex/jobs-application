        <div class="row admin-header-container">
            <div class="col-sm">
              <h3 class="admin-header-big-text">{__('Site')}</h3>
              <h3 class="admin-header-small-text">{__('Site Clients management')}</h3>
            </div>
            <div class="col-sm" style="padding: 0;">
                <div style="float: right;"> 
                   <a class="btn btn-success admin-header-button"  href="#" id="Add"><i class="fa fa-plus"></i> {__('New')}</a>
                </div> 
            </div>
          </div>
          
        <div class="breadcrumb-title">
            <p>              
                <i class="fa fa-home" style="color: #37bc9b;"></i>               
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Site')}
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Clients management')}
            </p>
        </div>
{alerts}
<div class="table-responsive bg-white px-1 py-2">
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
                <th class="footable-first-column" data-toggle="true">#</th>
                <th>{__('ID')}           
                    <div style="float: right;">
                        <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><i class="fas fa-sort-up {if $formFilter.order.id->getValue()=='asc'}text-dark{/if}" style=""></i></a>
                        <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><i class="fas fa-sort-down {if $formFilter.order.id->getValue()=='desc'}text-dark{/if}"></i></a>            
                       </div>
                </th>
                <th class="footable-first-column" data-toggle="true"><span>{__('Client')}</span></th>
                <th class="footable-first-column" data-toggle="true"><span>{__('Name')}</span></th>
                <th class="footable-first-column" data-toggle="true">
                    <span>{__('State')}</span>
                    {*<div style="float: right;">
                        <a href="#" class="order{$formFilter.order.is_active->getValueExist('asc','_active')}" id="asc" name="is_active"><i class="fas fa-sort-up"></i></a>
                        <a href="#" class="order{$formFilter.order.is_active->getValueExist('desc','_active')}" id="desc" name="is_active"><i class="fas fa-sort-down"></i></a>
                    </div>*}
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
                <th class="footable-first-column" data-toggle="true"><span>{__('Actions')}</span></th>
            </tr>
        </thead>
        <tr class=" input-list">
                <td>{if $pager->getNbItems()>5}</td>{/if}
                <td></td>
                <td><input  style="height: 31px;" class="search form-control" type="text" size="5" name="lang" value="{$formFilter.search.lang}"></td>
                <td><input  style="height: 31px;" class="search form-control" type="text" size="5" name="name" value="{$formFilter.search.name}"></td>                        
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
                <td></td>
                
                 
            </tr>
           
    {foreach $pager as $item}
        <tr class="clients list" id="{$item->get('id')}">
            <td class="client-count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>
            <td>{$item->get('id')}</td>             
              <td>
                 <img id="{$item->get('lang')}" src="{url("/flags/`$item->get('lang')`.png","picture")}"/>{$item->getLanguage()->getFormatted()->ucfirst()}   
            </td> 
            <td>
              {$item->get('name')}
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
                {*if $user->hasCredential([['superadmin','admin']])}
                    <a href="#" title="{__('Edit')}" class="View" id="{$item->get('id')}">
                     <i class="fa fa-edit"></i></a>
                {/if*}
                {if $user->hasCredential([['superadmin','admin']])}
                    <a href="#" class="list-action text-info View" id="{$item->get('id')}"  data-toggle="modal"  data-target="#exampleModal" title="{__('Edit')}"><i class="fa fa-pencil-alt"></i></a>
                    <a href="#" class="list-action text-danger Delete" id="{$item->get('id')}" name="{$item->get('firstname')} {$item->get('lastname')}" data-toggle="tooltip" title="{__('Delete')}"><i class="fa fa-trash-alt"></i></a>
                {/if}
            </td>
        </tr>
    {/foreach}
</table>
{if !$pager->getNbItems()}
    {__("No client")}
{/if}

{include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager}  
<script type="text/javascript">
    
    
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
    
    

        {*function changeIsActiveState(resp) 
        {
            $.each(resp.selection?resp.selection:[resp.id], function (id) { 
                sel="a.ChangeIsActive[id="+this+"]";
                if (resp.state=='YES'||resp.state=='NO') 
                {    
                    $(sel+" img").attr({
                        src :"{url('/icons/','picture')}"+resp.state+".gif"                    
                    });
                    $(sel).attr("name",resp.state);
                }
            });  
        }*}

    function getFilterParameters()
    {
        var params={ filter: {  order : { },
                    search : {  },
                    equal: {   },
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
        $(".equal.Select option:selected").each(function() { params.filter.equal[$(this).parent().attr('name')] =$(this).val(); });
        return params;
    }

    function updateFilter()
    {
        return $.ajax2({ data: getFilterParameters(),
            url:"{url_to('site_client_ajax',['action'=>'ListPartial'])}" ,          
            target: "#actions"
        });
    }

    function updateSitePager(n)
    {
        page_active=$(".pager .active").html()?parseInt($(".pager .active").html()):1;
        records_by_page=$("[name=nbitemsbypage]").val();
        start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
        $(".count").each(function(id) { $(this).html(start+id) }); // Update index column
        nb_results=parseInt($("#nb_results").html())-n;
        $("#nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
        $("#end_result").html($(".count:last").html());
    }

    $("#SelectListLanguages").change(function() {  updateFilter();   });
    
    
    {* =====================  P A G E R  A C T I O N S =============================== *}

    $("#init").click(function() {
        $.ajax2({ url:"{url_to('site_client_ajax',['action'=>'ListPartial'])}",            
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

    $("[name=nbitemsbypage],.equal.Select").change(function() { return updateFilter(); });


    $(".pager").click(function () {
        return $.ajax2({ data: getFilterParameters(),
            url:"{url_to('site_client_ajax',['action'=>'ListPartial'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length),        
            target: "#actions"
        });
    });
    {* =====================  A C T I O N S =============================== *}

    $(".View").click( function () {
        return $.ajax2({ data : { SiteClient : $(this).attr('id') },           
            url:"{url_to('site_client_ajax',['action'=>'View'])}",         
            target: "#actions"});
    });                  
     
    $(".Delete").click( function () {
        if (!confirm('{__("Client \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false;
        return $.ajax2({ data :{ SiteClient: $(this).attr('id') },
            url :"{url_to('site_client_ajax',['action'=>'Delete'])}",           
            success : function(resp) {
                if (resp.action=='DeleteClient')
                {
                    $(".list[id="+resp.id+"]").remove();
                    if ($('.list').length==0)  return updateFilter()
                    updateSitePager(1);
                }
            }
        });
    });


       $("#Add").click( function () {             
            return $.ajax2({                    
                url: "{url_to('site_client_ajax',['action'=>'Add'])}",               
                target: "#actions"
           });
         });
         
        $(".View").click( function () {             
            return $.ajax2({                    
                data : { SiteClient: $(this).attr('id') },
                url: "{url_to('site_client_ajax',['action'=>'View'])}",               
                target: "#actions"
           });
         });
           $(".ChangeIsActive").click(function() { 
           
            return $.ajax2({
                 data : { SiteClient : { id: $(this).attr('id') , value:$(this).attr('name'),token :'{mfForm::getToken('ChangeForm')}' } },                  
                 url: "{url_to('site_client_ajax',['action'=>'ChangeIsActive'])}",          
                success: function (resp) {
                    if (resp.action != 'ChangeIsActive') return ;
                    change('ChangeIsActive',resp);
                }
            });
           
           
                       {* return $.ajax2({ 
                            data : { 
                                        SiteClient : { 
                                                id: $(this).attr('id') , 
                                                value:$(this).attr('name'), 
                                                token: '{mfForm::getToken('ChangeForm')}' } },                            
                            url: "{url_to('site_client_ajax',['action'=>'ChangeIsActive'])}",                          
                            success: function(resp) { 
                                        if (resp.action=='ChangeIsActive')
                                            changeIsActiveState(resp);
                                     }
                    });*}
         });
            
</script>
