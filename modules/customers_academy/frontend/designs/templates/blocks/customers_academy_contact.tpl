<div class="col-md-6 order-md-last d-flex">
    <div class="bg-white p-5 contact-form" style="padding: 25px !important;">
        <div class="GenderFirstLastName" style="display: block ruby;padding-right: 10px;">
            <div class="form-group" name="gender" style="width: 20%;">
                <div class="errors" name="gender"></div>   
                {html_options style="padding-left: 2px;" name="gender" class="CustomerAcademyContact Select form-control form-control-lg error" options=$form->gender->getOption("choices")} 
               {* <select class="Signup Fields Select form-control form-control-lg error">
                    <option>Mr</option>
                    <option>Mrs</option>
                    <option>Ms</option>
                </select> *}
            </div>
            {*html_options style="padding-left: 2px;" name="gender" class="Signup Fields Select form-control form-control-lg error" options=$form->gender->getOption("choices")*}                
            <div class="form-group" style="width: 40%;">
                <input type="text" name="firstname" class="form-control Input CustomerAcademyContact" placeholder="{__('First name')}">
            </div>
            <div class="form-group" style="width: 40%;">
                <input type="text" name="lastname" class="form-control Input CustomerAcademyContact" placeholder="{__('Last name')}">
            </div>
        </div>
        <div class="divEmailPhone-Contact">
            <div class="form-group">
                <input type="text" name="email" class="form-control Input CustomerAcademyContact" placeholder="{__('Email')}">
            </div>
            <div class="form-group">
                <input type="text" name="phone" class="form-control Input CustomerAcademyContact" placeholder="{__('Phone')}">
            </div>
        </div>
        <div class="form-group">
            <input type="text" name="subject" class="form-control Input CustomerAcademyContact" placeholder="{__('Subject')}">
        </div>
        <div class="form-group" style="position: relative;">
            <textarea name="message" id="textEmployeeContact" cols="30" rows="7" class="FormtextAreaStyle Input CustomerAcademyContact" placeholder="{__('Your message')}"></textarea>
            <label id="charNumEmployeeContact" class="charNum">{__('Max characters is %s',$form->message->getOption('max_length',0))}</label>
        </div>
        <div class="form-group" style="margin-bottom: 0px !important;">
            <button id="CustomerAcademyContactSend" class="btn btn-primary py-3 px-5">{__('Send Message')}</button>
        </div>
    </div>
</div>
        
        
        
<div id="ModalAcademyContact-onPageSuccess" class="modal fade" role="dialog" aria-modal="true">
    <div class="ModalMessage modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="Modal-close close" data-dismiss="modal">×</button>
            </div>              
            <div class="modal-body" style="text-align: center;color: green;">
                <i class="mdi mdi-check-circle" style="font-size: 45px;"></i>
                <p style="font-size: 19px;">{__('Your message has been sent')}</p>
            </div>
        </div>
    </div> 
</div>
        
        
        
        
<script type="text/javascript">
    {JqueryScriptsReady}
        
    $('#textEmployeeContact').keyup(function () {                         
        $('#charNumEmployeeContact').text($(this).val().length >= {$form->message->getOption('max_length',0)}?"{__('you have reached the limit')}": {$form->message->getOption('max_length',0)} - $(this).val().length + "{__(' characters left')}");        
    }); 
    
    $('.CustomerAcademyContact').keyup(function () {   $(".CustomerAcademyContact").removeClass('intro');  });
        
            $("#CustomerAcademyContactSend").click( function () {                 
                var params = { CustomerAcademyContactMessage: { token : '{$form->getCSRFToken()}' } };
                $(".CustomerAcademyContact.Input").each(function () { params.CustomerAcademyContactMessage[$(this).attr('name')]=$(this).val(); });
                $(".CustomerAcademyContact.Select option:selected").each(function () { params.CustomerAcademyContactMessage[$(this).parent().attr('name')]=$(this).val(); });
                $(".CustomerAcademyContact").removeClass('intro');
                return $.ajax2({ 
                            data : params,
                            url :"{url_to('customers_course_ajax',['action'=>'SendMessage'])}",                               
                            success : function (resp)
                                {
                                    if (resp.errors)
                                    {                                        
                                        $.each(resp.errors, function (f) {  $(".CustomerAcademyContact[name="+f+"]").addClass('intro'); });                                       
                                        return ;
                                    }
                                    if (resp.status != 'OK') return ;
                                    $('#ModalAcademyContact-onPageSuccess').modal('show');
                                    $(".CustomerAcademyContact").val('');
                                }
                     });                                        
            });
    {/JqueryScriptsReady}
</script>