    
{if $model_i18n && $model_i18n->isLoaded()}
    {eval $model_i18n->get('body')}
{else}            
    {$user.courtesy} {$user.gender.short} {$user.firstname} {$user.lastname}<br><br>
    A link has been sent to your email including a temporary password:{$user.clear_password}

    Click the link below to access your account <br/>

    <a href="{url_to('employers_login')}" style="font-weight: bold;text-decoration: underline;">{__('Connect to your account')}</a>

    {include file="./includes/footer-email.tpl"}
{/if}