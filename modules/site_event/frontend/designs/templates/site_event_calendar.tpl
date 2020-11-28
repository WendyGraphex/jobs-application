<html lang="{$_request->getLanguage()}">
    {*<head>
    <link rel="stylesheet" media="all"  href="{url('css/calendar.css','web','frontend')}">
    </head>*}
    <head>
        <title>{component name="/site_company/Display" COMMENT=false} - {component name="/site_shop/display" field='meta_title' COMMENT=false}</title>   
        <meta charset="utf-8">
        <link rel="short icon" type="image/png" href="/web/pictures/favicon-graphex.png"/>
        <link rel="stylesheet"  media="all" href="{url('css/open-iconic-bootstrap.min.css','web','frontend')}">
        <link rel="stylesheet" media="all"  href="{url('css/calendar.css','web','frontend')}">
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
        {*<link rel="stylesheet" media="all" href="{url('majestic/css/bootstrap/bootstrap.css','web','frontend')}">*}  
        <link rel="stylesheet" media="all" href="{url('css/ui/1.12.1/jquery-ui.min.css','web','frontend')}">
        

        <script src="{url('js/jquery/3.2.1/jquery-3.2.1.min.js','web','frontend')}"></script>
    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar" style="border-bottom: 1px solid #f5f1f1;">    
            <div class="divAllInside">
                <div class="container">
                    {component name="/site_company/Display" tpl="logoCompany"}
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="oi oi-menu"></span>{__('Menu')}
                    </button>
                    {include file="./includes/event-header.tpl"}
                </div>
            </div>
        </nav>



        <div class="calendarTopMargin">
            <img src="/web/pictures/event-page.jpg" style="margin: 0 auto;display: block;max-width: 100%;" />
            <div style="text-align: center;background-color: rgb(173, 155, 79);margin: 30px 0px 30px 0px;padding: 17px;">
                <h1 style="margin-bottom: 0px;font-weight: bolder;color: rgb(101, 68, 4);">{__('To Our Event Users')}</h1>
            </div>
            <div class="container">
                <p>
                    {__('We are thrilled to invite you to take a tour to our event page. The page includes, but not limited to: <br/>
                    Conferences, Job fares, and all type of events that we are going to have throughout the year. <br/>
                    All the activities and events we are invited to are in the calendar as well.')}<span id="showTextEvent" style="padding: 10px;color: #222;font-size: 20px;cursor: pointer;text-align: center;">{__('See more.....')}</span>
                </p>
            </div>
            <div id="TextEvent" style="margin-bottom: 70px;display: none;">
                <div class="container" style="font-weight: bold;">
                    <p>
                        {__('Meet the CEO: </br>
                    If you want to book the CEO for an event, conference, job fare, or you want to meet with him for business purposes.<br/>
                    Please take time to go through the calendar to see if he’s not already booked on the day of your event.<br/>
                     You can also, contact the team for arrangements at: contact@graphex.net for more details. <br/> ')}
                    </p>
                    <p>
                        {__('We are thrilled to invite you to take a tour to our event page. The page includes, but not limited to: Conferences, Job fares, and all type of events that we are going to have throughout the year. All the activities and events we are invited to are in the calendar as well. Meet the CEO: If you want to book the CEO for an event, conference, job fare, or you want to meet with him for business purposes.  Please take time to go through the calendar to see if he’s not already booked on the day of your event. You can also, contact the team for arrangements at: contact@graphex.net for more details. We have paid events, and free events as well. If you are going to book an event, even if the event is free, you have to go through the same process, As if you were going to buy it. The only difference, you will put 0.00 (zero dollar) at the time of booking.')}
                    </p>
                    <p>
                        {__('When you attend our conferences, <br/>
                    This will help you scale into the untapped potential into our platform and other possible business opportunities.<br/>
                    You will be shown how to create an account, give you the tools you need to make you become successful on Graphex Technology. <br/> 
                    This would attract more people into your Graphex portfolio and profile.  <br/>
                    You will be directed as how to properly save and invest in Graphex, thus helping you grow financially.  <br/>
                    You will be given the chance to learn how to properly navigate the site just so you can potentially and efficiently successful.  <br/> ')}
                    </p>
                    <p>
                        {__('By attending our events, you will have the chance to grow both career-wise and also investment wise.<br/>  
                    Your presence at our events will be much appreciated. <br/>')}
                    </p>
                    <p>
                        {__('Choose the event you would like to attend, we’ll see you there.<br/> 
                    Have fun!<br/>')}
                    </p>
                    <p>
                        {__('Graphex Technology Team.')}
                    </p>
                </div>
                <div style="text-align: center;margin-bottom: 25px;">
                    <a href="{link_i18n("customers_contact")}" class="btn btn-primary">{__('Contact us')}</a>
                </div>
                <div style="width: 20%;margin: 0 auto;">
                    <img src="/web/pictures/event-page-bottom.jpg" style="max-width: 100%;">
                </div>
            </div>
            
                
            <div id="actions">    
            {include file="./site_event_ajaxCalendar.tpl"}
            </div>
        </div>

        {include file="./includes/event-footer.tpl"}

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
        <script src="{url('js/dropzone.js','web','frontend')}"></script>
        <script src="{url('js/jquery.custom.js','web','frontend')}"></script>
        <script src="{url('js/ui/1.12.1/jquery-ui.min.js','web','frontend')}" type="text/javascript"></script> 

        <script type="text/javascript">
            
        $("#showTextEvent").click(function () {
            $("#TextEvent").toggle();
        });

        </script>
        
    </body>
</html>