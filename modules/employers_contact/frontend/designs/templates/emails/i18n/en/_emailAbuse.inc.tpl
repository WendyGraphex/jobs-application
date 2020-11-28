{if $model_i18n && $model_i18n->isLoaded()}
    {eval $model_i18n->get('body')}
{else}                   
    {__('New abuse for advert')} : <a href="{$abuse.advert_i18n.url}">{$abuse.advert_i18n.title}</a>
{/if}
Message abuse: (for employer and employer)<br/>
Hi ....,<br/><br/>
We are sorry that, you had to experience this, It is not common to our platform, but we 
thank you for providing this info. we've passed your question on to another team because they're experts in solving problems like yours. We’ll let you know as soon as we have an update.
We appreciate your patience.

{include file="./includes/footer-email.tpl"}

