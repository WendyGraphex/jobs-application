{alerts}          
{if $item_i18n->getGallery()->isLoaded()}
<div class=" bg-white px-2 py-2">        
<div class="col-md-12  padd-col">
    <div class="float-left w-50">
          {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager class="dialog"}  
    </div>
    <div class="float-right w-50">                   
           <button  id="dialog-filter" class="btn btn-primary btn-color btn-f" >{__("Filter")}</button>   
           <button  id="dialog-init" class="btn btn-primary btn-color btn-init btn-f">{__("Init")}</button>
    </div>
</div>
<div class="table-responsive"> 
     <div class="row float-left mt-2 w-100 padd-row">
      <div class="col-sm-12 padd-col">
      <table id="DialogCityList" class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer w-100 list-user"  role="grid" aria-describedby="Myliste_info">
      <thead  class="bg-info thead-color">
        <tr role="row">
            <th>#</th>
           <th><span>{__('ID')}</span>
                    <div class="position-relative float-right mr-2">
                              
                             <a style="float: right;" href="#" class="position-absolute dialog-order{$formFilter.order.id->getValueExist('asc','_active')}" id="asc" name="id"><i class="fas fa-sort-up"></i></a>
                             <a style="float: right;" href="#" class="position-absolute dialog-order{$formFilter.order.id->getValueExist('desc','_active')}" id="desc" name="id"><i class="fas fa-sort-down"></i></a>            
                          </div>
              </th>             
            <th><span>{__('Title')}</span>
                          <div class="position-relative float-right mr-2">
                              
                             <a style="float: right;" href="#" class="position-absolute dialog-order{$formFilter.order.title->getValueExist('asc','_active')}" id="asc" name="title"><i class="fas fa-sort-up"></i></a>
                             <a style="float: right;" href="#" class="position-absolute dialog-order{$formFilter.order.title->getValueExist('desc','_active')}" id="desc" name="title"><i class="fas fa-sort-down"></i></a>            
                          </div>
            </th>               
        </tr>
      </thead>
      <tbody class="tablebody">
          <tr role="row">
              <td></td>
              <td><input class="form-control form-control-sm ml-1 dialog-search" name="id" value="{$formFilter.search.id}"/></td>                  
              <td><input class="form-control form-control-sm ml-1 dialog-search" name="title" value="{$formFilter.search.title}"/></td>                                                             
          </tr>
      
       {foreach $pager as $item} 
      <tr class="DialogCityList list {if $formFilter->getSelection()->in($item->get('id'))}Selected{/if}" id="{$item->get('id')}" role="row">
          <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>
          <td>{$item->get('id')}</td>                 
          <td>{if $item->hasI18n()}{$item->getI18n()->get('title')}{else}{__('---')}{/if}
          </td>                                                 
             </tr>
        {/foreach}
         {if !$pager->hasItems()}
             <tr role="row" >
                 <td  colspan="3">{__('No city')}</td>
             </tr>
        {/if}  
        </tbody>         
    </table>
      </div>
    </div>
       {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager class="dialog"} 
  </div>
  
</div>
<script type="text/javascript">
    
      $("#DialogCityList").data('selection',{$formFilter->getSelection()->toJson()});
      
      function getDialogFilterParameters()
        {
            var params={    EmployerCityGalleryI18n : { lang :'{$item_i18n->get('lang')}', gallery_id : '{$item_i18n->get('gallery_id')}' },
                            filter: {  order : { }, 
                                    search : { },
                                    equal: { },          
                                    range: { },                                
                                selection : $("#DialogCityList").data('selection'),
                                nbitemsbypage: $("[name=dialog-nbitemsbypage]").val(),                                
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
                            url:"{url_to('employers_ajax',['action'=>'ListPartialDialogCityForGalleryI18n'])}" ,                          
                            target: "#Modal-Employers-ctn"
                             });
        }               
        
        $(".dialog-search").keypress(function(event) {  if (event.keyCode==13)   return updateDialogFilter(); });

        $("[name=dialog-nbitemsbypage]").change(function () {  return updateDialogFilter();  });
    
        $(".dialog-equal").change(function () {  return updateDialogFilter();  });
        
        $(".dialog-pager").click(function () {                     
                return $.ajax2({ data: getDialogFilterParameters(), 
                                 url:"{url_to('employers_ajax',['action'=>'ListPartialDialogCityForGalleryI18n'])}?page="+$(this).attr('data-page'),                                
                                 target: "#Modal-Cities-ctn"
                });
        });
          
        $("#dialog-init").click(function () {                     
                return $.ajax2({ data : { 
                                        EmployerCityGalleryI18n : { lang :'{$item_i18n->get('lang')}', gallery_id : '{$item_i18n->get('gallery_id')}' },
                                        filter : { selection : $("#DialogCityList").data('selection'), token: '{mfForm::getToken('DialogCityFormFilter')}' }  
                                            },                                
                                 url:"{url_to('employers_ajax',['action'=>'ListPartialDialogCityForGalleryI18n'])}",
                                 target: "#Modal-Cities-ctn"
                });
        });
        
        $("#dialog-filter").click(function () {                     
                return $.ajax2({ data: getDialogFilterParameters(), 
                                 url:"{url_to('employers_ajax',['action'=>'ListPartialDialogCityForGalleryI18n'])}",                                
                                 target: "#Modal-Cities-ctn"
                });
        });
          
          
       $(".DialogCityList").click(function () {
           $(this).toggleClass("Selected");        
           if ($(this).hasClass("Selected"))                                                  
            $("#DialogCityList").data("selection").push(parseInt($(this).attr("id")));                                 
           else              
            $("#DialogCityList").data("selection").splice($.inArray(parseInt($(this).attr("id")),$("#DialogCityList").data("selection")),1);                                                                    
        });
        
    
</script>
      
{else}
    {__('Gallery is invalid.')}
{/if}       