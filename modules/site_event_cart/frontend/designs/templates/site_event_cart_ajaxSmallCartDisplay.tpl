{if $cart}
    {if !$cart->getCartEvents()->isEmpty()}  
        
        {foreach $pager as $item}
            
            <div class="item-content flex-grow DropCart" style="text-align: left;padding: 10px;">
                 
                    {*if $item->getQuotation()->hasEmployerAdvert()}
                        <div>{__('Ref.')}{$item->getQuotation()->getEmployerAdvert()->getI18n()->get('reference')}</div>
                        <div>
                            <label>
                            {$item->getQuotation()->getEmployerAdvert()->getI18n()->getFormatter()->getTitle()->ucfirst()}                                             
                            </label>
                            <label>{$item->getFormatter()->getTotalSalePriceWithTax()->getAmount()}</label>
                        </div>
                        <div>aaaaaaaaaaaaaaaaaa</div>
                    {elseif $item->getQuotation()->hasEmployeeAdvert()}      
                        <div>{__('Ref.')}{$item->getQuotation()->getEmployeeAdvert()->getI18n()->get('reference')}</div>
                        <div>
                            <label>{$item->getQuotation()->getEmployeeAdvert()->getI18n()->getFormatter()->getTitle()->ucfirst()}</label>
                            <label>{$item->getFormatter()->getTotalSalePriceWithTax()->getAmount()}</label>
                        </div><label>{$item->getQuotation()->getProject()->getFormatter()->getName()->ucfirst()}</label> 
                    {/if*} 
                   
                       
                       {*<div class="row">
                            <div class="col-md-9">
                                <div>{__('Ref.')}{$item->getQuotation()->getEmployerAdvert()->getI18n()->get('reference')}</div>
                                <div>{$item->getQuotation()->getEmployerAdvert()->getI18n()->getFormatter()->getTitle()->ucfirst()}</div>
                                <div></div>
                            </div>
                            <div class="col-md-3">
                                <label style="margin-top: 30%;">{$item->getFormatter()->getTotalSalePriceWithTax()->getAmount()}</label>
                            </div>
                       </div> *}  
                            
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
                            
                            
                       {*<div class="row">
                           <div class="col-md-9">
                                <div>{__('Ref.')}{$item->getQuotation()->getEmployerAdvert()->getI18n()->get('reference')}</div>
                                <div>{$item->getQuotation()->getEmployerAdvert()->getI18n()->getFormatter()->getTitle()->ucfirst()}</div>                                            </div>
                                <div>Fygfy 20015 uiguzeaaaaaa gdtd</div>
                           </div>
                            <div class="col-md-3">
                                <label style="margin-top: 30%;">{$item->getFormatter()->getTotalSalePriceWithTax()->getAmount()}</label>
                            </div>
                       </div>*}
                   {*elseif $item->getQuotation()->hasEmployeeAdvert()}      
                        <div>
                            <div>{__('Ref.')}{$item->getQuotation()->getEmployeeAdvert()->getI18n()->get('reference')}</div>
                            <div style="display: flex;">
                                <div>{$item->getQuotation()->getEmployeeAdvert()->getI18n()->getFormatter()->getTitle()->ucfirst()}</div> 
                                <div style="position: absolute;right: 10px;">{$item->getFormatter()->getTotalSalePriceWithTax()->getAmount()}</div>
                            </div>
                            <div>{$item->getQuotation()->getProject()->getFormatter()->getName()->ucfirst()}</div>
                        </div> *}
                    

            </div>
        {/foreach}
        <div class="TotalPriceCart">
            <label>{$cart->getFormatter()->getTotalSalePriceWithTax()->getAmount()}</label>
        </div>
        <div style="text-align: center;">           
            <button type="button" class="btn btn-secondary Continue-btn">{__('Continue')}</button>                        
            <button type="button" class="btn btn-success Order-btn"><a href="{url_to('site_event_cart',['action'=>'MyCart'])}?callback=cart" style="color: #fff;">{__('Order')}</a></button>
        </div>
    {else}
        <div class="item-content flex-grow {*DropCart*}" style="padding-left: 0px;text-align: center;padding: 10px;"> {__('Cart is empty')}</div>
    {/if}
{else}    
    <div class="item-content flex-grow {*DropCart*}" style="padding-left: 0px;text-align: center;padding: 10px;"> {__('Cart is empty')}</div>
{/if}

<script type="text/javascript">
    
    $(".Continue-btn").click(function () { 
        return $.ajax2({ url :"{url_to('sales_quotation_ajax',['action'=>'ListPartialQuotationForEmployer'])}", 
                        target : "#actions",
                        success : function (resp)
                        {
                            //$("#SmallCartItems").removeClass('show');    
                            $("#SmallCartItems").hide(); 
                        }
                    });  
    });
    
       
     /*   $(".Continue-btn").click(function () {             
           return $.ajax2({ url :"{url_to('sales_quotation_ajax',['action'=>'ListPartialQuotationForEmployer'])}", 
                            target : "#actions",
                            success : function (resp)
                                   {
                                        //$("#SmallCartItems").removeClass('show');    
                                        $("#SmallCartItems").hide(); 
                                   }
                     });  
            
       });*/
       
</script>    