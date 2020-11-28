<!DOCTYPE html>
<html lang="{$_request->getLanguage()}">
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>{component name="/site_company/Display" field='name' COMMENT=false} - {__('Our services')}</title>
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
        <link rel="stylesheet" media="all" href="{url('css/dropzone.css','web','frontend')}">

        {*<link rel="stylesheet" media="all" href="{url('majestic/css/owl.carousel.css','web','frontend')}">*}
        <link rel="stylesheet" media="all" href="{url('majestic/css/owl.theme.css','web','frontend')}">
        <link rel="stylesheet" href="{url('/css/awesome/4.7.0/css/font-awesome.min.css','web')}">
        {*<link rel="stylesheet" media="all" href="{url('majestic/css/bootstrap/bootstrap.css','web','frontend')}">*}    
        <link rel="stylesheet" media="all" href="{url('css/ui/1.12.1/jquery-ui.min.css','web','frontend')}">
        <script src="{url('js/jquery/3.2.1/jquery-3.2.1.min.js','web','frontend')}"></script>      
        {header}
    </head>
    <body>

        {include file="./includes/header-nav.tpl"}
        <!-- END nav -->

        <section class="ftco-section bg-light sectionCategoriesTop sectionMarginTop">
            <div id="page-ctn" class="container">  
                {component name="/partners/breadcrumb" node=$node}                          
                {*if $node_i18n->getCategory()->hasPicture()}                 
                    <div class="categoriePicture">
                       <img src="{$node_i18n->getCategory()->getPicture()->getUrl()}"/>
                   </div>    
                    {/if}
                {if $node_i18n->hasContent()}     
                   <div class="row categorieTextTop">
                       <div>{$node_i18n->get('content')}</div>
                   </div>
               {/if*}
               
                {component name="/partners/subcategories" node=$node}
                 <div id="page-wrapper">               
                {component name="/employees/categories" node=$node tpl='mixed'}
                 </div>
            </div>                
        </section>

        {component name="/customers_newsletter/signin"}	  
        
        {include file="./includes/footer.tpl"}

        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
        
        {component name="/employers/postAJob"}    
        {component name="/employees/wantAJob"}

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
        {component name="/utils_dropzone/resources" version="5.7.0"}  
        <script src="{url('js/jquery.custom.js','web')}"></script>    
           <script src="{url('js/ui/1.12.1/jquery-ui.min.js','web','frontend')}" type="text/javascript"></script>    
<script type="text/javascript">
    
    $(".showChildrenInside, #categoriesChildrenInside").hover(function() {
        $("#categoriesChildrenInside").css('opacity','2');
    }, function() {
        $("#categoriesChildrenInside").css('opacity','0');
    });
    
    
    $('.carousel-categories').owlCarousel({
        margin: 10,
        responsiveClass: true,
        autoHeight: true,
        items: 6,
        autoplay:true,
        autoplayTimeout:3000,
        autoplayHoverPause:true,
        //autoplayHoverPause: true,
        nav: true,
        dots: false, //Make this true
        navText: ["<img src='/web/pictures/previous1.png'>", "<img src='/web/pictures/next1.png'>"],
        responsive:{
            1450:{ items:6, nav:true,loop:true },
            1384:{  items:5, nav:true, loop:true },
            1242:{  items:4, nav:true, loop:true },
            1000:{ items:3,  nav:true, loop:true },
            500:{ items:2, nav:true,  loop:true },
            0:{ items:1, nav:true, loop:true },
        }
    });
    
    
    $('.carousel-categories-children').owlCarousel({
        margin: 10,
        responsiveClass: true,
        autoHeight: true,
        items: 6,
        loop:true,
        autoplay: true,
        autoplayTimeout: 2000,
        autoplayHoverPause: true,
        nav: true,
        dots: false,
        navText: ["<img src='/web/pictures/previous1.png'>", "<img src='/web/pictures/next1.png'>"],
        responsive:{
            1450:{ items:6, nav:true,loop:true },
            1384:{  items:5, nav:true,loop:true },
            1242:{  items:4, nav:true,loop:true },
            1000:{ items:3,  nav:true,loop:true },
            400:{ items:2, nav:true,loop:true },
            0:{ items:1, nav:true,loop:true },
        }
    });
    
    
    $('.Myadvert-carousel').owlCarousel({
            margin:10,
            responsiveClass:true,
            autoHeight:true,
            items:1,
            autoplayTimeout:10000,
            autoplayHoverPause:true,
            nav : true,
            dots: true, //Make this true
            navText : ["<img src='/web/pictures/previous1.png'>","<img src='/web/pictures/next1.png'>"],
        });
</script>
    </body>

</html>
