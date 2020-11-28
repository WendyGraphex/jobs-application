<!DOCTYPE html>
<html lang="{$_request->getLanguage()}">
<head>
     <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="short icon" type="image/png" href="/web/pictures/favicon-graphex.png"/>
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>{component name="/site_company/Display" field='name' COMMENT=false} - {__('Home')}</title>   

    <!-- Favicon -->
    <link rel="icon" href="{url('/core-img/favicon.ico','picture')}">

    <!-- Core Stylesheet -->
    <link href="{url('/style.css','web','frontend')}" rel="stylesheet">

    <!-- Responsive CSS -->
    <link href="{url('css/responsive/responsive.css','web','frontend')}" rel="stylesheet">
    <link rel="stylesheet" href="{url('/vendors/mdi/css/materialdesignicons.min.css','web')}">
     <script src="{url('js/jquery/jquery-2.2.4.min.js','web','frontend')}"></script>
</head>

<body>
    <!-- Preloader -->

   
    <!-- ***** Header Area Start ***** -->
        {include file="./includes/header-nav.tpl"}
    <!-- ***** Header Area End ***** -->
    
    <div class="div-top"></div>
    <div class="container div-content">
          {component name="/cms_pages/pageDisplay" page="cookies"}
    </div>

      {include file="./includes/footer.tpl"}
      
      {component name="/employers/postAJob"}    
        {component name="/employees/wantAJob"}
</body>

</html>



