<!doctype html>
<html lang="{$_request->getLanguage()}">
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>{component name="/site_company/Display" field='name' COMMENT=false} - {$page_i18n->getFormatter()->getMetaTitle()->ucfirst()}</title> 
        <link rel="short icon" type="image/png" href="/web/pictures/favicon-graphex.png"/>
        <meta name="description" content="{$page_i18n->getFormatter()->getMetaDescription()->ucfirst()}"/>
        <meta name="keywords" content="{$page_i18n->getFormatter()->getMetaKeywords()->ucfirst()}"/>
        <link rel="stylesheet"  media="all" href="{url('css/open-iconic-bootstrap.min.css','web','frontend')}">
        <link rel="stylesheet"  media="all" href="{url('css/animate.css','web','frontend')}">
        <link rel="stylesheet" href="{url('majestic/css/vendors/mdi/css/materialdesignicons.min.css','web')}">
        <link rel="stylesheet" media="all"  href="{url('css/style.css','web','frontend')}">  
        <script src="{url('js/jquery/3.2.1/jquery-3.2.1.min.js','web','frontend')}"></script>            
    </head>    
    <body id="index">       
             <div id="content">{eval $page->get('content') }</div>        
    </body>
</html>
