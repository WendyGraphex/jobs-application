{if $model_i18n && $model_i18n->isLoaded()}
    {eval $model_i18n->get('body')}
{else}                   
    Project dates changes<br/>
    Dear ... <br/><br/>
    We would like to inform you that a request has been made to change the end date of your project. If you are not agree with the change, please contact us right away.
    Thank you!
    
    {include file="./includes/footer-email.tpl"}
    
{/if}