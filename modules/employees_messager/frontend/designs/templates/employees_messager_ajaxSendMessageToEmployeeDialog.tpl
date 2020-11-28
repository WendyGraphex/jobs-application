{if $employee->isLoaded()}
<div class="ModalContactUser modal-dialog modal-lg" style="width: 50%;">
  <div class="modal-content">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal">&times;</button>
    </div>
    <div class="modal-body">
        <input type="text" class="form-control MessageToEmployee Input" name="subject" placeholder="{__('Subject')}" style="height: 42px !important;"/><br/>
        <div style="position: relative;">
            <textarea id="MessageModalDialog" name="message" placeholder="{__('Your message')}" class="MessageToEmployee Input" style="height: 135px !important;position: relative;"></textarea>
            <label id="charNumDialog" class="charNum">{__('Max characters is 500')}</label>
            <label id="" class="textLeftMin">{__('Min characters is 200')}</label>
        </div>
        <div style="text-align: center;">
            <button type="button" id="SendMessageToEmployee" class="btn btn-success">{__('Send')}</button>
        </div>
        {*========================Not Connected==============================*}
            {*<div class="FormCard card-container">
                <img id="profile-img" class="profile-img-card" src="/web/pictures/avatar_2.png" />
                <p id="profile-name" class="profile-name-card"></p>
                <form class="form-signin">
                    <span id="reauth-email" class="reauth-email"></span>
                    <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
                    <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
                    <div id="remember" class="checkbox">
                        <label>
                            <input type="checkbox" value="remember-me"> Remember me
                        </label>
                    </div>
                    <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Sign in</button>
                </form>

                <div class="mb-2 d-flex d-flex-lgn">
                    {component name="/facebook_oauth/oauth"}     
                      <button type="button" class="btn btn-google auth-form-btn flex-grow ml-1 ">
                       <i class="mdi mdi-google mr-2"></i>Google
                     </button>
                </div>
                <div class="text-center mt-4 font-weight-light">
                    Don't have an account? <a href="/employee/signin" class="text-primary">Create</a>
                </div>
            </div>*}
    </div>
  </div>
</div>

    <script type="text/javascript">
    
 

    $('#MessageModalDialog').keyup(function () {                         
        $('#charNumDialog').text($(this).val().length >= {$max_characters}?"{__('you have reached the limit')}": {$max_characters} - $(this).val().length + "{__(' characters left')}");        
    });          
      
    $("#SendMessageToEmployee").click(function () {   
        var params = { EmployeeMessage : { employee : '{$employee->get('url')}' , token : '{mfForm::getToken('SendMessageToEmployeeForm')}' } };
        $(".MessageToEmployee").each(function () { params.EmployeeMessage[$(this).attr('name')]=$(this).val(); });
         return $.ajax2({ data:  params ,
                        url:"{url_to('employees_messager_ajax',['action'=>'SendMessageToEmployee'])}",     
                        success : function (resp) 
                            {
                                if (resp.action != 'SendMessageToEmployee') return ;
                                if (resp.errors)
                                {
                                   $('.Input').keyup(function () { 
                                        $(".MessageToEmployee").removeClass('intro');
                                    });
                                    $.each(resp.errors,function (name,error) { $(".MessageToEmployee[name="+name+"]").addClass('intro'); });
                                    return ;
                                }    
                                $("#DialogEmployeeMessage").modal('hide');
                                $("#myModalContactUser").modal('show');
                                $(".EmployeeRequestDialog-text").html("{$employee->getFormatter()->getUsername()->ucfirst()}"); 
                            }
                        
                }); 
     });
     
      
       
</script>   

{/if}    