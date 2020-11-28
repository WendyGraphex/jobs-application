<div class="row RowTop">
    <div class="col-md-12 grid-margin classConducteurTop">
      <div class="d-flex justify-content-between flex-wrap">
        <div class="d-flex align-items-end flex-wrap">
          <div class="mr-md-3 mr-xl-5 styleWidth">
            <h2>{__('My Payment advises')}</h2>                 
          </div>
          <div class="d-flex">
            <i class="mdi mdi-home text-muted hover-cursor"></i>
            <a id="Dashboard"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('Dashboard')}</p></a>       
            <a id="PaymentEmployeeAdvises"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('My Payment advises')}</p></a>
            <p class="text-muted mb-0">&nbsp;/&nbsp;{__('Credit ')}</p>
          </div>
        </div>      
      </div>
    </div>
</div>
 {alerts}
 
<div class="col-lg-12 pt-2 stretch-card">
    <div class="card classMargin" style="text-align: center;">
        <div class="card-body pr-2 pl-2" style="padding-left: 20px !important;">
            <div class="col-md-5" style="margin: 0 auto;">
                <div class="totalPrice" style="text-align: left;">
                    <div>
                        <span>{__('Prestations')} ({$payment->getFormatter()->getNumberOfRequests()->getChoicesText("[0]no payment|[1]1 payment|(1,Inf]%s payments")})</span>
                        <label style="right: 18px;position: absolute;"> {$payment->getFormatter()->getTotalPriceWithTax()->getAmount()}</label>
                    </div>
                    <div>
                     <div>
                        <span>{__('Graphex commission')}</span><label style="right: 18px;position: absolute;"> {$payment->getFormatter()->getCommissionWithTax()->getAmount()} </label>
                    </div>
                    <span>{__('Service charges')}</span><label style="right: 18px;position: absolute;" Class="EmployeePaymentResults" name="adder">  {$payment->getFormatter()->getPaymentPriceWithTax()->getAmount()} </label> 
                    </div>
                    <div style="padding-top: 7px;text-align: right;">
                        <label style="font-size: 26px;" class="EmployeePaymentResults" name="global_total">{$payment->getFormatter()->getGeneralPriceWithTax()->getAmount()}</label>
                    </div>  
                </div>
                <div class="totalPrice" style="text-align: justify;margin-top: 25px;margin-bottom: 25px;font-size: 26px;">
                    {component name="/payments_employee/list"} 
                </div>
                <div>
                    <button id="Proceed" style="font-size: 17px; {if $default->isNotLoaded()}opacity:50%{/if}" type="button" class="btn btn-success">{__('Credit my account')}</button>
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
             
        $('#Dashboard').click(function(){                                       
          return $.ajax2({ url: "{url_to('employees_ajax',['action'=>'Dashboard'])}",                           
                           target: "#actions"}); 
        }); 
                 
         $('#PaymentEmployeeAdvises').click(function(){                                       
          return $.ajax2({ url: "{url_to('payments_employee_ajax',['action'=>'ListPartialPaymentForEmployee'])}",                           
                           target: "#actions"}); 
        });
        
        
        
       $("#Proceed").click(function () { 
            if ($("#Proceed").hasClass('isBusy')) return ;
            $("#Proceed").addClass('isBusy');
            if (!$(".Payment:checked").data('method')) return ;  
             $('#myModal22').modal('show');
            var url = "{url_to('payments_proceed_credit')}".replace("{ldelim}payment{rdelim}",$(".Payment:checked").data('method'));
            $.ajax2({    url : url,            
                         success : function (resp)
                         {
                              $("#Proceed").removeClass('isBusy');
                              $('#myModal22').modal('hide');
                              $("#actions").html(resp);
                         }
                         
             });
       });
       
       $(".Payment").click(function () {           
             var url = "{url_to('payments_process_credit_ajax')}".replace("{ldelim}payment{rdelim}",$(this).data('method'));            
             $.ajax2({ data : { EmployeePayment : { price : '{$payment->getFormatter()->getGlobalPriceWithTax()->getText("#.00")}' , token : '{mfForm::getToken('EmployeePaymentPriceForm')}' } },
                         url : url,            
                         success : function (resp)
                         {
                             if (resp.action !='CreditProcess') return ;
                             $(".EmployeePaymentResults").each(function () { $(this).html(resp[$(this).attr('name')]); });
                             $("#Proceed").css('opacity',1);
                         }
             });              
    });
    
      $('.Configure').click(function(){                                       
          return $.ajax2({ url: "{url_to('payments_employee_ajax',['action'=>'Method'])}",  
                           success : function  () { $(".nav-item").removeClass('active'); $("#800_employee_method_payments").addClass('active'); },
                           target: "#actions"}); 
        });
</script> 