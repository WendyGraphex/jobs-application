      
{if $model_i18n && $model_i18n->isLoaded()}
    {eval $model_i18n->get('body')}
{else}                   
    <div class="container email email-div">
        {$payment.employee.username}<br><br>
        We hope you are well.
        We wanted to inform you that your payment has been posted for the job you have done for the client employer3.. Reference number…Qhjgsjhfsf.
        
        {include file="./includes/footer-email.tpl"}
        
    </div>
{/if}
