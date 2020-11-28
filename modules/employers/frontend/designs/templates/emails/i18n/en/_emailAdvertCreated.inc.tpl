{if $model_i18n && $model_i18n->isLoaded()}
    {eval $model_i18n->get('body')}
{else}                   
    {$advert.employer.courtesy} {$advert.employer.gender.short} {$adver.employer.firstname} {$advert.employer.lastname}<br><br>
    {__('Advert created')}<br>
    --
    {include file="./includes/footer-email.tpl"}
{/if}