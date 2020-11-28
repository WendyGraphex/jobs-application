{messages class="errors"}
<div>
   <a id="New" href="#"><img  src="{url('/icons/add.gif','picture')}" alt="{__('new')}"/>{__('new page')|capitalize}</a>
</div>
<div>       
    <img id="{$formFilter.lang}" name="lang" src="{url("/flags/`$formFilter.lang|default:"__"`.png","picture")}" title="{if $formFilter.lang->hasError()}{$formFilter.lang}{else}{format_country($formFilter.lang)}{/if}" />
    <style> .ui-dialog { font-size: 62.5%; }</style> 
    <a id="ChangeLang" href="#" title="{__('change')}"><img  src="{url('/icons/edit.gif','picture')}" alt='{__("language")}'/></a>
    {component name="/languages/dialogListLanguagesFrontend" selected=$formFilter.lang}    
</div>
{include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter}
<button id="filter">{__("filter")|capitalize}</button>   <button id="init">{__("init")|capitalize}</button>
<table cellpadding="0" cellspacing="0">
    <tr>
        <th>#</th>
        {if $pager->getNbItems()>5}<th>&nbsp;</th>{/if}
        <th>{__('id')}
            <div>
                <a href="#" class="order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><img  src='{url("/icons/sort_asc`$formFilter.order.id->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                <a href="#" class="order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><img  src='{url("/icons/sort_desc`$formFilter.order.id->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
            </div> 
        </th> 
        <th>{__('name')}
            <div>
                <a href="#" class="order{$formFilter.order.name->getValueExist('asc','_active')}" id="asc" name="name"><img  src='{url("/icons/sort_asc`$formFilter.order.name->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                <a href="#" class="order{$formFilter.order.name->getValueExist('desc','_active')}" id="desc" name="name"><img  src='{url("/icons/sort_desc`$formFilter.order.name->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
            </div> 
        </th>
         <th>{__('url')}
            <div>
                <a href="#" class="order{$formFilter.order.url->getValueExist('asc','_active')}" id="asc" name="url"><img  src='{url("/icons/sort_asc`$formFilter.order.url->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                <a href="#" class="order{$formFilter.order.url->getValueExist('desc','_active')}" id="desc" name="url"><img  src='{url("/icons/sort_desc`$formFilter.order.url->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
            </div> 
        </th>
        <th>{__('in menu')}
        </th>
         <th>{__('in block')}
        </th>
         <th>{__('state')}
            <div>
                <a href="#" class="order{$formFilter.order.is_active->getValueExist('asc','_active')}" id="asc" name="is_active"><img  src='{url("/icons/sort_asc`$formFilter.order.is_active->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                <a href="#" class="order{$formFilter.order.is_active->getValueExist('desc','_active')}" id="desc" name="is_active"><img  src='{url("/icons/sort_desc`$formFilter.order.is_active->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
            </div>
        </th>
        <th>{__('actions')}</th>
    </tr>
    <tr>
        <td></td>
        {if $pager->getNbItems()>5}<td></td>{/if}
        <td>{* id *}<input class="search" type="text" size="5" name="id" value="{$formFilter.search.id}"></td>      
        <td>{* name *}<input class="search" type="text" size="5" name="name" value="{$formFilter.search.name}"></td>
        <td>{* url *}<input class="search" type="text" size="5" name="url" value="{$formFilter.search.url}"></td>
        <td>{* in menu*}
            {html_options_format class="equal" name="in_menu" options=$formFilter->equal.in_menu->getOption('choices') selected=(string)$formFilter.equal.in_menu format="__"}</td>    
        </td>
         <td>{* in block*}
            {html_options_format class="equal" name="in_block" options=$formFilter->equal.in_block->getOption('choices') selected=(string)$formFilter.equal.in_block format="__"}</td>    
        </td>
        <td>{*state *}
            {html_options_format class="equal" name="is_active" options=$formFilter->equal.is_active->getOption('choices') selected=(string)$formFilter.equal.is_active format="__"}</td>    
        <td>{* actions *}</td>
    </tr>       
    {foreach $pager as $page}
    <tr class="pages" id="page-{$page->getCmsPage()->get('id')}">
        <td class="pages-count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$page@iteration}</td>
        {if $pager->getNbItems()>5}
            <td>  
               <input class="selection" type="checkbox" name="{$page->getCmsPage()->get('id')}" {if $page->hasCmsI18nPage()} id="{$page->getCmsI18nPage()->get('id')}" title="{if $page->getCmsI18nPage()->get('url')}{$page->getCmsI18nPage()->getUrl()}{else}{$page->getCmsPage()->get('name')}{/if}{else}{__('--- not defined ---')}{/if}"/>
            </td>
        {/if}
        <td>
            {$page->getCmsPage()->get('id')}
        </td>
        <td>
            {$page->getCmsPage()->get('name')|escape}
        </td>
        <td>
            {if $page->hasCmsI18nPage()}
                <img id="status" src='{url("/icons/pages/pages`$page->getCmsI18nPage()->getPageStatus()`.gif","picture")}' alt='{__("page`$page->getCmsI18nPage()->getPageStatus()`")}'/>
                {if $page->getCmsI18nPage()->get('url')}{$page->getCmsI18nPage()->getURL()}{/if}
            {else}
                <img id="status" src='{url("/icons/pages/pages_inactive.gif","picture")}' alt='{__("page_inactive")}'/>
                <span>{__('-- not defined --')}</span>
            {/if}    
        </td>
        <td>
            {__($page->getCmsPage()->InMenu())}
        </td>
         <td>
            {__($page->getCmsPage()->InBlock())} 
        </td>
        <td>             
            {if $page->hasCmsI18nPage()}
               <a href="#" title="{__('change')}" class="ChangeIsActive" name="{$page->getCmsI18nPage()->get('id')}" id="{$page->getCmsI18nPage()->get('is_active')}">
                    <img  src="{url("/icons/`$page->getCmsI18nPage()->get('is_active')`.gif",'picture')}" alt='{__("page_`$page->getCmsI18nPage()->get("is_active")`")}'/>
               </a> 
            {else}
               <img style="opacity:0.5" src="{url('/icons/NO.gif','picture')}" alt='{__("page_NO")}'/>
            {/if}               
        </td>
        <td>
            <a href="#" title="{__('edit')}" class="View" id="{$page->getCmsPage()->get('id')}">
                <img src="{url('/icons/edit.gif','picture')}" alt='{__("edit")}'/>
            </a> 
            <a href="#" title="{__('delete')}" class="Delete" id="{$page->getCmsPage()->get('id')}" name="{if $page->hasCmsI18nPage() && $page->getCmsI18nPage()->get('url')}{$page->getCmsI18nPage()->get('url')}.html{else}{$page->getCmsPage()->get('name')}{/if}">
                <img  src="{url('/icons/delete.gif','picture')}" alt='{__("delete")}'/>
            </a> 
        </td>
    </tr>
    {/foreach}
    {if $pager->getNbItems()>5}
    <tr>
        <td></td>
        <td> <input type="checkbox" id="all" />  
        </td>
        <td>
            <a href="#" title="{__('enable')}" id="IsActiveEnablePages" style="opacity:0.5" class="actions_items">
                <img  src="{url('/icons/YES.gif','picture')}" alt='{__("yes")}'/>
            </a>
            <a href="#" title="{__('disable')}" id="IsActiveDisablePages" style="opacity:0.5" class="actions_items">
                <img  src="{url('/icons/NO.gif','picture')}" alt='{__("no")}'/>
            </a>
            <a href="#" title="{__('delete')}" id="DeletePages" style="opacity:0.5" class="actions_items">
                <img  src="{url('/icons/delete.gif','picture')}" alt='{__("delete")}'/>
            </a>
        </td>
    </tr>
    {/if}
</table>
{if !$pager->getNbItems()}  
    {__("no result")}
{/if}    
{include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager}
<script type="text/javascript">
    
    function changePageI18nIsActiveState(resp) 
    {
        $.each(resp.selection?resp.selection:[resp.id], function (id) {           
            sel="a.ChangeIsActive[name="+this+"]";
            if (resp.state=='YES'||resp.state=='NO') 
            {    
                $(sel+" img").attr({
                    src :"{url('/icons/','picture')}"+resp.state+".gif",
                    alt : (resp.state=='YES'?'{__("YES")}':'{__("NO")}'),
                    title : (resp.state=='YES'?'{__("YES")}':'{__("NO")}')
                });
                $(sel).attr("id",resp.state);
            }
        });  
    }
    
    function getPagesFilterParameters()
    {
        var params={ filter: {  order : { }, 
                                search: { },                             
                                equal : {  is_active:$(".equal[name=is_active] option:selected").val(),
                                           in_menu:$(".equal[name=in_menu] option:selected").val(),
                                           in_block:$(".equal[name=in_block] option:selected").val() 
                                        },
                                lang: $("img[name=lang]").attr('id'),  
                                nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                token:'{$formFilter->getCSRFToken()}'
                    }};
        params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");
        $(".search").each(function() { params.filter.search[this.name] =this.value; });                               
        return params;                  
    }

    function updatePagesFilter()
    {
       $(".dialogs").dialog("destroy").remove();        
       return $.ajax2({ data: getPagesFilterParameters(), url:"{url_to('cms_pages_ajax',['action'=>'List'])}" , target: "#middle" });
    }

    function updatePager(n)
    {
       page_active=$(".pager .active").html()?parseInt($(".pager .active").html()):1;
       records_by_page=$("[name=nbitemsbypage]").val();
       start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
       $(".pages-count").each(function(id) { $(this).html(start+id) }); // Update index column           
       nb_results=parseInt($("#nb_results").html())-n;
       $("#nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
       $("#end_result").html($(".pages-count:last").html());
    }
    
    {JqueryScriptsReady}    
    
     $("#ChangeLang").click(function() {      
            $("#dialogListLanguages").dialog("open");
     }); 
     
     $("#dialogListLanguages").bind('select',function(event){                
            $("img[name=lang]").attr({                           
                                  id: event.selected.id,
                                  src: '{url("/flags/","picture")}'+event.selected.id+'.png',
                                  title: event.selected.lang
                                  });
           $("#ChangeLang").show();
           updatePagesFilter();
     });     
     
     // {* PAGER - begin *}    
    $('.order').click(function() {
                    $(".order_active").attr('class','order');
                    $(this).attr('class','order_active'); 
                    return updatePagesFilter();
    });
            
    $("[name=nbitemsbypage],[name=is_active],[name=in_menu],[name=in_block]").change(function() { return updatePagesFilter(); });                                                   
    
    $(".search").keypress(function(event) {
        if (event.keyCode==13)
        {
           updatePagesFilter();
        }     
    });      
    
    $("#filter").click(function() { return updatePagesFilter(); }); 
            
    $("#init").click(function() { 
        $(".dialogs").dialog("destroy").remove();        
        $.ajax2({ url:"{url_to('cms_pages_ajax',['action'=>'List'])}",target: "#middle"}); 
    }); 

    $(".pager").click(function () {     
        $(".dialogs").dialog("destroy").remove();        
        return $.ajax2({ data: getPagesFilterParameters(), url:"{url_to('cms_pages_ajax',['action'=>'List'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length),target: "#middle"});
    });
    
     $("#all").click(function () {  $(".selection").attr("checked",($(this).attr("checked")=="checked"));  });
     
     $(".selection,#all").click(function (){               
         $(".actions_items").css('opacity',($(".selection:checked").length?'1':'0.5'));
     });
     // {* PAGER - end *}   

     // {* ACTIONS - begin *} 
         
    $(".View").click( function () { 
        $(".dialogs").dialog("destroy").remove();    
         return $.ajax2({ data : { CmsPageI18n : { page_id: $(this).attr('id'), lang: $("img[name=lang]").attr('id'),token:"{mfForm::getToken('cmsPageWithLanguageForm')}" } },
                          url:"{url_to('cms_pages_ajax',['action'=>'ViewPageI18n'])}",
                          target: "#actions" });
    });    
    
    $("#New").click( function () { 
        $(".dialogs").dialog("destroy").remove();    
         return $.ajax2({ data : { CmsPageI18n : { lang: $("img[name=lang]").attr('id'),token:"{mfForm::getToken('LanguageFrontendForm')}" } },
                          url:"{url_to('cms_pages_ajax',['action'=>'NewPageI18n'])}",
                          target: "#actions" });
    });    
    
    $(".Delete").click( function () { 
                if (!confirm('{__("page \"#0#\" will be deleted. Confirm ?")}'.format(this.name))) return false; 
                return $.ajax2({ data :{ page: this.id },
                                  url:"{url_to('cms_pages_ajax',['action'=>'DeletePage'])}",
                                 success : function(resp) {
                                       if (resp.action=='deletePage')
                                       {    
                                          $("tr#page-"+resp.id).remove();  
                                          if ($('.pages').length==0)
                                          {
                                               $(".dialogs").dialog("destroy").remove();        
                                               $.ajax2({ url:"{url_to('cms_pages_ajax',['action'=>'List'])}",target: "#middle"}); 
                                          }
                                          updatePager(1);
                                        }       
                                 }
                     });                                        
    });
    
    $(".ChangeIsActive").click( function () { 
        return $.ajax2({ data: { CmsPageI18n : { id: $(this).attr('name'), value: $(this).attr('id'), token: '{mfForm::getToken("cmsPageI18nChangeForm")}' } },
                         url: "{url_to('cms_pages_ajax',['action'=>'ChangeIsActivePageI18n'])}",
                         success: function(resp) {
                                       if (resp.action=='ChangeIsActivePageI18n')
                                            changePageI18nIsActiveState(resp);
                                  }
        });    
    });
    
    $("#IsActiveEnablePages,#IsActiveDisablePages").click( function () { 
                var params={ cmsPagesI18n: { selection : {  } , value :(this.id=='IsActiveDisablePages'?'NO':'YES'),token: "{mfForm::getToken('changesPageI18nForm')}" } };  
                idx=0;
                $(".selection:checked").each(function (id) { 
                    if ($(".ChangeIsActive[name="+this.id+"]").attr('id')!=params.cmsPagesI18n.value)
                       params.cmsPagesI18n.selection[idx++]= this.id;
                });
                if ($.isEmptyObject(params.cmsPagesI18n.selection))
                   return ;
                return $.ajax2({ data: params ,
                                 url: "{url_to('cms_pages_ajax',['action'=>'ChangesIsActivePageI18n'])}",
                                 success: function(resp) { 
                                                 if (resp.action=='ChangesIsActivePageI18n')
                                                        changePageI18nIsActiveState(resp);
                                          }
                });
    }); 
            
    $("#DeletePages").click( function () { 
                params={ selection : {  } };
                text="";
                $(".selection:checked").each(function (id) { 
                   params.selection[id]=this.name;
                   text+=this.title+",\n";
                });
                if ($.isEmptyObject(params.selection))
                   return ;
                if (!confirm("{__('pages :\u000A\u000A\"#0#\"\u000A\u000A will be deleted. Confirm ?')}".format(text.substring(0,text.lastIndexOf(","))))) 
                    return false; 
                return $.ajax2({ data: params,
                                 url: "{url_to('cms_pages_ajax',['action'=>'DeletesPage'])}",
                                 success:function(resp) {
                                           if (resp.action=='DeletesPage')
                                           {                                                     
                                               if ($(".pages").length-resp.parameters.length==0)
                                               {
                                                   $(".dialogs").dialog("destroy").remove();        
                                                   return $.ajax2({ url:"{url_to('cms_pages_ajax',['action'=>'List'])}",target: "#middle"}); 
                                               }
                                               $.each(resp.parameters, function (id) {  $("tr#page-"+this).remove(); });
                                               updatePager(resp.parameters.length);
                                               $("input#all").attr("checked",false);                                    
                                           }       
                                         }
                });    
    });
    // {* ACTIONS - end *}

    // Other actions            
    $('.sublink').click(function() {  
             $(".dialogs").dialog("destroy").remove();  
            return $.ajax2({ url:this.id,target: "#middle"});
    });            
    {/JqueryScriptsReady}      
</script>
