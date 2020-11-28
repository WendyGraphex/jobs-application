{component name="/dashboard/sublink"} 
<div id="actions-google-map">
    
    <table>
        <tr>
            <th>{__('Site')}</th>
            <th>{__('Key')}</th>
        </tr>
    {foreach $accounts as $account}
        <tr>
            <td>{$account->getSite()->get('site_host')}</td>
            <td>{$account->get('key')}</td>
        </tr>
    {/foreach}    
    </table>
</div>