{if $model_i18n && $model_i18n->isLoaded()}
    {eval $model_i18n->get('body')}
{else}                   
    Dear {$payment.employee.username},<br><br>
    We hope you are well.
    We wanted to inform you that your payment has been posted for the job(s) you have done for :
    the client Employer3  Reference number………. amount $150
    the client Employer2  Reference number………. amount $150
    the client Employer3  Reference number………. amount $150
    the client ……………….. Reference number………. amount $150
    the client ……………….. Reference number………. amount $150
    the client ……………….. Reference number………. amount $150<br/>
    <strong>Total $700</strong>
    
    {include file="./includes/footer-email.tpl"}
    
{/if}