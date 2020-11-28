{if in_array($tpl,['default','home','popular','single','advert'])}
  {include file="./tpl/_advert_`$tpl`.tpl"}
{else}
    {include file="./tpl/_advert_default.tpl"}
{/if}    