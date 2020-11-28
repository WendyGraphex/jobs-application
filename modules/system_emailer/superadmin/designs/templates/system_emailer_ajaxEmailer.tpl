{component name="/dashboard/sublink"} 
{messages class="system-emailer-errors"}
<fieldset>
<table cellpadding="0" cellspacing="0">
     <tr>
        <td>{__('Host')}
        </td>
        <td>{$transport->getHost()}
        </td>
    </tr>
    <tr>
        <td>{__('Port')}
        </td>
        <td>{$transport->getPort()}
        </td>
    </tr>
    <tr>
        <td>{__('Encryption')}
        </td>
        <td>{if $transport->getEncryption()}
                {$transport->getEncryption()}
            {else}
                {__('No encryption')}
            {/if}    
        </td>
    </tr>
    <tr>
        <td>{__('Username')}
        </td>
        <td>{$transport->getUsername()}
        </td>
    </tr>
    <tr>
        <td>{__('Password')}
        </td>
        <td>{$transport->getPassword()}
        </td>
    </tr>
</table>
<button id="SendByDefault">{__('Send Email by default')}</button>           
</fieldset>     

<fieldset>
<table cellpadding="0" cellspacing="0">
     <tr>
        <td>{__('From')}
        </td>
        <td><input type="text" size="60" class="SystemEmail Input" name="from" value="{$form.from}"/>
        </td>
    </tr>
     <tr>
        <td>{__('Email')}
        </td>
        <td><input type="text" size="60" class="SystemEmail Input" name="email" value=""/>
        </td>
    </tr>
     <tr>
        <td>{__('Text')}
        </td>
        <td><textarea cols="80" rows="4" class="SystemEmail Input" name="body" placeholder="{__('Your text')}">{__('Text emailer')}</textarea>
        </td>
    </tr>
</table>
<button id="Send">{__('Send Email')}</button> 
</fieldset>
<script type="text/javascript">

        $("#SendByDefault").click( function () {             
            return $.ajax2({                
                url: "{url_to('system_emailer_ajax',['action'=>'SendEmailByDefault'])}",      
                errorTarget: ".system-emailer-errors",
                success: function(resp)
                         {
                             
                         }
           });
         }); 
         
         
        $("#Send").click( function () {             
            var params = { SystemEmailer: {   token:'{$form->getCSRFToken()}' } };
            $(".SystemEmail.Input").each(function () { params.SystemEmailer[$(this).attr('name')]=$(this).val(); });
            return $.ajax2({    
                data : params,
                url: "{url_to('system_emailer_ajax',['action'=>'SendEmail'])}",  
                errorTarget: ".system-emailer-errors",
                success: function(resp)
                         {
                             
                         }
           });
         }); 
         
</script>