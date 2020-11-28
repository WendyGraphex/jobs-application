<!DOCTYPE html >
<html xmlns="http://www.w3.org/1999/xhtml" lang="{$_request->getLanguage()}" xml:lang="{$_request->getLanguage()}">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width" />
    <link rel="stylesheet" href="{url('/majestic/css/style.css','web','frontend')}">
	</head>
    <body>      
            {if $model_i18n && $model_i18n->isLoaded()}
               {eval $model_i18n->get('body')}
            {else}                   
        <div class="container email" style="font-size:16px;margin-left:100px;width: 30%;margin-top: 150px;">
          {$employee.courtesy} {$employee.gender.short} {$employee.firstname} {$employee.lastname}<br><br>
          Your Advert is active and you can start working today. Download the app to start receiving our job alerts and make money in second in the comfort of your home!<br>
              
            Cordialement<br><br>{$company.commercial} Technology Team<br><br>
            ------
            <div class="LogoCompanyCongratEmail">
              <img title="Logo" class="logo" src="{$company.picture.url}" alt="Logo">              
            </div>
            {*<h3>{$company.web}</h3>*}
        </div>
            {/if}
    </body>
</html>

