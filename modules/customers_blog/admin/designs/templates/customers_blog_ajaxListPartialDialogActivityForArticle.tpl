{alerts}          
<div class="NewClassAtTable bg-white px-2 py-2">   
    <div class="row">
        {component name="/customers_blog/path"}   
    </div> 
    <div class="col-md-12  padd-col">

        <div class="float-left w-50">
            {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager class="dialog-pager"}  
        </div>
        <div class="float-right w-50">                   
            <button  style="float: right;" id="dialog-filter" class="btn btn-secondary btn-f" >{__("Filter")}</button>   
            <button  style="float: right;margin-right: 10px;" id="dialog-init" class="btn btn-secondary btn-init btn-f">{__("Init")}</button>
        </div>
    </div>  
    {*<table class="table table-bordered table-hover table-striped" cellpadding="0" cellspacing="0"> 
    <thead class="bgSpec">
    <tr class="list-header">*}
    <table id="DialogActivityList" class="table table-bordered table-hover table-striped list-user"  role="grid" aria-describedby="Myliste_info">
        <thead  class="{*bg-info*}thead-color">
            <tr role="row">
                <th>#</th>
                    {*<th><span class="mr-1">{__('ID')}</span>
                    <div class="d-inline-block">
                    <a href="#" class="dialog-order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="title"><i class="fa fa-sort-up acs-desc"></i></a>
                    <a href="#" class="dialog-order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="title"><i class="fa fa-sort-down"></i></a>            
                    </div>
                    </th>   *}           
                <th><span class="mr-1">{__('Title')}</span></th>                                             

                <th>{__('Actions')}</th>            
            </tr>
        </thead>
        <tbody class="tablebody">
            <tr role="row">
                {*<td></td>*}
                <td></td>             
                <td><input class="form-control form-control-sm ml-1 dialog-search" name="title" value="{$formFilter.search.title}"></td>                                          
                <td></td>        
            </tr>

            {foreach $pager as $item} 
                <tr class="DialogActivityList list {if $selection->in($item->get('id'))}Selected{/if}" id="{$item->get('id')}" role="row">
                    <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>
                    {*<td>{$item->get('id')}</td>*}                  
                    <td>{if $item->hasI18n()}
                        {$item->getI18n()->get('title')}
                        {else}
                            {__('---')}
                            {/if}
                            </td>                                      
                            <td>   
                                {if !$item->isLeaf()}
                                    <a href="#" class="list-action text-info Activities" id="{$item->get('id')}" title="{__('Activities')}"><i class="fa fa-list {*icon-font*}"></i></a>             
                                    {/if}
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
            {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager class="dialog-pager"} 
        </div>
    </div>
<script type="text/javascript">
   
     $("#DialogActivityList").data('selection',{$selection->toJson()});
      
     function getDialogFilterParameters()
        {
            var params={ CustomerBlogActivityNode : { node: '{$node->get('id')}',                                            
                                             selection : $("#DialogActivityList").data('selection'),
                                             token : '{$formFilter->getCSRFToken()}'  },
                          filter: {  order : { }, 
                                    search : { },
                                    equal: { },          
                                    range: { },  
                                nbitemsbypage: $("[name=nbitemsbypage]").val(),                                
                                token:'{$formFilter->getCSRFToken()}'
                         } };
             if($(".dialog-order_active").attr("name"))
                 params.filter.order[$(".dialog-order_active").attr("name")] =$(".dialog-order_active").attr("id");            
            $(".dialog-search").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); });            
            return params;                  
        }
        
        function updateDialogFilter()
        {          
           return $.ajax2({ data: getDialogFilterParameters(), 
                            url:"{url_to('customers_blog_ajax',['action'=>'ListPartialDialogActivityForArticle'])}" ,                          
                            target: "#Modal-Activities-ctn"
                             });
        }
        
        $("#SelectListLanguages").change(function() {  updateDialogFilter();   });
        
        $(".dialog-search").keypress(function(event) {  if (event.keyCode==13)   return updateDialogFilter(); });

        $("[name=nbitemsbypage]").change(function () {  return updateDialogFilter();  });
    
        $(".dialog-pager").click(function () {                     
                return $.ajax2({ data: getDialogFilterParameters(), 
                                 url:"{url_to('customers_blog_ajax',['action'=>'ListPartialDialogActivityForArticle'])}?page="+$(this).attr('data-page'),                                
                                 target: "#Modal-Activities-ctn"
                });
        });
          
        $("#dialog-init").click(function () {                     
                return $.ajax2({ data : { CustomerBlogActivity : {  
                                              token : '{$formFilter->getCSRFToken()}' ,
                                              selection : $("#DialogActivityList").data('selection')
                                         } },
                                 url:"{url_to('customers_blog_ajax',['action'=>'ListPartialDialogActivityForArticle'])}",
                                 target: "#Modal-Activities-ctn"
                });
        });
        
        $("#dialog-filter").click(function () {                     
                return $.ajax2({ data: getDialogFilterParameters(), 
                                 url:"{url_to('employers_ajax',['action'=>'ListPartialDialogActivityForArticle'])}",                                
                                 target: "#Modal-Activities-ctn"
                });
        });
          
    
        $(".Activities").click( function () {                    
                  return $.ajax2({  data : { CustomerBlogActivityNode : { 
                                                node: $(this).attr('id'),
                                                selection : $("#DialogActivityList").data('selection'),
                                                lang: '{$formFilter->getLanguage()}'                                            
                                    } },                            
                                  url:"{url_to('customers_blog_ajax',['action'=>'ListPartialDialogActivityForArticle'])}", 
                                  target: "#Modal-Activities-ctn"});
     });
                    
    $(".CustomerBlogActivity-item").click(function () { 
              var params={  CustomerBlogActivityNode : { node: $(this).attr('id'), 
                                             lang : '{$formFilter->getLanguage()}', 
                                             selection : $("#DialogActivityList").data('selection'),
                                             token : '{mfForm::getToken('CustomerBlogActivitySelectionForm')}' },
                            filter: {  order : { }, 
                                    search : { },
                                    equal: { },                                            
                                    nbitemsbypage: '{$formFilter.nbitemsbypage}', 
                                    token:'{$formFilter->getCSRFToken()}'
                         } };
            if ($(".order_active").attr("name"))
                 params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");   
            $(".search").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); }); 
                 return $.ajax2({ 
                                 data : params,
                                 url:"{url_to('customers_blog_ajax',['action'=>'ListPartialDialogActivityForArticle'])}", 
                                 target: "#Modal-Activities-ctn" 
                                  }); 
             });  
        
{* $(".DropMenuShowFoldersInside").mouseleave(function(){
                $(this).hide("fade", { }, 1000);
        });  *}
        
       $(".DialogActivityList").click(function () {
           $(this).toggleClass("Selected");        
           if ($(this).hasClass("Selected"))                                                  
            $("#DialogActivityList").data("selection").push(parseInt($(this).attr("id")));                                 
           else              
            $("#DialogActivityList").data("selection").splice($.inArray(parseInt($(this).attr("id")),$("#DialogActivityList").data("selection")),1);                                                                    
        });
        
        
    $(".CustomerBlogActivityPath-item").click(function () { 
         $('.DropMenuShowFoldersInside').hide();
             var item=$(this);
             return $.ajax2({ 
                         data : { CustomerBlogActivityI18n : { activity_id: $(this).attr('id'),lang : '{$formFilter->getLanguage()}' } },
                         url:"{url_to('customers_blog_ajax',['action'=>'GetChildrenActivity'])}",                                              
                         success : function (resp)
                                {
                                       $(".DropMenuShowFoldersInside").css({
                                        position: "absolute",
                                        left: (item.position().left + 1) + "px"
                                      });
                                      $("#path-activity-ctn-"+item.attr('id')).show();
                                },
                           target : "#path-activity-ctn-"+item.attr('id') 
                       });
    });
    
    $(".mouseLeaveFunction").mouseleave(function(){
        $(".mouseLeaveFunction").css("display", "none");
    });
    
    
{*  $(".CustomerBlogActivity-item").click(function () { 
              var params={  CustomerBlogActivityNode : { node: $(this).attr('id'), 
                                             lang : $("#SelectListLanguages option:selected").attr('id'), 
                                             token : '{mfForm::getToken('CustomerBlogActivityNodeForm')}' },
                            filter: {  order : { }, 
                                    search : { },
                                    equal: { },                                                                     
                                    nbitemsbypage: '{$formFilter.nbitemsbypage}', //$("[name=nbitemsbypage]").val(),
                                    token:'{$formFilter->getCSRFToken()}'
                         } };
            if ($(".order_active").attr("name"))
                 params.filter.order[$(".order_active").attr("name")] =$(".order_active").attr("id");   
             $(".search").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); }); 
                return $.ajax2({ 
                         data : params,
                          url:"{url_to('customers_blog_ajax',['action'=>'ListPartialDialogActivityForArticle'])}", 
                         target: "#Modal-Activities-ctn" }); 
        }); *}
</script>
