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
        <link rel="stylesheet" media="all" href="{url('css/bootstrap-datepicker.css','web','frontend')}">
        <link rel="stylesheet" media="all" href="{url('css/jquery.timepicker.css','web','frontend')}">
        <link rel="stylesheet" media="all" href="{url('css/flaticon.css','web','frontend')}">
        <link rel="stylesheet" media="all" href="{url('css/icomoon.css','web','frontend')}">
        <link rel="stylesheet" media="all"  href="{url('css/style.css','web','frontend')}">
        <link rel="stylesheet"  media="all" href="{url('css/dropzone.css','web','frontend')}">
        <link rel="stylesheet" media="all" href="{url('majestic/css/owl.carousel.css','web','frontend')}">
        <link rel="stylesheet" media="all" href="{url('majestic/css/owl.theme.css','web','frontend')}">
        {*<link rel="stylesheet" media="all" href="{url('majestic/css/bootstrap/bootstrap.css','web','frontend')}">*}      
        <script src="{url('js/jquery/3.2.1/jquery-3.2.1.min.js','web','frontend')}"></script>
    </head>
    <body>
        <div id="actions">
            
            {include file="./includes/header-nav.tpl"}
            <!-- END nav --> 
            <section class="ftco-section contact-section bg-light sectionMarginTop">
                <img src="/web/pictures/Contact-us.jpg" style="height: 100%;width: 100%;margin-top: 20px;">
                <div class="container" style="width: 70%">
                    <div style="color: #222;font-size: 18px;font-family: Trebuchet MS;line-height: 25px;margin-top: 50px;margin-bottom: 50px;">
                        {__('Do you have a concern? Do you have a question? <br/>  
                        Do you have a suggestion? Do you want to partner with us? Do you have a suggestion? <br/><br/>
                        We are here to help you, and we are ready to help you in everything you need. <br/>
                        Should you have any problem, contact us now!<br/>
                        We are experts in solving problems.')}
                    </div>
                    <div class="row d-flex mb-5 contact-info">
                        <div class="col-md-12 mb-4">
                            <h2 class="h3">{__('Contact Information')}</h2>
                        </div>
                        <div class="w-100"></div>
                        {component name="/site_company/Display" tpl="contact-us"}  
                    </div>
                    
                    <div class="row block-9">
                        {component name="/employers_contact/contact"}     
                        {component name="/site_company/map" tpl="contact-us"}    
                    </div>
                </div>
            </section>
        {*component name="/customers_newsletter/signin"*}	
    
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
</body>
</html>