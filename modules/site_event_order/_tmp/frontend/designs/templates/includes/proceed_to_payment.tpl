<div class="col-lg-12 pt-2 stretch-card">
    <div class="card classMargin" style="text-align: center;">
        <div class="card-body pr-2 pl-2" style="padding-left: 20px !important;">
            <div class="col-md-5" style="margin: 0 auto;">
                <div class="totalPrice" style="text-align: left;">
                    <div>
                        <span>{__('Prestations')} {$order->getFormatter()->getNumberOfQuotations()->getChoicesText("[0]no job|[1]1 job|(1,Inf]%s jobs")}</span><label style="right: 18px;position: absolute;"> {$order->getFormatter()->getGlobalSalePriceWithTax()->getAmount()}</label>
                    </div>
                    <div>
                        <span>{__('Service charges')}</span><label style="right: 18px;position: absolute;" Class="OrderResults" name="adder"> --- </label>
                    </div>
                    <div style="padding-top: 7px;text-align: right;">
                        <label style="font-size: 26px;" class="OrderResults" name="general_total">{$order->getFormatter()->getGlobalSalePriceWithTax()->getAmount()}</label>
                    </div>  
                </div>
                <div class="totalPrice" style="text-align: justify;margin-top: 25px;margin-bottom: 25px;font-size: 26px;">
                    {component name="/payments_employer/list"} 
                </div>
                <div>
                    <button id="Proceed" style="font-size: 17px; opacity:50%" type="button" class="btn btn-success">{__('Proceed to payment')}</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->
<div id="myModal22" class="modal" role="dialog">
  <div class="modal-dialog" style="top: 30%;">
    <div class="modal-content">
        <div class="modal-body" style="text-align: center;">
            <img src="/web/pictures/loading-pay.gif" style="width: 100px;"/>
            <h4>{__('Please wait payment in progress')}.....</h4>
        </div>
    </div>
  </div>
</div>
        
<script type="text/javascript">      
    
    $(".Payment").click(function () { 
            var url = "{url_to('payments_process_ajax')}".replace("{ldelim}payment{rdelim}",$(this).data('method'));
            $.ajax2({ data : { SaleOrder : { price : '{$order->getFormatter()->getGlobalSalePriceWithTax()->getText("#.00")}' , token : '{mfForm::getToken('SaleOrderPaymentPriceForm')}' } },
                         url : url,            
                         success : function (resp)
                         {
                             if (resp.action !='Process') return ;
                             $(".OrderResults").each(function () { $(this).html(resp[$(this).attr('name')]); });
                             $("#Proceed").css('opacity',1);
                         }
             });
    });
    
    
    $("#Proceed").click(function () { 
            if ($("#Proceed").hasClass('isBusy')) return ;
            $("#Proceed").addClass('isBusy');
            if (!$(".Payment:checked").data('method')) return ; 
            $('#myModal22').modal('show');
            var url = "{url_to('payments_proceed')}".replace("{ldelim}payment{rdelim}",$(".Payment:checked").data('method'));
            $.ajax2({ data : { SaleOrder : '{$order->get('id')}' },
                         url : url,            
                         success : function (resp)
                         {
                              $("#Proceed").removeClass('isBusy');
                              if (resp.redirect)
                              {
                                  window.location.href = resp.redirect;
                                  return false;
                              }
                              $('#myModal22').modal('hide');
                              $("#actions").html(resp);
                         }
                         
             });
    });
</script>
