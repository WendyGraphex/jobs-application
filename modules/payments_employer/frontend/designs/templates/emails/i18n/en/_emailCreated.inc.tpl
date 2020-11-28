{if $model_i18n && $model_i18n->isLoaded()}
    {eval $model_i18n->get('body')}
{else}                      
    Hi {$payment.employer.username},<br><br>

    Thank you for your payment on your recent accepted offer(s). We appreciate being able to serve your needs.<br><br>

    At any time, you can review your account with us including invoices, receipts, and payments.  Just click the below link and you’ll be automatically logged into our billing center:<br><br>

    <a href="{$links.login_employer}" style="font-weight: bold;text-decoration: underline;">Login to your account</a><br><br>

    Don’t forget we are here for you for any questions and concerns. If you’re not happy for whatever reason, we’ll happily help you choose another freelancer, or refund your money. Charges and fees may apply.<br><br>

    We look forward to doing business with you in the future.<br><br>

    {include file="./includes/footer-email.tpl"}
    
{/if}
