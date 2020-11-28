{if $model_i18n && $model_i18n->isLoaded()}
    {eval $model_i18n->get('body')}
{else}                   
    {$advert_i18n.employer.courtesy} {$advert_i18n.employer.gender.short} {$adver_i18n.employer.firstname} {$advert_i18n.employer.lastname},<br><br>
    {__('Advert closed')}<br>

    {include file="./includes/footer-email.tpl"}
{/if}