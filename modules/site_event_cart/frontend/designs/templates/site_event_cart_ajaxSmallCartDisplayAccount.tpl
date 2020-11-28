{if $cart}
    {if !$cart->getCartEvents()->isEmpty()}  
        {foreach $pager as $item}
            <div class="item-content flex-grow DropCart" style="text-align: left;padding: 10px;">
                <div>
                    <div style="display: flex;">
                        <div>{__('Ref.')}{$item->getEvent()->get('reference')}</div>
                        <div style="position: absolute;right: 10px;">{__('Qte')} : {$item->get('quantity')}</div>
                    </div>
                    <div style="display: flex;">
                        <div>{$item->getEvent()->getI18n()->getFormatter()->getMetaTitle()->ucfirst()}</div>
                        <div>{$item->getFormatter()->getQuantity()->getText()}</div>
                        <div style="position: absolute;right: 10px;">{$item->getFormatter()->getTotalSalePriceWithTax()->getAmount()}</div>
                    </div>
                    <div></div>
               </div>      
            </div>
        {/foreach}
        <div class="TotalPriceCart">
            <label>{$cart->getFormatter()->getTotalSalePriceWithTax()->getAmount()}</label>
        </div>
        <div style="text-align: center;">           
            <button type="button" class="btn btn-secondary Continue-btn">{__('Continue')}</button>                        
            <button id="Order-btn" type="button" class="btn btn-success Order-btn">{__('Order')}</button>
        </div>
    {else}
        <div class="item-content flex-grow {*DropCart*}" style="padding-left: 0px;text-align: center;padding: 10px;"> {__('Cart is empty')}</div>
    {/if}
{else}    
    <div class="item-content flex-grow {*DropCart*}" style="padding-left: 0px;text-align: center;padding: 10px;"> {__('Cart is empty')}</div>
{/if}

<script type="text/javascript">
    
    {* $(".Continue-btn").click(function () { 
        return $.ajax2({ url :"{url_to('sales_quotation_ajax',['action'=>'ListPartialQuotationForEmployer'])}", 
                        target : "#actions",
                        success : function (resp)
                        {
                            //$("#SmallCartItems").removeClass('show');    
                            $("#SmallCartItems").hide(); 
                        }
                    });  
    }); *}
       
       $("#Order-btn").click(function () {             
           return $.ajax2({ url :"{url_to('site_event_cart_ajax',['action'=>'MyCart'])}", 
                            target : "#page-wrapper",
                            success : function (resp)
                                   {
                                        //$("#SmallCartItems").removeClass('show');    
                                         $("#SmallCartItems").hide();                                          
                                   }
                     });  
            
       }); 
       
</script>    