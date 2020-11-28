{if $model_i18n && $model_i18n->isLoaded()}
    {eval $model_i18n->get('body')}
{else}                   
    Dear {$payment_request.employee.username},<br/><br/>
    {__('Payment has been confirmed by %s',$payment_request.employer.username)} <br/>
    Good News! 
    Congratulations!<br/>
    Graphex admin wanted to confirm you that the payment had just been accepted. <br/>
    Thank you! 
    {$payment_request.reference}  : {$payment_request.total_price_with_tax}
    {include file="./includes/footer-email.tpl"}
{/if}