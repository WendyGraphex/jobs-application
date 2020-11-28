{if $advert_i18n->isLoaded()} 
<div class="ModalScreenCenter modal-dialog modal-dialog modal-lg" style="width: 40%;">
        <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="FormCard card-container" style="width: 98%;">
                    <div class="row">
                        <div class="col-md-6"><input type="text" style="height: 42px !important;" class="form-control EmployerAdvertI18nShare Input" name="firstname" placeholder="{__('First name')}" required /></div>
                        <div class="col-md-6"><input type="text" style="height: 42px !important;" class="form-control EmployerAdvertI18nShare Input" name="lastname" placeholder="{__('Last name')}" required /></div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <input type="email" style="height: 42px !important;" class="form-control EmployerAdvertI18nShare Input" name="email" placeholder="{__('Email')}" required autofocus>
                        </div>
                        <div class="col-md-6">
                            <input type="phone" style="height: 42px !important;" class="form-control EmployerAdvertI18nShare Input" name="phone" placeholder="{__('Phone')}" required autofocus>
                        </div>
                    </div>
                   
                    <div style="position: relative;">
                        <textarea id="MessageModalEmail" placeholder="{__('Message')}" name="message" class="EmployerAdvertI18nShare Input" style="height: 135px !important;position: relative;"></textarea>
                        <label id="charNumEmail" class="charNum" style="line-height: 1.8;color: #999999;">{__('Max characters is 500')}</label>
                        <label id="" class="textLeftMin">{__('Min characters is 200')}</label>
                    </div>
                    <div class="mb-2 d-flex d-flex-lgn">  
                        <button type="button" id="SendShareAdvert-btn" class="btn btn-success" style="margin: 0 auto;">{__('Send')}</button>
                    </div>
                </div>
            </div>
        </div>
    </div> 
    <script type="text/javascript">        
       
       $('.Input').keyup(function () { $(".EmployerAdvertI18nShare").removeClass('intro');});
       
     $("#SendShareAdvert-btn").click(function () {        
         var params = { EmployerAdvertI18nShare : {  url: '{$advert_i18n->get('url')}', lang: '{$advert_i18n->get('lang')}', token : '{mfForm::getToken('EmployerShareAdvertI18nForm')}'} };
         $(".EmployerAdvertI18nShare.Input").each(function () { params.EmployerAdvertI18nShare[$(this).attr('name')]=$(this).val(); });
         return $.ajax2({ data:  params,
                        url:"{url_to('employers_contact_ajax',['action'=>'ShareAdvertI18n'])}",     
                        success : function (resp) { 
                            if (resp.action !='ShareAdvertI18n') return ;
                            if (resp.errors)
                            {
                                
                                $.each(resp.errors, function (f) {  $(".EmployerAdvertI18nShare[name="+f+"]").addClass('intro'); });                                       
                                        return ;
                            }                                
                            $("#DialogShareAdvert").modal('hide'); 
                            $(".myModalEmailSahre").modal('show');
                            $(".EmployerRequestDialog-text").html("{$advert_i18n->getAdvert()->getEmployerUser()->getFormatter()->getUsername()->ucfirst()}");
                        }                        
                }); 
     }); 
    {*$('#MessageModalEmail').keyup(function () {  
        alert("ererzer");
        $('#charNumEmail').text($(this).val().length >= {$max_characters} ?"{__('you have reached the limit')}": {$max_characters} - $(this).val().length + "{__(' characters left')}");        
    });*}
    $('#MessageModalEmail').keyup(function () {
        var max = 500;
        var len = $(this).val().length;
        if (len >= max) {
          $('#charNumEmail').text(' you have reached the limit');
        } else {
          var char = max - len;
          $('#charNumEmail').text(char + ' characters left');
        }
    }); 
       
</script>   
{else}
    {__('Advert is invalid.')}
{/if}    