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
            <center><strong>It’s easier than ever to make money in the comfort of your home.</strong></center>
            Querido {$employee.firstname} {$employee.lastname}<br><br>
            Queremos informarle que la aplicación que inició no se completó. Regrese a la aplicación antes de que caduque.<br>
                Necesita ayuda para resolver problemas con este proceso de solicitud. Visite el Smart Room Center.<br><br>
              
           Equipo de tecnología de {$company.commercial}<br><br>
            ------
            <div class="LogoCompanyCongratEmail">
              <img title="Logo" class="logo" src="{$company.picture.url}" alt="Logo">              
            </div>
            {*<h3>{$company.web}</h3>*}
        </div>
            {/if}
    </body>
</html>

