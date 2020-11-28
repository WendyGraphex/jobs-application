{if $advert_i18n->isLoaded()} 
<div class="ModalScreenCenter modal-dialog modal-dialog modal-lg" style="width: 40%;">
        <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="FormCard card-container" style="width: 98%;">
                    <div class="row">
                        <div class="col-md-6"><input type="text" id="FirstNameAbuse" class="form-control EmployeeAdvertI18nAbuse Input" name="firstname" placeholder="{__('First name')}" required /></div>
                        <div class="col-md-6"><input type="text" id="LastNameAbuse" class="form-control EmployeeAdvertI18nAbuse Input" name="lastname" placeholder="{__('Last name')}" required /></div>
                    </div>
                        <input type="email" id="EmailAbuse" class="form-control EmployeeAdvertI18nAbuse Input" name="email" placeholder="{__('Email')}" required autofocus>
                        {html_options name="type_id" class="EmployeeAdvertI18nAbuse form-control Fields Select" options=$form->type_id->getChoices()->toArray() selected=$advert_i18n->get('type_id')}<br/>
                    <div style="position: relative;">
                        <textarea id="MessageModalAbuse" placeholder="{__('Message')}" name="message" class="EmployeeAdvertI18nAbuse Input" style="height: 135px !important;position: relative;"></textarea>
                        <label id="CharNumAbuse" class="charNum" style="line-height: 1.8;color: #999999;">{__('Max characters is 500')}</label>
                        <label id="" class="textLeftMin">{__('Min characters is 200')}</label>
                    </div>
                    <div class="mb-2 d-flex d-flex-lgn">  
                        <button type="button" id="SendAbuseAdvert-btn" class="btn btn-success" style="margin: 0 auto;">{__('Send')}</button>
                    </div>
                </div>
            </div>
        </div>
    </div> 
    <script type="text/javascript">  
        
    $('#MessageModalAbuse').keyup(function () {                         
      $('#CharNumAbuse').text($(this).val().length >= {$max_characters}?"{__('You have reached the limit')}": {$max_characters} - $(this).val().length + "{__(' characters left')}");        
    });
    
     $("#SendAbuseAdvert-btn").click(function () {        
         var params = { EmployeeAdvertI18nAbuse : {  url: '{$advert_i18n->get('url')}', lang: '{$advert_i18n->get('lang')}', token : '{mfForm::getToken('EmployeeAbuseAdvertI18nForm')}'} };
         $(".EmployeeAdvertI18nAbuse.Input").each(function () { params.EmployeeAdvertI18nAbuse[$(this).attr('name')]=$(this).val(); });
         $(".EmployeeAdvertI18nAbuse.Select option:selected").each(function () { params.EmployeeAdvertI18nAbuse[$(this).parent().attr('name')]=$(this).val(); });
         return $.ajax2({ data:  params,
                        url:"{url_to('employees_contact_ajax',['action'=>'AbuseAdvertI18n'])}",     
                        success : function (resp) { 
                            if (resp.action !='AbuseAdvertI18n') return ;
                            if (resp.errors)
                            {
                                //$(".EmployeeAdvertI18nAbuse").addClass('intro');
                                $('.Input').keyup(function () { 
                                    $(".EmployeeAdvertI18nAbuse").removeClass('intro');
                                });
                                $.each(resp.errors,function (name,error) { $(".EmployeeAdvertI18nAbuse[name="+name+"]").addClass('intro'); });
                                return;
                            }                               
                            $("#DialogAbuseAdvert").modal('hide');
                            $(".myModalEmailAbuse").modal('show');                          
                        }                        
                }); 
     });           
       
</script>   
{else}
    {__('Advert is invalid.')}
{/if}    