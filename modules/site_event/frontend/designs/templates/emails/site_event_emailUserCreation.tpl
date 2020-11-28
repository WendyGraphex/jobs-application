<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="{$_request->getLanguage()}" xml:lang="{$_request->getLanguage()}">
	<head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <meta name="viewport" content="width=device-width" />  
<style>
    .btn-warning {
  color: #ffffff;   
  background-color: #259545;    /*#ffc107*/
  border-color: #259545; }      /*#ffc107*/
  .btn-warning:hover {
    color: #ffffff;
    background-color: #3ab05c;      /*#e0a800*/
    border-color: #3ab05c; } 
</style>
                
	</head>
 
<body class="Signup tooltips">
          <div class="container">

            <div class="Signup-header text-center">
                {*<img title="Logo" class="logo" src="{url("/pictures/logo.png","web","frontend")}" alt="{__('Logo Signup')}">*}  
                <img title="Logo" class="logo" src="{$_request->getSite()->getSite()->getPicture()->getUrl()}" alt="Logo Signup" style="width: 150px;"> 
            </div>        
            {if $model_i18n && $model_i18n->isLoaded()}
                {eval $model_i18n->get('body')}
            {else}    
        <div class="actionsPaddingTop  container email" style="font-size:16px;margin-left:100px;margin: 0;">          
          {$user.courtesy} {$user.gender.short} {$user.firstname} {$user.lastname}<br><br>
          {__('An email has been sent to your email to confirm your account.')}<br>            
              
              {__('You can access and complete your account by password')}: {$user.clear_password}
              
              {__('by the link')} <a href="{url_to('employers_login')}">{__('Connect to your account')}</a>
             {__('Cordialement')}<br><br>
             {__('L’équipe')} {$company.commercial}<br><br>
            --
            <div class="">
              <img title="{component name="/site_company/Display" field='name'}" class="logo" src="{$company.picture.url}" alt="Logo">              
            </div>
            <h3>{$company.web}</h3>
        </div>
            {/if}
        </div>      
</body>
</html>

