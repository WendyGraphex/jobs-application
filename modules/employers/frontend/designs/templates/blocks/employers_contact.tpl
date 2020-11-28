<div class="col-md-6 order-md-last d-flex">
    <div class="bg-white p-5 contact-form" style="padding: 25px !important;">
        <div class="GenderFirstLastName" style="display: block ruby;padding-right: 10px;">
            <div class="form-group" name="gender" style="width: 20%;">
                <div class="errors" name="gender"></div>   
                {html_options style="padding-left: 2px;" name="gender" class="EmployerContact Select form-control form-control-lg error" options=$form->gender->getOption("choices")} 
            </div>
            <div class="form-group" style="width: 40%;">
                <input type="text" name="firstname" class="form-control Input EmployerContact" placeholder="{__('First name')}">
            </div>
            <div class="form-group" style="width: 40%;">
                <input type="text" name="lastname" class="form-control Input EmployerContact" placeholder="{__('Last name')}">
            </div>
        </div>
        <div class="divEmailPhone-Contact">
            <div class="form-group">
                <input type="text" name="email" class="form-control Input EmployerContact" placeholder="{__('Email')}">
            </div>
            <div class="form-group">
                <input type="text" name="phone" class="form-control Input EmployerContact" placeholder="{__('Phone')}">
            </div>
        </div>
        <div class="form-group">
            <input type="text" name="subject" class="form-control Input EmployerContact" placeholder="{__('Subject')}">
        </div>
        <div class="form-group" style="position: relative;">
            <textarea name="message" id="textEmployerContact" cols="30" rows="7" class="FormtextAreaStyle Input EmployerContact" placeholder="{__('Your message')}"></textarea>
            <label id="charNumEmployerContact" class="charNum">{__('Max characters is %s',$form->message->getOption('max_length',0))}</label>
        </div>
        <div class="form-group" style="margin-bottom: 0px !important;">
            <button id="EmployerContactSend" class="btn btn-primary py-3 px-5">{__('Send Message')}</button>
        </div>
    </div>
</div>
<script type="text/javascript">
    {JqueryScriptsReady}
        
    $('#textEmployerContact').keyup(function () {                         
        $('#charNumEmployerContact').text($(this).val().length >= {$form->message->getOption('max_length',0)}?"{__('you have reached the limit')}": {$form->message->getOption('max_length',0)} - $(this).val().length + "{__(' characters left')}");        
    }); 
    
    $('.EmployerContact').keyup(function () {   $(".EmployerContact").removeClass('intro');  });
        
            $("#EmployerContactSend").click( function () {                 
                var params = { EmployerContactMessage: { token : '{$form->getCSRFToken()}' } };
                $(".EmployerContact.Input").each(function () { params.EmployerContactMessage[$(this).attr('name')]=$(this).val(); });
                $(".EmployerContact.Select option:selected").each(function () { params.EmployerContactMessage[$(this).parent().attr('name')]=$(this).val(); });
                $(".EmployerContact").removeClass('intro');
                return $.ajax2({ 
                            data : params,
                            url :"{url_to('employers_ajax',['action'=>'SendMessage'])}",                               
                            success : function (resp)
                                {
                                    if (resp.errors)
                                    {                                        
                                        $.each(resp.errors, function (f) {  $(".EmployerContact[name="+f+"]").addClass('intro'); });                                       
                                        return ;
                                    } 
                                }
                     });                                        
            });
    {/JqueryScriptsReady}
</script>