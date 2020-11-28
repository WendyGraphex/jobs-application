<div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div style="text-align: center;">
                    <div style="position: relative;margin-bottom: 38px;margin-top: 10px;">
                        <textarea id="DescriptionQuotea" placeholder="{__('Message')}" name="description" class="SaleEmployeeQuotationNegociated" style="height: 135px !important;position: relative;"></textarea>
                        <label id="charNumQuotea" class="charNum">{__('Max characters is 500')}</label>
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
        var params = { SaleEmployeeQuotation : '{$quotation->get('id')}', SaleEmployeeQuotationNegociated : { description: $(".SaleEmployeeQuotationNegociated[name=description]").val(), token : '{mfForm::getToken('SendQuoteNegociatedEmployerForm')}' } };         
        return $.ajax2({ data : params,            
                         url :"{url_to('sales_quotation_ajax',['action'=>'SendQuoteNegociatedEmployer'])}", 
                         success : function  (resp)
                                   {
                                        if (resp.errors)
                                        {                                          
                                            $('#DescriptionQuotea').keyup(function () { 
                                                $("#DescriptionQuotea").removeClass('intro');
                                            });
                                            $("#DescriptionQuotea").addClass('intro');
                                            return ;
                                        }                                       
                                        $("#ModalQuotation").modal('hide');
                                        $(".list[id={$quotation->get('id')}]").html(resp);
                                        $(".count[id={$quotation->get('id')}]").html(count);
                                   }                    
             });
    });  
    $('#DescriptionQuotea').keyup(function () {   
        $('#charNumQuotea').text($(this).val().length >= {$max_characters}?"{__('you have reached the limit')}": {$max_characters} - $(this).val().length + "{__(' characters left')}");        
    });
    
</script>
