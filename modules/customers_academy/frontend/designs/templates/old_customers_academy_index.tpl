<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Graphex Academy</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' type='text/css' href="{url('/css/academy/main.css','web')}">    
        <link rel="stylesheet" href="{url('/css/bootstrap/4.5.0/bootstrap.min.css','web')}">    
        <link rel="stylesheet" media="all" href="{url('css/owl.carousel.min.css','web','frontend')}">
        <link rel="stylesheet" href="{url('majestic/css/vendors/mdi/css/materialdesignicons.min.css','web')}">
        <script src="{url('/js/jquery/3.4.1/jquery.min.js','web')}"></script>  
        <link rel='stylesheet' type='text/css' href="{url('/css/academy/googleapis.css','web')}">  
        <script src="{url('/js/academy/fontawesome.js','web')}"></script>  
    </head>
    
    <body>
        <header>
            {include file="./includes/header-academy.tpl"}
        </header>
        <section>
            <div class="container-fluid">
                {*<div id="banner"> </div>*}
                {component name="/site_gallery/display" gallery="academy_gallery" tpl="academy"}
            </div>
        </section>
        <section>
            <div class="container-fluid">                             
                {component name="/customers_academy/categories" tpl="categories-middle" node=$node}
            </div>
        </section>
        {component name="/cms_pages/pageDisplay" page="academy_home_offers"}
        {component name="/customers_academy/bestSellers"}

        <section>
            <div class="container-fluid">
                <div id="instructor"></div>
            </div>
        </section>
        
        {component name="/customers_academy/inprogress"}
        
        {component name="/customers_academy/upcoming"}
        
        <section class="reviews">
            <div class="container-fluid">
                <h2>Reviews</h2>
                <div class="row review">
                    <div class="col-lg-4 col-sm-12 mb-5">
                        <div class="review-box">
                            <p>“ I have only scratched the surface
                                in this ever evolving field
                                but know that
                                the technological potential is limitless.”</p>
                            <h3>Adam Smith</h3>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-12 mb-5">
                        <div class="review-box">
                            <p>“ I have only scratched the surface
                                in this ever evolving field
                                but know that
                                the technological potential is limitless.”</p>
                            <h3>Adam Smith</h3>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-12 mb-5">
                        <div class="review-box">
                            <p>“ I have only scratched the surface
                                in this ever evolving field
                                but know that
                                the technological potential is limitless.”</p>
                            <h3>Adam Smith</h3>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        {component name="/customers_academy_newsletter/signin"}

        <footer>
            {include file="./includes/footer-academy.tpl"}
        </footer>

        <script src="{url('js/jquery.custom.js','web')}"></script> 
        <script src="{url('/js/academy/popper.min.js','web')}"></script>  
        <script src="{url('/js/academy/bootstrap-4.0.0.js','web')}"></script>  
        <script src="{url('js/owl.carousel.min.js','web','frontend')}"></script>
        <script src="{url('js/jquery.custom.js','web','frontend')}"></script>
    </body>
</html>
