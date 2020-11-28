<!DOCTYPE html>
<html lang="{$_request->getLanguage()}">
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Graphex Academy</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' type='text/css' href="{url('/css/academy/main.css','web')}">    
        <link rel="stylesheet" href="{url('/css/bootstrap/4.5.0/bootstrap.min.css','web')}">    
        <link rel="stylesheet" media="all" href="{url('css/owl.carousel.min.css','web','frontend')}">
        <script src="{url('/js/jquery/3.4.1/jquery.min.js','web')}"></script>  
        <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@700&display=swap" rel="stylesheet"> 
        <script src="https://use.fontawesome.com/9f6e65beb0.js"></script>
    </head>
    <body>

        {include file="./includes/header-academy.tpl"}

        <section class="ftco-section bg-light sectionMarginTop">
            <div class="page-wrap d-flex flex-row align-items-center">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-md-12 text-center">
                            <span class="display-1 d-block">404</span>
                            <div class="mb-4 lead">{__('The academy category you are looking for was not found.')}</div>
                            <a href="/" class="btn btn-link"><i style="font-size: 19px;" class="mdi mdi-home"></i>{__('Back to Home')}</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>   

        <footer>
            {include file="./includes/footer-academy.tpl"}
        </footer>
    </body>

</html>


