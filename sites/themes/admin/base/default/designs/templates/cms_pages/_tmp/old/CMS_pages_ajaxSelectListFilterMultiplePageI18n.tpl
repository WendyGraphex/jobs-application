{messages class="errors"}
<h3>{__("add pages for block : %s",$block->get('name'))|capitalize}</h3>
<style>
    .selected {
        background-color:#ff0000;
    }
</style>
<div>          
    <a href="#" id="Save" {if !$formFilter.selected->getValue()}style="display:none;"{/if}><img  src="{url('/icons/save.gif','picture')}" alt="{__('save')}"/>{__('save')}</a>
    <a href="#" id="Cancel"><img  src="{url('/icons/cancel.gif','picture')}" alt="{__('cancel')}"/>{__('cancel')|capitalize}</a>
</div>
<style> .ui-dialog { font-size: 62.5%; }</style> 
{component name="/languages/dialogListLanguagesFrontend" selected=(string)$formFilter.lang site=$block->getSite()} 
<img class="PageI18n" id="{$formFilter.lang}" name="lang" src="{url("/flags/`$formFilter.lang`.png","picture")}" title="{format_country($formFilter.lang)}" />
<a id="ChangeLang" href="#" title="{__('change')}"><img  src="{url('/icons/edit.gif','picture')}" alt='{__("language")}'/></a> 
{if $block->isLoaded()}  
    {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter}
    <button id="filter">{__("filter")|capitalize}</button><button id="init">{__("init")|capitalize}</button>
    <table id="selectListFilterMultiplePageI18n" cellpadding="0" cellspacing="0">
        <tr>
           <th>#</th>      
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
        </tr>
        <tr>
            <td>{* # *}</td>      
            <td>{* id *}<input class="search" type="text" size="5" name="id" value="{$formFilter.search.id|escape}"></td>          
            <td>{* url *}<input class="search" type="text" size="5" name="url" value="{$formFilter.search.url|escape}"></td>                           
        </tr>  
        {foreach $pager as $item}
        <tr class="selectFilterMultiplePageI18n{if in_array($item->getCmsPage()->get('id'),(array)$formFilter.selected->getValue())} selected{/if}" id="{$item->getCmsPage()->get('id')}">
            <td class="selectFilterMultiplePageI18n-count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>      
            <td>{* id *}
               {$item->getCmsPage()->get('id')}
            </td>  
            <td>{* name *}
                {$item->getCmsPage()->get('name')}
            </td>            
            <td>{* url *}
                {if $item->hasCmsI18nPage()}{$item->getCmsI18nPage()->getURL()}{else}{__('--- not defined ---')}{/if}
            </td>               
        </tr>
        {/foreach}    
    </table>   
    {if !$pager->getNbItems()}  
       <span>{__("no result")}</span>
    {/if}    
    {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager}
{else}
    <span>{__('block is invalid.')}</span>
{/if}    
<script type="text/javascript">
                    
    $("#selectListFilterMultiplePageI18n").data("selected",{$formFilter.selected->JSON()});        
    
    $(".selectFilterMultiplePageI18n").click(function () {             
            var selected=$("#selectListFilterMultiplePageI18n").data("selected");
            $(this).toggleClass('selected');
            if ($(this).hasClass('selected'))
               selected.push($(this).attr("id"));   
            else
               selected.splice($.inArray($(this).attr("id"),selected),1);                         
            $("#selectListFilterMultiplePageI18n").data("selected",selected);       
            $("#selectListFilterMultiplePageI18n").trigger('change');
            $("#Save").show();  
    });
    
    {* PAGER *}
    function getSelectListFilterMultipleProductsFilterParameters()
    {
            var params={   
                      id: "{$block->get('id')}",
                      filter: {      lang: "{$formFilter.lang}",
                                     selected: $("#selectListFilterMultiplePageI18n").data("selected"),  
                                     order : { }, 
                                     equal : { },
                                     search: { },
                                     nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                     token:'{$formFilter->getCSRFToken()}'
                                  }};
            if ($(".order_active").attr("name"))
                 params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");
            $(".search").each(function() { params.filter.search[this.name] =this.value; });                               
            return params;                  
    }
    
    function updateSelectListFilterMultipleProductsFilter()
    {        
      $(".dialogs").dialog("destroy").remove();  
      return $.ajax2({ 
          data: getSelectListFilterMultipleProductsFilterParameters(), 
          url:"{url_to('cms_block_ajax',['action'=>'SelectListFilterMultiplePageI18n'])}",
          target: "#actions" });  
    }
    
    $('.order').click(function() {
            $(".order_active").attr('class','order');
            $(this).attr('class','order_active'); 
            return updateSelectListFilterMultipleProductsFilter();
    });
    
     $("#init").click(function() {     
           $(".dialogs").dialog("destroy").remove();  
           return $.ajax2({ 
               data : { id: "{$block->get('id')}", 
                        filter: { selected: $("#selectListFilterMultiplePageI18n").data("selected"),
                                  lang: "{$formFilter.lang}",token:'{$formFilter->getCSRFToken()}' }
                      },
               url:"{url_to('cms_block_ajax',['action'=>'SelectListFilterMultiplePageI18n'])}",
               target: "#actions"}); 
    }); 
    
    $(".search").keypress(function(event) {
        if (event.keyCode==13)
        {
          updateSelectListFilterMultipleProductsFilter();
        }     
    });  
    {* language *}
    $( "#ChangeLang").click(function() {
        $("#Save").show();       
        $("#dialogListLanguages").dialog("open");
    });  

    $("#dialogListLanguages").bind('select',function(event){                     
        $(".PageI18n[name=lang]").attr({
                              id: event.selected.id,           
                              src: '{url("/flags/","picture")}'+event.selected.id+'.png',
                              title: event.selected.lang
                              });   
        return $.ajax2({
                     data : { id: "{$block->get('id')}", 
                        filter: { selected: $("#selectListFilterMultiplePageI18n").data("selected"),
                                  lang: $(".PageI18n[name=lang]").attr('id'),token:'{$formFilter->getCSRFToken()}' }
                      },
                    url : "{url_to('cms_block_ajax',['action'=>'SelectListFilterMultiplePageI18n'])}",
                    target: "#actions"
                });                          
    }); 
    
    {*   ACTIONS  *}
    $("#Cancel").click(function () {      
             $(".dialogs").dialog("destroy").remove();  
             return $.ajax2({ data : { id: "{$block->get('id')}" },
                                url:"{url_to('cms_block_ajax',['action'=>'PagesListBlock'])}", 
                                target: "#actions" });  
    });
    
     $("#Save").click(function () {      
           $(".dialogs").dialog("destroy").remove();  
           return $.ajax2({ 
                        data : {    id: "{$block->get('id')}", 
                                    selectFilterMultiplePageI18n : { 
                                                selection: $("#selectListFilterMultiplePageI18n").data("selected"),
                                                lang: $(".PageI18n[name=lang]").attr('id'),
                                                token:'{mfForm::getToken('selectPageI18nForBlockForm')}'
                        }
                      },
               url:"{url_to('cms_block_ajax',['action'=>'SaveMultiplePageI18nBlock'])}",
               target: "#actions"}); 
    });
</script>