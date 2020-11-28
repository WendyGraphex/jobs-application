<div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div style="text-align: center;">
                    <div class="row">
                        <div class="col-md-6">
                            <input id="in_at" type="text" placeholder="{__('Start at')}" class="form-control Employee SaleEmployeeQuotationSchedule" name="in_at" value="">
                        </div>
                        <div class="col-md-6">
                            <input id="out_at" type="text" placeholder="{__('Ending at')}" class="form-control Employee SaleEmployeeQuotationSchedule" name="out_at" value="">
                        </div>
                    </div>
                    <div style="padding-top: 10px;">
                        <button id="Send" type="button" class="btn btn-success">{__('Send')}</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script type="text/javascript">
   
     $("#Send").click(function () {  
      //  var count=$(".count[id={$quotation->get('id')}]").html();       
        var params = { SaleEmployeeQuotation : '{$quotation->get('id')}', SaleEmployeeQuotationSchedule : { token : '{mfForm::getToken('SendQuoteScheduleEmployeeForm')}' } };         
         $(".SaleEmployeeQuotationSchedule").each(function () { params.SaleEmployeeQuotationSchedule[$(this).attr('name')]=$(this).val(); });
        return $.ajax2({ data : params,            
                         url :"{url_to('sales_quotation_ajax',['action'=>'SendQuoteScheduleEmployee'])}", 
                         success : function  (resp)
                                   {
                                        if (resp.action != 'SendQuoteScheduleEmployee') return ;
                                        if (resp.errors)
                                        {                                          
                                            $('.Employee').keyup(function () { 
                                                $(".Employee").removeClass('intro');
                                            });
                                            $.each(resp.errors,function (name,error) { $(".Employee[name="+name+"]").addClass('intro'); });
                                            return;
                                        }
                                        $("#ModalQuotation").modal('hide');
                                        $(".EmployeeQuotationActions[data-action=SCHEDULE][id={$quotation->get('id')}]").hide();
                                        $(".SaleEmployeeQuotation-InAt[id={$quotation->get('id')}]").html(resp.in_at);
                                        $(".SaleEmployeeQuotation-NumberOfDays[id={$quotation->get('id')}]").html(resp.number_of_days);                                        
                                   }                    
             });
    });
    
      var dates = $( "#in_at,#out_at" ).datepicker({
                            minDate : 0,
                            onSelect: function( selectedDate ) {
                                    var option = this.id == "in_at" ? "minDate" : "maxDate",
                                            instance = $( this ).data( "datepicker" ),
                                            date = $.datepicker.parseDate(
                                                    instance.settings.dateFormat ||
                                                    $.datepicker._defaults.dateFormat,
                                                    selectedDate, instance.settings );
                                    dates.not( this ).datepicker( "option", option, date );
        } } ); 
    
    
</script>                    
