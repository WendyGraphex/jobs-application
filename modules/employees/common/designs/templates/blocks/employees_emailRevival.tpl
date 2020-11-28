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
                                           
<center><strong>It’s easier than ever to make money in the comfort of your home.</strong></center>

{$advert.employee.courtesy} {$advert.employee.gender.short} {$advert.employee.firstname} {$advert.employee.lastname}

We wanted to let you know that the application you’ve started did not complete. Please go back to the application before it expires. 

Need help resolving issues with this application process. Please Visit the Smart Room Center. <lien contact employee>
<div style="margin-top: 40px;">
    <p>Sincerely,</p>
    <p>Graphex Technology Team</p>
    --
    <div class="" style="width: 200px;">
        <a href="{$company.url}"><img title="{$company.name}" class="logo" src="{$company.picture.url}" alt="{$company.name}" style="max-width: 100%;"></a>              
    </div><br/>
    <a href="{$company.url}">{$company.web}</a>
</div>

                </div>
            </div>      
        {/if}
    </body>
</html>