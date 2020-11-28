<!DOCTYPE html >
<html xmlns="http://www.w3.org/1999/xhtml" lang="{$_request->getLanguage()}" xml:lang="{$_request->getLanguage()}">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width" />
        <style>
            a:hover, a:focus {
                color: #222;
                text-decoration: none;
            }
        </style>
    </head>
    <body>      
        {if $model_i18n && $model_i18n->isLoaded()}
            {eval $model_i18n->get('body')}
        {else}                
            <div class="container email" style="font-size:16px;margin-top: 40px !important;width: 52%;margin: 0 auto;font-family: calibri !important;">
                <div style="padding: 20px;background-color: #dfdfdf;">
                    {if in_array($_request->getLanguage(),['en'])}
                        {include file="./blocks/i18n/`$_request->getLanguage()`/_emailEmployeeRequestRevival.inc.tpl"}
                    {else}
                        {include file="./blocks/i18n/en/_emailEmployeeRequestRevival.inc.tpl"}
                    {/if}
                </div>
            </div>      
        {/if}
    </body>
</html>