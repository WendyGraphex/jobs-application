<html xmlns="http://www.w3.org/1999/xhtml" lang="{$_request->getLanguage()}" xml:lang="{$_request->getLanguage()}">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width" />
        <link rel="stylesheet" media="all" href="/web/majestic/css/font-awesome/4.7.0/font-awesome.min.css"/>
        <style>
            a:hover, a:focus {
                color: #222;
                text-decoration: none;
            }
            .email-div{
                font-size:16px;
                margin-top: 40px !important;
                width: 52%;
                margin: 0 auto;
                font-family: calibri !important;
            }
            .social-email a{
                padding: 8px;
            }
            .social-email img{
                width: 50px;
            }
            @media (max-width: 769px) {
                .email-div{
                    width: 98%;
                }
                .social-email{
                    text-align: center;
                }
                .social-email img{
                    width: 40px !important;
                }
            }
        </style>
    </head>
    <body>      
        {if $model_i18n && $model_i18n->isLoaded()}
            {eval $model_i18n->get('body')}
        {else}                
            <div class="container email email-div">
                <div style="padding: 20px;background-color: #dfdfdf;">
                    {if in_array($_request->getLanguage(),['en'])}
                        {include file="./emails/i18n/`$_request->getLanguage()`/_emailEmployerSchedule.inc.tpl"}
                    {else}
                        {include file="./emails/i18n/en/_emailEmployerSchedule.inc.tpl"}
                    {/if}
                </div>
            </div>      
        {/if}
    </body>
</html>
