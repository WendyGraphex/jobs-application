      
{if $model_i18n && $model_i18n->isLoaded()}
    {eval $model_i18n->get('body')}
{else}                       
    Thanks for your last payment!<br/>
    We wanted to inform you that your job reference number [{$project.reference}] has been paid 
    Therefore, no more action can be taken. 
    It was nice doing business with you. I look forward to working with you again in near future.
    If you were happy about the project, please review/rate the job that will help me to grow my business.
    Thank you so much for your business.
    
    {include file="./includes/footer-email.tpl"}
    
{/if}