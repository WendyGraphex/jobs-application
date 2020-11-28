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
            {$payment.employee.username}<br><br>
            We hope you are well.
            We wanted to inform you that your payment has been posted for the job you have done for the client employer3.. Reference number…Qhjgsjhfsf.
            {include file="./includes/footer-email.tpl"}
        </div>
        {/if}
    </body>
</html>
    
{*
<!DOCTYPE html >
<html xmlns="http://www.w3.org/1999/xhtml" lang="{$_request->getLanguage()}" xml:lang="{$_request->getLanguage()}">
    <head>
        <link rel="stylesheet" media="all" href="/web/majestic/css/bootstrap/bootstrap.css">
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
            <div class="container email" style="font-size:16px;margin-top: 40px;">
                <div style="padding: 20px;background-color: #dfdfdf;">
                    {if in_array($_request->getLanguage(),['en'])}
                        {include file="./emails/i18n/`$_request->getLanguage()`/_emailEmployeeQuotationPaid.inc.tpl"}
                    {else}
                        {include file="./emails/i18n/en/_emailEmployeeQuotationPaid.inc.tpl"}
                    {/if}
                </div>
            </div>      
        {/if}
    </body>
</html>
*}

