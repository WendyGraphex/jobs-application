{if $model_i18n && $model_i18n->isLoaded()}
    {eval $model_i18n->get('body')}
{else}                   
    Project finished<br/>

    {include file="./includes/footer-email.tpl"}
    
{/if}