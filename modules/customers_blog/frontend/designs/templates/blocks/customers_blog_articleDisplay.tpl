{if in_array($tpl,['default','success','popular'])}
  {include file="./tpl/_article_`$tpl`.tpl"}
{else}
  {include file="./tpl/_article_default.tpl"}
{/if}