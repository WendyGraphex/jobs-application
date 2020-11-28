{if $model_i18n && $model_i18n->isLoaded()}
    {eval $model_i18n->get('body')}
{else}    
    <div class="actionsPaddingTop  container email" style="font-size:16px;margin-left:100px;margin: 0;">          
        {$user.courtesy} {$user.gender.short} {$user.firstname} {$user.lastname},<br><br>
        {*If you didn’t change your password, please send us an email right now at <strong>{$company.email}</strong><br/>
        Just a reminder:<br/>
        <ul>
            <li>Never share your password with anyone.</li>
            <li>Create passwords that are hard to guess and don’t use personal information. Be sure to include uppercase and lowercase letters, numbers, and symbols.</li>
            <li>Use different passwords for each of your accounts, if you have more than one.</li>
        </ul>*}
        
        {__('Your password has been changed, if you didn’t change your password, give us a call at')} {$company.phone}
              
        {include file="./includes/footer-email.tpl"}
    </div>
{/if}
