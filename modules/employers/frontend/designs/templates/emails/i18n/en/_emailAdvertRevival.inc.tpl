{if $model_i18n && $model_i18n->isLoaded()}
    {eval $model_i18n->get('body')}
{else}                   
    <center><strong>It’s easier than ever to make money in the comfort of your home.</strong></center><br/>
        {$advert.employer.courtesy} {$advert.employer.gender.short} {$adver.employer.firstname} {$advert.employer.lastname}
    We wanted to let you know that the application you’ve started did not complete. Please go back to the application before it expires. 

    Need help resolving issues with this application process. Please Visit the Smart Room Center. <lien contact employer>
    {include file="./includes/footer-email.tpl"}
{/if}