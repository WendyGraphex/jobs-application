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
            Merci beaucoup d'avoir essayé de publier votre offre de travail. Après avoir soigneusement examiné ce qui est décrit dans votre offre, nous devons regrettablement le refuser. L'offre ne répond pas aux exigences de nos règles, conditions et directives communautaires en vigueur.<br>
              
            Veuillez consulter nos politiques d'affichage des offres d'emploi. Si vous avez d'autres questions, contactez notre service client en cliquant sur le lien ci-dessous.<br><br>
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

