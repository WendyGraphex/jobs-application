{if $cart}
    {if $cart->getCartProducts()->count()}
<li class="header-cat">
                   <div class="row">
                       <div class="col-1 centent-center">
                       </div>
                       <div class="col-2 centent-center">
                       </div>
                       <div class="col-4">
                           <h6>{__('Ref/Desc.')}</h6>
                       </div>
                       <div class="col-3">
                           <h6 class="pl-3">{__('In/Out')}</h6>
                       </div>                      
                       <div class="col-1 p-l-scroll">
                           <h6>{__('Qty')}</h6>
                       </div>
                       <div class="col-1 centent-center">
                       </div>
                   </div>
              </li>
              <li class="">
                  <ul class="list-items-scroll">
                    {foreach $pager as $item}

                       <li class="item">
                         <div class="row item-cart">
                             <div class="col-1 border-right centent-center">
                                 <span>{$pager->getNbItems() - $item@index}</span>
                             </div>
                             <div class="col-2 border-right centent-center">
                                 {if  $item->getProduct()->hasPicture()}
                                     <img class="product-img-cart" src="{$item->getProduct()->getPicture()->getThumb()->getUrl()}" alt=""/>
                                 {else}
                                    <img class="product-img" src="/web/pictures/bg-img/PasImage.png" alt="" >
                                 {/if}
                             </div>
                             <div class="col-4 border-right centent-center-l">
                                 <span>{$item->getProduct()->get('reference')}
                                     {$item->getProduct()->getI18n()->get('title')}
                                 </span>
                             </div>
                             <div class="col-3 border-right pt-2 text-center">
                                 <span class="">{$item->getFormatter()->getInAt()->getText()}</span></br>                     
                                 <span class="">{$item->getFormatter()->getOutAt()->getText()}</span> 
                             </div>
                             <div class="col-1 border-right centent-center">
                                 <a href="#" class="DecCartProduct" id="{$item->get('id')}" {if $item->getQuantity()==1}style="display:none"{/if}> <span   class="mdi mdi-minus cursor"></span></a>
                                 <span class="CartProductQuantity" id="{$item->get('id')}">{$item->getFormatter()->getQuantity()}</span>
                                 <a href="#" class="IncCartProduct" id="{$item->get('id')}"><span  class="mdi mdi-plus cursor"></span></a>
                             </div>
                             <div class="col-1 border-right centent-center test-height" alt="{__('Delete')}">
                                <a href="#" class="CartProductItem" name="{$item->getProduct()->get('reference')} {$item->getProduct()->getI18n()->get('title')}" id="{$item->get('id')}"><i class="fa fa-trash-o cart-trash"></i></a>
                             </div>
                         </div>
                        </li>

                    {/foreach}
                  </ul>
                </li>
                <li class="pt-3 pb-3 text-center t-border footer-cart">                
                   {format_number_choice('[1]one result|(1,Inf]%s results',$pager->getNbItems(),$pager->getNbItems())}                 
                   {component name="/cart/cartLink"}                             
               </li>
               <li class="divider"></li>
               <li class="pt-3 pb-3 text-center footer-cart">                 
                 {component name="/quotations/orderLink"}
               </li>   
                           
   {else}
        <li class="header-cat">
                   <div class="row">
                       <div class="col-12 centent-center" style="text-align: center;">
                        {__('Cart is empty')}
                       </div>
                   </div>
              </li>  
    {/if}
{else}    
    <li class="header-cat">
                   <div class="row">
                       <div class="col-12 centent-center" style="text-align: center;">
                        {__('Cart is empty')}
                       </div>
                   </div>
              </li>  
{/if}

<script type="text/javascript">
         
       $(".DecCartProduct").click(function () {            
                  return $.ajax2({ data : { CartProduct:  $(this).attr('id') },
                                   url :"{url_to('cart_ajax',['action'=>'DecQuantityCartProduct'])}",                               
                                   success : function (resp)
                                    {
                                        if (resp.quantity == 1)
                                            $(".DecCartProduct[id="+resp.id+"]").hide();
                                        $(".CartProductQuantity[id="+resp.id+"]").html(resp.quantity);
                                        
                                    }
                     }); 
       });
                     
       $(".IncCartProduct").click(function () {                            
                  return $.ajax2({  data : { CartProduct:  $(this).attr('id') },
                                    url :"{url_to('cart_ajax',['action'=>'IncQuantityCartProduct'])}",                               
                                    success : function (resp)
                                    {
                                        $(".DecCartProduct[id="+resp.id+"]").show();
                                        $(".CartProductQuantity[id="+resp.id+"]").html(resp.quantity);
                                       
                                    }
                     });              
       });
    
      {if $cart}
       $(".CartProductItem").click(function () {    
           if (!confirm('{__("Item \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false;            
           return $.ajax2({ data : { CartProduct : { id:$(this).attr('id'), token:'{mfForm::getToken('DeleteProductToCartForm')}' }  },
                            url :"{url_to('cart_ajax',['action'=>'DeleteCartProductToCart'])}",                            
                            target :"#SmallCartItems"   ,
                            success : function (resp)
                            {
                                 cnt="{$cart->getCartProducts()->count()-1}";
                                 $("#SmartCartBtn").trigger('deletefromcart',[cnt]); {***************** A REVOIR *******************}
                             }
                     });             
       });
       {/if}
</script>
