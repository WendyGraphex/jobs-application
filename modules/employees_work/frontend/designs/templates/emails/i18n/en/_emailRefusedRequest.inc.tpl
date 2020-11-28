{if $model_i18n && $model_i18n->isLoaded()}
    {eval $model_i18n->get('body')}
{else}                   
    Dear {$payment_request.employee.username},<br/><br/>
    {__('Payment has been refused by %s',$payment_request.employer.username)} <br/>
    {$payment_request.reference}  : {$payment_request.total_price_with_tax}
    Hi [Freelancer],
    We wanted to inform you that the payment you have requested has been recently declined. The decline could be due to card expiration, insufficient funds, card number change, etc. Please verify the information and resend payment.
    <br/>Thanks,
    {include file="./includes/footer-email.tpl"}
{/if}