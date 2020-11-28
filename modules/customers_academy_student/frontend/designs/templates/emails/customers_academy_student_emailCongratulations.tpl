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
            {$student.courtesy} {$student.gender.short} {$student.firstname} {$student.lastname}<br><br>
           {__('Your account is active and you can start working today. Download the app to start receiving our job alerts and make money in second in the comfort of your home!')}<br>

              {__('To finalize your account, please to follow the link:')}<br>
              <a href='{$token.url}'>{__('Continue to validate your account')}</a><br><br>

             {__('Cordialement')}<br><br>{$company.commercial}{__('Technology Team')} <br><br>
            ------
            <div class="LogoCompanyCongratEmail">
              <img title="Logo" class="logo" src="{$company.picture.url}" alt="Logo">              
            </div>   
            {*<h3>{$company.web}</h3>*}
        </div>
        {/if}
    </body>
</html>

