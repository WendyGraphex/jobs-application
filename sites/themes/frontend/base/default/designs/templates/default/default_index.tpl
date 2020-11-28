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
        <!------***************************** ---------->


        <!------ Include the above in your HEAD tag ---------->


    </head>

    <body>
        <div id="actions"
             
            {include file="./includes/header-nav.tpl"}
            
            <!-- END nav -->
            <div class="DivCarouselPicture">
                <div id="owlCarouselGallery" class="overlay owl-carousel owl-theme" style="opacity: 15;"> 
                    <a href="#"><img style="width: 100%;" src="/web/pictures/image_2.jpg" alt="Logo"></a>
                    <a href="#"><img style="width: 100%;" src="{url('pictures/bg_2.jpg','web','frontend')}" alt="Logo"></a>
                    <a href="#"><img style="width: 100%;" src="/web/pictures/image_7.jpg" alt="Logo"></a>
                </div>
                <div class="container ConatinerSearch">
                    <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-start" data-scrollax-parent="true">
                        <div class="col-xl-10 ftco-animate mb-5 pb-5 ClassPaddingTop" data-scrollax=" properties: { translateY: '70%' }" style="margin: 0px auto; padding-top: 150px;z-index: 2;">
                            {*<p class="mb-4 mt-5 pt-5" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">We have <span class="number" data-number="850000">0</span> great job offers you deserve!</p>*}                                                     
                            <div class="ftco-search">
                                {*<input type="text" class="form-control" placeholder="Search" style="font-size: 16px;"/>*}
                                <div class="row">
                                    <div class="col-md-12 nav-link-wrap">
                                        <div class="nav nav-pills text-center" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                            {component name="/recruiters/findJobTab"}
                                            {component name="/candidates/findCandidateTab"}	
                                            {component name="/employers/findWorkTab"}
                                            {component name="/employees/findEmployeeTab"}		
                                        </div>
                                    </div>
                                    <div class="col-md-12 tab-wrap">			            
                                        <div class="tab-content p-4" id="v-pills-tabContent">			             
                                           {component name="/recruiters/findJobPanel"}			             
                                           {component name="/candidates/findCandidatePanel"}
                                           {component name="/employers/findWorkPanel"}
                                           {component name="/employees/findEmployeePanel"}	
                                        </div>
                                    </div>
                                </div>
                            </div>  
                        </div>
                    </div>
                </div>
            </div>
{*============================================================ Picture ======================================================*}
            <section class="ftco-section ftco-counter" style="padding-top: 0px;padding-bottom: 0px;">
                <img style="width: 100%;" src="/web/pictures/aaaaaa.jpg" alt="Logo">
            </section>    
{*================================================================== End ==========================================================*}
            <section class="ftco-section services-section bg-light">
                <div class="container">
                    <div class="row d-flex">
                        <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                            <div class="media block-6 services d-block">
                                <div class="icon icon-onHomePage">
                                    {*<span class="flaticon-resume"></span>*}
                                    <img src="/web/pictures/translation11.png"/>
                                </div>
                                <div class="media-body">
                                   {* <h3 class="heading mb-3">Search Millions of Jobs</h3>*}
                                    <p>Find Thousands of Jobs in minutes Search Jobs by countries, cities, mostrecents, or get in touch with an employer directly.</p>
                                </div>
                            </div>      
                        </div>
                        <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                            <div class="media block-6 services d-block">
                                <div class="icon icon-onHomePage">
                                    <img src="/web/pictures/translation11.png"/>
                                </div>
                                <div class="media-body">
                                    <p>We are here for you 24/7, You can contact us,or chat with our hiring parteners. We have part time and hourly jobs.</p>
                                </div>
                            </div>    
                        </div>
                        <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                            <div class="media block-6 services d-block">
                                <div class="icon icon-onHomePage">
                                    <img src="/web/pictures/translation11.png"/>
                                </div>
                                <div class="media-body">
                                    <p>You’re in control of how much you want to make for theday. All you need is a computer and internet access.</p>
                                </div>
                            </div>      
                        </div>
                        <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                            <div class="media block-6 services d-block">
                                <div class="icon icon-onHomePage">
                                    <img src="/web/pictures/translation11.png"/>
                                </div>
                                <div class="media-body">
                                    <p>Make money everys econd It’seasy: 1.accept a job offer,<br/>
                                        2.finish the job and,<br/>
                                        3.Get paid right away.<br/>
                                    </p>
                                </div>
                            </div>      
                        </div>
                    </div>
                </div>
            </section>

            <section class="ftco-section ftco-counter">
                <div class="container">
                    <div class="row justify-content-center mb-5 pb-3">
                        <div class="col-md-7 heading-section text-center ftco-animate">
                            <span class="subheading">Categories work wating for you</span>
                            <h2 class="mb-4"><span>Current</span> Job Posts</h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3 col-md-4 ftco-animate">
                            <ul class="category">
                                <li class="showAllSubCategories">
                                    <a href="#">
                                        <span class="iconSubCategories">
                                            <img src="/web/pictures/translation11.png"/>
                                        </span>
                                        <span class="titleCtegoriseHome">Web Development </span><span class="number" data-number="1000">0</span></a>
                                        <ul class="subCategoriesHome" style="display: none;">
                                            <li class="" href="#">
                                                <img src="/web/pictures/translation11.png"/>
                                                <span>Logo</span>
                                            </li>
                                            <li class="" href="#">
                                                <img src="/web/pictures/translation11.png"/>
                                                <span>Logo</span>
                                            </li>
                                            <li class="" href="#">
                                                <img src="/web/pictures/translation11.png"/>
                                                <span>Logo</span>
                                            </li>
                                        </ul>
                                </li>
                                <li>
                                    <a href="#">
                                        <span class="iconSubCategories">
                                            <img src="/web/pictures/translation11.png"/>
                                        </span><span class="titleCtegoriseHome">Graphic Designer </span>
                                        <span class="number" data-number="1000">0</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-lg-3 col-md-4 ftco-animate">
                            <ul class="category">
                                <li><a href="#">
                                    <span class="iconSubCategories">
                                        <img src="/web/pictures/translation11.png"/>
                                    </span><span class="titleCtegoriseHome">Education &amp; Training </span><span class="number" data-number="3500">0</span></a></li>
                                    <li>
                                        <a href="#">
                                            <span class="iconSubCategories">
                                                <img src="/web/pictures/translation11.png"/>
                                            </span><span class="titleCtegoriseHome">Graphic Designer </span>
                                            <span class="number" data-number="1000">0</span>
                                        </a>
                                    </li>
                            </ul>
                        </div>
                        <div class="col-lg-3 col-md-4 ftco-animate">
                            <ul class="category">
                                <li><a href="#"><span class="iconSubCategories">
                                        <img src="/web/pictures/translation11.png"/>
                                    </span>
                                    <span class="titleCtegoriseHome">PHP Programming </span><span class="number" data-number="5500">0</span></a></li>
                                    <li>
                                        <a href="#">
                                            <span class="iconSubCategories">
                                                <img src="/web/pictures/translation11.png"/>
                                            </span><span class="titleCtegoriseHome">Graphic Designer </span>
                                            <span class="number" data-number="1000">0</span>
                                        </a>
                                    </li>
                            </ul>
                        </div>
                        <div class="col-lg-3 col-md-4 ftco-animate">
                            <ul class="category">
                                <li><a href="#"><span class="iconSubCategories">
                                            <img src="/web/pictures/translation11.png"/>
                                    </span>
                                    <span class="titleCtegoriseHome">Web Designer </span><span><span class="number" data-number="8000">0</span></span></a></li>
                                    <li>
                                        <a href="#">
                                            <span class="iconSubCategories">
                                                <img src="/web/pictures/translation11.png"/>
                                            </span><span class="titleCtegoriseHome">Graphic Designer </span>
                                            <span class="number" data-number="1000">0</span>
                                        </a>
                                    </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </section>

            <section class="ftco-section bg-light">
                <div class="container">
                    <div class="row justify-content-center mb-5 pb-3">
                        <div class="col-md-7 heading-section text-center ftco-animate">
                            <span class="subheading">Recently Added Jobs</span>
                            <h2 class="mb-4"><span>Recent</span> Jobs Employee</h2>
                        </div>
                    </div>
                    <div class="row">

                        <div class="col-md-12 ftco-animate">
                            <div class="job-post-item bg-white p-4 d-block d-md-flex align-items-center">

                                <div class="mb-4 mb-md-0 mr-5">
                                    <div class="job-post-item-header d-flex align-items-center">
                                        <h2 class="mr-3 text-black h4">Full Stack Developer</h2>
                                        <div class="badge-wrap">
                                            <span class="bg-warning text-white badge py-2 px-3">Full Time</span>
                                        </div>
                                    </div>
                                    <div class="job-post-item-body d-block d-md-flex">
                                        <div class="mr-3"><span class="icon-layers"></span> <a href="#">Google, Inc.</a></div>
                                        <div><span class="icon-my_location"></span> <span>Western City, UK</span></div>
                                    </div>
                                </div>

                                <div class="ml-auto d-flex">
                                    <a href="job-single.html" class="btn btn-primary py-2 mr-1">Apply Job</a>
                                    <a href="#" class="btn btn-danger rounded-circle btn-favorite d-flex align-items-center">
                                        <span class="icon-heart"></span>
                                    </a>
                                </div>

                            </div>
                        </div> <!-- end -->

                        <div class="col-md-12 ftco-animate">

                            <div class="job-post-item bg-white p-4 d-block d-md-flex align-items-center">

                                <div class="mb-4 mb-md-0 mr-5">
                                    <div class="job-post-item-header d-flex align-items-center">
                                        <h2 class="mr-3 text-black h4">Frontend Development</h2>
                                        <div class="badge-wrap">
                                            <span class="bg-secondary text-white badge py-2 px-3">Internship</span>
                                        </div>
                                    </div>
                                    <div class="job-post-item-body d-block d-md-flex">
                                        <div class="mr-3"><span class="icon-layers"></span> <a href="#">Facebook, Inc.</a></div>
                                        <div><span class="icon-my_location"></span> <span>Western City, UK</span></div>
                                    </div>
                                </div>

                                <div class="ml-auto d-flex">
                                    <a href="job-single.html" class="btn btn-primary py-2 mr-1">Apply Job</a>
                                    <a href="#" class="btn btn-secondary rounded-circle btn-favorite d-flex align-items-center icon">
                                        <span class="icon-heart"></span>
                                    </a>
                                </div>
                            </div>
                        </div> <!-- end -->
                    </div>
                    <div class="row mt-5">
                        <div class="col text-center">
                            <div class="block-27">
                                <ul>
                                    <li><a href="#">&lt;</a></li>
                                    <li class="active"><span>1</span></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">4</a></li>
                                    <li><a href="#">5</a></li>
                                    <li><a href="#">&gt;</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
{*================================================= Recent Job Employer =========================================================*}
            <section class="ftco-section bg-light">
                <div class="container">
                    <div class="row justify-content-center mb-5 pb-3">
                        <div class="col-md-7 heading-section text-center ftco-animate">
                            <span class="subheading">Recently Added Jobs</span>
                            <h2 class="mb-4"><span>Recent</span> Jobs Employer</h2>
                        </div>
                    </div>
                    <div class="row">

                        <div class="col-md-12 ftco-animate">
                            <div class="job-post-item bg-white p-4 d-block d-md-flex align-items-center">

                                <div class="mb-4 mb-md-0 mr-5">
                                    <div class="job-post-item-header d-flex align-items-center">
                                        <h2 class="mr-3 text-black h4">Full Stack Developer</h2>
                                        <div class="badge-wrap">
                                            <span class="bg-warning text-white badge py-2 px-3">Full Time</span>
                                        </div>
                                    </div>
                                    <div class="job-post-item-body d-block d-md-flex">
                                        <div class="mr-3"><span class="icon-layers"></span> <a href="#">Google, Inc.</a></div>
                                        <div><span class="icon-my_location"></span> <span>Western City, UK</span></div>
                                    </div>
                                </div>

                                <div class="ml-auto d-flex">
                                    <a href="job-single.html" class="btn btn-primary py-2 mr-1">Apply Job</a>
                                    <a href="#" class="btn btn-danger rounded-circle btn-favorite d-flex align-items-center">
                                        <span class="icon-heart"></span>
                                    </a>
                                </div>

                            </div>
                        </div> <!-- end -->

                        <div class="col-md-12 ftco-animate">

                            <div class="job-post-item bg-white p-4 d-block d-md-flex align-items-center">

                                <div class="mb-4 mb-md-0 mr-5">
                                    <div class="job-post-item-header d-flex align-items-center">
                                        <h2 class="mr-3 text-black h4">Frontend Development</h2>
                                        <div class="badge-wrap">
                                            <span class="bg-secondary text-white badge py-2 px-3">Internship</span>
                                        </div>
                                    </div>
                                    <div class="job-post-item-body d-block d-md-flex">
                                        <div class="mr-3"><span class="icon-layers"></span> <a href="#">Facebook, Inc.</a></div>
                                        <div><span class="icon-my_location"></span> <span>Western City, UK</span></div>
                                    </div>
                                </div>

                                <div class="ml-auto d-flex">
                                    <a href="job-single.html" class="btn btn-primary py-2 mr-1">Apply Job</a>
                                    <a href="#" class="btn btn-secondary rounded-circle btn-favorite d-flex align-items-center icon">
                                        <span class="icon-heart"></span>
                                    </a>
                                </div>
                            </div>
                        </div> <!-- end -->
                    </div>
                    <div class="row mt-5">
                        <div class="col text-center">
                            <div class="block-27">
                                <ul>
                                    <li><a href="#">&lt;</a></li>
                                    <li class="active"><span>1</span></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">4</a></li>
                                    <li><a href="#">5</a></li>
                                    <li><a href="#">&gt;</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
{*=========================================================Popular jobs============================================================*}
            <section class="ftco-section bg-light">
                <div class="container">
                    <div class="row justify-content-center mb-5 pb-3">
                        <div class="col-md-7 heading-section text-center ftco-animate">
                            <h2><span>Poular</span> Jobs</h2>
                        </div>
                    </div>
                    {*<div class="row d-flex">*}
                    <div id="PopularJobs" class="classOwl-dote-margin owl-carousel owl-theme" style="opacity: 1; display: block;">   
                        <div class="item">
                            <div class="blog-entry align-self-stretch">
                                <a href="blog-single.html" class="block-20" style="background-image: url('/web/pictures/image_1.jpg');">
                                </a>
                                <div class="text mt-3">
                                    <div class="meta mb-2">
                                        <div><a href="#">December 2, 2018</a></div>
                                        <div><a href="#">Admin</a></div>
                                        <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                                    </div>
                                    <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias architecto enim non iste maxime optio, ut com</p>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="blog-entry align-self-stretch">
                                <a href="blog-single.html" class="block-20" style="background-image: url('/web/pictures/image_1.jpg');">
                                </a>
                                <div class="text mt-3">
                                    <div class="meta mb-2">
                                        <div><a href="#">December 2, 2018</a></div>
                                        <div><a href="#">Admin</a></div>
                                        <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                                    </div>
                                    <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias architecto enim non iste maxime optio, ut com</p>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="blog-entry align-self-stretch">
                                <a href="blog-single.html" class="block-20" style="background-image: url('/web/pictures/image_1.jpg');">
                                </a>
                                <div class="text mt-3">
                                    <div class="meta mb-2">
                                        <div><a href="#">December 2, 2018</a></div>
                                        <div><a href="#">Admin</a></div>
                                        <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                                    </div>
                                    <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias architecto enim non iste maxime optio, ut com</p>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="blog-entry align-self-stretch">
                                <a href="blog-single.html" class="block-20" style="background-image: url('/web/pictures/image_1.jpg');">
                                </a>
                                <div class="text mt-3">
                                    <div class="meta mb-2">
                                        <div><a href="#">December 2, 2018</a></div>
                                        <div><a href="#">Admin</a></div>
                                        <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                                    </div>
                                    <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias architecto enim non iste maxime optio, ut com</p>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="blog-entry align-self-stretch">
                                <a href="blog-single.html" class="block-20" style="background-image: url('/web/pictures/image_1.jpg');">
                                </a>
                                <div class="text mt-3">
                                    <div class="meta mb-2">
                                        <div><a href="#">December 2, 2018</a></div>
                                        <div><a href="#">Admin</a></div>
                                        <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                                    </div>
                                    <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias architecto enim non iste maxime optio, ut com</p>
                                </div>
                            </div>
                        </div>
                       
                    </div>
                </div>
            </section>
{*======================================================= Employer Section ==============================================================================*}
<section clas="ftco-section" id="Gallery1">
                <div class="col-md-12 text-center">
                    <h2>Employers</h2>
                </div>
                <div class="content col-md-12">
                    <div id="owl-demo1" class="classOwl-dote-margin owl-demo-same-item owl-carousel owl-theme" style="opacity: 1; display: block;">   
                        <div class="item">
                            <div class="blog-entry">
                                <img style="width: 500px;" src="{url('pictures/bg_2.jpg','web','frontend')}" alt="Owl Image">
                                <div class="TitleandDescription">
                                    <h4>Recruiter 1</h4>
                                    <p>zaeze erzzzzzzzzz rere rerererererere rerererererere errrrrr eeeeee er err re</p>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="blog-entry">
                                <img style="width: 500px;" src="{url('pictures/image_2.jpg','web','frontend')}" alt="Owl Image">
                                <div class="TitleandDescription">
                                    <h4>Recruiter 1</h4>
                                    <p>zaeze erzzzzzzzzz rere rerererererere rerererererere errrrrr eeeeee er err re</p>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="blog-entry">
                                <img style="width: 500px;" src="{url('pictures/image_3.jpg','web','frontend')}" alt="Owl Image">
                                <div class="TitleandDescription">
                                    <h4>Recruiter 1</h4>
                                    <p>zaeze erzzzzzzzzz rere rerererererere rerererererere errrrrr eeeeee er err re</p>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="blog-entry">
                                <img style="width: 500px;" src="{url('pictures/bg_1.jpg','web','frontend')}" alt="Owl Image">
                               <div class="TitleandDescription">
                                    <h4>Recruiter 1</h4>
                                    <p>zaeze erzzzzzzzzz rere rerererererere rerererererere errrrrr eeeeee er err re</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
{*=============================================================== Comments =================================================================== *} 
<section class="ftco-section testimony-section">
                <div class="container">
                    <div class="row justify-content-center mb-5 pb-3">
                        <div class="col-md-7 text-center heading-section ftco-animate">
                            <span class="subheading">Testimonial</span>
                            <h2 class="mb-4"><span>Happy</span> Clients</h2>
                        </div>
                    </div>
                    <div class="row ftco-animate">
                        <div class="col-md-12">
                            <div class="carousel-testimony owl-carousel ftco-owl">
                                <div class="item">
                                    <div class="testimony-wrap py-4 pb-5">
                                        <div class="user-img mb-4" style="background-image: url(images/person_1.jpg)">
                                            <span class="quote d-flex align-items-center justify-content-center">
                                                <i class="icon-quote-left"></i>
                                            </span>
                                        </div>
                                        <div class="text">
                                            <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                            <p class="name">Roger Scott</p>
                                            <span class="position">Marketing Manager</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="testimony-wrap py-4 pb-5">
                                        <div class="user-img mb-4" style="background-image: url(images/person_2.jpg)">
                                            <span class="quote d-flex align-items-center justify-content-center">
                                                <i class="icon-quote-left"></i>
                                            </span>
                                        </div>
                                        <div class="text">
                                            <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                            <p class="name">Roger Scott</p>
                                            <span class="position">Interface Designer</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="testimony-wrap py-4 pb-5">
                                        <div class="user-img mb-4" style="background-image: url(images/person_3.jpg)">
                                            <span class="quote d-flex align-items-center justify-content-center">
                                                <i class="icon-quote-left"></i>
                                            </span>
                                        </div>
                                        <div class="text">
                                            <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                            <p class="name">Roger Scott</p>
                                            <span class="position">UI Designer</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="testimony-wrap py-4 pb-5">
                                        <div class="user-img mb-4" style="background-image: url(images/person_1.jpg)">
                                            <span class="quote d-flex align-items-center justify-content-center">
                                                <i class="icon-quote-left"></i>
                                            </span>
                                        </div>
                                        <div class="text">
                                            <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                            <p class="name">Roger Scott</p>
                                            <span class="position">Web Developer</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="testimony-wrap py-4 pb-5">
                                        <div class="user-img mb-4" style="background-image: url(images/person_1.jpg)">
                                            <span class="quote d-flex align-items-center justify-content-center">
                                                <i class="icon-quote-left"></i>
                                            </span>
                                        </div>
                                        <div class="text">
                                            <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                            <p class="name">Roger Scott</p>
                                            <span class="position">System Analyst</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
{*========================================================== Numbers ===============================================================*}
            <section class="ftco-section ftco-counter" id="section-counter">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-md-10">
                            <div class="row">
                                <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                                    <div class="block-18 text-center">
                                        <div class="text">
                                            <strong class="number" data-number="1350000">0</strong>
                                            <span>Jobs</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                                    <div class="block-18 text-center">
                                        <div class="text">
                                            <strong class="number" data-number="40000">0</strong>
                                            <span>Members</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                                    <div class="block-18 text-center">
                                        <div class="text">
                                            <strong class="number" data-number="30000">0</strong>
                                            <span>Resume</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                                    <div class="block-18 text-center">
                                        <div class="text">
                                            <strong class="number" data-number="10500">0</strong>
                                            <span>Company</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
{*======================================================== Employee ===============================================================*}
            <section clas="ftco-section" id="Gallery1">
                <div class="col-md-12 text-center">
                    <h2>Employees</h2>
                </div>
                <div class="content col-md-12">
                    <div id="owl-demo2" class="classOwl-dote-margin owl-demo-same-item owl-carousel owl-theme" style="opacity: 1; display: block;">   
                        <div class="item">
                            <div class="blog-entry">
                                <img style="width: 500px;" src="{url('pictures/bg_2.jpg','web','frontend')}" alt="Owl Image">
                                <div class="TitleandDescription">
                                    <h4>Recruiter 1</h4>
                                    <p>zaeze erzzzzzzzzz rere rerererererere rerererererere errrrrr eeeeee er err re</p>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="blog-entry">
                                <img style="width: 500px;" src="{url('pictures/image_2.jpg','web','frontend')}" alt="Owl Image">
                                <div class="TitleandDescription">
                                    <h4>Recruiter 1</h4>
                                    <p>zaeze erzzzzzzzzz rere rerererererere rerererererere errrrrr eeeeee er err re</p>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="blog-entry">
                                <img style="width: 500px;" src="{url('pictures/image_3.jpg','web','frontend')}" alt="Owl Image">
                                <div class="TitleandDescription">
                                    <h4>Recruiter 1</h4>
                                    <p>zaeze erzzzzzzzzz rere rerererererere rerererererere errrrrr eeeeee er err re</p>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="blog-entry">
                                <img style="width: 500px;" src="{url('pictures/bg_1.jpg','web','frontend')}" alt="Owl Image">
                               <div class="TitleandDescription">
                                    <h4>Recruiter 1</h4>
                                    <p>zaeze erzzzzzzzzz rere rerererererere rerererererere errrrrr eeeeee er err re</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
{*============================================Section Event===============================================*}
            {*<section class="ftco-section bg-light">
                <div class="container">
                    <div class="row justify-content-center mb-5 pb-3">
                        <div class="col-md-7 heading-section text-center ftco-animate">
                            <h2><span>Section</span> Events</h2>
                        </div>
                    </div>
                    <div class="row d-flex">
                        <div class="col-md-3 d-flex ftco-animate">
                            <div class="blog-entry align-self-stretch">
                                <a href="blog-single.html" class="block-20" style="background-image: url('/web/pictures/image_1.jpg');">
                                </a>
                                <div class="text mt-3">
                                    <div class="meta mb-2">
                                        <div><a href="#">December 2, 2018</a></div>
                                        <div><a href="#">Admin</a></div>
                                        <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                                    </div>
                                    <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias architecto enim non iste maxime optio, ut com</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 d-flex ftco-animate">
                            <div class="blog-entry align-self-stretch">
                                <a href="blog-single.html" class="block-20" style="background-image: url('/web/pictures/image_2.jpg');">
                                </a>
                                <div class="text mt-3">
                                    <div class="meta mb-2">
                                        <div><a href="#">December 2, 2018</a></div>
                                        <div><a href="#">Admin</a></div>
                                        <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                                    </div>
                                    <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet nobis natus incidunt officia assumenda.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 d-flex ftco-animate">
                            <div class="blog-entry align-self-stretch">
                                <a href="blog-single.html" class="block-20" style="background-image: url('/web/pictures/image_3.jpg');">
                                </a>
                                <div class="text mt-3">
                                    <div class="meta mb-2">
                                        <div><a href="#">December 2, 2018</a></div>
                                        <div><a href="#">Admin</a></div>
                                        <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                                    </div>
                                    <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Excepturi obcaecati praesentium,</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 d-flex ftco-animate">
                            <div class="blog-entry align-self-stretch">
                                <a href="blog-single.html" class="block-20" style="background-image: url('/web/pictures/image_4.jpg');">
                                </a>
                                <div class="text mt-3">
                                    <div class="meta mb-2">
                                        <div><a href="#">December 2, 2018</a></div>
                                        <div><a href="#">Admin</a></div>
                                        <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                                    </div>
                                    <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolor minima, dolores quis, dolorum accusamu</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>*}
            
            <section class="ftco-section bg-light">
                <div class="container">
                    <div class="row justify-content-center mb-5 pb-3">
                        <div class="col-md-7 heading-section text-center ftco-animate">
                            <h2>Events</h2>
                        </div>
                    </div>
                    <div id="SectionEvents" class="classOwl-dote-margin owl-carousel owl-theme" style="opacity: 1; display: block;">   
                        <div class="item">
                            <div class="blog-entry align-self-stretch">
                                <a href="blog-single.html" class="block-20" style="background-image: url('/web/pictures/image_1.jpg');">
                                </a>
                                <div class="SectionEventDivInfo">
                                    <div class="titleAndDate">
                                        <h4>Titre 1</h4>
                                        <span class="ClassFloatRight">22/08/2020</span>
                                    </div>
                                    <div>
                                        <span class="icon-my_location"></span> <span>Western City, UK</span>
                                        <button class="btn btn-primary BookEvent">Book Event</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="blog-entry align-self-stretch">
                                <a href="blog-single.html" class="block-20" style="background-image: url('/web/pictures/image_1.jpg');">
                                </a>
                                <div class="SectionEventDivInfo">
                                    <div class="titleAndDate">
                                        <h4>Titre 1</h4>
                                        <span class="ClassFloatRight">22/08/2020</span>
                                    </div>
                                    <div>
                                        <span class="icon-my_location"></span> <span>Western City, UK</span>
                                        <button class="btn btn-primary BookEvent">Book Event</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="blog-entry align-self-stretch">
                                <a href="blog-single.html" class="block-20" style="background-image: url('/web/pictures/image_1.jpg');">
                                </a>
                                <div class="SectionEventDivInfo">
                                    <div class="titleAndDate">
                                        <h4>Titre 1</h4>
                                        <span class="ClassFloatRight">22/08/2020</span>
                                    </div>
                                    <div>
                                        <span class="icon-my_location"></span> <span>Western City, UK</span>
                                        <button class="btn btn-primary BookEvent">Book Event</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="blog-entry align-self-stretch">
                                <a href="blog-single.html" class="block-20" style="background-image: url('/web/pictures/image_1.jpg');">
                                </a>
                                <div class="SectionEventDivInfo">
                                    <div class="titleAndDate">
                                        <h4>Titre 1</h4>
                                        <span class="ClassFloatRight">22/08/2020</span>
                                    </div>
                                    <div>
                                        <span class="icon-my_location"></span> <span>Western City, UK</span>
                                         <button class="btn btn-primary BookEvent">Book Event</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="blog-entry align-self-stretch">
                                <a href="blog-single.html" class="block-20" style="background-image: url('/web/pictures/image_1.jpg');">
                                </a>
                                <div class="SectionEventDivInfo">
                                    <div class="titleAndDate">
                                        <h4>Titre 1</h4>
                                        <span class="ClassFloatRight">22/08/2020</span>
                                    </div>
                                    <div>
                                        <span class="icon-my_location"></span> <span>Western City, UK</span>
                                         <button class="btn btn-primary BookEvent">Book Event</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            
{*============================================================= Last Gallery ===========================================================*}
            <section class="ftco-section bg-light">
                <div class="container">
                    <div id="SectionLastGellery" class="classOwl-dote-margin owl-carousel owl-theme" style="opacity: 1; display: block;">   
                        <div class="item">
                            <div class="SectionLastGellery-div">
                                <a href="blog-single.html" class="">
                                    <h1>Learn a new skill and make your money</h1>
                                    <div class="bigTitle">Graphex Academy</div>
                                </a>
                            </div>
                        </div>
                        <div class="item">
                            <div class="SectionLastGellery-div">
                                <a href="blog-single.html" class="">
                                    <h1>Learn a new skill and make your money</h1>
                                    <div class="bigTitle">Graphex Academy</div>
                                </a>
                            </div>
                        </div>
                        <div class="item">
                            <div class="SectionLastGellery-div">
                                <a href="blog-single.html" class="">
                                    <h1>Learn a new skill and make your money</h1>
                                    <div class="bigTitle">Graphex Academy</div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            {component name="/customers_newsletter/signin"}	                                          
            {include file="./includes/footer.tpl"}
            {component name="/site_cookie/panel"}
        </div>


        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

        {component name="/employers/postAJob"}    
        {component name="/employees/wantAJob"}
        

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
        <script src="{url('js/bootstrap-datepicker.js','web','frontend')}"></script>
        <script src="{url('js/scrollax.min.js','web','frontend')}"></script>

        <script src="{url('js/google-map.js','web','frontend')}"></script>
        <script src="{url('js/main.js','web','frontend')}"></script>
        <script src="{url('js/dropzone.js','web','frontend')}"></script>


        {*header*}
        {*component name="/site_cookie/panel"*}
        <script type="text/javascript">

{*$('ul li.dropdown').hover(function() {
    $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(500);
  }, function() {
    $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(500);
  });
*}
            $("#owl-demo1").owlCarousel({
                loop: false,
                autoPlay: 3000,
                autoplay: false,
                items: 3,
                nav: true,
                dots: true,
                margin: 30,
                navText : ["<img src='/web/pictures/previous1.png'>","<img src='/web/pictures/next1.png'>"],
                responsive: {
                    0: {
                        items: 1
                    },
                    857: {
                        items: 2
                    },
                    1000: {
                        items: 3
                    }
                },
            });

            $("#owl-demo2").owlCarousel({
                loop: true,
                autoPlay: 3000,
                autoplay: true,
                items: 3,
                nav: true,
                dots: true,
                margin: 30,
                navText : ["<img src='/web/pictures/previous1.png'>","<img src='/web/pictures/next1.png'>"],
                responsive: {
                    0: {
                        items: 1
                    },
                    857: {
                        items: 2
                    },
                    1000: {
                        items: 3
                    }
                },
            });


{*function setOwlStageHeight(event) {
    var maxHeight = 0;
    $('.owl-item.active').each(function () { // LOOP THROUGH ACTIVE ITEMS
        var thisHeight = parseInt( $(this).height() );
        maxHeight=(maxHeight>=thisHeight?maxHeight:thisHeight);
    });
    $('.owl-carousel').css('height', maxHeight );
    $('.owl-stage-outer').css('height', maxHeight ); // CORRECT DRAG-AREA SO BUTTONS ARE CLICKABLE
}*}



            $('#owlCarouselGallery').owlCarousel({
                loop: true,
                autoPlay: 3000,
                autoplay: true,
                nav: true,
                items: 1,
                nav: false,
                dots: false,
            });
            
            $("#PopularJobs").owlCarousel({
                loop: false,
                autoPlay: 3000,
                autoplay: false,
                items: 4,
                nav: true,
                dots: true,
                margin: 30,
                navText : ["<img src='/web/pictures/previous1.png'>","<img src='/web/pictures/next1.png'>"],
                responsive: {
                    0: {
                        items: 1
                    },
                    857: {
                        items: 2
                    },
                    1000: {
                        items: 3
                    },
                    1020: {
                        items: 4
                    }
                },
            });
            
            $("#SectionEvents").owlCarousel({
                loop: false,
                autoPlay: 3000,
                autoplay: false,
                items: 4,
                nav: true,
                dots: true,
                margin: 30,
                navText : ["<img src='/web/pictures/previous1.png'>","<img src='/web/pictures/next1.png'>"],
                responsive: {
                    0: {
                        items: 1
                    },
                    857: {
                        items: 2
                    },
                    1000: {
                        items: 3
                    },
                    1020: {
                        items: 4
                    }
                },
            });
            $('#SectionLastGellery').owlCarousel({
                loop: false,
                autoPlay: 3000,
                autoplay: false,
                nav: true,
                items: 1,
                nav: true,
                dots: true,
                navText : ["<img src='/web/pictures/previous1.png'>","<img src='/web/pictures/next1.png'>"],
            });

        </script> 
    </body>
</html>
