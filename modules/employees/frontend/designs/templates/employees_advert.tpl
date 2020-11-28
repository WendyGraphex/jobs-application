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
        <link rel="stylesheet" media="all" href="{url('/majestic/css/font-awesome/4.7.0/font-awesome.min.css','web','frontend')}"/>
        {*<link rel="stylesheet" media="all" href="{url('majestic/css/bootstrap/bootstrap.css','web','frontend')}">*}  
        <link rel="stylesheet" media="all" href="{url('css/unitegallery/unite-gallery.css','web','frontend')}"/>
        <link rel="stylesheet" media="all" href="{url('css/unitegallery/ug-theme-default.css','web','frontend')}"/>
        <script src="{url('js/jquery/3.2.1/jquery-3.2.1.min.js','web','frontend')}"></script>      
        {header}
    </head>
    <body>

        {include file="./includes/header-nav.tpl"}
        <!-- END nav -->

        <section class="AdvertInfo ftco-section ftco-degree-bg">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="saveShare">
                             {component name="/employees_alert/alertEmployeeAdvertBtn" advert_i18n=$advert_i18n}              
                            {component name="/employers_alert/alertEmployeeAdvertBtn" advert_i18n=$advert_i18n}          
                            {component name="/employees/favoriteEmployeeAdvertBtn" advert_i18n=$advert_i18n}              
                            {component name="/employers/favoriteEmployeeAdvertBtn" advert_i18n=$advert_i18n}              
                            {*<label class="countSaves">5484</label>*}
                            {component name="/employees/shareAdvertBtn" advert_i18n=$advert_i18n}                         
                        </div> 
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-8 col-md-12 ftco-animate">
                        <h2 class="mb-3">{$advert_i18n->getFormatter()->getTitle()->ucfirst()}</h2>
                        <div style="margin-bottom: 50px;">
                            <div class="seller-overview">
                                <div style="display: flex;">
                                    <div class="user-profile-image">
                                        <label class="profile-pict" style="width: 32px;height: 32px;font-size: 1em;">
                                            {if $advert_i18n->getAdvert()->getEmployeeUser()->hasAvatar()}
                                                <a href="{$advert_i18n->getAdvert()->getEmployeeUser()->getUrl()}">
                                                     <img src="{$advert_i18n->getAdvert()->getEmployeeUser()->getAvatar()->getThumb()->getUrl()}" class="profile-pict-img" alt="{$advert_i18n->getAdvert()->getEmployeeUser()->get('username')}">
                                                </a>
                                            {else}    
                                                <img src="/web/pictures/person_4.jpg" class="profile-pict-img" alt="{$advert_i18n->getAdvert()->getEmployeeUser()->getFormatter()->getUserName()}">
                                            {/if}
                                        </label>
                                    </div>
                                    <div class="profile-name">
                                        <span class="user-status">
                                            <a href="{$advert_i18n->getAdvert()->getEmployeeUser()->getUrl()}" class="seller-link">{$advert_i18n->getAdvert()->getEmployeeUser()->getFormatter()->getUserName()}</a>
                                            {if $advert_i18n->getAdvert()->getEmployeeUser()->hasCompany()}
                                                <a href="{$advert_i18n->getAdvert()->getEmployeeUser()->getCompany()->getUrl()}" class="company-advert-class">
                                                    <span class="">{$advert_i18n->getAdvert()->getEmployeeUser()->getCompany()->getFormatter()->getName()->ucfirst()}</span>
                                                </a>
                                            {/if}
                                        </span>
                                    </div>
                                </div>
                                {* <div class="seller-level">Level 2 Seller</div> *}
                                <div class="user-advert-info">
                                    {component name="/employees_notation/notations" employee_user=$advert_i18n->getAdvert()->getEmployeeUser()}                        
                                    {*<span class="total-orders">168 Orders in Queue</span> *}
                                </div>
                            </div>
                            <div id="gallery">
                                {if $advert_i18n->getAdvert()->getDocuments()->isEmpty()}   
                                    <img src="/web/pictures/555.jpg">
                                {else}                    
                                    {foreach $advert_i18n->getAdvert()->getDocuments() as $document}                            
                                        <img src="{$document->getFile()->getImages()->getUrl()}" style="max-width: 100% !important"/>                               
                                    {/foreach} 
                                {/if}
                            </div> 
                            <div style="margin-top: 50px;">
                                <div>
                                    <h3 style="margin-bottom: 0px;">{__('Description')}</h3>
                                    <div class="short-content">{$advert_i18n->getFormatter()->getContent()->ucfirst()}</div>
                                </div>
                            </div>
                        </div>
                        {component name="/employees_comment/commentsAdvert" tpl="advert"  advert_i18n=$advert_i18n}
                    </div> <!-- .col-md-8 -->
                    <div class="col-lg-4 col-md-12 sidebar ftco-animate">
                        <h2>{__('About the seller')}</h2>
                        <div class="ProfileUserCard">
                            <div class="UserCard">
                                <div class="UserprofileInfo">
                                    <div class="user-profile-image">
                                        <label class="profile-pict" style="width: 110px; height: 110px; font-size: 2.2em;">                             
                                            {if $advert_i18n->getAdvert()->getEmployeeUser()->hasAvatar()}
                                                <a href="{$advert_i18n->getAdvert()->getEmployeeUser()->getUrl()}">
                                                    <img src="{$advert_i18n->getAdvert()->getEmployeeUser()->getAvatar()->getMedium()->getUrl()}" class="profile-pict-img" alt="{$advert_i18n->getAdvert()->getEmployeeUser()->get('username')}">
                                                </a>
                                            {else}    
                                                <img src="/web/pictures/person_4.jpg" class="profile-pict-img" alt="{$advert_i18n->getAdvert()->getEmployeeUser()->get('username')}">
                                            {/if}
                                        </label>
                                    </div>
                                    <div class="user-profile-information">
                                        <div class="SellerUsername">
                                            <a href="{$advert_i18n->getAdvert()->getEmployeeUser()->getUrl()}" style="color: rgba(0, 0, 0, 0.8);font-size: 18px;">{$advert_i18n->getAdvert()->getEmployeeUser()->get('username')}</a>
                                        </div>
                                        <div class="">
                                            <p class="TitleUserAds">{$advert_i18n->getAdvert()->getEmployeeUser()->getContent()->getI18n()->getFormatter()->getMetaTitle()->ucfirst()}</p>                                                                                                                                                                
                                            {component name="/employers_notation/notations" employer_user=$advert_i18n->getAdvert()->getEmployeeUser() tpl="advert"}                               
                                        </div>
                                        <label>
                                            <a href="#" class="SendMessage btn btn-success classMarginTop">{__('Contact me')}</a>

                                        </label>
                                    </div>
                                </div>
                                <div class="UserInfo-description">
                                    <div class="row row-info-user">
                                        <div class="col-md-4"><div>{__('From')}</div><strong>
                                                <b>{$advert_i18n->getAdvert()->getEmployeeUser()->getFormatter()->getCity()->ucfirst()} - {$advert_i18n->getAdvert()->getEmployeeUser()->getFormatter()->getCountry()->getFormatted()->ucfirst()}                                  
                                                </b>    

                                            </strong></div>
                                        <div class="col-md-4"><div>{__('Member since')}</div><strong>{$advert_i18n->getAdvert()->getEmployeeUser()->getFormatter()->getCreatedAt()->getFormatted('P')}</strong></div>
                                        <div class="col-md-4"><div>{__('Avg. Response Time')}</div><strong>{$advert_i18n->getAdvert()->getEmployeeUser()->getFormatter()->getAverageResponseTime()->getHour()->getText()}</strong></div>
                                    </div>
                                    <div class="row" style="padding-top: 10px;">
                                        <div class="col-md-12">
                                            <p>{$advert_i18n->getAdvert()->getEmployeeUser()->getContent()->getI18n()->getFormatter()->getMetaDescription()->ucfirst()}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        {component name="/employees/listAdvertEmployee" options=['created_at'=>'desc','nbitemsbypage'=>2] employee_user=$advert_i18n->getAdvert()->getEmployeeUser() tpl="advert"}             

                        {component name="/employees_portfolio/portfolio" tpl="portfolio" filter=['nbitemsbypage'=>2] employee_user=$advert_i18n->getAdvert()->getEmployeeUser()}

                        {*component name="/employees_portfolio/portfolio" tpl="portfolio" filter=['nbitemsbypage'=>50] employee_user=$employee_user*}

                        {component name="/employees_notation/ranking" employee_user=$advert_i18n->getAdvert()->getEmployeeUser()}                                

{*
                        <div class="sidebar-box ftco-animate block-recommanded-foryou">
                            <h3>Recommanded for you (TO BE DEFINED)</h3>
                            <span class="next-advert" style="display: none;">
                                <img src="/web/pictures/next1.png"/>
                            </span>
                            <div class="block-21 mb-4 d-flex">
                                <a class="blog-img mr-4" style="background-image: url(/web/pictures/image_1.jpg);"></a>
                                <div class="text">
                                    <h4 class="heading" style="margin-bottom: 0px;"><a href="#">Advert title aaaaa</a></h4>
                                    <p style="margin-bottom: 0px;">efzyvef eygfvyefv ygfey dfreggg ryyyyyyyyyyyyt thhhhhhhhhhhytutyu</p>
                                    <div class="meta">
                                        <div><a href="#"><span class="icon-calendar"></span> July 12, 2018</a></div>
                                        <div><a href="#"><span class="icon-person"></span>Employer1</a></div>
                                         
                                    </div>
                                </div>
                            </div>
                            <div class="block-21 mb-4 d-flex">
                                <a class="blog-img mr-4" style="background-image: url(/web/pictures/image_2.jpg);"></a>
                                <div class="text">
                                    <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                                    <div class="meta">
                                        <div><a href="#"><span class="icon-calendar"></span> July 12, 2018</a></div>
                                        <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                                        <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                                    </div>
                                </div>
                            </div>
                            <div class="block-21 mb-4 d-flex">
                                <a class="blog-img mr-4" style="background-image: url(/web/pictures/image_3.jpg);"></a>
                                <div class="text">
                                    <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                                    <div class="meta">
                                        <div><a href="#"><span class="icon-calendar"></span> July 12, 2018</a></div>
                                        <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                                        <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                                    </div>
                                </div>
                            </div>
                            <div class="block-27 block-adverts-pager" style="display: none;">
                                <ul style="text-align: center;">
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
                        <div class="sidebar-box ftco-animate">
                            <h3>Tag Cloud  (TO BE DEFINED)</h3>
                            <div class="tagcloud">
                                <a href="#" class="tag-cloud-link">dish</a>
                                <a href="#" class="tag-cloud-link">menu</a>
                                <a href="#" class="tag-cloud-link">food</a>
                                <a href="#" class="tag-cloud-link">sweet</a>
                                <a href="#" class="tag-cloud-link">tasty</a>
                                <a href="#" class="tag-cloud-link">delicious</a>
                                <a href="#" class="tag-cloud-link">desserts</a>
                                <a href="#" class="tag-cloud-link">drinks</a>
                            </div>
                        </div>
*}
                        {*<div class="sidebar-box ftco-animate">
                        <h3>Paragraph</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus itaque, autem necessitatibus voluptate quod mollitia delectus aut, sunt placeat nam vero culpa sapiente consectetur similique, inventore eos fugit cupiditate numquam!</p>
                        </div>*}
                    </div>

                </div>
            </div>
        </section> <!-- .section -->

        {component name="/customers_newsletter/signin"}	      

        {include file="./includes/footer.tpl"}



        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

        {component name="/employers/postAJob"}     
        {component name="/employees/wantAJob"}
        
    {component name="/sales_quotation/getquote"}
    {component name="/employees_messager/dialog"}
    {component name="/employees/shareAdvertLink" advert_i18n=$advert_i18n}
    
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


        <script src="{url('js/unitegallery/unitegallery.min.js','web','frontend')}"></script>  
        <script src="{url('js/unitegallery/ug-theme-default.js','web','frontend')}"></script>
        <script src="{url('js/unitegallery/ug-theme-compact.js','web','frontend')}"></script>
        <script type="text/javascript">

 

            $('.carousel-user').owlCarousel({
                margin: 10,
                responsiveClass: true,
                autoHeight: true,
                items: 1,
                // autoplay:true,
                autoplayTimeout: 10000,
                autoplayHoverPause: true,
                nav: true,
                dots: true, //Make this true
                navText: ["<img src='/web/pictures/previous1.png'>", "<img src='/web/pictures/next1.png'>"],
            {*navigationText: ["<img src='myprevimage.png'>","<img src='mynextimage.png'>"],*}
            });

            var api = $("#gallery").unitegallery({
                gallery_theme: "compact",
                theme_skin: "right-thumb", //right-thumb | right-title-only | right-no-thumb
                // gallery_width:'auto',							//gallery width		
                // gallery_height:'auto',		
                theme_autoplay: false,
                // slider_scale_mode: "fill",		//autoplay videos at start.  true / false. Don't working on mobiles.
                theme_disable_panel_timeout: 5000
            });
            {* $("#shareAdEmpl").click(function () {
            alert("rtrytr");
            $("#DialogContact").modal('show'); 
            });*}

            {*$('#copyLink').click(function () {
            alert("huyfyufyusd");
            if ( $('#Link').val() === "") return ;       
            var copyText = $(this).siblings('#Link');
            alert("aaaaaaaaaa".copyText)
            //copyText.select();     
            document.execCommand("copy");
            $('.tooltiptext').css('visibility','visible').fadeOut(2000);   
            });*}

        </script>
    </body>
</html>
