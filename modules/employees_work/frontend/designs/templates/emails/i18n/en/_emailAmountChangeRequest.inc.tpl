{if $model_i18n && $model_i18n->isLoaded()}
    {eval $model_i18n->get('body')}
{else}                   

    Dear {$payment_request.employee.username},<br><br>
    {__('Payment has been changed')}<br>

    {$payment_request.previous_total_price_with_tax}  ===> {$payment_request.total_price_with_tax}

    Due to the modification in your receipt offer we wanted to inform you that the amount has been changed.

    {include file="./includes/footer-email.tpl"}
{/if}