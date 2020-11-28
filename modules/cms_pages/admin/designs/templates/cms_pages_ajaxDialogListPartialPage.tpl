{alerts}
<div style="width: 100%; background-color: white; display: inline-block; padding: 5px;">   
    {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter class="dialog"}

    <button style="float: right; background-color: #c8c8c8; border-radius: 0;" id="dialog-filter" class="btn btn-default">{__("filter")|capitalize}</button>   
    <button style="float: right; margin-right: 10px; background-color: #c8c8c8; border-radius: 0;" id="dialog-init" class="btn btn-default">{__("init")|capitalize}</button>

    <table id="DialogPage" class="table table-bordered table-hover table-striped" cellpadding="0" cellspacing="0"> 
        <thead class="bgSpec">
            <tr role="row">
                <th class="footable-first-column" data-toggle="true">#</th> 
                                   
            <th>{__('Title/Name/Url')}
            </th>            
            
        </thead>
        </tr>
        <tbody>
          <tr role="row">
            <td></td>
                    
            <td><input style="height: 31px;" class="dialog-search form-control" type="text" size="5" name="meta_title" value="{$formFilter.search.meta_title}"></td>       
            
        </tr>       
        {foreach $pager as $item}
        <tr class="dialog-list" id="{$item->get('id')}" {if $item->get('id') == $formFilter->getSelected()}Selected{/if}>
            <td class="dialog-pages-count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>
           
                                    
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
            
        </tr>
        {/foreach}

    </table>
            {*<div style="text-align: center;">
                <button class="btn btn-primary" style="width: 120px;">{__('Select')}</button>
            </div>*}
    {if !$pager->getNbItems()}  
        {__("no result")}
    {/if}        
    {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager class="dialog"}
</div>
<script type="text/javascript">
     $("#DialogPage").data('selected',{$formFilter->getSelected()});   
    
    function getDialogFilterParameters()
    {
        var params={ filter: {  order : { }, 
                                search: { },                             
                                equal : {  },
                                range : { },   
                                selected:  $("#DialogPage").data('selected'),
                                nbitemsbypage: $("[name=dialog-nbitemsbypage]").val(),
                                lang: $("#SelectListLanguages option:selected").attr('id'), 
                                token:'{$formFilter->getCSRFToken()}'
                    }};
        params.filter.order[$(".dialog-order_active").attr("name")] =$(".dialog-order_active").attr("id");
        $(".dialog-search").each(function() { params.filter.search[this.name] =this.value; });        
        return params;                  
    }

    function updateDialogFilter()
    {          
       return $.ajax2({ data: getFilterParameters(), url:"{url_to('cms_pages_ajax',['action'=>'DialogListPartialPage'])}" ,   target: "#CmsPageListDialog-ctn" });
    }

    function updateDialogPager(n)
    {
       var page_active=$(".pager .active").html()?parseInt($(".pager .active").html()):1;
       var records_by_page=$("[name=nbitemsbypage]").val();
       var start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
       $(".pages-count").each(function(id) { $(this).html(start+id) }); // Update index column           
       var nb_results=parseInt($("#nb_results").html())-n;
       $("#nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
       $("#end_result").html($(".pages-count:last").html());
    }
    
        function updateDialogFilter()
        {          
           return $.ajax2({ data: getDialogFilterParameters(), 
                            url:"{url_to('cms_pages_ajax',['action'=>'DialogListPartialPage'])}" , 
                              target: "#CmsPageListDialog-ctn",
                             });
        }
    
        
    $('.dialog-order').click(function() {
                    $(".dialog-order_active").attr('class','dialog-order');
                    $(this).attr('class','dialog-order_active'); 
                    return updateDialogFilter();
    });
            
    $("[name=dialog-nbitemsbypage]").change(function() { return updateDialogFilter(); });                                                   
    
    $(".dialog-search").keypress(function(event) {
        if (event.keyCode!=13) return ;        
        updateDialogFilter();     
    });      
    
    $("#dialog-filter").click(function() { return updateDialogFilter(); }); 
            
    $("#dialog-init").click(function() {           
        return $.ajax2({ url:"{url_to('cms_pages_ajax',['action'=>'DialogListPartialPage'])}",  target: "#CmsPageListDialog-ctn"}); 
    }); 

    $(".dialog-pager").click(function () {           
        return $.ajax2({ data: getDialogFilterParameters(), url:"{url_to('cms_pages_ajax',['action'=>'DialogListPartialPage'])}?page="+$(this).attr('data-page'),  target: "#CmsPageListDialog-ctn" });
    });
    
      $(".dialog-list").click(function() { 
             $("#DialogPage").data('selected',$(this).attr('id'));
             $(".dialog-list").removeClass('Selected');
             $(this).addClass('Selected');
        });
</script>
