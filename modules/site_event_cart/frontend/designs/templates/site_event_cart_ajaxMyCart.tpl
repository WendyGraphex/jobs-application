<div id="actions">
    {if $cart}    
        <div class="row RowTop">
            <div class="col-md-12 grid-margin classConducteurTop">
                <div class="d-flex justify-content-between flex-wrap">
                    <div class="d-flex align-items-end flex-wrap">
                        <div class="mr-md-3 mr-xl-5 styleWidth">
                            <h2>{__('My cart')}</h2>                   
                        </div>
                        <div class="d-flex">
                            <i class="mdi mdi-home text-muted hover-cursor"></i>
                            <a id="Dashboard"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('Dashboard')}</p></a>
                            <p class="text-muted mb-0">&nbsp;/&nbsp;{__('My cart n°[%s]' ,$cart->getReference())}</p>
                        </div>
                    </div>      
                </div>
            </div>
        </div>
        {alerts}    
        <div class="col-lg-12 pt-2 stretch-card">
            <div class="card classMargin">
                <div class="card-body pr-2 pl-2">               
                    <div class="table-responsive pt-3">
                        <div id="NoCart-ctn" style="display:none;font-size: 25px;">
                            <div class="alert alert-warning" role="alert">
                                {__('No cart') } 
                            </div>
                        </div>  
                        <table id="CartList-ctn" class="table table-bordered table-striped">
                            <thead class="">
                                <tr role="row">
                                    <th> #</th>                        
                                    <th>{__('Ref/Desc.')}</th> 
                                    <th>{__('Quantity')}</th>                                                                    
                                    <th>{__('Unit Price')}</th>                                                                       
                                    <th>{__('Total')}</th>                                                                       
                                    <th>{__('Actions')}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach $pager as $item} 
                                    <tr class="list" id="{$item->get('id')}" role="row">
                                        <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>                                                                                   
                                        <td>{$item->getEvent()->get('reference')} - {$item->getEvent()->getI18n()->getFormatter()->getMetaTitle()->ucfirst()}
                                        </td>
                                        <td>
                                            <div class="def-number-input number-input safari_only">
                                                <button onclick="this.parentNode.querySelector('input[type=number]').stepDown()" class="minus"></button>
                                                <input class="quantity" min="0" name="quantity" value="{$item->getFormatter()->getQuantity()}" type="number">
                                                <button onclick="this.parentNode.querySelector('input[type=number]').stepUp()" class="plus"></button>
                                            </div>
                                            
                                        </td>                       
                                        <td>
                                            {$item->getFormatter()->getSalePriceWithTax()->getAmount()}
                                        </td>                                            
                                        <td style="text-align: center;"> 
                                            {$item->getFormatter()->getTotalSalePriceWithTax()->getAmount()}
                                        </td>
                                        <td> 
                                            <a href="javascript:void(0);" class="CartEvent-Delete Delete" id="{$item->get('id')}" name="{$item->getEvent()->getI18n()->getFormatter()->getMetaTitle()->ucfirst()}"><i class="fa fa-trash" style="color: #b91111;"></i></a>
                                        </td>
                                    </tr>
                                {/foreach}
                                {if !$pager->hasItems()}
                                    <tr role="row" >
                                        <td  colspan="9">{__('No event available')}</td>
                                    </tr>
                                {/if}                             
                                {* <tr class="" role="row">
                                    <td class="bg-white border-0 " colspan="3"></td>
                                    <td class="align-middle border bg-light">
                                        <div> Graphex {__('commission')} </div>
                                        <div>{$cart->getCommission()->getFormatter()->getFix()->getAmount()} + {$cart->getCommission()->getFormatter()->getRate()->getPourcentage(0)}</div>
                                    </td>
                                    <td class="align-middle text-center border bg-light">
                                        {$cart->getFormatter()->getCommissionWithTax()->getAmount()}
                                    </td>
                                </tr> *}
                                {foreach $cart->getTaxes()->getValues() as $value}
                                <tr class="" role="row">
                                    <td class="bg-white border-0" colspan="3"></td>
                                    <td class="align-middle border bg-light">{__('Total Tax')} {$value->getRate()->getPourcentage()}</td>
                                    <td class="align-middle text-center border bg-light">
                                        {$value->getAmount()->getAmount()}
                                    </td>
                                </tr>
                                {/foreach}
                                <tr class="" role="row">
                                    <td class="bg-white border-0" colspan="3"></td>
                                    <td class="align-middle border bg-light">{__('Total TTC')}</td>
                                    <td class="align-middle text-center border bg-light">
                                        {$cart->getFormatter()->getGlobalSalePriceWithTax()->getAmount()}
                                    </td>
                                </tr>
                            </tbody>         
                        </table>
                    </div>                       
                </div>
            </div>     
        </div> 
        <div id="OrderSummuryCart" class="pb-5" style="padding-left: 11px;padding-right: 11px;/*! border-top: none; *//*! padding: 5px; */">
            <div class="container bg-white pb-2  col-lg-12">
                <div class="row py-5 bg-white" style="padding: 20px;">
                    <div class="col-lg-12">
                        <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Order summary </div>
                        <p class="font-italic mb-4">
                            <strong>Graphex Technology</strong>
                            {__('may also collect taxes (such as value added tax (VAT) in Europe) on Service Fees.')}
                            {__('Additionally, the use of various Payment Methods offered through the Site, and the Site Services may incur added fees or charges. All Payment Methods are posted on the Site along with any associated fees or charges, which we may update from time to time at our sole discretion. You hereby authorize us to charge to you and to collect from you (consistent with this Agreement, the User Agreement, or elsewhere in the Terms of Service) any fees, charges, or taxes.')}
                        </p>           
                    </div>
                    <div class="mb-4">
                        {component name="/site_event_order/conditionsLink" tpl='cart'}                                        
                    </div>                                  
                </div>
                {component name="/site_event_order/btnOrder"}
            </div>
        </div>
    {else}
        <div class="row RowTop">
            <div class="col-md-12 grid-margin classConducteurTop">
                <div class="d-flex justify-content-between flex-wrap">
                    <div class="d-flex align-items-end flex-wrap">
                        <div class="mr-md-3 mr-xl-5 styleWidth">
                            <h2>{__('My cart')}</h2>                   
                        </div>
                        <div class="d-flex">
                            <i class="mdi mdi-home text-muted hover-cursor"></i>
                            <a id="Dashboard"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('Dashboard')}</p></a>
                            <p class="text-muted mb-0">&nbsp;/&nbsp;{__('My cart')}</p>
                        </div>
                    </div>      
                </div>
            </div>
        </div>
        {alerts}
        <div class="col-lg-12 pt-2 stretch-card">
            <div class="card classMargin">
                <div class="card-body pr-2 pl-2">               
                    <div class="table-responsive pt-3">
                        <div style="font-size: 25px;">
                            <div class="alert alert-warning" role="alert">
                                {__('No cart') } 
                            </div>
                        </div>   
                    </div>
                </div>
            </div>
        </div>            
    {/if}
    
<script type="text/javascript">
    {JqueryScriptsReady}
         
        $('#defaultChecked2').change(function() {
            if(this.checked) 
                $('#CreateOrder').removeClass('disabledButton');                   
            else          
                $('#CreateOrder').addClass('disabledButton');              
        });       

        
        $(".nav-item").removeClass('active');
        
        $(".nav-item[id=075_site_event_mycart]").addClass('active');
        
        $('#Dashboard').click(function(){                                       
          return $.ajax2({ url: "{url_to('site_event_ajax',['action'=>'Dashboard'])}",                           
                           target: "#actions"}); 
        }); 
        
       $(".CartEvent-Delete").click(function () {    
           if (!confirm('{__("Event \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
           return $.ajax2({ data : { SiteCartEvent : $(this).attr('id') },
                            url :"{url_to('site_event_cart_ajax',['action'=>'DeleteCartEvent'])}",                            
                            success : function (resp)
                            {
                                    if (resp.action !='DeleteCartEvent') return ;
                                    $(".list[id="+resp.id+"]").remove();
                                    $('td.count').text(function (i) {
                                        return i + 1;
                                    });
                                    if (!$(".list").length)
                                    {    
                                        $("#NoCart-ctn").show();
                                        $("#CartList-ctn").hide();
                                        $("#OrderSummuryCart").hide();
                                    }
                            }
                     });  
            
       });               
                  
   {/JqueryScriptsReady}  
           
   
</script>

</div>