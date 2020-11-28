{if $model_i18n && $model_i18n->isLoaded()}
    {eval $model_i18n->get('body')}
{else}                   
    {$employer.courtesy} {$employer.gender.short} {$employer.firstname} {$employer.lastname}<br><br>
    Your account is active now. You can start posting jobs and browse our site to benefit from our millions of experts.<br>

    {include file="./includes/footer-email.tpl"}
{/if}
