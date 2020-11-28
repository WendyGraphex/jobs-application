{$advert.employee.courtesy} {$advert.employee.gender.short} {$adver.employee.firstname} {$advert.employee.lastname}<br><br>
Your job [{$advert.reference}] has been created:<br><br/>

{foreach $advert.advert_i18n_list as $advert_i18n}
    Job [<a href="{$advert_i18n.url}">{$advert_i18n.reference}]</a> <br/>
{/foreach}    
{* + liste / langues *}
{include file="./includes/footer-email.tpl"}

