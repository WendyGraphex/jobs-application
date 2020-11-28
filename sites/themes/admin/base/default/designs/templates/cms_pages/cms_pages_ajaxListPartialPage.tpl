
<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__('Site')}</h3>
        <h3 class="admin-header-small-text">{__('CMS pages management')}</h3>
    </div>
    <div class="col-sm" style="padding: 0;">
        <div style="float: right;">
            <a id="New" class="btn btn-success admin-header-button" href="#">
            <i class="fa fa-plus" style="margin-right:5px;"></i>{__('New page')}</a>
            <a style="margin-left: 10px;" id="Menus" class="btn btn-info admin-header-button" href="#">
                <i class="fa fa-list-ul" style="margin-right:5px;"></i>
                {__('Menus')}
            </a>
        </div>
    </div>
</div>
<div class="breadcrumb-title">
    <p>
        <i class="fa fa-home" style="color: #37bc9b;"></i>
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Site')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('CMS pages')}
    </p>
</div> 
    
    {alerts}
<div style="width: 100%; background-color: white; display: inline-block; padding: 5px;">
    <div>
      
        {component name="/site_languages/selectListLanguagesFrontend" selected=$formFilter.lang}
    </div>
    {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter}

    <button style="float: right; background-color: #c8c8c8; border-radius: 0;" id="filter" class="btn btn-default">{__("filter")|capitalize}</button>   
    <button style="float: right; margin-right: 10px; background-color: #c8c8c8; border-radius: 0;" id="init" class="btn btn-default">{__("init")|capitalize}</button>

    <table class="table table-bordered table-hover table-striped" cellpadding="0" cellspacing="0"> 
        <thead class="bgSpec">
            <tr role="row">
                <th class="footable-first-column" data-toggle="true">#</th> 
                <th></th>
             <th>{__('ID')}           
                <div style="float: right;">
                    <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><i class="fas fa-sort-up {if $formFilter.order.id->getValue()=='asc'}text-dark{/if}" style=""></i></a>
                    <a href="#" class="position-absolute order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><i class="fas fa-sort-down {if $formFilter.order.id->getValue()=='desc'}text-dark{/if}"></i></a>            
                </div>
            </th>           
            <th>{__('Title/Name/Url')}
            </th>            
            <th class="footable-first-column" data-toggle="true">{__('In menu')}
            </th>           
            <th class="footable-first-column" data-toggle="true">{__('State')}
               {* <div style="float: right;">
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
            <th class="footable-first-column" data-toggle="true">{__('Actions')}</th>
        </thead>
        </tr>
        <tbody>
          <tr role="row">
            <td></td>
            <td></td>
            <td>{* id *}<input style="height: 31px;" class="search form-control" type="text" size="5" name="id" value="{$formFilter.search.id}"></td>                 
            <td><input style="height: 31px;" class="search form-control" type="text" size="5" name="meta_title" value="{$formFilter.search.meta_title}"></td>       
            <td>{* in menu*}
                {html_options style="height: 31px;" class="form-control equal" name="in_menu" options=$formFilter->equal.in_menu->getOption('choices') selected=(string)$formFilter.equal.in_menu}</td>    
            </td>            
            <td>{*state *}
                {html_options style="height: 31px;" class="form-control equal" name="is_active" options=$formFilter->equal.is_active->getOption('choices') selected=(string)$formFilter.equal.is_active}</td>    
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
        <tr class="pages list" id="{$item->get('id')}">
            <td class="pages-count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>
           
                <td>  
                   <input class="selection" type="checkbox" id="{$item->get('id')}" title="{if $item->getI18n()->get('url')}{$item->getI18n()->getUrl()}{else}{$item->get('name')}{/if}"/>
                </td>         
            <td>
                {$item->get('id')}
            </td>
            <td>
                <div>{$item->get('name')}</div>
                <div>{if $item->hasI18n()}{$item->getI18n()->getFormatter()->getMetaTitle()}{else}{__('not defined')}{/if}</div>
                <div>{if $item->hasI18n()}                      
                    {if $item->getI18n()->hasUrl()}<a class="list-action" target="_blank" href="{$item->getI18n()->getURL()}">
                            {if $item->getI18n()->getUrl()->isLink()}<i class="fa fa-link"></i>{/if} {$item->getI18n()->getURL()->getText()}</a>{/if}
                {else}                   
                    <span>{__('-- not defined --')}</span>
                {/if}     
                </div>
            </td>
            <td>{if $item->inMenu()}
                 {$item->getNumberOfMenus()}       
                 <a href="#" class="list-action Menus" id="{$item->get('id')}"><i class="fa fa-list"></i></a>
                {/if}
            </td>           
             <td class="align-middle text-center"> <a href="#" class="ChangeIsActive" name="{$item->get('is_active')}" id="{$item->get('id')}"><i class="fa fa-circle text-{if $item->isActive()}success{else}danger{/if}"></i></a>
                </td>          
            <td>                
                    {$item->getI18n()->getFormatter()->getCreatedAt()->getFormatted()}
            </td>
            <td>                
                    {$item->getI18n()->getFormatter()->getUpdatedAt()->getFormatted()}
            </td>
            <td>
                <a href="#" title="{__('Edit')}" class="View list-action" id="{$item->get('id')}">
                   <i class="fa fa-pencil-alt"></i>                   
                </a> 
                <a href="#" title="{__('Delete')}" class="Delete list-action" id="{$item->get('id')}" name="{if $item->hasI18n() && $item->getI18n()->get('url')}{$item->getI18n()->get('url')}.html{else}{$item->get('name')}{/if}">
                    <i class="fa fa-trash-alt"></i>                   
                </a> 
            </td>
        </tr>
        {/foreach}

    </table>
    {if !$pager->getNbItems()}  
        {__("no result")}
    {/if}    
    {*if $pager->getNbItems()>5}

            <div>
                <a href="#" title="{__('enable')}" id="IsActiveEnablePages" style="opacity:0.5" class="actions_items">
                    <img  src="{url('/icons/YES.gif','picture')}" alt='{__("yes")}'/>
                </a>
                <a href="#" title="{__('disable')}" id="IsActiveDisablePages" style="opacity:0.5" class="actions_items">
                    <img  src="{url('/icons/NO.gif','picture')}" alt='{__("no")}'/>
                </a>
                <a href="#" title="{__('delete')}" id="DeletePages" style="opacity:0.5" class="actions_items">
                    <img  src="{url('/icons/delete.gif','picture')}" alt='{__("delete")}'/>
                </a>
            </div>

        {/if*}
    {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager}
</div>
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
    
    
    
    
     function getFilterParameters()
    {
        var params={ filter: {  order : { }, 
                                search: { },                             
                                equal : {  is_active:$(".equal[name=is_active] option:selected").val(),
                                           in_menu:$(".equal[name=in_menu] option:selected").val(),
                                           in_block:$(".equal[name=in_block] option:selected").val() 
                                        },
                                range : { },
                                lang: $("#SelectListLanguages option:selected").attr('id'), 
                                nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                token:'{$formFilter->getCSRFToken()}'
                    }};
        params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");
        $(".search").each(function() { params.filter.search[this.name] =this.value; });
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
       return $.ajax2({ data: getFilterParameters(), url:"{url_to('cms_pages_ajax',['action'=>'ListPartialPage'])}" , target: "#actions" });
    }

    function updatePager(n)
    {
       var page_active=$(".pager .active").html()?parseInt($(".pager .active").html()):1;
       var records_by_page=$("[name=nbitemsbypage]").val();
       var start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
       $(".pages-count").each(function(id) { $(this).html(start+id) }); // Update index column           
       var nb_results=parseInt($("#nb_results").html())-n;
       $("#nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
       $("#end_result").html($(".pages-count:last").html());
    }
    
        function updateFilter()
        {          
           return $.ajax2({ data: getFilterParameters(), 
                            url:"{url_to('cms_pages_ajax',['action'=>'ListPartialPage'])}" , 
                            target: "#actions"
                             });
        }
    
    $("#SelectListLanguages").change(function() {  updateFilter(); });
    
         
    $('.order').click(function() {
                    $(".order_active").attr('class','order');
                    $(this).attr('class','order_active'); 
                    return updateFilter();
    });
            
    $("[name=nbitemsbypage],[name=is_active],[name=in_menu],[name=in_block]").change(function() { return updateFilter(); });                                                   
    
    $(".search").keypress(function(event) {
        if (event.keyCode!=13) return ;        
        updateFilter();     
    });      
    
    $("#filter").click(function() { return updateFilter(); }); 
            
   $("#init").click(function() {           
        $.ajax2({ url:"{url_to('cms_pages_ajax',['action'=>'ListPartialPage'])}",target: "#actions"}); 
    }); 
  
    $(".pager").click(function () {           
        return $.ajax2({ data: getFilterParameters(), url:"{url_to('cms_pages_ajax',['action'=>'ListPartialPage'])}?page="+$(this).attr('data-page'),target: "#actions"});
    });
    
     $("#all").click(function () {  $(".selection").attr("checked",($(this).attr("checked")=="checked"));  });
     
     $(".selection,#all").click(function (){               
         $(".actions_items").css('opacity',($(".selection:checked").length?'1':'0.5'));
     });
       
     $(".View").click( function () {      
         return $.ajax2({ data : { CmsPageI18n : { page_id: $(this).attr('id'), lang: $("#SelectListLanguages option:selected").attr('id') } },
                          url:"{url_to('cms_pages_ajax',['action'=>'ViewPageI18n'])}",
                          target: "#actions" });
    });    
    
    $("#New").click( function () {        
         return $.ajax2({ data : { CmsPageI18n : {  lang: $("#SelectListLanguages option:selected").attr('id'),token:"{mfForm::getToken('LanguageFrontendForm')}" } },
                          url:"{url_to('cms_pages_ajax',['action'=>'NewPageI18n'])}",
                          target: "#actions" });
    }); 
    
     $("#Menus").click( function () {         
         return $.ajax2({ data : { Lang: {  lang: $("#SelectListLanguages option:selected").attr('id'),token:"{mfForm::getToken('LanguageFrontendForm')}" } },
                          url:"{url_to('cms_pages_ajax',['action'=>'ListPartialMenu'])}",
                          target: "#actions" });
    }); 
    
    $(".Delete").click( function () { 
                if (!confirm('{__("page \"#0#\" will be deleted. Confirm ?")}'.format(this.name))) return false; 
                return $.ajax2({ data :{ Page: $(this).attr('id') },
                                  url:"{url_to('cms_pages_ajax',['action'=>'DeletePage'])}",
                                 success : function(resp) {
                                          if (resp.action!='DeletePage') return ;                                     
                                          $(".list[id="+resp.id+"]").remove();  
                                          if ($('.list').length==0)
                                             return updateFilter();
                                          updatePager(1);                                      
                                 }
                     });                                        
    });
    
    $(".ChangeIsActive").click( function () { 
        return $.ajax2({ data: { Page : { id: $(this).attr('id'), value: $(this).attr('name'), token: '{mfForm::getToken("ChangeForm")}' } },
                         url: "{url_to('cms_pages_ajax',['action'=>'ChangeIsActivePage'])}",
                         success: function(resp) {
                                       if (resp.action != 'ChangeIsActivePage') return ;
                                         change('ChangeIsActive',resp);
                                  }
        });    
    });
    
    $("#IsActiveEnablePages,#IsActiveDisablePages").click( function () { 
                var params={ PagesI18n: { selection : {  } , value :(this.id=='IsActiveDisablePages'?'NO':'YES'),token: "{mfForm::getToken('changesPageI18nForm')}" } };  
                idx=0;
                $(".selection:checked").each(function (id) { 
                    if ($(".ChangeIsActive[name="+this.id+"]").attr('id')!=params.cmsPagesI18n.value)
                       params.cmsPagesI18n.selection[idx++]= this.id;
                });
                if ($.isEmptyObject(params.cmsPagesI18n.selection))
                   return ;
                return $.ajax2({ data: params ,
                                 url: "{url_to('cms_pages_ajax',['action'=>'ChangeSelectionIsActivePageI18n'])}",
                                 success: function(resp) { 
                                                 if (resp.action=='ChangeSelectionIsActivePageI18n')
                                                        changePageI18nIsActiveState(resp);
                                          }
                });
    }); 
            
    $("#DeletePages").click( function () { 
             var   params={ Selection : {  } };
                text="";
                $(".selection:checked").each(function (id) { 
                   params.selection[id]=this.name;
                   text+=this.title+",\n";
                });
                if ($.isEmptyObject(params.selection))
                   return ;
                if (!confirm("{__('Pages :\u000A\u000A\"#0#\"\u000A\u000A will be deleted. Confirm ?')}".format(text.substring(0,text.lastIndexOf(","))))) 
                    return false; 
                return $.ajax2({ data: params,
                                 url: "{url_to('cms_pages_ajax',['action'=>'DeleteSelectionPage'])}",
                                 success:function(resp) {
                                           if (resp.action!='DeleteSelectionPage') return ;                                                                                     
                                               if ($(".list").length-resp.parameters.length==0)
                                                  return updateFilter();
                                               $.each(resp.parameters, function () {  $(".list[id="+this+"]").remove(); });
                                               updatePager(resp.parameters.length);
                                               $("input#all").attr("checked",false);                                                                             
                                         }
                });    
    });
             
   
   
     $(".Menus").click(function () {                     
                return $.ajax2({ data : { CmsMenuNode : {  
                                             lang : $("#SelectListLanguages option:selected").attr('id'), 
                                             token : '{mfForm::getToken('CmsMenuNodeForm')}' },
                                          filter: {  
                                                equal : { page_id : $(this).attr('id') },
                                                nbitemsbypage: $("[name=nbitemsbypage]").val(),                              
                                                token: '{mfForm::getToken('CmsMenuFormFilter')}'
                                                }  
                                       },
                                 url:"{url_to('cms_pages_ajax',['action'=>'ListPartialMenu'])}",
                                 target: "#actions"
                });
        });
</script>
