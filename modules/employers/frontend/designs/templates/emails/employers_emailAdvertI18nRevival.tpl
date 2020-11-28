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
                <center><strong>It’s easier than ever to make money in the comfort of your home.</strong></center>
                {$advert.employer.courtesy} {$advert.employer.gender.short} {$adver.employer.firstname} {$advert.employer.lastname}
                We wanted to let you know that the application you’ve started did not complete. Please go back to the application before it expires. 
                Need help resolving issues with this application process. Please Visit the Smart Room Center. <lien contact employer>
                {include file="./includes/footer-email.tpl"}
            </div>
        {/if}
    </body>
</html>

