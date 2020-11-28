{if $model_i18n && $model_i18n->isLoaded()}
    {eval $model_i18n->get('body')}
{else}                   
    Dear {$payment_request.employee.username},<br><br>
    {__('Payment has been confirmed by %s',$payment_request.employer.username)} <br>

    Woooww! Good News!
    We wanted to inform you that your payment has been automatically accepted.
    Great Job!<br/>
    {$payment_request.reference}  : {$payment_request.total_price_with_tax}
    {include file="./includes/footer-email.tpl"}
{/if}

