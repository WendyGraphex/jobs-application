{if $model_i18n->isLoaded()}
    {$model_i18n->get('body')}
{else}       
    from admin
    <div>{$message.message}</div>
    <div>{$message.sender}</div>
{/if}
{include file="./includes/footer-email.tpl"}