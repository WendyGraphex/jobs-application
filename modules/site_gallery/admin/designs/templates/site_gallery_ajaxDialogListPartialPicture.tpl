{alerts}
<div style="width: 100%; background-color: white; display: inline-block; padding: 5px;">   
       <div>                    
                {*component name="/site_languages/selectListLanguagesFrontend" selected=$formFilter.lang*}
                {component name="/site_languages/selectListLanguagesFrontend" selected=$formFilter.lang}
             </div>
    {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter class="dialog"}

    <button style="float: right; background-color: #c8c8c8; border-radius: 0;" id="dialog-filter" class="btn btn-default">{__("Filter")}</button>   
    <button style="float: right; margin-right: 10px; background-color: #c8c8c8; border-radius: 0;" id="dialog-init" class="btn btn-default">{__("Init")}</button>
    <div style="position: relative;">
        <input style="height: 31px;" class="dialog-search form-control" type="text" size="5" name="title" placeholder="{__('Search')}" value="{$formFilter.search.title}"/>
        <i class="fa fa-search" style="position: absolute;right: 6px;top: 22px;color: #7b7b7b;" aria-hidden="true"></i>
    </div>
    <div style="text-align: right;padding: 5px;">
        <a href="#" class="list-action Mode" name="NORMAL"><i class="ModeIcon Normal far fa-square" style="color: rgb(164, 164, 164);"></i></a>
    </div>   
    <div id="DialogPictures" class="row Picturetable-admin" style="width: 100%;margin: 0 auto;margin-top: 30px;">
        {foreach $pager as $item}
            <div class="col-md-4" style="margin-bottom: 25px;">
                <div class="dialog-list {if $formFilter->getSelection()->in($item->get('id'))}Selected{/if}" id="{$item->get('id')}" style="padding: 10px;">            
                    <div style="width: 100%;">                       
                        <img src="{$item->getPictureManager()->getURL()}" style="width: 100%; height: 200px;" alt="{if $item->hasI18n()}{$item->getI18n()->get('title')|escape}{else}{__('--- not defined ---')}{/if}"/>
                        <div style="width: 100%; height: 40px; line-height: 40px; text-align: center; font-weight: 300; font-size: 1.2em;">
                            {if $item->hasI18n()}<span>{$item->getI18n()->get('title')|escape}</span>{elseif $item->get('name')}{$item->get('name')}{else}{__('--- not defined ---')}{/if}     
                        </div>
                    </div>               
                </div>
            </div>
        {/foreach}
    </div>
    {if !$pager->getNbItems()}  
        {__("no result")}
    {/if}        
    {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager class="dialog"}
</div>
<script type="text/javascript">
    
    $(".Mode").click(function () {
        if ($(this).attr('name')=='NORMAL')
        {
            $(this).attr('name','INVERSE');
            $(".ModeIcon").removeClass('Normal far fa-square').addClass('Inverse fa fa-square-full');
            $(".Picturetable-admin").css('background-color','rgb(164, 164, 164)');
        }
        else
        {
            $(this).attr('name','NORMAL');
            $(".ModeIcon").removeClass('Inverse fa fa-square-full').addClass('Normal far fa-square');
            $(".Picturetable-admin").css('background-color','');
        }
    });
    
    $("#DialogPictures").data('selection',{$formFilter->getSelection()->toJson()});   
    
    function getDialogFilterParameters()
    {
        var params={ filter: {  order : { }, 
                                search: { },                             
                                equal : { },
                                range : { },   
                                selection:  $("#DialogPictures").data('selection'),
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
       return $.ajax2({ data: getFilterParameters(), url:"{url_to('site_gallery_ajax',['action'=>'DialogListPartialPicture'])}" ,   target: "#SitePictureListDialog-ctn" });
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
                            url:"{url_to('site_gallery_ajax',['action'=>'DialogListPartialPicture'])}" , 
                              target: "#SitePictureListDialog-ctn",
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
        return $.ajax2({ data : { filter: {  order : { }, search: { }, equal : {  }, range : { },   
                                selection:  $("#DialogPictures").data('selection'),
                                nbitemsbypage: $("[name=dialog-nbitemsbypage]").val(),
                                lang: $("#SelectListLanguages option:selected").attr('id'), 
                                token:'{$formFilter->getCSRFToken()}' } }, url:"{url_to('site_gallery_ajax',['action'=>'DialogListPartialPicture'])}",  target: "#SitePictureListDialog-ctn"}); 
    }); 

    $(".dialog-pager").click(function () {           
        return $.ajax2({ data: getDialogFilterParameters(), url:"{url_to('site_gallery_ajax',['action'=>'DialogListPartialPicture'])}?page="+$(this).attr('data-page'),  target: "#SitePictureListDialog-ctn" });
    });
    
      $(".dialog-list").click(function () {
           $(this).toggleClass("Selected");        
           if ($(this).hasClass("Selected"))                                                  
            $("#DialogPictures").data("selection").push(parseInt($(this).attr("id")));                                 
           else              
            $("#DialogPictures").data("selection").splice($.inArray(parseInt($(this).attr("id")),$("#DialogPictures").data("selection")),1);                                                                    
        }); 
</script>
