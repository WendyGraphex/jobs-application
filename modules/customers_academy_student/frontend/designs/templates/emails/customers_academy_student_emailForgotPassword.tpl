<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="{$_request->getLanguage()}" xml:lang="{$_request->getLanguage()}">
	<head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <meta name="viewport" content="width=device-width" />            	                                                 	                		 
	</head>
 
<body class="Signup tooltips">
    <div class="container ClassContainerEmail">
        {if $model_i18n && $model_i18n->isLoaded()}
            {eval $model_i18n->get('body')}
        {else}    
        <div class="email email-container" style="font-size:16px;">          
             <p style="font-size: 18px;text-align: center;margin-bottom: 10px;">
                {$user.courtesy} {$user.gender.short} {$user.firstname} {$user.lastname}
             </p>
             <p style="font-size: 18px;text-align: center;">
                  {__('Pour générer un nouveau mot de passe' )} 
             </p>
             <p style="font-size: 15px;text-align: center;margin-bottom: 9px;">
                  {__('veuillez cliquer sur le lien ci-après :')}
             </p>
             <p style="font-size: 17px;text-align: center;margin-bottom: 9px;color:#5d25dd!important;">
                    <a href='{$forgotpassword.uri}'>{__('générer un nouveau mot de passe')}</a>
             </p>
             <p style="font-size: 15px;text-align: center;">{__('Cordialement')}</p>
             <p style="font-size: 18px;text-align: center;color:#259545">{__('L’équipe')} {$company.commercial}</p>
             <hr>
             <div style="width:100%;text-align: center;margin-bottom: 17px;">
                  <img  title="{component name="/site_company/Display" field='name'}" class="logo" src="{$company.picture.url}" alt="Logo" style="max-width: 100px;max-height: 100px;margin: auto;">              
             </div>
                  <h3 style="text-align: center;">{$company.web}</h3>
        </div>
            {/if}
    </div>      
</body>
</html>

