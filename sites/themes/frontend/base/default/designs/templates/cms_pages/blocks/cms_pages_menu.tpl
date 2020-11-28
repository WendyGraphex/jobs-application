{if in_array($tpl,['academy-footer-left'])}
    {include file="./tpl/`$tpl`.tpl"}
{elseif in_array($tpl,['academy-footer-right'])}
    {include file="./tpl/`$tpl`.tpl"}
{elseif in_array($tpl,['academy-top'])}
    {include file="./tpl/`$tpl`.tpl"}
{elseif in_array($tpl,['about','safety','academy','blog','helpcenter'])}
   {include file="./tpl/footer-`$tpl`.tpl"}
{elseif in_array($tpl,['header'])}
    {include file="./tpl/header-`$tpl`.tpl"}
{/if}
