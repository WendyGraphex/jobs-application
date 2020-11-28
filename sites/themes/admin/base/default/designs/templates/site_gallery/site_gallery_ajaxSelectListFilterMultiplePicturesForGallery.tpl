{messages}
<h3>{__("Add pictures for gallery")}</h3>
 <img id="{$gallery_i18n->get('lang')}" name="lang" src="{url("/flags/`$gallery_i18n->get('lang')`.png","picture")}" title="{format_country($gallery_i18n->get('lang'))}" />
<div>   
    <a id="AddSelection" class="btn btn-primary" href="#" {if !$formFilter.selected->getValue()}style="display:none"{/if}><i class="fa fa-plus" style=" margin-right: 10px;"></i>{__('Save selection')}</a>
    <a href="#" id="Cancel" class="btn btn-primary"><i class="fa fa-reply" style=" margin-right: 10px;"></i>
        {__('Cancel')}</a> 
</div>
{include file="./_pagers/default/_default_pager_top.tpl" pager=$pager formfilter=$formFilter}
<button id="filter" class="btn btn-default">{__("Filter")}</button>   
<button class="btn btn-default" id="init">{__("Init")}</button>

<table class='table-bordered table-hover table-striped footable table' cellpadding="0" cellspacing="0"> 
 <tr>
         <th>#</th>
         {if $pager->getNbItems()>5}<th>&nbsp;</th>{/if}         
         <th>
             <span>{__('id')}</span>
             <div>
                 <a href="#" class="order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><img  src='{url("/icons/sort_asc`$formFilter.order.id->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                 <a href="#" class="order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><img  src='{url("/icons/sort_desc`$formFilter.order.id->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
             </div> 
         </th>       
         <th>
             <span>{__('Name')}</span>
             <div>
                 <a href="#" class="order{$formFilter.order.name->getValueExist('asc','_active')}" id="asc" name="name"><img  src='{url("/icons/sort_asc`$formFilter.order.name->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                 <a href="#" class="order{$formFilter.order.name->getValueExist('desc','_active')}" id="desc" name="name"><img  src='{url("/icons/sort_desc`$formFilter.order.name->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
             </div> 
         </th>
         <th>
             <span>{__('Title')}</span>
             <div>
                 <a href="#" class="order{$formFilter.order.title->getValueExist('asc','_active')}" id="asc" name="title"><img  src='{url("/icons/sort_asc`$formFilter.order.title->getValueExist("asc","_h")`.gif","picture")}' alt="{__('order_asc')}"/></a>
                 <a href="#" class="order{$formFilter.order.title->getValueExist('desc','_active')}" id="desc" name="title"><img  src='{url("/icons/sort_desc`$formFilter.order.title->getValueExist("desc","_h")`.gif","picture")}' alt="{__('order_desc')}"/></a>
             </div> 
         </th>        
         <th>
             <span>{__('Start')}</span>
         </th>
         <th>
             <span>{__('Expired')}</span>
         </th>          
 </tr>    
 <tr>
        <td></td>
        {if $pager->getNbItems()>5}<td></td>{/if}
        <td>{* id *}
            <input class="search form-control" type="text" size="5" name="id" value="{$formFilter.search.id}">
        </td>
        <td>{* name *}
        </td>
        <td>{* title *}
           {* {html_options_format class="equal" name="lang" options=$formFilter->equal.lang->getOption('choices') selected=(string)$formFilter.equal.lang} *}
        </td>       
        <td>{* start *}
            <table cellpadding="0" cellspacing="0">
                <tr>
               
                    <td><input class="range form-control" placeholder="{__('from')}" id="start_at_from" type="text" size="7" name="start_at[from]" value="{format_date((string)$formFilter.range.start_at.from|default:'','a')}"/> 
                        <input  class="range form-control" placeholder="{__('to')}" id="start_at_to" type="text" size="7" name="start_at[to]" value="{format_date((string)$formFilter.range.start_at.to|default:'','a')}"/></td>
                </tr>
            </table>       
       </td>
       <td>{* expired *}
            <table cellpadding="0" cellspacing="0">
                <tr>
                   
                    <td><input placeholder="{__('from')}" class="range form-control" id="expired_at_from" type="text" size="7" name="expired_at[from]" value="{format_date((string)$formFilter.range.expired_at.from|default:'','a')}"/> 
                   <input  class="range form-control" placeholder="{__('to')}" id="expired_at_to" type="text" size="7" name="expired_at[to]" value="{format_date((string)$formFilter.range.expired_at.to|default:'','a')}"/></td>
                <tr>
            </table>       
       </td>            
 </tr>       
 </table>
 <div id="pager">        
 {foreach $pager as $item}   
      <div class="col-md-3"> 
          <div id="{$item->getSitePicture()->get('id')}" class="Img_Gallery Img_GallerySelect {if in_array($item->getSitePicture()->get('id'),(array)$formFilter.selected->getValue())}selected{/if}">
         <div id="{$item->getSitePicture()->get('id')}" class="pictures" {if $item->getSitePicture()->get("is_active")=="NO"}style="opacity:0.5"{/if}> 
            
                 <div class="picture">
                  {if $item->hasSitePictureI18n()}<img height="64px" width="64px" src="{$item->getSitePictureI18n()->picture()->getURL()}" alt="{$item->getSitePictureI18n()->get('title')|escape}"/>{else}{__('no picture')}{/if} 
                </div>              
                <div class="ImgGalleryInfo">
                    <div> <span>{$item->getSitePicture()->get('name')|escape}</span>     
                    </div>  
                    {if $item->hasSitePictureI18n()}<span>{$item->getSitePictureI18n()->get('title')|escape}</span>{else}{__('--- not defined ---')}{/if}     
               
                     <span title="{$item->getSitePicture()->get('start_at')}" name="start_at">{format_date($item->getSitePicture()->get('start_at'),"a")}</span>    
                </div>
                <div>
                     <span title="{$item->getSitePicture()->get('expired_at')}" name="expired_at">{format_date($item->getSitePicture()->get('expired_at'),"a")}</span>    
                </div>
              
         </div>  
 </div>
</div>  
     {/foreach}         
</div>
 {if !$pager->getNbItems()}  
     {__("no result")}
 {/if}    
 {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager}        
<script type="text/javascript">  
        
        function getPicturesFilterParameters()
        {
            var params={    SiteGalleryI18n : { id : "{$gallery_i18n->get('id')}" },
                        filter: {  order : { },    
                                selected: $("#pager").data("selected"), 
                                nbitemsbypage: $("[name=nbitemsbypage]").val(),
                                token:'{$formFilter->getCSRFToken()}'
                         } };
            if ($(".order_active").attr("name"))
                 params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");                                   
            return params;                  
        }
        
        function updatePicturesFilter()
        {        
           return $.ajax2({ data: getPicturesFilterParameters(), 
                            url:"{url_to('site_gallery_ajax',['action'=>'SelectListFilterMultiplePicturesForGallery'])}",                           
                            target: "#actions" });
        }
    
        function updatePicturesPager(n)
        {
           page_active=$(".pager .active").html()?parseInt($(".pager .active").html()):1;
           records_by_page=$("[name=nbitemsbypage]").val();
           start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
           $(".count").each(function(id) { $(this).html(start+id) }); // Update index column           
           nb_results=parseInt($("#nb_results").html())-n;
           $("#nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
           $("#ProductCategory-end_result").html($(".count:last").html());
        }
        
        $('.order').click(function() {
            $(".order_active").attr('class','order');
            $(this).attr('class','order_active');
            return updatePicturesFilter();
        });
    
        $("[name=nbitemsbypage]").change(function() { return updatePicturesFilter(); }); 
     
        $("#filter").click(function() { return updatePicturesFilter(); }); 

        $(".pager").click(function () {                   
               return $.ajax2({ data: getPicturesFilterParameters(), 
                                url:"{url_to('site_gallery_ajax',['action'=>'SelectListFilterMultiplePicturesForGallery'])}?"+this.href.substring(this.href.indexOf("?")+1, this.href.length),
                                errorTarget: ".ProductCategory-errors",
                                target: "#actions" });
        });
    
        $("#init").click(function() {           
               return     $.ajax2({ data : { SiteGalleryI18n : { id : "{$gallery_i18n->get('id')}" },
                                       filter: { selected: $("#pager").data("selected"), order: { },token:'{$formFilter->getCSRFToken()}' }
                                     },                                
                              url:"{url_to('site_gallery_ajax',['action'=>'SelectListFilterMultiplePicturesForGallery'])}" , 
                              target: "#actions"}); 
         }); 
    
        $("#pager").data("selected",{$formFilter.selected->JSON()});
        
        {* === A C T I O N S  ==== *}
        $('#Cancel').click(function() {                           
           return $.ajax2({ data : { SiteGalleryI18n : { 
                                                gallery_id: "{$gallery_i18n->get('gallery_id')}",
                                                lang: "{$gallery_i18n->get('lang')}"                                               
                                    } },
                                url: "{url_to('site_gallery_ajax',['action'=>'ViewGalleryI18nPictures'])}",target: "#actions"}); 
        });                       

        $("#AddSelection").click(function() {
                  return     $.ajax2({ data : { SiteGalleryI18n : { gallery_id : "{$gallery_i18n->get('gallery_id')}", lang: "{$gallery_i18n->get('lang')}" },
                                          SitePictures: { selection : $("#pager").data("selected"),token :"{mfForm::getToken('SitePicturesSelectionForm')}" }
                                        },                              
                                url:"{url_to('site_gallery_ajax',['action'=>'SavePictureSelectionForGallery'])}" , 
                                target: "#actions"}); 
        });   
        
        {* ========================== F I E L D S =================================================== *}
        $(".Img_GallerySelect").click(function () {             
            var selected=$("#pager").data("selected");
            $(this).toggleClass('selected');
            if ($(this).hasClass('selected'))
               selected.push($(this).attr("id"));   
            else
               selected.splice($.inArray($(this).attr("id"),selected),1);     
            if (selected.length)
                
                $("#AddSelection").show();
            else
                $("#AddSelection").hide();
            $("#pager").data("selected",selected);          
    });
</script>       
    
    