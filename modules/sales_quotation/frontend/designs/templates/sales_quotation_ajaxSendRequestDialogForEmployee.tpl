<div class="modal-header">
     <button type="button" class="close" data-dismiss="modal">&times;</button>
</div>
<div class="modal-body">
    <h4>{__('Advert: %s',(string)$item->getAdvertI18n()->getFormatter()->getTitle()->ucfirst())}</h4>   
    <span class="ModalRequestImg">
       <img height="32px" src="{$item->getEmployerUser()->getAvatar()->getThumb()->getUrl()}"/>
        <label><h5>{$item->getEmployerUser()->getFormatter()->getUsername()->ucfirst()}</h5></label>
    </span>      
    <div style="position: relative;margin-bottom: 38px;margin-top: 10px;">
        <textarea placeholder="{__('Message')}" class="EmployeeDescription EmployeeQuote Input" name="description" style="height: 135px !important;position: relative;"></textarea>
        <label id="charNum" class="charNum">{__('Max characters is 500')}</label>
        <label class="MinChar">{__('Min characters is 200')}</label>
    </div>
    <div style="text-align: center;">
        <label style="position: relative;">
            <input id="PriceOrder" type="text" class="price EmployeeQuote Input" name="price" placeholder="{__('Enter your price')}"  style="height: 40px !important;">
            <span style="position: absolute;top: 8px;right: 10px;font-size: 20px;color: #999;">$</span>
        </label>
    </div>
    <div style="text-align: center;">
        <button type="button" id="SendQuote" class="btn btn-success">{__('Send my quote')}</button>
    </div>
</div>
                                                               
 <script type="text/javascript">
       
    $("#SendQuote").click( function () {   
        var params= { EmployerQuotationRequest: '{$item->get('id')}', EmployeeQuote : {  token: '{mfForm::getToken('EmployeeSendRequestQuotationForm')}' } };
        $(".EmployeeQuote.Input").each(function () { params.EmployeeQuote[$(this).attr('name')]=$(this).val(); });
        return $.ajax2({ data : params,
                         url :"{url_to('sales_quotation_ajax',['action'=>'SendRequestQuotation'])}",   
                         success: function (resp) { 
                             if (resp.action !='SendRequestQuotation') return ;
                             if (resp.errors)
                             {
                                $(".EmployeeDescription").addClass('intro');
                                $("#PriceOrder").addClass('intro');
                                 return ;
                             }    
                             $(".EmployerQuotationRequest[name=price][id="+resp.id+"]").html(resp.price);
                             $(".EmployerQuotationRequest[name=quoted_at][id="+resp.id+"]").html(resp.quoted_at);
                             $("#ModalRequest").modal('hide'); 
                            }
                         
             });                                        
    });
    
    
    $('.EmployeeDescription').keyup(function () {                         
        $('#charNum').text($(this).val().length >= {$max_characters}?"{__('you have reached the limit')}": {$max_characters} - $(this).val().length + "{__(' characters left')}");        
    });
    
</script>   
 