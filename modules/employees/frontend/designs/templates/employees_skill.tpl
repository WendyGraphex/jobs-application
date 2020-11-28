<!DOCTYPE html>
<html lang="{$_request->getLanguage()}">
    <head>
        <meta charset="UTF-8">
        <title>{component name="/site_company/Display" field='name' COMMENT=false} - {$skill_i18n->getFormatter()->getTitle()->ucfirst()}</title>
        <link rel="short icon" type="image/png" href="/web/pictures/favicon-graphex.png"/>
        <meta name="description" content="{$skill_i18n->getFormatter()->getDescription()->ucfirst()}">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">      
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

        <link rel="stylesheet" media="all" href="{url('majestic/css/owl.carousel.css','web','frontend')}">
        <link rel="stylesheet" media="all" href="{url('majestic/css/owl.theme.css','web','frontend')}">
        <link rel="stylesheet" href="{url('/css/awesome/4.7.0/css/font-awesome.min.css','web')}">
        {*<link rel="stylesheet" media="all" href="{url('majestic/css/bootstrap/bootstrap.css','web','frontend')}">*}      
        <script src="{url('js/jquery/3.2.1/jquery-3.2.1.min.js','web','frontend')}"></script>      
        {header}
    </head>
    <body>

        {include file="./includes/header-nav.tpl"}

        <section class="ftco-section bg-light sectionCategoriesTop sectionMarginTop">
            <div id="page-ctn" class="container">      
                <div id="page-wrapper" class="allAdvetsInCities">  
                    <h1>{$skill_i18n->getTitle()->ucfirst()}</h1>
                 {if $skill_i18n->getSkill()->hasPicture()}                 
                <div class="categoriePicture">
                    <img src="{$skill_i18n->getSkill()->getPicture()->getUrl()}"/>
                </div>    
            {/if}
            {if $skill_i18n->hasContent()}
            {$skill_i18n->getFormatter()->getContent()->ucfirst()}
            {/if}
                {component name="/employees/employees"}
                </div>
                {*======================================================*}
                <div class="divHowItWork-about margin-top-about" style="font-size:14px">
                    <div class="justify-content-center mb-5 pb-3 row">
                        <div class="col-md-7 fadeInUp ftco-animate ftco-animated heading-section text-center">
                            <h2>{__('How It Works')}</h2>

                            <h4>{__('it is easy as 1-2-3-4.')}</h4>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-3 col-md-3 fadeInUp ftco-animate ftco-animated sectionHowItWork">
                            <div style="text-align:center">
                                <div class="sectionHowItWork-divImage"><img src="/web/files/icons/monitor.png"/></div>

                                <div class="sectionHowItWork-divDescription">
                                    <h4>{__('1. Post a job')}</h4>

                                    <p>{__('Simply post a job if you post a job<br />
                                        an associate will contact you within minutes.<br />
                                        Otherwise<br />
                                        you can choose an associate<br />
                                        from our available freelancers<br />
                                        by going through their portfolio<br />
                                        and click on get a quote or<br />
                                        simply send a message directly to them.')}</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-3 fadeInUp ftco-animate ftco-animated sectionHowItWork">
                            <div style="text-align:center">
                                <div class="sectionHowItWork-divImage"><img src="/web/files/icons/group.png"/></div>

                                <div class="sectionHowItWork-divDescription">
                                    <h4>{__('2. Choose freelancers')}</h4>

                                    <p>{__('Whatever your needs are, there will be a freelancer to get it done. Services such as: Graphic and web design, Data Science, mobile app development, virtual assistants, business and marketing, Music productions, writing &amp; translations and a lot more. (See all categories). Find professionals you can trust by going through their portfolios and their profiles. You&rsquo;ll see samples of previous work and read reviews from previous customers.')}</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-3 fadeInUp ftco-animate ftco-animated sectionHowItWork">
                            <div style="text-align:center">
                                <div class="sectionHowItWork-divImage"><img src="/web/files/icons/lock.png"/></div>
                                
                                <div class="sectionHowItWork-divDescription">
                                    <h4>{__('3. Secure payment')}</h4>

                                    <p>At Graphex Technology, your secure and safe payment is our first priority. The beauty about our company, you negotiate with the freelancer, but you pay our company. The freelancer won&rsquo;t get paid until the job is done. The freelancer will get paid when the project is completed and you&#39;re 100% satisfied. You can track the progress of your projects by sending an email to the freelancer or access the database provided by your freelancer to allow transparency.</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-3 fadeInUp ftco-animate ftco-animated sectionHowItWork">
                            <div style="text-align:center">
                                <div class="sectionHowItWork-divImage"><img src="/web/files/icons/support.png"></div>

                                <div class="sectionHowItWork-divDescription">
                                    <h4>{__('4. 24/7 support')}</h4>

                                    <p>{__('We have a team of customer supports available 24/7 and 7 days a week to answer all your questions and concerns. We speak many languages to facilitate customers to express themselves in their own languages, just so their concerns can be understood and solved. We&#39;re always here to help. Our support consists of real people who are available 24/7.')}</p>
                                </div>
                            </div>
                        </div>
                    </div>
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
    {component name="/utils/UIresources" version="1.11.3"}
    <script src="{url('js/jquery.custom.js','web')}"></script>  

    <script type="text/javascript">

        {JqueryScriptsReady}
       
        {/JqueryScriptsReady}
    </script>
</body>

</html>






