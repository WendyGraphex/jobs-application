{if $model_i18n && $model_i18n->isLoaded()}
    {eval $model_i18n->get('body')}
{else}                   
    Project dates changes<br/>
    Dear .... <br/><br/>
    We would like to inform you that a request has been made by your freelancer [XXXXX] to change the starting date of your project [XXXX].
    Thank you!
    
    {include file="./includes/footer-email.tpl"}
    
{/if}