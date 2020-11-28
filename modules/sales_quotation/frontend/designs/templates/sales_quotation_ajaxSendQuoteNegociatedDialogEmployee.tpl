<div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div style="text-align: center;">
                    <div style="position: relative;margin-bottom: 38px;margin-top: 10px;">
                        <textarea id="DescriptionQuote" placeholder="{__('Message')}" class="SaleEmployeeQuotationNegociated" name="description" style="height: 135px !important;position: relative;"></textarea>
                        <label id="charNumQuote" class="charNum">{__('Max characters is 500')}</label>
                    </div>
                    <div style="text-align: center;margin-top: 20px;">
                        <label style="position: relative;">
                            <input id="PriceOrder" type="text" class="form-control Input SaleEmployeeQuotationNegociated" value="{$quotation->getFormatter()->getPrice()->getText()}" name="price" placeholder="{__('Enter your price')}" style="height: 40px !important;">
                            <span style="position: absolute;top: 7px;right: 10px;font-size: 21px;color: #999;">$</span>
                        </label>
                    </div>
                    <div>
                        <button id="Send" type="button" class="btn btn-success">{__('Send')}</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script type="text/javascript">
   
     $("#Send").click(function () {  
        var count=$(".count[id={$quotation->get('id')}]").html();
        var params = { SaleEmployeeQuotation : '{$quotation->get('id')}', SaleEmployeeQuotationNegociated : { token : '{mfForm::getToken('SendQuoteNegociatedEmployeeForm')}' } };         
        $(".SaleEmployeeQuotationNegociated").each(function () { params.SaleEmployeeQuotationNegociated[$(this).attr('name')]=$(this).val(); });
        return $.ajax2({ data : params,            
                         url :"{url_to('sales_quotation_ajax',['action'=>'SendQuoteNegociatedEmployee'])}", 
                         success : function  (resp)
                                   {
                                        if (resp.errors)
                                        {                                          
                                            $('#DescriptionQuote').keyup(function () { 
                                                $("#DescriptionQuote").removeClass('intro');
                                            });
                                            $("#DescriptionQuote").addClass('intro');
                                            return ;
                                        }
                                        $("#ModalQuotation").modal('hide');
                                        $(".list[id={$quotation->get('id')}]").html(resp);
                                        $(".count[id={$quotation->get('id')}]").html(count);
                                   }                    
             });
    });    
    
    $('#DescriptionQuote').keyup(function () {   
        $('#charNumQuote').text($(this).val().length >= {$max_characters}?"{__('you have reached the limit')}": {$max_characters} - $(this).val().length + "{__(' characters left')}");        
    });
        
    
</script>
