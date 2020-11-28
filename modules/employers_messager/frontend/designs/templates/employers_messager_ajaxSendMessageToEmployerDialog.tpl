{if $employer->isLoaded()}
<div class="ModalContactUser modal-dialog modal-lg" style="width: 50%;">
  <div class="modal-content">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal">&times;</button>
    </div>
    <div class="modal-body">
        <input type="text" class="form-control MessageToEmployer Input" name="subject" placeholder="{__('Subject')}" style="height: 42px !important;"/><br/>
        <div style="position: relative;">
            <textarea id="MessageModalDialog" name="message" placeholder="{__('Your message')}" class="MessageToEmployer Input" style="height: 135px !important;position: relative;"></textarea>
            <label id="charNumDialog" class="charNum">{__('Max characters is 500')}</label>
            <label id="" class="textLeftMin">{__('Min characters is 200')}</label>
        </div>
        <div style="text-align: center;">
            <button type="button" id="SendMessageToEmployer" class="btn btn-success">{__('Send')}</button>
        </div>        
    </div>
  </div>
</div>

    <script type="text/javascript">
    
    $('#MessageModalDialog').keyup(function () {                         
        $('#charNumDialog').text($(this).val().length >= {$max_characters}?"{__('you have reached the limit')}": {$max_characters} - $(this).val().length + "{__(' characters left')}");        
    });
    
    {*$('#MessageModalDialog').keyup(function () {
        var max = 500;
        var len = $(this).val().length;
        if (len >= max) {
          $('#charNumDialog').text(' you have reached the limit');
        } else {
          var char = max - len;
          $('#charNumDialog').text(char + ' characters left');
        }
    });*}     
      
    $("#SendMessageToEmployer").click(function () {   
        var params = { EmployerMessage : { employer : '{$employer->get('url')}' , token : '{mfForm::getToken('SendMessageToEmployerForm')}' } };
        $(".MessageToEmployer").each(function () { params.EmployerMessage[$(this).attr('name')]=$(this).val(); });
         return $.ajax2({ data:  params ,
                        url:"{url_to('employers_messager_ajax',['action'=>'SendMessageToEmployer'])}",     
                        success : function (resp) 
                            {
                                if (resp.action != 'SendMessageToEmployer') return ;
                                if (resp.errors)
                                {
                                    $('.Input').keyup(function () { 
                                        $(".MessageToEmployer").removeClass('intro');
                                    });
                                    $.each(resp.errors,function (name,error) { $(".MessageToEmployer[name="+name+"]").addClass('intro'); });
                                    return ;
                                }    
                                $("#DialogEmployerMessage").modal('hide'); 
                                $("#myModalContactUser").modal('show');
                                $(".EmployerRequestDialog-text").html("{$employer->getFormatter()->getUsername()->ucfirst()}");
                                
                            }
                        
                }); 
     });
     
      
       
</script>   

{/if}    