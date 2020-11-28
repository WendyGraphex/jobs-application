<!DOCTYPE html>
<html lang="{$_request->getLanguage()}">
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>{component name="/site_company/Display" field='name' COMMENT=false} - {__('Our blog')}</title>   
        <link rel="short icon" type="image/png" href="/web/pictures/favicon-graphex.png"/>
        <link rel="stylesheet"  media="all" href="{url('css/open-iconic-bootstrap.min.css','web','frontend')}">
        <link rel="stylesheet"  media="all" href="{url('css/animate.css','web','frontend')}">
        <link rel="stylesheet" href="{url('majestic/css/vendors/mdi/css/materialdesignicons.min.css','web')}">
        <link rel="stylesheet" media="all" href="{url('css/owl.carousel.min.css','web','frontend')}">
        {*<link rel="stylesheet" media="all" href="{url('css/owl.theme.default.min.css','web','frontend')}">*}
        <link rel="stylesheet" media="all" href="{url('css/magnific-popup.css','web','frontend')}">
        <link rel="stylesheet" media="all" href="{url('css/aos.css','web','frontend')}">
        <link rel="stylesheet" media="all"  href="{url('css/ionicons.min.css','web','frontend')}">
        <link rel="stylesheet" media="all" href="{url('css/bootstrap-datepicker.css','web','frontend')}">
        <link rel="stylesheet" media="all" href="{url('css/jquery.timepicker.css','web','frontend')}">
        <link rel="stylesheet" media="all" href="{url('css/flaticon.css','web','frontend')}">
        <link rel="stylesheet" media="all" href="{url('css/icomoon.css','web','frontend')}">
        <link rel="stylesheet" media="all"  href="{url('css/style.css','web','frontend')}">
        {* <link rel="stylesheet"  media="all" href="{url('css/dropzone.css','web','frontend')}"> *}       
        <link rel="stylesheet" media="all" href="{url('majestic/css/owl.carousel.css','web','frontend')}">
        <link rel="stylesheet" media="all" href="{url('majestic/css/owl.theme.css','web','frontend')}">
        <link rel="stylesheet" href="{url('/css/awesome/4.7.0/css/font-awesome.min.css','web')}">
        <link rel="stylesheet" media="all" href="{url('css/blog.css','web','frontend')}">
        {*<link rel="stylesheet" media="all" href="{url('majestic/css/bootstrap/bootstrap.css','web','frontend')}">*}      
        <script src="{url('js/jquery/3.2.1/jquery-3.2.1.min.js','web','frontend')}"></script>      
        {header}
    </head>
    <body>
        <nav  class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">    
            <div class="divAllInside divAllInsideBlog">
                <div class="container">
                    {component name="/site_company/Display" tpl="logoCompany"}
                    <button class="navbar-toggler btnMenuResponsive" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="oi oi-menu"></span>{__('Menu')}
                    </button>
                    <button class="navbar-toggler btnCategoriesResponsive" type="button" data-toggle="collapse" data-target="#navCategories" aria-controls="navCategories" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="oi oi-menu"></span> {__('Categories')}
                    </button>
                    <div class="languagesAndCurrency second-languagesAndCurrency" style="display:none;">
                        <div class="languages-new-class">
                            {component name="/site_languages/list"}
                        </div>
                        <div class="devises-new-class">
                            {component name="/site_currency/list"}              
                        </div>
                    </div>
                    {include file="./includes/header.tpl"}
                </div>
                <div>
                    {component name="/customers_blog/menu" node="top" tpl="default"} 
                </div>
            </div>
        </nav>
        <section class="ftco-section bg-light sectionCategoriesTop sectionMarginTop">
            <div class="page-wrap d-flex flex-row align-items-center">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12 text-center">
                <span class="display-1 d-block">404</span>
                <div class="mb-4 lead">{__('The event you are looking for was not found.')}</div>
                <a href="/" class="btn btn-link"><i style="font-size: 19px;" class="mdi mdi-home"></i>{__('Back to Home')}</a>
            </div>
        </div>
    </div>          
        </section> 
        {component name="/customers_newsletter/signin"}	                                          
        {include file="./includes/footer.tpl"}

        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


        <script src="{url('js/jquery-migrate-3.0.1.min.js','web','frontend')}"></script>  
        <script src="{url('js/popper.min.js','web','frontend')}"></script>
        <script src="{url('js/bootstrap.min.js','web','frontend')}"></script>
        {*<script src="{url('js/jquery.easing.1.3.js','web','frontend')}"></script>*}
        <script src="{url('js/jquery.waypoints.min.js','web','frontend')}"></script> 
        <script src="{url('js/jquery.stellar.min.js','web','frontend')}"></script> 
        <script src="{url('js/owl.carousel.min.js','web','frontend')}"></script>
        <script src="{url('js/jquery.magnific-popup.min.js','web','frontend')}"></script>
        <script src="{url('js/aos.js','web','frontend')}"></script>
        <script src="{url('js/jquery.animateNumber.min.js','web','frontend')}"></script> 
        {* <script src="{url('js/bootstrap-datepicker.js','web','frontend')}"></script>  *}
        <script src="{url('js/scrollax.min.js','web','frontend')}"></script>  

        {* <script src="{url('js/google-map.js','web','frontend')}"></script>*}
        <script src="{url('js/main.js','web','frontend')}"></script>
        <script src="{url('js/jquery.custom.js','web')}"></script>  

 <script type="text/javascript">
     
    {*$("#SectionEvents-onEvents").owlCarousel({
        loop: false,
        autoPlay: 3000,
        autoplay: false,
        items: 4,
        nav: true,
        dots: true,
        margin: 30,
        navText : ["<img src='/web/pictures/previous1.png'>","<img src='/web/pictures/next1.png'>"],
    });*}
    
    $("#showTextEvent").click( function () { 
        $("#TextEvent").toggle();
    }); 
    
 </script>
 
</body>

</html>





