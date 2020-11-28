<!DOCTYPE html>
<html lang="{$_request->getLanguage()}">
    <head>
        <title>{component name="/site_company/Display" COMMENT=false} - {component name="/site_shop/display" field='meta_title' COMMENT=false}</title>   
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="short icon" type="image/png" href="/web/pictures/favicon-graphex.png"/>
        <link rel="stylesheet"  media="all" href="{url('css/open-iconic-bootstrap.min.css','web','frontend')}">
        <link rel="stylesheet"  media="all" href="{url('css/animate.css','web','frontend')}">
        <link rel="stylesheet" href="{url('majestic/css/vendors/mdi/css/materialdesignicons.min.css','web')}">
        <link rel="stylesheet" media="all" href="{url('css/owl.carousel.min.css','web','frontend')}">
        {*<link rel="stylesheet" media="all" href="{url('css/owl.theme.default.min.css','web','frontend')}">*}
        <link rel="stylesheet" media="all" href="{url('css/magnific-popup.css','web','frontend')}">
        <link rel="stylesheet" media="all" href="{url('css/aos.css','web','frontend')}">
        <link rel="stylesheet" media="all"  href="{url('css/ionicons.min.css','web','frontend')}">
        <link rel="stylesheet" media="all" href="{url('/majestic/css/font-awesome/4.7.0/font-awesome.min.css','web','frontend')}"/>
        {*<link rel="stylesheet" media="all"  href="{url('css/font-awesome.min.css','web','frontend')}">*}

        <link rel="stylesheet" media="all" href="{url('css/bootstrap-datepicker.css','web','frontend')}">
        <link rel="stylesheet" media="all" href="{url('css/jquery.timepicker.css','web','frontend')}">
        <link rel="stylesheet" media="all" href="{url('css/flaticon.css','web','frontend')}">
        <link rel="stylesheet" media="all" href="{url('css/icomoon.css','web','frontend')}">
        <link rel="stylesheet" media="all"  href="{url('css/style.css','web','frontend')}">
        <link rel="stylesheet" media="all" href="{url('css/dropzone.css','web','frontend')}">
        <link rel="stylesheet" media="all" href="{url('majestic/css/owl.carousel.css','web','frontend')}">
        <link rel="stylesheet" media="all" href="{url('majestic/css/owl.theme.css','web','frontend')}">
        {*<link rel="stylesheet" media="all" href="{url('majestic/css/bootstrap/bootstrap.css','web','frontend')}">*}    
        <link rel="stylesheet" media="all" href="{url('css/ui/1.12.1/jquery-ui.min.css','web','frontend')}">
        <script src="{url('js/jquery/3.2.1/jquery-3.2.1.min.js','web','frontend')}"></script>
    </head>
    <body>
         {include file="./includes/header-nav.tpl"}
        <section class="ftco-section bg-light sectionCategoriesTop sectionMarginTop">
            <div id="page-wrapper" class="container">  
                <div style="padding: 20px;color: #222;">
                    {if in_array($user->getLanguage(),['en','fr','es'])}
                        {include file="./i18n/`$user->getLanguage()`/_validateEmailError.inc"}
                    {else}
                        {include file="./i18n/en/_validateEmailError.inc"} 
                    {/if}    
                </div>
            </div>
        </section>

            {include file="./includes/footer.tpl"}


            <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

            {component name="/employers/postAJob"}

            {component name="/employees/wantAJob"}

            <script src="{url('js/jquery-migrate-3.0.1.min.js','web','frontend')}"></script>
            <script src="{url('js/popper.min.js','web','frontend')}"></script>
            <script src="{url('js/bootstrap.min.js','web','frontend')}"></script>
            <script src="{url('js/jquery.easing.1.3.js','web','frontend')}"></script>
            <script src="{url('js/jquery.waypoints.min.js','web','frontend')}"></script>
            <script src="{url('js/jquery.stellar.min.js','web','frontend')}"></script>
            <script src="{url('js/owl.carousel.min.js','web','frontend')}"></script>
            <script src="{url('js/jquery.magnific-popup.min.js','web','frontend')}"></script>
            <script src="{url('js/aos.js','web','frontend')}"></script>
            <script src="{url('js/jquery.animateNumber.min.js','web','frontend')}"></script>
            {*  <script src="{url('js/bootstrap-datepicker.js','web','frontend')}"></script> *}
            <script src="{url('js/scrollax.min.js','web','frontend')}"></script>

            {*  <script src="{url('js/google-map.js','web','frontend')}"></script> *}
            <script src="{url('js/main.js','web','frontend')}"></script>
            {component name="/utils_dropzone/resources" version="5.7.0"}  
            <script src="{url('js/jquery.custom.js','web','frontend')}"></script>
            <script src="{url('js/ui/1.12.1/jquery-ui.min.js','web','frontend')}" type="text/javascript"></script> 
    </body>
</html>

