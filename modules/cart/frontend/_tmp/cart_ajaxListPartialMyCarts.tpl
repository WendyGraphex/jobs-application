{alerts}
<div class="row admin-header-container padd-r">    
    <div class="col-sm p-0">
       
    </div>
</div>
<div class="col-lg-12 pt-2 stretch-card">
              <div class="card">
                <div class="card-body pr-2 pl-2">               
                  <div class="table-responsive pt-3">
                    <table class="table table-bordered table-striped">
                      <thead class="">
                        <tr role="row">
                            <th>#</th>                                                 
                            <th>{__('Ref')}</th> 
                            <th>{__('Number of products')}</th> 
                            <th>{__('Total Sale without tax')}</th> 
                            <th>{__('Total Sale with tax')}</th> 
                            <th>{__('Currency')}</th> 
                            <th>{__('Created at')}</th>                                                      
                            <th>{__('Updated at')}</th>
                            <th>{__('Actions')}</th>
                        </tr>
                      </thead>
                      <tbody>
                         {foreach $pager as $item} 
                            <tr class="list" id="{$item->get('id')}" role="row">
                                <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>                                                            
                                <td>{$item->getReference()}</td>
                                <td>{$item->getFormatter()->getNumberOfProducts()}</td>
                                <td>{$item->getFormatter()->getTotalSalePriceWithoutTax()}</td>
                                <td>{$item->getFormatter()->getTotalSalePriceWithTax()}</td>
                                <td>{$item->getCurrency()->getCode()->getSymbol()}</td> 
                                 <td>{$item->getFormatter()->getCreatedAt()->getText()}</td>    
                                 <td>{$item->getFormatter()->getUpdatedAt()->getText()}</td>                                  
                                  <td class="font-i">     
                                     <a href="#" class="list-action Products" id="{$item->get('id')}" title="{__('Edit')}"><i class="fa fa-list"></i></a>                                    
                                     <a href="#" class="list-action text-info Delete text-danger" id="{$item->get('id')}" name="{$item->getReference()}" title="{__('Delete')}"><i class="fa fa-trash"></i></a>                                
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
              </div>
            </div>
 <script type="text/javascript">
     
        
      function updatePager(n)
        {
           page_active=$(".pager .active").html()?parseInt($(".pager .active").html()):1;
           records_by_page=$("[name=nbitemsbypage]").val();
           start=(records_by_page!="*")?(page_active-1)*records_by_page+1:1;
           $(".count").each(function(id) { $(this).html(start+id) }); // Update index column           
           nb_results=parseInt($("#nb_results").html())-n;
           $("#nb_results").html((nb_results>1?nb_results+" {__('results')}":"{__('one result')}"));
           $("#end_result").html($(".count:last").html());
        }
      
        $(".Delete").click( function () { 
                if (!confirm('{__("Cart \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
                return $.ajax2({ data :{ Cart: $(this).attr('id') },
                                 url :"{url_to('cart_ajax',['action'=>'DeleteCart'])}",                               
                                 success : function(resp) {
                                       if (resp.action!='DeleteCart') return ;                                          
                                          $(".list[id="+resp.id+"]").remove();  
                                          //if ($('.list').length==0) return updateFilter();   
                                          updatePager(1);
                                 }
                     });                                        
            });  
        
        
            
         $(".Products").click( function () {                 
                return $.ajax2({ data :{ Cart: $(this).attr('id') },
                                 url :"{url_to('cart_ajax',['action'=>'ListPartialForCart'])}",                               
                                 target :"#actions"
                     });                                        
            });  
</script> 
               
