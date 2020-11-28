<!DOCTYPE html>
<html lang="{$_request->getLanguage()}">
    <head>
        <meta charset="utf-8">
        <title>{component name="/site_company/Display" COMMENT=false} - {component name="/site_shop/display" field='meta_title' COMMENT=false}</title>  
        <meta name="description" content="{component name="/site_shop/display" field='meta_description' COMMENT=false}">       
        <meta name="keywords" content="{component name="/site_shop/display" field='meta_keywords' COMMENT=false}">   
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
        <div id="actions">
            {include file="./includes/header-nav.tpl"}
            <div id="actions-ctn"> 
                <div class="DivCarouselPicture">
                    {component name="/site_gallery/display" gallery="Home" tpl="default"}
                    <div class="container ConatinerSearch">
                        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-start" data-scrollax-parent="true">
                            <div class="col-xl-10 ftco-animate mb-5 pb-5 ClassPaddingTop" data-scrollax=" properties: { translateY: '70%' }" style="margin: 0px auto; padding-top: 150px;z-index: 2;">
                                {*<p class="mb-4 mt-5 pt-5" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">We have <span class="number" data-number="850000">0</span> great job offers you deserve!</p>*}                                                     
                                <div class="ftco-search">
                                    {*<input type="text" class="form-control" placeholder="Search" style="font-size: 16px;"/>*}
                                    <div class="row">
                                        <div class="col-md-12 nav-link-wrap">
                                            <div class="nav nav-pills text-center" id="v-pills-tab" role="tablist" aria-orientation="vertical">                                          
                                                {component name="/employers/findWorkTab"}
                                                {component name="/employees/findEmployeeTab"}		
                                            </div>
                                        </div>
                                        <div class="col-md-12 tab-wrap">			            
                                            <div class="tab-content p-4" id="v-pills-tabContent">			                                                     
                                                {component name="/employers/findWorkPanel"}
                                                {component name="/employees/findEmployeePanel"}	
                                            </div>
                                        </div>
                                    </div>
                                </div>  
                            </div>
                        </div>
                    </div>
                </div>

                {component name="/cms_pages/pageDisplay" page="marketing"}
                {component name="/partners/menu" node="top_category" tpl="top_category"} 
                {component name="/employers/popularWork" tpl="default"} 
                {component name="/site_gallery/display" gallery="AcademyAdvise" tpl="academy_advise"}    
                {component name="/cms_pages/pageDisplay" page="howitworks"}                      
                {component name="/employees/listAdvert" options=['nbitemsbypage'=>5,'order'=>['created_at'=>'desc']] tpl="recents"}
                {component name="/employers/listAdvert" query="last" tpl="recents" limit=10}
                {component name="/employees/listSkills" options=['nbitemsbypage'=>'*','order'=>['created_at'=>'desc']] tpl="best_skills"} 
                {component name="/employers/displayPopularAdvert" tpl="default"}               
                {component name="/employers/listPopulars" options=['limit'=>10]}
                {*component name="/site_comment/displayGallery" gallery="Home" tpl="default"*} 

                {*============================================================== YOUR CULTURE ============================================================*}
                {*<section class="ftco-section">
                <div class="container">
                <div class="row justify-content-center mb-5 pb-3">
                <div class="col-md-7 heading-section text-center ftco-animate fadeInUp ftco-animated">
                <h2 class="mb-4"><span>How</span> ????????????????</h2>
                </div>
                </div>
                <div class="row">
                <div class="col-lg-3 col-md-3 ftco-animate fadeInUp ftco-animated sectionHowItWork">
                <div style="text-align: center;">
                <div class="sectionHowItWork-divImage">
                <img src="/web/pictures/translation11.png">
                </div>
                <div class="sectionHowItWork-divDescription">
                <h4>Teach Your Culture</h4>
                <p class="divDescription-P">dzef dfedfref a aaa aaaaaaa aaaaaaaaa aaaa aknkn niinono ibibib</p>
                </div>
                </div>
                </div>
                <div class="col-lg-3 col-md-3 ftco-animate fadeInUp ftco-animated sectionHowItWork">
                <div style="text-align: center;">
                <div class="sectionHowItWork-divImage">
                <img src="/web/pictures/translation11.png">
                </div>
                <div class="sectionHowItWork-divDescription">
                <h4>Entertain Your Passion</h4>
                <p class="divDescription-P">dzef dfedfref a aaa aaaaaaa aaaaaaaaa aaaa aknkn niinono ibibib</p>
                </div>
                </div>
                </div>
                <div class="col-lg-3 col-md-3 ftco-animate fadeInUp ftco-animated sectionHowItWork">
                <div style="text-align: center;">
                <div class="sectionHowItWork-divImage">
                <img src="/web/pictures/translation11.png">
                </div>
                <div class="sectionHowItWork-divDescription">
                <h4>Play Your Hobby</h4>
                <p class="divDescription-P">dzef dfedfref a aaa aaaaaaa aaaaaaaaa aaaa aknkn niinono ibibib</p>
                </div>
                </div>
                </div>
                <div class="col-lg-3 col-md-3 ftco-animate fadeInUp ftco-animated sectionHowItWork">
                <div style="text-align: center;">
                <div class="sectionHowItWork-divImage">
                <img src="/web/pictures/translation11.png">
                </div>
                <div class="sectionHowItWork-divDescription">
                <h4>Experience other’s Experience</h4>
                <p class="divDescription-P">dzef dfedfref a aaa aaaaaaa aaaaaaaaa aaaa aknkn niinono xxxxx</p>
                </div>
                </div>
                </div>
                </div>
                </div>
                </section> *}

                {component name="/cms_pages/pageDisplay" page="numbers"}
                {component name="/employees/listPopulars" options=['limit'=>10]}
                {component name="/site_event/last"}
                {component name="/site_gallery/display" gallery="Partners" tpl="partners"}                                   
                {component name="/site_gallery/display" gallery="Academy" tpl="academy"}                              

            </div>

            {component name="/customers_newsletter/signin"}	                                          
            {include file="./includes/footer.tpl"}
            {component name="/site_cookie/panel"}
        </div>

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
     
<script type="text/javascript">
      
    
    $("#owl-demo1").owlCarousel({
        loop: true,
        autoPlay: 3000,
        autoplay: true,
        items: 3,
        nav: false,
        dots: true,
        margin: 30,
        navText : ["<img src='/web/pictures/previous1.png'>","<img src='/web/pictures/next1.png'>"],
        responsive: {
            0: {
                items: 1
            },
            857: {
                items: 2
            },
            1000: {
                items: 3
            },
            {*1020: {
                items: 4
            }*}
        },
    });
    

    $("#owl-demo2").owlCarousel({
        loop: true,
        autoPlay: 3000,
        autoplay: true,
        items: 3,
        nav: false,
        dots: true,
        margin: 30,
        navText : ["<img src='/web/pictures/previous1.png'>","<img src='/web/pictures/next1.png'>"],
        responsive: {
            0: {
                items: 1
            },
            857: {
                items: 2
            },
            1000: {
                items: 3
            }
        },
    });


    $("#PopularJobs").owlCarousel({
        loop: false,
        autoPlay: 3000,
        autoplay: false,
        items: 4,
        nav: false,
        dots: true,
        margin: 30,
        {*navText : ["<img src='/web/pictures/previous1.png'>","<img src='/web/pictures/next1.png'>"],*}
        responsive: {
            0: {
                items: 1
            },
            857: {
                items: 2
            },
            1000: {
                items: 3
            },
            1020: {
                items: 4
            }
        },
    });
    
    
    $('#owlCarouselAcademy').owlCarousel({
        autoPlay: 3000,
        autoplay: true,
        items: 1,
        nav: false,
        dots: false,
    });
    
    
    $('.OwlPopularSecond').owlCarousel({
        autoPlay: 3000,
        autoplay: true,
        items: 1,
        nav: true,
        dots: true,
        navText : ["<img src='/web/pictures/previous1.png'>","<img src='/web/pictures/next1.png'>"],
    });
     
                                    
        
        </script> 
        
      
    </body>
</html>
