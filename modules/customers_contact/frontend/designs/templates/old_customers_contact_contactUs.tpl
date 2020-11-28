<!DOCTYPE html>
<html lang="{$_request->getLanguage()}">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
       <title>{component name="/site_company/Display" field='name' COMMENT=false} - {__('Contact us')}</title> 
       <link rel="short icon" type="image/png" href="/web/pictures/favicon-graphex.png"/>

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link href="{url('style.css','web')}" rel="stylesheet">

    <!-- Responsive CSS -->
    <link href="{url('css/responsive/responsive.css','web')}" rel="stylesheet">
    <link rel="stylesheet" href="{url('/vendors/mdi/css/materialdesignicons.min.css','web')}">

</head>

<body>
    <!-- Preloader -->
    

    
      {include file="./includes/header.tpl"}
    
    <!-- ***** Header Area End ***** -->

    <!-- ***** Breadcumb Area Start ***** -->
    <div class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/hero-1.jpg)"></div>
    <!-- ***** Breadcumb Area End ***** -->

    <!-- ***** Contact Area Start ***** -->
    <div class="dorne-contact-area d-md-flex" id="contact">
        <!-- Contact Form Area -->
        <div class="contact-form-area equal-height">
            <div class="contact-text">
                <h4>Hello, Get in touch with us</h4>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam ac nibh sed mi ullamcorper rhoncus. Curabitur pulvinar vel augue sit amet vestibulum. Proin tempus lacus porta lorem blandit aliquam eget quis ipsum. Vivamus accumsan consequat ligula non volutpat. Sed mollis orci non cursus vestibulum. Pellentesque vitae est a augue laoreet venenatis sed eu felis. Sed cursus magna nec turpis ullamcorper, eget rutrum felis egestas. Nunc odio ex, fermentum efficitur nunc vitae, efficitur hendrerit diam. Lorem ipsum dolor sit amet, consectetur.</p>

                  {component name="/site_company/Display" tpl="contact_us"}
                
            </div>
            <div class="contact-form">
                <div class="contact-form-title">
                    <h6>{__('Contact us')}</h6>
                </div>
                <form action="#">
                    <div class="row">
                        <div class="col-12 col-md-6">
                            <input type="text" name="name" class="form-control" placeholder="Your Name">
                        </div>
                        <div class="col-12 col-md-6">
                            <input type="email" name="email" class="form-control" placeholder="Email Address">
                        </div>
                        <div class="col-12">
                            <input type="text" name="subject" class="form-control" placeholder="Subject">
                        </div>
                        <div class="col-12">
                            <textarea name="message" class="form-control" id="Message" cols="30" rows="10" placeholder="Your Message"></textarea>
                        </div>
                        <div class="col-12">
                            <button type="submit" class="btn dorne-btn">Send</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!-- Map Area -->
        <div class="dorne-map-area equal-height">
            <div id="googleMap"></div>
        </div>
    </div>
    <!-- ***** Contact Area End ***** -->

    {include file="./includes/footer.tpl"}

    <!-- jQuery-2.2.4 js -->
    <script src="{url('js/jquery/jquery-2.2.4.min.js','web')}"></script>
    <!-- Popper js -->
    <script src="{url('js/bootstrap/popper.min.js','web')}"></script>
    <!-- Bootstrap-4 js -->
    <script src="{url('js/bootstrap/bootstrap.min.js','web')}"></script>
    <!-- All Plugins js -->
    <script src="{url('js/others/plugins.js','web')}"></script>
    <!-- Google Maps js -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDk9KNSL1jTv4MY9Pza6w8DJkpI_nHyCnk"></script>
    <script src="{url('js/google-map/map-active.js','web')}"></script> 
    <!-- Active JS -->
    <script src="{url('js/active.js','web')}"></script>
    <script src="{url('js/jquery.custom.js','web')}"></script>
</body>

</html>
