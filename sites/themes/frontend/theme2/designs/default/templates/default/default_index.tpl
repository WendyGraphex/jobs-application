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
        <link rel="stylesheet" media="all"  href="{url('css/style.css','web','frontend')}">  
        <script src="{url('js/jquery/3.2.1/jquery-3.2.1.min.js','web','frontend')}"></script>      
        {header}
    </head>
    <body>

        <section class="ftco-section" style="background-color: rgb(154, 136, 0);">
            <div class="page-wrap">
                <div class="container">
                    <div class="landing-backImage">
                        <div>                      
                            <h1 class="firstH1">
                                {__('Graphex Technology')}
                            </h1>
                            <p>{__('"Be reliant on reliable talents"~"Unemployed to be deployed to your full potential"')}</p>
                        </div>
                        <div>
                            <img class="landing-logo" src="/web/pictures/grand.jpg"/>
                            <h1 class="secondH1">
                                {__('Registration is Open Now')}
                            </h1>
                            <div class="divUlRegistration">
                                <ul class="ulRegistration">
                                    <li>{__('Join a world of experts, freedom seekers, professionals, and entrepreneurs.')}</li>
                                    <li>{__('Connect with thousands of freelancers, entrepreneurs, businesses, and golden Opportunities.')}</li>
                                </ul>
                            </div>
                        </div>
                        <div class="rightDiv">
                            {__('Oct 17,2020')}<br/>
                            {__('7:00 PM,')}<br/>
                            {__('Eastern Time')}<br/>
                        </div>
                        {component name="/customers_registration/registerLink"}                        
                    </div>
                    {*========================================================*}
                </div>   
                <img src="/web/pictures/grand2.jpg" style="width: 100%;margin: 30px 0px 30px 0px;"/>
                <div class="container" style="color: #222;font-size: 17px;">
                    <div class="landing-div-class">
                        <p>{__('Dear')}</p>
                        <p>{__('Graphex Technology Grand Opening Participants,')}</p>
                        
                        <p>{__('<strong>If you have not RSVP’d for this event, please do so now.</strong><br/>
                        The Zoom information will be sent out on Thursday, October 15th, 2020.')}
                        </p>
                        
                        <p>{__('We would like to invite you to participate in the Grand Opening of <br/>
                            “Graphex Technology” on Saturday,<strong> October 17, 2020, at 7:00 PM.</strong><br/>
                            Due to Covid-19 Pandemic, our inauguration will be held virtually on:<br/>
                             Zoom, Facebook, YouTube, and Instagram. ')}</p>
                        
                        <p>{__('Graphex Technology brings forth an infinite world of opportunities  <br/>
                        for citizens worldwide, by creating and allowing access to millions <br/>
                         of culturally diversified jobs, entrepreneurship, <br/>
                         career enhancement opportunities, and life work-balance flexibility <br/>
                        wherever you are in the world. ')}
                        </p>
                        
                        <p>
                            {__('we implore you to join us in this magnitude celebration, <br/>
                            as we introduce this revolutionary movement toward greatness<br/>
                            in our ever-evolving virtual technological world. ')}
                        </p>
                        
                        <p>{__('We thank you in advance for your everlasting support, <br/>
                            this innovative movement would not be possible without you in mind.<br/> 
                            Please RSVP at this link so that we have an accurate headcount <br/>
                            and to receive the call in information. ')}
                        </p>
                        
                        <p>{__('Thank You')}</p>
                    </div>
                </div>
            </div>
                {component name="/social_networks/SocialNetworksDisplay" tpl="landing"}
        </section>

        {*component name="/customers_contact/register"*}     
                        
        


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

</html>
