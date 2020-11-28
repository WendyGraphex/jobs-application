{if $model_i18n && $model_i18n->isLoaded()}
    {eval $model_i18n->get('body')}
{else}                   

    Dear {$payment_request.employee.username},<br/><br/>
    {__('Payment has been accepted by %s',$payment_request.employer.username)} <br/>
    {$payment_request.reference}  : {$payment_request.total_price_with_tax}<br/>
    Hi [Customer],
    Thanks for doing business with us! We appreciate you.
    You have a new payment request for the offer you just discussed with ……. Ref. Number…..
    Please follow the link below to view and download your invoice. For your convenience, you can easily pay online. We accept [Visa, MasterCard, PayPal, Western Union, Wire Transfer, and Online Check.]
    <a href="" style="font-weight: bold;text-decoration: underline;"><#YOUR_LINK#></a>
    If you have any questions or concerns, please don’t hesitate to reach out at Payroll@graphextech.com or 707-308-7070. We’re here for you!
    {include file="./includes/footer-email.tpl"}
{/if}

