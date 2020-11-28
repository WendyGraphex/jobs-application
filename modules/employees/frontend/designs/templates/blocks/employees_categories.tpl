{if in_array($tpl,['default','mixed'])}
    {include file="./tpl/_categories_`$tpl`.tpl"}      
{else}
    {include file="./tpl/_categories_default.tpl"}      
{/if}         