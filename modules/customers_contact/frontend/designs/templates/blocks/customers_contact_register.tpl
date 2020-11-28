<div id="register-modal" class="modal fade" role="dialog">
    <div class="modal-dialog  modal-lg ModalMakeOffer" style="width:100%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="bg-white p-5 contact-form" style="padding: 25px !important;">
                    <div class="GenderFirstLastName" style="display: block ruby;padding-right: 10px;">
                        <div class="form-group" name="gender" style="width: 20%;">
                            <div class="errors" name="gender"></div>   
                            {html_options style="padding-left: 2px;" name="gender" class="CustomerContact Select form-control form-control-lg error" options=$form->gender->getOption("choices")} 
                        </div>             
                        <div class="form-group" style="width: 40%;">
                            <input type="text" name="firstname" class="form-control Input CustomerContact" placeholder="{__('First name')}">
                        </div>
                        <div class="form-group" style="width: 40%;">
                            <input type="text" name="lastname" class="form-control Input CustomerContact" placeholder="{__('Last name')}">
                        </div>
                    </div>
                    <div class="divEmailPhone-Contact">
                        <div class="form-group">
                            <input type="text" name="email" class="form-control Input CustomerContact" placeholder="{__('Email')}">
                        </div>
                        <div class="form-group">
                            <input type="text" name="phone" class="form-control Input CustomerContact" placeholder="{__('Phone')}">
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 0px !important;text-align: center;">
                        <button id="CustomerContactSend" class="btn btn-primary py-3 px-5">{__('Send Message')}</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>  
        
<script type="text/javascript">
    {JqueryScriptsReady}
    
    $('.CustomerContact').keyup(function () {   $(".CustomerContact").removeClass('intro');  });
        
            $("#CustomerContactSend").click( function () {                 
                var params = { CustomerContactMessage: { token : '{$form->getCSRFToken()}' } };
                $(".CustomerContact.Input").each(function () { params.CustomerContactMessage[$(this).attr('name')]=$(this).val(); });
                $(".CustomerContact.Select option:selected").each(function () { params.CustomerContactMessage[$(this).parent().attr('name')]=$(this).val(); });
                $(".CustomerContact").removeClass('intro');
                return $.ajax2({ 
                            data : params,
                            url :"{url_to('customers_contact_ajax',['action'=>'SendMessage'])}",                               
                            success : function (resp)
                                {
                                    if (resp.errors)
                                    {                                        
                                        $.each(resp.errors, function (f) {  $(".CustomerContact[name="+f+"]").addClass('intro'); });                                       
                                        return ;
                                    }
                                    $('#ModalContact-onPageSuccess').modal('show');
                                }
                     });                                        
            });
    {/JqueryScriptsReady}
</script>