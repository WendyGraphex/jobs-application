{messages class="site-smsbox-callback-errors"}
<h3>{__("SMS box callback settings")}</h3>
<div>    
    <a href="javascript:void(0);" id="SmsBoxCallback-Save" class="btn" style="display:none"><i class="fa fa-floppy-o" style="margin-right: 10px;"></i>{__('Save')}</a>
    <a href="javascript:void(0);" id="SmsBoxCallback-Cancel" class="btn" ><i class="fa fa-times" style="margin-right: 10px;"></i>{__('Cancel')}</a>
</div>
<fieldset>
    <h3>{__('Settings')}</h3>
    <div>
        <div class="errors_settings">{$form.ip_utils->getError()}</div>
        <label>{__('Ip Utils')}</label>
        <input type="text" class="settings" name="ip_utils" size="128" value="{$settings->get('ip_utils')}"/>
    </div>
    <div>
        <div class="errors_settings">{$form.ips_servers->getError()}</div>
        <label>{__('Ips Servers')}</label>
        <input type="text" class="settings" name="ips_servers" size="128" value="{$settings->get('ips_servers')}"/>
    </div>
    <div>
        <div class="errors_settings">{$form.host_utils->getError()}</div>
        <label>{__('Host Utils')}</label>
        <input type="text" class="settings" name="host_utils" size="128" value="{$settings->get('host_utils')}"/>
    </div>
    <div>         
        <div class="errors_settings">{$form.url_send_test->getError()}</div>
        <label>{__('Url Send Test')}</label>
        <input type="text" class="settings" name="url_send_test" size="128"  value="{$settings->get('url_send_test')}"/>
    </div>
    <div>         
        <div class="errors_settings">{$form.url_callback_test->getError()}</div>
        <label>{__('Url Callback Test')}</label>
        <input type="text" class="settings" name="url_callback_test" size="128" value="{$settings->get('url_callback_test')}"/>
    </div>
    <div>         
        <div class="errors_settings">{$form.action_callback_sent->getError()}</div>
        <label>{__('Action Callback Sent')}</label>
        <input type="text" class="settings" name="action_callback_sent" size="128" value="{$settings->get('action_callback_sent')}"/>
    </div>
    <div>         
        <div class="errors_settings">{$form.action_callback_return->getError()}</div>
        <label>{__('Action Callback Return')}</label>
        <input type="text" class="settings" name="action_callback_return" size="128" value="{$settings->get('action_callback_return')}"/>
    </div>
    <div>         
        <div class="errors_settings">{$form.action_utils->getError()}</div>
        <label>{__('Action utils')}</label>
        <input type="text" class="settings" name="action_utils" size="128" value="{$settings->get('action_utils')}"/>
    </div>
</fieldset>

<script type="text/javascript">

    $("input.settings").click(function(){         
        // $(".errors").messagesManager('clear');
        $("#SmsBoxCallback-Save").show();        
    });
         
    $(".settings").change(function(){
        // $(".errors").messagesManager('clear');
        $("#SmsBoxCallback-Save").show();        
    });
     
    $('#SmsBoxCallback-Cancel').click(function(){ 
        return $.ajax2({ url:"{url_to('services_smsbox_callback_ajax',['action'=>'ListPartialCallback'])}",
                        errorTarget: ".site-smsbox-callback-errors",
                        target: "#actions" 
                }); 
    });
         
    $('#SmsBoxCallback-Save').click(function(){ 
        var  params = { Settings: {  token :'{$form->getCSRFToken()}' } };
        $("input.settings,select.settings").each(function() { params.Settings[this.name]=$(this).val(); });                                         
        return $.ajax2({ data : params,                                 
                        url: "{url_to('services_smsbox_callback_ajax',['action'=>'SettingsCallback'])}",
                        errorTarget: ".site-smsbox-callback-errors",
                        target: "#actions"}); 
    });
    
</script>

