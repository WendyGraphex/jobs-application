{component name="/dashboard/sublink"} 
{messages}
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
<button id="Send">{__('Send Email')}</button>        

<script type="text/javascript">

  $("#Send").click( function () {             
            return $.ajax2({                
                url: "{url_to('site_ajax',['action'=>'SendEmail'])}",               
                success: function(resp)
                         {
                             
                         }
           });
         }); 
         
</script>