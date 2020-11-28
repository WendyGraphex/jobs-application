{alerts}
<div class="bg-white px-2 py-2">   
    <div class="row">    
     {if !$formFilter.search.title->getValue()}
     {component name="/customers_blog/path" class='dialog'}  
     {/if}
    </div>    
             <div class="col-md-12  padd-col">
                
                 <div class="float-left w-50">
                       {include file="./_pagers/default/_default_pager_top.tpl" pager=$pager class="dialog"}  
                 </div>
                 <div class="float-right w-50">                   
                    <button id="dialog-filter" class="btn btn-primary" style="float: right; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Filter")}</button>   
                    <button id="dialog-init" class="btn btn-primary" style="float: right; margin-right: 10px; border: 0; border-radius: 0; background-color: #c8c8c8; color:black;">{__("Init")}</button>
             
                 </div>
             </div>
      <table id="DialogCustomerBlogActivityList" class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer w-100 list-user"  role="grid" aria-describedby="Myliste_info">
      <thead  class="bgSpec">
        <tr role="row">
            <th>#</th>                                       
            <th><span class="mr-1">{__('Title')}</span>
                <div style="float: right;">
                    <a href="#" class="position-absolute dialog-order{$formFilter.order.title->getValueExist('asc','_active')}" id="asc" name="title"><i class="fas fa-sort-up {if $formFilter.order.title->getValue()=='asc'}text-dark{/if}"></i></a>
                    <a href="#" class="position-absolute dialog-order{$formFilter.order.title->getValueExist('desc','_active')}" id="desc" name="title"><i class="fas fa-sort-down {if $formFilter.order.title->getValue()=='desc'}text-dark{/if}"></i></a>            
                </div>
            </th>    
            <th></th>
        </tr>
      </thead>
      <tbody>
          <tr role="row">
              <td></td>                                              
              <td><input class="form-control form-control-sm ml-1 dialog-search" placeholder="{__('Name/Title')}" name="title" value="{$formFilter.search.title}"></td>                         
              <td></td>
          </tr>
      </tbody>
      <tbody>
       {foreach $pager as $item} 
      <tr class="dialog-list {if $form->getSelected()->in($item->get('id'))}Selected{/if}" id="{$item->get('id')}" role="row">
          <td class="dialog-count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>                                
          <td>{if $item->hasI18n()}
                   {$item->getI18n()}
              {else}
                    {__('---')}
              {/if}
          </td>   
          <td>{if !$item->isLeaf()}
                 <a href="#" class="list-action text-info dialog-activities" id="{$item->get('id')}" title="{__('Activities')}"><i class="fa fa-list icon-font"></i></a>
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
    {*  </div>
    </div>*}
       {include file="./_pagers/default/_default_pager_bottom.tpl" pager=$pager class="dialog"} 
  </div>
</div>
<script type="text/javascript">
    
    $("#DialogCustomerBlogActivityList").data('selected',{$form->getSelected()});

     function getDialogFilterParameters()
        {
            var params={ CustomerBlogActivityNode : { node: '{$node->get('id')}', 
                                             lang : $("#SelectListLanguages option:selected").attr('id'), 
                                             selected:  $("#DialogCustomerBlogActivityList").data('selected'),
                                             token : '{$form->getCSRFToken()}' },
                          filter: {  order : { }, 
                                    search : { },
                                    equal: { },         
                                    range: { },                                     
                                nbitemsbypage: $("[name=dialog-nbitemsbypage]").val(),                              
                                token:'{$formFilter->getCSRFToken()}'
                         } };
             if($(".dialog-order_active").attr("name"))
                 params.filter.order[$(".dialog-order_active").attr("name")] =$(".dialog-order_active").attr("id");            
            $(".dialog-search").each(function() { params.filter.search[$(this).attr('name')] =$(this).val(); });
            $(".dialog-equal option:selected").each(function() { params.filter.equal[$(this).parent().attr('name')] =$(this).val(); });           
            return params;                  
        }
        
        function updateDialogFilter()
        {          
           return $.ajax2({ data: getDialogFilterParameters(), 
                            url:"{url_to('customers_blog_ajax',['action'=>'DialogListPartialActivity'])}" ,                          
                            target: "#CustomerBlogActivityListDialog-ctn"
                             });
        }
        
        function updateDialogPager(n)
        {
           var page_active=$(".dialog-pager .active").html()?parseInt($(".dialog-pager .active").html()):1;
           var records_by_page=$("[name=dialog-nbitemsbypage]").val();
           var start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
           $(".dialog-count").each(function(id) { $(this).html(start+id) }); // Update index column           
           var nb_results=parseInt($("#dialog-nb_results").html())-n;
           $("#dialog-nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
           $("#dialog-end_result").html($(".dialog-count:last").html());
        } 
        
       
        $(".dialog-search").keypress(function(event) {  if (event.keyCode==13)   return updateDialogFilter(); });

        $("[name=dialog-nbitemsbypage]").change(function () {  return updateDialogFilter();  });
        
        $('.dialog-order').click(function() {            
                $(".dialog-order_active").attr('class','dialog-order');
                $(this).attr('class','dialog-order_active');
                return updateDialogFilter();
           });
           
        $(".dialog-pager").click(function () {                     
                return $.ajax2({ data: getDialogFilterParameters(), 
                                 url:"{url_to('customers_blog_ajax',['action'=>'DialogListPartialActivity'])}?page="+$(this).attr('data-page'),                                
                                 target: "#CustomerBlogActivityListDialog-ctn"
                });
        });
          
        $("#dialog-init").click(function () {                     
                return $.ajax2({ data : { CustomerBlogActivityNode : { node: '{$node->get('id')}', 
                                             lang : $("#SelectListLanguages option:selected").attr('id'), 
                                             selected:  $("#DialogCustomerBlogActivityList").data('selected'),
                                             token : '{$form->getCSRFToken()}' } },                                         
                                 url:"{url_to('customers_blog_ajax',['action'=>'DialogListPartialActivity'])}",
                                 target: "#CustomerBlogActivityListDialog-ctn"
                });
        });
        
         $("#dialog-filter").click(function () {                     
                return $.ajax2({ data: getDialogFilterParameters(), 
                                 url:"{url_to('customers_blog_ajax',['action'=>'DialogListPartialActivity'])}",                                
                                 target: "#CustomerBlogActivityListDialog-ctn"
                });
        });
          
          
        $(".dialog-list").click(function() { 
             $("#DialogCustomerBlogActivityList").data('selected',$(this).attr('id'));
             $(".dialog-list").removeClass('Selected');
             $(this).addClass('Selected');
        });
        
         $(".dialog-activities,.dialog-CustomerBlogActivity-item").click( function () {                    
                  return $.ajax2({  data : { CustomerBlogActivityNode : { 
                                                node: $(this).attr('id'),
                                                selected:  $("#DialogCustomerBlogActivityList").data('selected'),
                                                lang: $("#SelectListLanguages option:selected").attr('id')                                            
                                    } },                            
                                  url:"{url_to('customers_blog_ajax',['action'=>'DialogListPartialActivity'])}", 
                                  target: "#CustomerBlogActivityListDialog-ctn" });
        });
     
     
</script>
  
