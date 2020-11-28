{if in_array($user->getLanguage(),['en','fr','es'])}
    {include file="./i18n/`$user->getLanguage()`/_validateEmailError.inc"}
{else}
    {include file="./i18n/en/_validateEmailError.inc"} 
{/if}    