{if $model_i18n && $model_i18n->isLoaded()}
    {eval $model_i18n->get('body')}
{else}                   
    Dear {$quotation.employee.username},<br><br>
    Thank you for doing business with us, we hope to work with you again in a near future  
    
    {include file="./includes/footer-email.tpl"}
    
{/if}
