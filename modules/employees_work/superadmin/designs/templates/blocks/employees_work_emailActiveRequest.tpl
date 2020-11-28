<!DOCTYPE html >
<html xmlns="http://www.w3.org/1999/xhtml" lang="{$_request->getLanguage()}" xml:lang="{$_request->getLanguage()}">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width" />		
	</head>
    <body>      
            {if $model_i18n && $model_i18n->isLoaded()}
               {eval $model_i18n->get('body')}
            {else}                   
        <div class="container email" style="font-size:16px;margin-top: 40px !important;width: 52%;margin: 0 auto;font-family: calibri !important;">
          {$payment_request.employer.username}<br><br>
          {__('A new payment is ready to be paid ')} <br>
              
              {$payment_request.reference}  : {$payment_request.total_price_with_tax}
              
              <p>{__('You have 24h from now to refused it')}</p>
              <p>{__('Over this delay, the payment will be automatically accepted')}</p>
              <br>
              <a href="{$payment_request.refused_url}">{__('Refused payment')}</a>
              <br>                
              
              {__('Cordialement')}<br><br>{__('L’équipe')} {$company.commercial}<br><br>
            --
            <div class="">
              <img title="Logo" class="logo" src="{$company.picture.url}" alt="Logo">              
            </div>
            <h3>{$company.web}</h3>
        </div>
            {/if}
    </body>
</html>
