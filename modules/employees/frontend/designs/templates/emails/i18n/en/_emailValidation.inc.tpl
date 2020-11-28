{if $model_i18n && $model_i18n->isLoaded()}
    {eval $model_i18n->get('body')}
{else}                   
    {*$employee.courtesy}   {$employee.firstname} {$employee.lastname*} 
    Welcome to the Graphex community!<br/><br/>

    We've sent you an email, please go to your email and click on the link to validate your account<br/><br/>

    <a href="{$token.url}" style="font-weight: bold;text-decoration: underline;color:#222;">{__('Continue to validate your account')}</a>

    {include file="./includes/footer-email.tpl"}
    
{/if}