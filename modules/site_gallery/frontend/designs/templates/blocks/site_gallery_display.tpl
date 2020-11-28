 <!--  gallery-{$tpl} -->
{if in_array($tpl,['default','partners','academy','academy_advise','blog'])}
   {include file="./tpl/_gallery_`$tpl`.tpl"}
{else}
   {include file="./tpl/_gallery_default.tpl"} 
{/if}