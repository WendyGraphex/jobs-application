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
            <center>C’est plus facile que jamais de gagner de l’argent dans le confort de votre maison.</center>
            Cher {$employee.firstname} {$employee.lastname}<br><br>
            Nous souhaitons vous informer que l’application que vous avez lancée n'est pas terminée. Veuillez revenir à l'application avant son expiration.<br>
            Besoin d'aide pour résoudre les problèmes liés à ce processus de demande. Veuillez visiter le Smart Room Center.<br><br>
              
            Équipe de Technologie {$company.commercial} <br><br>
            ------
            <div class="LogoCompanyCongratEmail">
              <img title="Logo" class="logo" src="{$company.picture.url}" alt="Logo">              
            </div>
            {*<h3>{$company.web}</h3>*}
        </div>
            {/if}
    </body>
</html>

