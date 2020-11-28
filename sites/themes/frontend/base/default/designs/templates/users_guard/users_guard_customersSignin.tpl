<!DOCTYPE html>
<html lang="{$_request->getCountry()}">
    <head>
           <meta name="viewport" content="width=device-width, initial-scale=1" />
                <link rel="stylesheet" href="{url('css/bootstrap.min.css','web')}" />
                <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="{url('css/main2.css','web')}" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
        {header}
    </head>
    <body>
        <div id="body" class="CustomersSignin">
             
            <div id="middle">                  
                      <div class="container-CustomersSignin">
                       <img class="logo" src="{url('pictures/logo.png','web')}">
                    <h2>Nos Mode D'inscription</h2>
                     <div>
                    {component name="/customers/signinLink"}
                     </div>
                     <div>
                    {component name="/customers_company/signinLink"}
                     </div>
                      </div>                  
            </div>
            <div id="bottom">
            </div>
        </div>
        
    </body>
</html>