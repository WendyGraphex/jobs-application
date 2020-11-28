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
        <link rel="stylesheet" href="{url('/css/awesome/4.7.0/css/font-awesome.min.css','web')}">
        <script src="{url('/js/jquery/3.4.1/jquery.min.js','web')}"></script>  
        <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@700&display=swap" rel="stylesheet"> 
        <script src="https://use.fontawesome.com/9f6e65beb0.js"></script>
    </head>
    <body>

        {include file="./includes/header-academy.tpl"}

        <section class="ftco-section bg-light sectionMarginTop">
            <div class="page-wrap d-flex flex-row align-items-center">
                <div class="container">
                    <img src="/web/pictures/aaaaaa.jpg" style="max-width: 100%;margin: 0 auto;display: block;"/>
                    <h2 style="text-align: center;margin-top: 20px;">{__('The academy category you are looking for was not found.')}</h2>
                    <p style="padding: 20px;">{__('Hi! Please provide in the box below some details on how you can help me getting the job done, and I will get back to you ASAP.” Et puis dans la partie où les lettres sont écrites en grasses “ Please be as detailed as possible. how much can you do job and in how many days can you complete the job')}</p>
                    <div style="padding: 10px;border: 1px solid #e1e1e1;border-radius: 10px;margin-bottom: 10px;">
                        <div>{__('PHP Course')} (32Mo) 
                            <i class="fa fa-download" style="float: right;font-size: 20px;" aria-hidden="true"></i>
                        </div>
                    </div>
                    <div style="padding: 10px;border: 1px solid #e1e1e1;border-radius: 10px;margin-bottom: 10px;">
                        <div>{__('MySql Course')} (105Mo) 
                            <i class="fa fa-download" style="float: right;font-size: 20px;" aria-hidden="true"></i>
                        </div>
                    </div>
                    <div style="padding: 10px;border: 1px solid #e1e1e1;border-radius: 10px;margin-bottom: 10px;">
                        <div>{__('Asp.Net Course')} (68Mo) 
                            <i class="fa fa-download" style="float: right;font-size: 20px;" aria-hidden="true"></i>
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
