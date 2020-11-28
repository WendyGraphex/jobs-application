{if $model_i18n && $model_i18n->isLoaded()}
    {eval $model_i18n->get('body')}
{else}                   
    {$order.employer.courtesy} {$order.employer.gender.short} {$order.employer.firstname} {$order.employer.lastname},<br><br>
    {__('Order cancelled')}<br>

    {include file="./includes/footer-email.tpl"}
{/if}
