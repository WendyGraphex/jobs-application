<input type="text" placeholder="{__('Amount')}" id="Amount" value="{$payment_request->getFormatter()->getTotalPriceWithTax()->getText("#.00")}"/>
<span>{__('Max')}: {$payment_request->getFormatter()->getRestOfTotalPriceWithTax()->getAmount()}</span>
<div style="text-align: center;padding: 10px;">
    <button id="Save" class="btn btn-success">{__('Save')}</button>
</div>
<script type="text/javascript">
    
    
    $('input').on('input blur paste', function(){
        $(this).val($(this).val().replace(/\D/g, ''))
    });
    
    
    $('#Amount').click(function() { 
        $(this).removeClass('intro');
    });
    
    $("#Save").click(function() { 
        return $.ajax2({ data : { EmployeeWorkPaymentRequest : { reference : '{$payment_request->get('reference')}' } ,
                                 EmployeeWorkPaymentRequestAmount : { amount : $("#Amount").val(), token : '{$form->getCSRFToken()}' } 
                             },
                       url: "{url_to('employees_work_ajax',['action'=>'SaveDialogAmountRequestForEmployer'])}",                           
                       success : function (resp) {   

                                    if (resp.errors)
                                    {
                                        $('#Amount').addClass('intro');
                                        return ;
                                    }                                         
                                    $('#ModalAmountRequest').modal('hide');                                                                             
                                    $("#actions").html(resp);   
                                }
                        }); 
   });
        
        
</script> 
