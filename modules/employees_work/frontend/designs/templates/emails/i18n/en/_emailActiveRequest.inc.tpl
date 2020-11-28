{if $model_i18n && $model_i18n->isLoaded()}
    {eval $model_i18n->get('body')}
{else}                   
    {$payment_request.employee.username}<br/><br/>
    {__('Payment has been activated by %s',$payment_request.employer.username)} <br/>

    {$payment_request.reference}  : {$payment_request.total_price_with_tax}<br/>
    Dear Employer2,
    We wanted to inform you that a payment has been sent 
    To accept or decline your payment , please click on the link below
    [ BUTTON ACCEPTED GREEN] 
    [ BUTTON REFUSE RED ]
    Keep in mind , if you don't take any action your payment will be automatically accepted       .
    ..........
    {include file="./includes/footer-email.tpl"}
{/if}