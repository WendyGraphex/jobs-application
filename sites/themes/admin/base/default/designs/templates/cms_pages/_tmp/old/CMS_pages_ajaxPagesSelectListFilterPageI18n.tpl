{messages class="errors-SelectListFilterPageI18n"}
{include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter class="SelectListFilterPageI18n"}
<button id="SelectListFilterPageI18n-filter">{__("filter")|capitalize}</button><button id="SelectListFilterPageI18n-init">{__("init")|capitalize}</button>
<table id="SelectListFilterPageI18n-Pager" cellpadding="0" cellspacing="0" style="border-collapse:collapse;"> 
    <tr>
        <th>#</th>
        <th>
            <span>{__('id')|capitalize}</span>             
            <div>
                <a href="#" class="SelectListFilterPageI18n-order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><img  src='{url("/icons/sort_asc`$formFilter.order.id->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                <a href="#" class="SelectListFilterPageI18n-order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><img  src='{url("/icons/sort_desc`$formFilter.order.id->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
            </div> 
         </th>
          <th><span>{__('name')|capitalize}</span>
             <div>
                <a href="#" class="SelectListFilterPageI18n-order{$formFilter.order.name->getValueExist('asc','_active')}" id="asc" name="name"><img  src='{url("/icons/sort_asc`$formFilter.order.name->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                <a href="#" class="SelectListFilterPageI18n-order{$formFilter.order.name->getValueExist('desc','_active')}" id="desc" name="name"><img  src='{url("/icons/sort_desc`$formFilter.order.name->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
            </div> 
         </th> 
         <th><span>{__('title')|capitalize}</span>
             <div>
                <a href="#" class="SelectListFilterPageI18n-order{$formFilter.order.meta_title->getValueExist('asc','_active')}" id="asc" name="meta_title"><img  src='{url("/icons/sort_asc`$formFilter.order.meta_title->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                <a href="#" class="SelectListFilterPageI18n-order{$formFilter.order.meta_title->getValueExist('desc','_active')}" id="desc" name="meta_title"><img  src='{url("/icons/sort_desc`$formFilter.order.meta_title->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
            </div> 
         </th>       
         <th><span>{__('active')|capitalize}</span></th>           
    </tr>
    <tr>
    </tr>  
    {foreach $pager as $item}
    <tr class="SelectListFilterPageI18n{if (string)$formFilter.selected==$item->getCmsI18nPage()->get('id')} selected{/if}" id="{$item->getCmsI18nPage()->get('id')}"> 
        <td class="SelectListFilterPageI18n-count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>        
        <td>
            <span>{$item->getCmsI18nPage()->get('id')}</span>
        </td>
        <td>
            <span>{$item->getCmsPage()->get('name')}</span>
        </td>   
         <td>
            <span>{$item->getCmsI18nPage()->get('meta_title')}</span>
        </td>       
        <td>
            <span>{__($item->getCmsI18nPage()->get('is_active'))}</span>
        </td>     
    </tr>    
    {/foreach}     
</table>
{if !$pager->getNbItems()}  
    {__("no result")}
{/if}    
{include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager class="SelectListFilterPageI18n"}
<script type="text/javascript">
    
       $("#SelectListFilterPageI18n").die('select'); 
        
       $("#SelectListFilterPageI18n").data('pager',[{foreach $pager as $item} { id:"{$item->getCmsI18nPage()->get('id')}", 
                                                                                meta_title: "{$item->getCmsI18nPage()->get('meta_title')}",
                                                                                name: "{$item->getCmsPage()->get('name')}",
                                                                                page_id:"{$item->getCmsPage()->get('id')}"},
                                                    {/foreach}]);   
        
       $("#SelectListFilterPageI18n").data('selected',"{(string)$formFilter.selected}");       
      
       function getSelectListFilterPageI18nFilterParameters()
       {
           var params={  
                         filter: {     
                                lang : "{$formFilter.lang}",
                                selected : $("#SelectListFilterPageI18n").data('selected'),                             
                                order: { },
                                search: { },
                                nbitemsbypage: $("[name=SelectListFilterPageI18n-nbitemsbypage]").val(),
                                token:'{$formFilter->getCSRFToken()}'
                                } 
                       };                                            
            if ($(".SelectListFilterPageI18n-order_active").attr("name"))
                    params.filter.order[$(".SelectListFilterPageI18n-order_active").attr("name")] =$(".SelectListFilterPageI18n-order_active").attr("id");
            $(".SelectListFilterPageI18n-search").each(function(id) { params.filter.search[this.name] =this.value; });                               
            return params;                  
       }
       
        function updateSelectListFilterPageI18nFilter()
        {
           return $.ajax2({ data: getSelectListFilterPageI18nFilterParameters(), 
                            url:"{url_to('cms_pages_ajax',['action'=>'SelectListFilterPageI18n'])}",                           
                            errorTarget:".errors-SelectListFilterPageI18n",                          
                            target: "#SelectListFilterPageI18n"
                });                                
        }
        
        function updateSelectListFilterProductsPager(n)
        {
           page_active=$(".SelectListFilterPageI18n-pager .active").html()?parseInt($(".SelectListFilterPageI18n-pager .active").html()):1;
           records_by_page=$(".SelectListFilterPageI18nPager[name=nbitemsbypage]").val();
           start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
           $(".SelectListFilterPageI18n-count").each(function(id) { $(this).html(start+id) }); // Update index column           
           nb_results=parseInt($("#SelectListFilterPageI18n-nb_results").html())-n;
           $("#SelectListFilterPageI18n-nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
           $("#SelectListFilterPageI18n-end_result").html($(".SelectListFilterPageI18n-count:last").html());
        }
        
        $("[name=SelectListFilterPageI18n-nbitemsbypage]").change(function() { return updateSelectListFilterPageI18nFilter(); }); 
        
        $('.SelectListFilterPageI18n-order').click(function() {
                $(".SelectListFilterPageI18n-order_active").attr('class','order');
                $(this).attr('class','SelectListFilterPageI18n-order_active');
                return updateSelectListFilterPageI18nFilter();
        });
        
        $("#SelectListFilterPageI18n-init").click(function() { 
            return $.ajax2({    data : { filter : { selected: $("#SelectListFilterPageI18n").data('selected'),lang : "{$formFilter.lang}",token:'{$formFilter->getCSRFToken()}' } },
                      url:"{url_to('cms_pages_ajax',['action'=>'SelectListFilterPageI18n'])}" ,
                      errorTarget:".errors-SelectListFilterPageI18n",                          
                      target: "#SelectListFilterPageI18n"
                 }); 
        });    
       
        $("#SelectListFilterPageI18n-filter").click(function() { return updateSelectListFilterPageI18nFilter(); });
        
        $(".SelectListFilterPageI18n-pager").click(function () {
                return $.ajax2({ data: getSelectListFilterPageI18nFilterParameters(), 
                                 errorTarget:".errors-SelectListFilterPageI18n",                                
                                 url:"{url_to('cms_pages_ajax',['action'=>'SelectListFilterPageI18n'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length),
                                 target: "#SelectListFilterPageI18n"
                     });
        });
        
        $(".SelectListFilterPageI18n").click(function () { 
            $(".SelectListFilterPageI18n").removeClass('selected');
            $(this).addClass('selected');
            $("#SelectListFilterPageI18n").data('selected',$(this).attr('id'));
            index=$(".SelectListFilterPageI18n.selected").index()-2;  {* 2 : number of <tr> before *}            
            $("#SelectListFilterPageI18n").data('object',$("#SelectListFilterPageI18n").data('pager')[index]);           
            $("#SelectListFilterPageI18n").trigger({ type:'select',  
                                    selected: $("#SelectListFilterPageI18n").data('selected'),
                                    object : $("#SelectListFilterPageI18n").data('object')
            });
        });
        

</script>