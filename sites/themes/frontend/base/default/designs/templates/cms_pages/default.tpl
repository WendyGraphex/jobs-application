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
    <body>
        
        {include file="./includes/header-nav.tpl"}
        <section class="ftco-section bg-light sectionMarginTop">
            <div class="page-wrap d-flex flex-row align-items-center">
                <div class="container">
                    {eval $page_i18n->get('content')} 
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
        {*<script src="{url('js/jquery.easing.1.3.js','web','frontend')}"></script>*}
        <script src="{url('js/jquery.waypoints.min.js','web','frontend')}"></script> 
        <script src="{url('js/jquery.stellar.min.js','web','frontend')}"></script> 
        <script src="{url('js/jquery.magnific-popup.min.js','web','frontend')}"></script>
        <script src="{url('js/aos.js','web','frontend')}"></script>
        <script src="{url('js/jquery.animateNumber.min.js','web','frontend')}"></script> 
        {* <script src="{url('js/bootstrap-datepicker.js','web','frontend')}"></script>  *}
        <script src="{url('js/scrollax.min.js','web','frontend')}"></script>  
        {* <script src="{url('js/google-map.js','web','frontend')}"></script>*}
        <script src="{url('js/main.js','web','frontend')}"></script>
        <script src="{url('js/jquery.custom.js','web')}"></script> 
        {component name="/google_analytics/tag"}
    </body>

<script type="text/javascript">

    $('#textDefaultContact').keyup(function () {
        $('#charNumDefaultContact').text($(this).val().length >= {$max_characters} ? "{__('you have reached the limit')}" : {$max_characters} - $(this).val().length + "{__(' characters left')}");
    });

</script>
</html>
