 Dear {$advert.employee.gender.short} {$adver.employee.firstname} {$advert.employee.lastname}, <br/><br/>

We are thrilled to formally inform you that your job offer has been posted. We are looking forward to working with you and we are going to work together so our customers can have the best experience ever. 
<br/><br/>
{foreach $advert.advert_i18n_list as $advert_i18n}
    Job [<a href="{$advert_i18n.url}">{$advert_i18n.reference}]</a> <br/>
{/foreach} 

{include file="./includes/footer-email.tpl"}
