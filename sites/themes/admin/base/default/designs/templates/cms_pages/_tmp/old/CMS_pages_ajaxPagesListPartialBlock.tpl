{messages class="errors"}
{if $block->isLoaded()}
    <h3>{__('block')}: {$block->get('name')}</h3>
    <div>
            <a id="New" href="#"><img  src="{url('/icons/add.gif','picture')}" alt="{__('new')}"/>{__('add pages')|capitalize}</a>
            <a id="Positions" href="#"><img  src="{url('/icons/ordered-list.png','picture')}" alt="{__('position')}"/>{__('page position')|capitalize}</a>
            <a href="#" id="Cancel"><img  src="{url('/icons/cancel.gif','picture')}" alt="{__('cancel')}"/>{__('cancel')|capitalize}</a>
    </div>
    {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter}
    <button id="filter">{__("filter")|capitalize}</button><button id="init">{__("init")|capitalize}</button>
    <div>       
        <img class="PageI18n" id="{$formFilter.lang}" name="lang" src="{url("/flags/`$formFilter.lang|default:"__"`.png","picture")}" title="{if $formFilter.lang->hasError()}{$formFilter.lang}{else}{format_country($formFilter.lang)}{/if}" />
        <style>.ui-dialog { font-size: 62.5%; }</style> 
        <a id="ChangeLang" href="#" title="{__('change')}"><img  src="{url('/icons/edit.gif','picture')}" alt='{__("language")}'/></a>
        {component name="/languages/dialogListLanguagesFrontend" selected=$formFilter.lang site=$formFilter->getSite()}    
    </div>
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
             <th>{__('position')}
                   <div>
                  <a href="#" class="order{$formFilter.order.position->getValueExist('asc','_active')}" id="asc" name="position"><img  src='{url("/icons/sort_asc`$formFilter.order.position->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                  <a href="#" class="order{$formFilter.order.position->getValueExist('desc','_active')}" id="desc" name="position"><img  src='{url("/icons/sort_desc`$formFilter.order.position->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a> 
                 </div> 
             </th>
             <th>{__('name')}                
             </th>
             <th>{__('url')}
                   <div>
                  <a href="#" class="order{$formFilter.order.url->getValueExist('asc','_active')}" id="asc" name="url"><img  src='{url("/icons/sort_asc`$formFilter.order.url->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                  <a href="#" class="order{$formFilter.order.url->getValueExist('desc','_active')}" id="desc" name="url"><img  src='{url("/icons/sort_desc`$formFilter.order.url->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a> 
                 </div> 
             </th>
             <th>{__('is active')}
             </th>
             <th>{__('actions')}</th>
         </tr>
         <tr>
            <td>{* # *}</td>
            {if $pager->getNbItems()>5}<td>{* nb *}</td>{/if}
            <td>{* id *}<input class="equal" type="text" size="5" name="id" value="{$formFilter.equal.id|escape}"></td>
            <td>{* position *}<input class="equal" type="text" size="5" name="position" value="{$formFilter.equal.position|escape}"></td>
            <td>{* name *}</td>
            <td>{* url *}<input class="search" type="text" size="5" name="url" value="{$formFilter.search.url|escape}"></td>
            <td>{* is_active *}</td>
            <td>{* actions *}</td>               
         </tr>       
            {foreach $pager as $item}
            <tr class="blockPageI18n" id="blockPageI18n-{$item->getCmsBlockPage()->get('id')}">
                <td class="blockPageI18n-count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>
                {if $pager->getNbItems()>5}<td><input class="selection" type="checkbox" name="{$item->getCmsBlockPage()->get('id')}" /></td>{/if}
                <td>{* id *}
                    {$item->getCmsBlockPage()->get('id')}
                </td>
                <td>{* position *}
                    {$item->getCmsBlockPage()->get('position')}
                </td>
                <td>{* name *}
                   {$item->getCmsPage()->get('name')}
                </td>
                <td>{* url *}
                    {if $item->hasCmsI18nPage()}{$item->getCmsI18nPage()->getURL()}{else}{__('--- not defined ---')}{/if}
                </td>  
                <td>{* is_active *}                    
                       <a href="#" title="{__('change')}" class="Change" id="{$item->getCmsBlockPage()->get('id')}" name="{$item->getCmsBlockPage()->get('is_active')}">
                           <img  src="{url('/icons/','picture')}{$item->getCmsBlockPage()->get('is_active')}.gif" alt='{__($item->getCmsBlockPage()->get('is_active'))}'/>
                       </a>
                </td>
                <td>{* actions *}
                   <a href="#" title="{__('delete')}" class="Delete" id="{$item->getCmsBlockPage()->get('id')}" name="{if $item->hasCmsI18nPage()}{$item->getCmsI18nPage()->getURL()}{else}{__('--- not defined ---')}{/if}">
                       <img  src="{url('/icons/delete.gif','picture')}" alt='{__("delete")}'/>
                   </a>
                </td>
            </tr>
            {/foreach} 
            {if $pager->getNbItems()>5}
            <tr>
                <td>{* # *}
                </td>
                <td>{* n *}
                    <input type="checkbox" id="all" />                    
                </td>
                <td>
                    <a href="#" title="{__('enable')}" id="Enabled" style="opacity:0.5" class="actions_items"><img  src="{url('/icons/YES.gif','picture')}" alt='{__("yes")}'/>
                    <a href="#" title="{__('disable')}" id="Disabled" style="opacity:0.5" class="actions_items"><img  src="{url('/icons/NO.gif','picture')}" alt='{__("no")}'/></a>
                    <a href="#" title="{__('delete')}" id="Delete"><img  src="{url('/icons/delete.gif','picture')}" alt='{__("delete")}'/></a>                    
                </td>
            </tr>
            {/if}
    </table>
    {if !$pager->getNbItems()}  
         {__("no result")}         
    {/if}    
    {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager}
{else}
   <span>{__("block doesn't exists.")}</span>
{/if}
<script type="text/javascript">
           
        function changeIsActivePageBlockState(resp) 
         {
            $.each(resp.selection?resp.selection:[resp.id], function (id) { 
                 sel="a.Change#"+this;
                 if (resp.state=='YES'||resp.state=='NO') 
                 {    
                     $(sel+" img").attr({
                         src :"{url('/icons/','picture')}"+resp.state+".gif",
                         alt : (resp.state=='YES'?'{__("YES")}':'{__("NO")}'),
                         title : (resp.state=='YES'?'{__("YES")}':'{__("NO")}')
                     });
                     $(sel).attr("name",resp.state);
                 }
             });  
         }
            
        function getBlockPageI18NFilterParameters()
        {
            var params={    id: "{$block->get('id')}",
                            filter: {      
                                lang: $("img.PageI18n[name=lang]").attr('id'),     
                                order : { }, 
                                search: { },
                                equal: { }, 
                                nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                token:'{$formFilter->getCSRFToken()}'
                             }};
            params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");
            $(".equal").each(function() { params.filter.equal[this.name] =this.value; });                               
            $(".search").each(function() { params.filter.search[this.name] =this.value; });                               
            return params;                  
        }
        
        function updateBlockPageI18NFilter()
        {
           $(".dialogs").dialog("destroy").remove();           
           return $.ajax2({ data: getBlockPageI18NFilterParameters(), 
                            url:"{url_to('cms_block_ajax',['action'=>'PagesListBlock'])}", 
                            target: "#actions" });
        }
        
        function updatePager(n)
        {
           page_active=$(".pager .active").html()?parseInt($(".pager .active").html()):1;
           records_by_page=$("[name=nbitemsbypage]").val();
           start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
           $(".blockPageI18n-count").each(function(id) { $(this).html(start+id) }); // Update index column           
           nb_results=parseInt($("#nb_results").html())-n;
           $("#nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
           $("#end_result").html($(".blockPageI18n-count:last").html());
        }
        
         // {* PAGER - begin *}
          $('.order').click(function() {
             $(".order_active").attr('class','order');
             $(this).attr('class','order_active');
             return updateBlockPageI18NFilter();
          });
                   
          $("[name=nbitemsbypage]").change(function() { return updateBlockPageI18NFilter(); }); 
          
          $(".search,.equal").keypress(function(event) {
                if (event.keyCode==13)
                {
                    return updateBlockPageI18NFilter();
                }     
          });
                   
          $("#filter").click(function() { return updateBlockPageI18NFilter(); }); 
          
          $("#init").click(function() {  
                return $.ajax2({ data : { id: "{$block->get('id')}" },
                                 url:"{url_to('cms_block_ajax',['action'=>'PagesListBlock'])}", 
                                 target: "#actions" });  
          }); 
          
          $(".pager").click(function () {
             return $.ajax2({ data: getBlockPageI18NFilterParameters(), 
                              url:"{url_to('cms_block_ajax',['action'=>'PagesListBlock'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length) , 
                              target: "#middle" });
          });
          
          $("#all").click(function () {  $(".selection").attr("checked",($(this).attr("checked")=="checked"));  });
          // {* PAGER - end *}         
           
          // {* ACTIONS - begin *}          
          $("#Delete").click( function () { 
             var params={ selection : {  } };
             text="";
             $(".selection:checked").each(function (id) { 
                params.selection[id]=this.name;
                text+=this.id+",\n";
             });
             if ($.isEmptyObject(params.selection))
                return ;
             if (!confirm("{__('pages :\u000A\u000A\"#0#\"\u000A\u000A will be deleted. Confirm ?')}".format(text.substring(0,text.lastIndexOf(","))))) 
                 return false; 
             return $.ajax2({ 
                     data: params,
                     url : "{url_to('cms_block_ajax',['action'=>'DeletesPageBlock'])}",
                     success: function(resp) {
                            if (resp.action=='deletesPageBlock')
                            {   
                                if ($(".blockPageI18n").length-resp.parameters.length==0)
                                {    
                                  return $.ajax2({  data : { id: "{$block->get('id')}" },
                                                    url:"{url_to('cms_block_ajax',['action'=>'PagesListPartialBlock'])}", 
                                                    target: "#actions" });  
                                }    
                                $.each(resp.parameters, function () {  $("tr#blockPageI18n-"+this).remove(); });
                                updatePager(resp.parameters.length); 
                                $("input#all").attr("checked",false);                                    
                            }       
                         }
             });
          });
          
          $(".Delete").click( function () { 
               if (!confirm('{__("page \"#0#\" will be deleted. Confirm ?")}'.format(this.name))) return false; 
               return $.ajax2({
                    data: { BlockPage: this.id },
                    url : "{url_to('cms_block_ajax',['action'=>'DeletePageBlock'])}",
                    success: function(resp) {
                            if (resp.action=='deleteCmsBlockPage')
                            {    
                                if ($(".blockPageI18n").length-1==0)
                                {    
                                   return $.ajax2({  data : { id: "{$block->get('id')}" },
                                                     url:"{url_to('cms_block_ajax',['action'=>'PagesListPartialBlock'])}", 
                                                     target: "#actions" });  
                                }      
                                $("tr#blockPageI18n-"+resp.id).remove(); 
                                updatePager(1);
                            }
                        }
               });
          }); 
                               
          $("#Positions").click( function () { 
               return $.ajax2({
                    data: { cmsPageI18nBlock : { id: "{$block->get('id')}",lang : $(".PageI18n[name=lang]").attr('id'), token:"{mfForm::getToken('cmsPageI18nBlockForm')}" } },
                    url: "{url_to('cms_block_ajax',['action'=>'PositionPagesBlock'])}",
                    target: "#actions"
               });
          });   
          
          $("#New").click( function () { 
               return $.ajax2({
                    data: { AddPagesBlock : { block: "{$block->get('id')}",lang: $(".PageI18n[name=lang]").attr('id'),token:"{mfForm::getToken('cmsBlockAndLanguageForm')}" } },
                    url: "{url_to('cms_block_ajax',['action'=>'AddPagesBlock'])}",
                    target: "#actions"
               });
          });   
          
          $("#Cancel").click(function () {
              $(".dialogs").dialog("destroy").remove();              
              return $.ajax2({ url :"{url_to('cms_block_ajax',['action'=>'ListBlock'])}", target: "#middle" });  
          });
          
          $("#ChangeLang").click(function() {      
                $("#dialogListLanguages").dialog("open");
          }); 
     
          $("#dialogListLanguages").bind('select',function(event){                
               $(".PageI18n[name=lang]").attr({                           
                                     id: event.selected.id,
                                     src: '{url("/flags/","picture")}'+event.selected.id+'.png',
                                     title: event.selected.lang
                                     });
              $("#ChangeLang").show();
              updateBlockPageI18NFilter();
          });   
          
          $(".Change").click( function () {                    
                    return $.ajax2({ data: { cmspageblock : { id: this.id, value: this.name, token: '{mfForm::getToken("ChangeForm")}' } },
                                     url: "{url_to('cms_block_ajax',['action'=>'ChangeIsActivePageBlock'])}",
                                     success: function(resp) { 
                                                 if (resp.action=='ChangeIsActivePageBlock')
                                                    changeIsActivePageBlockState(resp);
                                              }
                         });
          });  
</script>
       