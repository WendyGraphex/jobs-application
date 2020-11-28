<!DOCTYPE html>
<html lang="{$_request->getLanguage()}">
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>{component name="/site_company/Display" field='name' COMMENT=false} - {__('All employee skills')}</title> 
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
        {* <link rel="stylesheet"  media="all" href="{url('css/dropzone.css','web','frontend')}"> *}


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
                    <h1>{__('All Skills')} : </h1>

                    <h3>Graphic design</h3>
                    <div class="advertsInCities">
                        <div class="row">
                            <div class="col-xlg-3 col-lg-3 col-md-4 col-sm-6">        
                                <div class="blog-entry align-self-stretch">
                                    <div class="ViewsQuotes">
                                        <label class="AdViews"><i class="mdi mdi-cart"></i>120</label>
                                        <label class="AdQuote"><i class="mdi mdi-eye"></i>230</label>
                                    </div>
                                    <div class="Myadvert-carousel owl-carousel owl-theme">                
                                        <div class="item">
                                            <a href="/" class="block-20">
                                                <img src="/web/pictures/555.jpg"/>
                                            </a>  
                                        </div>  
                                    </div>  
                                    <input class="copied" type="text" id="Link" aria-hidden="true" style="position: absolute;left: -999em;"/>
                                    <div class="seller-info row">
                                        <div class="col-md-6 AdvertDate">
                                            <span class="AdDate">23/02/2020</span>
                                        </div>
                                        <div class="col-md-6 nameAndContact">
                                            <div class="ImageTitle">
                                                <span class="seller-image">
                                                    <span class="is-online" style="background: #1dbf73;"></span>
                                                    <span class="spanImage">
                                                        {*<img height="32px" src="/"/>*}
                                                    </span>
                                                </span>
                                                <div class="nameAndDate" style="padding-left: 42px;">
                                                    <div class="UserNameAndSecond">
                                                        <a href="/" class="UserName" style="display: inline;">
                                                            zefertretrt
                                                        </a>                                                                       
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>                     
                                    <div class="UserInfo">         
                                        <h4 style="margin-bottom: 0rem;">
                                            <a href="/" style="color: #222;">sdsfdsfdf</a>
                                        </h4>
                                        <p class="Description">ezfgeuzgfu...</p>
                                        <div class="UserVotes">
                                            <span class="votes"><i class="mdi mdi-star-half" aria-hidden="true"></i>4.5 (1.5k)</span>
                                            <span class="ref">{__('Ref:')}  <a href="/">24587001457</a></span>
                                        </div>
                                        <div class="wsihAndStarting startingAndPrice row">
                                            <div class="col-md-2 divWish">
                                                <span class="wish"><i class="mdi mdi-heart" aria-hidden="true"></i></span>
                                                <span class="wish" style="display: none;"><i class="mdi mdi-heart-outline" aria-hidden="true"></i></span>
                                            </div>
                                            <div class="col-md-10 divStarting">                          
                                                <span class="starting starting-price" style="float:right;">{__('Starting at')} <label class="workPrice"></label></span>
                                            </div>
                                        </div>
                                        <div class="social-network-sharing">
                                            <label><i class="mdi mdi-share"></i>{__('Share to')}</label>
                                            <label class="social-network">
                                                <i id="" class="copyLink mdi mdi-content-copy my-tool-tip" style="cursor:pointer;" data-toggle="tooltip"
                                                   data-placement="right" data-original-title="copy link"></i>                                                                                                
                                            </label>
                                            <button class="BtnOfferQuote btn btn-primary EmployeeAdvertQuote" id="211">{__('Get a quote')}</button>                       
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xlg-3 col-lg-3 col-md-4 col-sm-6">        
                                <div class="blog-entry align-self-stretch">
                                    <div class="ViewsQuotes">
                                        <label class="AdViews"><i class="mdi mdi-cart"></i>120</label>
                                        <label class="AdQuote"><i class="mdi mdi-eye"></i>230</label>
                                    </div>
                                    <div class="Myadvert-carousel owl-carousel owl-theme">                
                                        <div class="item">
                                            <a href="/" class="block-20">
                                                <img src="/web/pictures/555.jpg"/>
                                            </a>  
                                        </div>  
                                    </div>  
                                    <input class="copied" type="text" id="Link" aria-hidden="true" style="position: absolute;left: -999em;"/>
                                    <div class="seller-info row">
                                        <div class="col-md-6 AdvertDate">
                                            <span class="AdDate">23/02/2020</span>
                                        </div>
                                        <div class="col-md-6 nameAndContact">
                                            <div class="ImageTitle">
                                                <span class="seller-image">
                                                    <span class="is-online" style="background: #1dbf73;"></span>
                                                    <span class="spanImage">
                                                        {*<img height="32px" src="/"/>*}
                                                    </span>
                                                </span>
                                                <div class="nameAndDate" style="padding-left: 42px;">
                                                    <div class="UserNameAndSecond">
                                                        <a href="/" class="UserName" style="display: inline;">
                                                            zefertretrt
                                                        </a>                                                                       
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>                     
                                    <div class="UserInfo">         
                                        <h4 style="margin-bottom: 0rem;">
                                            <a href="/" style="color: #222;">sdsfdsfdf</a>
                                        </h4>
                                        <p class="Description">ezfgeuzgfu...</p>
                                        <div class="UserVotes">
                                            <span class="votes"><i class="mdi mdi-star-half" aria-hidden="true"></i>4.5 (1.5k)</span>
                                            <span class="ref">{__('Ref:')}  <a href="/">24587001457</a></span>
                                        </div>
                                        <div class="wsihAndStarting startingAndPrice row">
                                            <div class="col-md-2 divWish">
                                                <span class="wish"><i class="mdi mdi-heart" aria-hidden="true"></i></span>
                                                <span class="wish" style="display: none;"><i class="mdi mdi-heart-outline" aria-hidden="true"></i></span>
                                            </div>
                                            <div class="col-md-10 divStarting">                          
                                                <span class="starting starting-price" style="float:right;">{__('Starting at')} <label class="workPrice"></label></span>
                                            </div>
                                        </div>
                                        <div class="social-network-sharing">
                                            <label><i class="mdi mdi-share"></i>{__('Share to')}</label>
                                            <label class="social-network">
                                                <i id="" class="copyLink mdi mdi-content-copy my-tool-tip" style="cursor:pointer;" data-toggle="tooltip"
                                                   data-placement="right" data-original-title="copy link"></i>                                                                                                
                                            </label>
                                            <button class="BtnOfferQuote btn btn-primary EmployeeAdvertQuote" id="211">{__('Get a quote')}</button>                       
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xlg-3 col-lg-3 col-md-4 col-sm-6">        
                                <div class="blog-entry align-self-stretch">
                                    <div class="ViewsQuotes">
                                        <label class="AdViews"><i class="mdi mdi-cart"></i>120</label>
                                        <label class="AdQuote"><i class="mdi mdi-eye"></i>230</label>
                                    </div>
                                    <div class="Myadvert-carousel owl-carousel owl-theme">                
                                        <div class="item">
                                            <a href="/" class="block-20">
                                                <img src="/web/pictures/555.jpg"/>
                                            </a>  
                                        </div>  
                                    </div>  
                                    <input class="copied" type="text" id="Link" aria-hidden="true" style="position: absolute;left: -999em;"/>
                                    <div class="seller-info row">
                                        <div class="col-md-6 AdvertDate">
                                            <span class="AdDate">23/02/2020</span>
                                        </div>
                                        <div class="col-md-6 nameAndContact">
                                            <div class="ImageTitle">
                                                <span class="seller-image">
                                                    <span class="is-online" style="background: #1dbf73;"></span>
                                                    <span class="spanImage">
                                                        {*<img height="32px" src="/"/>*}
                                                    </span>
                                                </span>
                                                <div class="nameAndDate" style="padding-left: 42px;">
                                                    <div class="UserNameAndSecond">
                                                        <a href="/" class="UserName" style="display: inline;">
                                                            zefertretrt
                                                        </a>                                                                       
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>                     
                                    <div class="UserInfo">         
                                        <h4 style="margin-bottom: 0rem;">
                                            <a href="/" style="color: #222;">sdsfdsfdf</a>
                                        </h4>
                                        <p class="Description">ezfgeuzgfu...</p>
                                        <div class="UserVotes">
                                            <span class="votes"><i class="mdi mdi-star-half" aria-hidden="true"></i>4.5 (1.5k)</span>
                                            <span class="ref">{__('Ref:')}  <a href="/">24587001457</a></span>
                                        </div>
                                        <div class="wsihAndStarting startingAndPrice row">
                                            <div class="col-md-2 divWish">
                                                <span class="wish"><i class="mdi mdi-heart" aria-hidden="true"></i></span>
                                                <span class="wish" style="display: none;"><i class="mdi mdi-heart-outline" aria-hidden="true"></i></span>
                                            </div>
                                            <div class="col-md-10 divStarting">                          
                                                <span class="starting starting-price" style="float:right;">{__('Starting at')} <label class="workPrice"></label></span>
                                            </div>
                                        </div>
                                        <div class="social-network-sharing">
                                            <label><i class="mdi mdi-share"></i>{__('Share to')}</label>
                                            <label class="social-network">
                                                <i id="" class="copyLink mdi mdi-content-copy my-tool-tip" style="cursor:pointer;" data-toggle="tooltip"
                                                   data-placement="right" data-original-title="copy link"></i>                                                                                                
                                            </label>
                                            <button class="BtnOfferQuote btn btn-primary EmployeeAdvertQuote" id="211">{__('Get a quote')}</button>                       
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>            
                        {*============================================Second Row==============================================*}
                        <h3>Logo creation</h3>
                        <div class="advertsInCities">
                            <div class="row">
                                <div class="col-xlg-3 col-lg-3 col-md-4 col-sm-6">        
                                    <div class="blog-entry align-self-stretch">
                                        <div class="ViewsQuotes">
                                            <label class="AdViews"><i class="mdi mdi-cart"></i>120</label>
                                            <label class="AdQuote"><i class="mdi mdi-eye"></i>230</label>
                                        </div>
                                        <div class="Myadvert-carousel owl-carousel owl-theme">                
                                            <div class="item">
                                                <a href="/" class="block-20">
                                                    <img src="/web/pictures/555.jpg"/>
                                                </a>  
                                            </div>  
                                        </div>  
                                        <input class="copied" type="text" id="Link" aria-hidden="true" style="position: absolute;left: -999em;"/>
                                        <div class="seller-info row">
                                            <div class="col-md-6 AdvertDate">
                                                <span class="AdDate">23/02/2020</span>
                                            </div>
                                            <div class="col-md-6 nameAndContact">
                                                <div class="ImageTitle">
                                                    <span class="seller-image">
                                                        <span class="is-online" style="background: #1dbf73;"></span>
                                                        <span class="spanImage">
                                                            {*<img height="32px" src="/"/>*}
                                                        </span>
                                                    </span>
                                                    <div class="nameAndDate" style="padding-left: 42px;">
                                                        <div class="UserNameAndSecond">
                                                            <a href="/" class="UserName" style="display: inline;">
                                                                zefertretrt
                                                            </a>                                                                       
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                     
                                        <div class="UserInfo">         
                                            <h4 style="margin-bottom: 0rem;">
                                                <a href="/" style="color: #222;">sdsfdsfdf</a>
                                            </h4>
                                            <p class="Description">ezfgeuzgfu...</p>
                                            <div class="UserVotes">
                                                <span class="votes"><i class="mdi mdi-star-half" aria-hidden="true"></i>4.5 (1.5k)</span>
                                                <span class="ref">{__('Ref:')}  <a href="/">24587001457</a></span>
                                            </div>
                                            <div class="wsihAndStarting startingAndPrice row">
                                                <div class="col-md-2 divWish">
                                                    <span class="wish"><i class="mdi mdi-heart" aria-hidden="true"></i></span>
                                                    <span class="wish" style="display: none;"><i class="mdi mdi-heart-outline" aria-hidden="true"></i></span>
                                                </div>
                                                <div class="col-md-10 divStarting">                          
                                                    <span class="starting starting-price" style="float:right;">{__('Starting at')} <label class="workPrice"></label></span>
                                                </div>
                                            </div>
                                            <div class="social-network-sharing">
                                                <label><i class="mdi mdi-share"></i>{__('Share to')}</label>
                                                <label class="social-network">
                                                    <i id="" class="copyLink mdi mdi-content-copy my-tool-tip" style="cursor:pointer;" data-toggle="tooltip"
                                                       data-placement="right" data-original-title="copy link"></i>                                                                                                
                                                </label>
                                                <button class="BtnOfferQuote btn btn-primary EmployeeAdvertQuote" id="211">{__('Get a quote')}</button>                       
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xlg-3 col-lg-3 col-md-4 col-sm-6">        
                                    <div class="blog-entry align-self-stretch">
                                        <div class="ViewsQuotes">
                                            <label class="AdViews"><i class="mdi mdi-cart"></i>120</label>
                                            <label class="AdQuote"><i class="mdi mdi-eye"></i>230</label>
                                        </div>
                                        <div class="Myadvert-carousel owl-carousel owl-theme">                
                                            <div class="item">
                                                <a href="/" class="block-20">
                                                    <img src="/web/pictures/555.jpg"/>
                                                </a>  
                                            </div>  
                                        </div>  
                                        <input class="copied" type="text" id="Link" aria-hidden="true" style="position: absolute;left: -999em;"/>
                                        <div class="seller-info row">
                                            <div class="col-md-6 AdvertDate">
                                                <span class="AdDate">23/02/2020</span>
                                            </div>
                                            <div class="col-md-6 nameAndContact">
                                                <div class="ImageTitle">
                                                    <span class="seller-image">
                                                        <span class="is-online" style="background: #1dbf73;"></span>
                                                        <span class="spanImage">
                                                            {*<img height="32px" src="/"/>*}
                                                        </span>
                                                    </span>
                                                    <div class="nameAndDate" style="padding-left: 42px;">
                                                        <div class="UserNameAndSecond">
                                                            <a href="/" class="UserName" style="display: inline;">
                                                                zefertretrt
                                                            </a>                                                                       
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                     
                                        <div class="UserInfo">         
                                            <h4 style="margin-bottom: 0rem;">
                                                <a href="/" style="color: #222;">sdsfdsfdf</a>
                                            </h4>
                                            <p class="Description">ezfgeuzgfu...</p>
                                            <div class="UserVotes">
                                                <span class="votes"><i class="mdi mdi-star-half" aria-hidden="true"></i>4.5 (1.5k)</span>
                                                <span class="ref">{__('Ref:')}  <a href="/">24587001457</a></span>
                                            </div>
                                            <div class="wsihAndStarting startingAndPrice row">
                                                <div class="col-md-2 divWish">
                                                    <span class="wish"><i class="mdi mdi-heart" aria-hidden="true"></i></span>
                                                    <span class="wish" style="display: none;"><i class="mdi mdi-heart-outline" aria-hidden="true"></i></span>
                                                </div>
                                                <div class="col-md-10 divStarting">                          
                                                    <span class="starting starting-price" style="float:right;">{__('Starting at')} <label class="workPrice"></label></span>
                                                </div>
                                            </div>
                                            <div class="social-network-sharing">
                                                <label><i class="mdi mdi-share"></i>{__('Share to')}</label>
                                                <label class="social-network">
                                                    <i id="" class="copyLink mdi mdi-content-copy my-tool-tip" style="cursor:pointer;" data-toggle="tooltip"
                                                       data-placement="right" data-original-title="copy link"></i>                                                                                                
                                                </label>
                                                <button class="BtnOfferQuote btn btn-primary EmployeeAdvertQuote" id="211">{__('Get a quote')}</button>                       
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xlg-3 col-lg-3 col-md-4 col-sm-6">        
                                    <div class="blog-entry align-self-stretch">
                                        <div class="ViewsQuotes">
                                            <label class="AdViews"><i class="mdi mdi-cart"></i>120</label>
                                            <label class="AdQuote"><i class="mdi mdi-eye"></i>230</label>
                                        </div>
                                        <div class="Myadvert-carousel owl-carousel owl-theme">                
                                            <div class="item">
                                                <a href="/" class="block-20">
                                                    <img src="/web/pictures/555.jpg"/>
                                                </a>  
                                            </div>  
                                        </div>  
                                        <input class="copied" type="text" id="Link" aria-hidden="true" style="position: absolute;left: -999em;"/>
                                        <div class="seller-info row">
                                            <div class="col-md-6 AdvertDate">
                                                <span class="AdDate">23/02/2020</span>
                                            </div>
                                            <div class="col-md-6 nameAndContact">
                                                <div class="ImageTitle">
                                                    <span class="seller-image">
                                                        <span class="is-online" style="background: #1dbf73;"></span>
                                                        <span class="spanImage">
                                                            {*<img height="32px" src="/"/>*}
                                                        </span>
                                                    </span>
                                                    <div class="nameAndDate" style="padding-left: 42px;">
                                                        <div class="UserNameAndSecond">
                                                            <a href="/" class="UserName" style="display: inline;">
                                                                zefertretrt
                                                            </a>                                                                       
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                     
                                        <div class="UserInfo">         
                                            <h4 style="margin-bottom: 0rem;">
                                                <a href="/" style="color: #222;">sdsfdsfdf</a>
                                            </h4>
                                            <p class="Description">ezfgeuzgfu...</p>
                                            <div class="UserVotes">
                                                <span class="votes"><i class="mdi mdi-star-half" aria-hidden="true"></i>4.5 (1.5k)</span>
                                                <span class="ref">{__('Ref:')}  <a href="/">24587001457</a></span>
                                            </div>
                                            <div class="wsihAndStarting startingAndPrice row">
                                                <div class="col-md-2 divWish">
                                                    <span class="wish"><i class="mdi mdi-heart" aria-hidden="true"></i></span>
                                                    <span class="wish" style="display: none;"><i class="mdi mdi-heart-outline" aria-hidden="true"></i></span>
                                                </div>
                                                <div class="col-md-10 divStarting">                          
                                                    <span class="starting starting-price" style="float:right;">{__('Starting at')} <label class="workPrice"></label></span>
                                                </div>
                                            </div>
                                            <div class="social-network-sharing">
                                                <label><i class="mdi mdi-share"></i>{__('Share to')}</label>
                                                <label class="social-network">
                                                    <i id="" class="copyLink mdi mdi-content-copy my-tool-tip" style="cursor:pointer;" data-toggle="tooltip"
                                                       data-placement="right" data-original-title="copy link"></i>                                                                                                
                                                </label>
                                                <button class="BtnOfferQuote btn btn-primary EmployeeAdvertQuote" id="211">{__('Get a quote')}</button>                       
                                            </div>
                                        </div>
                                    </div>
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
        {component name="/utils/UIresources" version="1.11.3"}
        <script src="{url('js/jquery.custom.js','web')}"></script>  


    </body>

</html>




