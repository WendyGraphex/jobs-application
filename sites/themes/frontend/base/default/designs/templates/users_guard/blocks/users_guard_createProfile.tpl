{messages class="create-account-errors"}
<div class="col-md-6 account">
    <form action="{link_i18n("customers_signin")}" id="CreateProfile-form" method="POST">
        <div class="account-title">{__('Create your account')}</div>
            <div class="form-group">
                <div class="error-log">{$form.email->getError()}</div>
                <label>{__("Email")}</label>
                <input type="text" class="AccountCreation Input  form-control" name="CustomersSignin[email]" />
            </div>
            <div>
                <input type="checkbox" id="is_professional"/>{__('Professional')}
                <input type="hidden" name="CustomersSignin[token]" value="{mfForm::getToken('CreateProfileForm')}"/>
            </div>               
              <a href="javascript:void(0);" id="CreateAccount" class="enter btn btn-primary">{__('Create your account')}
              <i class="fa fa-chevron-right" style="margin-left: 10px;"></i></a>
    </form>           
</div> 
<script type="text/javascript">
    {*JqueryScriptsReady*}
 
    $("#CreateAccount").click(function() {   
                       $('#CreateProfile-form').submit(); 
                   });
                   
    $("#is_professional").click(function () { 
            $("#CreateProfile-form").attr('action',$(this).prop('checked')?'{link_i18n("customers_company_signin")}':'{link_i18n("customers_signin")}')
    });
    
    {*/JqueryScriptsReady*}
</script>    