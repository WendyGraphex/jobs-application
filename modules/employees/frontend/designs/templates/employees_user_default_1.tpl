{*<div>
{$employer_user->getFormatter()->getUsername()}
</div>*}
<!DOCTYPE html>
<html lang="en">
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
        {* <link rel="stylesheet"  media="all" href="{url('css/dropzone.css','web','frontend')}"> *}


        <link rel="stylesheet" media="all" href="{url('majestic/css/owl.carousel.css','web','frontend')}">
        <link rel="stylesheet" media="all" href="{url('majestic/css/owl.theme.css','web','frontend')}">
        <link rel="stylesheet" media="all" href="{url('css/font-awesome/4.1.0/font-awesome.min.css','web','frontend')}">
        {*<link rel="stylesheet" media="all" href="{url('majestic/css/bootstrap/bootstrap.css','web','frontend')}">*}  
        <link rel="stylesheet" media="all" href="{url('css/unitegallery/unite-gallery.css','web','frontend')}"/>
        <link rel="stylesheet" media="all" href="{url('css/unitegallery/ug-theme-default.css','web','frontend')}"/>
        <script src="{url('js/jquery/3.2.1/jquery-3.2.1.min.js','web','frontend')}"></script>      
        {header}
    </head>
  <body>
    
	{include file="./includes/header-nav.tpl"}
        
    <!-- END nav -->
    <div class="row d-flex">
        {foreach $pager as $item_i18n}     
            {component name="/employers/advertDisplay" advert=$item_i18n}                 
        {/foreach}                           
    </div> 
    <section class="AdvertInfo ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
            <div class="col-md-12">
                  <div class="saveShare col-md-12">
                      <label class="saveAdEmpl"><i class="mdi mdi-heart"></i><i class="mdi mdi-heart-outline"></i>Save</label>
                      <label class="countSaves">5484</label>
                      <label id="shareAdEmpl" class="shareAdEmpl"><i class="mdi mdi-share-variant"></i>Share</label>
                  </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 ftco-animate">
                <div class="card-onProfile">
                    <div>
                        <div class="user-online-on-profile" data-user-id="">
                            <i class="mdi mdi-circle"></i>online
                        </div>
                    </div>
                    <div class="profile-card-onProfile">
                        <div class="user-image-onProfile">
                            <label class="label-pict-onProfile">
                                <img src="/web/pictures/person_4.jpg" class="pict-img-onProfile" alt="indondesign">
                            </label>
                        </div>
                        <div class="user-information-onProfile">
                            <div class="SellerUsername-onProfile">
                                <a href="#"> Flan Ben flan</a>
                            </div>
                            <div class="info-onProfile">
                                <p class="TitleUserAds-onProfile">Design is thinking made visual !</p>
                                <div style="display: inline-block;">
                                    <span class="UserVotestars-onProfile"><i class="mdi mdi-star"></i><i class="mdi mdi-star"></i><i class="mdi mdi-star"></i><i class="mdi mdi-star-half"></i></span>
                                    <p class="para-onProfile">4.9 (1k+ reviews)</p>
                                </div>
                            </div>
                            <label>
                                <a href="#" class="SendMessage btn btn-success classMarginTop">Contact me</a>
                                <a href="#" class="EmployeeAdvertMakeOffer btn btn-primary classMarginTop">Make an offer</a>
                            </label>
                        </div>
                    </div>
                    <div class="user-Card-info-onProfile">
                        <ul class="user-country">
                            <li class="location">
                                <label><i class="mdi mdi-map-marker"></i> From</label>
                                <b>Morocco</b>
                            </li>
                            <li class="member-since">
                                <label><i class="mdi mdi-account"></i> Member since</label>
                                <b>Mar 2018</b>
                            </li>
                            <li class="response-time">
                                <label><i class="mdi mdi-timer"></i> Avg. Response Time</label>
                                <b>1 hour</b>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="description-onProfile">
                    <h4>Description</h4>
                    <p>Hello,
                    My name is Hussain, apart from photography and music I like designing and founder of mount design.
                    Mount design is a team of professional and enthusiastic designer who believes that every business needs a brand identity to grow and develop their business.
                    So, our main goal is to make the customer delighted with creative design.
                    Let's join the world of creativity!</p>
                    <div class="languages-onProfile">
                        <div><strong>English</strong><span> -- good</span></div>
                    </div>
                    <div class="skills-onProfile">
                        <label class="skills-label"><strong>Photoshop</strong><span> -- good</span></label>
                        <label class="skills-label"><strong>illustrator</strong><span> -- good</span></label>
                        <label class="skills-label"><strong>eeeeeeeeee</strong><span> -- good</span></label>
                    </div>
                    <div class="diplomes-onProfile">
                        <div><strong>Diplome 1</strong><span> -- 2010</span></div>
                        <div><strong>Diplome 2</strong><span> -- 2016</span></div>
                        <div><strong>Diplome 3</strong><span> -- 2018</span></div>
                    </div>
                </div>
            </div>
            {*============================================== List adverts =========================================*}
            <div class="col-md-8 Advert-onProfile sidebar ftco-animate">
                
                {*<div class="saveShare">
                    <label class="saveAdEmpl"><i class="mdi mdi-heart"></i><i class="mdi mdi-heart-outline"></i>Save</label>
                    <label class="countSaves">5484</label>
                    <label id="shareAdEmpl" class="shareAdEmpl"><i class="mdi mdi-share-variant"></i>Share</label>
                </div>*}
                <div class="row">
                <div class="col-lg-4 col-md-6 single-adverton-profile">
                    <div class="blog-entry align-self-stretch">
                        <div class="carousel-profile owl-carousel owl-theme">
                            <div class="item">
                                <a href="blog-single.html" class="block-20">
                                    <img src="/web/pictures/111.jpg"/>
                                </a>
                            </div>
                            <div class="item">
                                <a href="blog-single.html" class="block-20">
                                    <img src="/web/pictures/bg_1.jpg"/>
                                </a>
                            </div>
                            <div class="item">
                                <a href="blog-single.html" class="block-20">
                                    <img src="/web/pictures/444.jpg"/>
                                </a>
                            </div>
                            <div class="item">
                                <a href="blog-single.html" class="block-20">
                                    <img src="/web/pictures/444.jpg"/>
                                </a>
                            </div>
                        </div>
                        <div class="user-advert-onProfile">
                            <span class="user-advertPic-onProfile">
                                <img src="/web/pictures/444.jpg"/>
                            </span>
                            <span class="user-name-onProfile">
                                aaaaaaaaaaaaaaaaaaaaaa
                            </span>
                        </div>
                        <div class="user-text-onProfile" style="padding: 9px;">
                            <a>
                                <h5>I will create flat minimalist logo design in 12 hours</h5>
                            </a>
                        </div>
                        <div class="user-notes-onProfile" style="padding: 9px;">
                            <span>
                                <i class="mdi mdi-star-half"></i>(2.1k)
                            </span>
                        </div>
                        <div class="footer-onProfile">
                            <span class="save-onProfile">
                                <i class="mdi mdi-heart"></i>
                            </span>
                            <span class="starting-onProfile">
                                <label>Starting At<strong>120$</strong></label>
                            </span>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-4 col-md-6 single-adverton-profile">
                    <div class="blog-entry align-self-stretch">
                        <div class="carousel-profile owl-carousel owl-theme">
                            <div class="item">
                                <a href="blog-single.html" class="block-20">
                                    <img src="/web/pictures/111.jpg"/>
                                </a>
                            </div>
                            <div class="item">
                                <a href="blog-single.html" class="block-20">
                                    <img src="/web/pictures/bg_1.jpg"/>
                                </a>
                            </div>
                            <div class="item">
                                <a href="blog-single.html" class="block-20">
                                    <img src="/web/pictures/444.jpg"/>
                                </a>
                            </div>
                            <div class="item">
                                <a href="blog-single.html" class="block-20">
                                    <img src="/web/pictures/444.jpg"/>
                                </a>
                            </div>
                        </div>
                        <div class="user-advert-onProfile">
                            <span class="user-advertPic-onProfile">
                                <img src="/web/pictures/444.jpg"/>
                            </span>
                            <span class="user-name-onProfile">
                                aaaaaaaaaaaaaaaaaaaaaa
                            </span>
                        </div>
                        <div class="user-text-onProfile" style="padding: 9px;">
                            <a>
                                <h5>I will create flat minimalist logo design in 12 hours</h5>
                            </a>
                        </div>
                        <div class="user-notes-onProfile" style="padding: 9px;">
                            <span>
                                <i class="mdi mdi-star-half"></i>(2.1k)
                            </span>
                        </div>
                        <div class="footer-onProfile">
                            <span class="save-onProfile">
                                <i class="mdi mdi-heart"></i>
                            </span>
                            <span class="starting-onProfile">
                                <label>Starting At<strong>120$</strong></label>
                            </span>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-4 col-md-6 single-adverton-profile">
                    <div class="blog-entry align-self-stretch">
                        <div class="carousel-profile owl-carousel owl-theme">
                            <div class="item">
                                <a href="blog-single.html" class="block-20">
                                    <img src="/web/pictures/111.jpg"/>
                                </a>
                            </div>
                            <div class="item">
                                <a href="blog-single.html" class="block-20">
                                    <img src="/web/pictures/bg_1.jpg"/>
                                </a>
                            </div>
                            <div class="item">
                                <a href="blog-single.html" class="block-20">
                                    <img src="/web/pictures/444.jpg"/>
                                </a>
                            </div>
                            <div class="item">
                                <a href="blog-single.html" class="block-20">
                                    <img src="/web/pictures/444.jpg"/>
                                </a>
                            </div>
                        </div>
                        <div class="user-advert-onProfile">
                            <span class="user-advertPic-onProfile">
                                <img src="/web/pictures/444.jpg"/>
                            </span>
                            <span class="user-name-onProfile">
                                aaaaaaaaaaaaaaaaaaaaaa
                            </span>
                        </div>
                        <div class="user-text-onProfile" style="padding: 9px;">
                            <a>
                                <h5>I will create flat minimalist logo design in 12 hours</h5>
                            </a>
                        </div>
                        <div class="user-notes-onProfile" style="padding: 9px;">
                            <span>
                                <i class="mdi mdi-star-half"></i>(2.1k)
                            </span>
                        </div>
                        <div class="footer-onProfile">
                            <span class="save-onProfile">
                                <i class="mdi mdi-heart"></i>
                            </span>
                            <span class="starting-onProfile">
                                <label>Starting At<strong>120$</strong></label>
                            </span>
                        </div>
                    </div>
                </div>
                </div>
                {*==============================Portfolio=================================*}
                <div>
                    <div class="col-md-12"><h2>My Portfolio</h2></div>
                    <div class="col-md-4">
                        <div class="blog-entry align-self-stretch">
                            <div class="">
                                <div class="item">
                                    <a href="blog-single.html" class="block-20">
                                        <img src="/web/pictures/111.jpg" style="max-width: 100%;height: 100%;margin: 0 auto;display: block;"/>
                                    </a>
                                </div>
                            </div>
                            <div class="user-text-onProfile" style="padding: 9px;">
                                <a>
                                    <h5>I will create flat minimalist logo design in 12 hours</h5>
                                </a>
                            </div>
                            <div style="text-align: right;padding: 5px;">
                                <a href="#" style="color: black;">See All</a>
                            </div>
                        </div>
                    </div>
                </div>
                {*================================ Ranking ===============================*}
                <div class="ranking-onProfile">
                    <div class="notations" style="padding: 25px;">
                        <div class="details-notations">
                            <span class="total-rating">4299 Reviews</span>
                            <span class="all-stars-voted"><i class="mdi mdi-star"></i><i class="mdi mdi-star"></i><i class="mdi mdi-star"></i><i class="mdi mdi-star-half"></i></span>
                            <span class="total-votes">4.9</span>
                        </div>
                        <div class="ranking-notation">
                            <ul class="list-notation">
                                <li>Seller communication level
                                    <span>4.9<i class="mdi mdi-star"></i></span>
                                </li>
                                <li>
                                    Recommend to a friend
                                    <span>4.8<i class="mdi mdi-star-half"></i></span>
                                </li>
                                <li>Service as described
                                    <span>4.9<i class="mdi mdi-star-half"></i></span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                {*=================================== Comments ================================*}
                <div class="comments-onProfile">
                    <h3 class="mb-5">6 Comments</h3>
                    <ul class="comment-list">
                      <li class="comment">
                        <div class="vcard bio">
                          <img src="/web/pictures/person_1.jpg" alt="Image placeholder">
                        </div>
                        <div class="comment-body">
                          <h3>John Doe</h3>
                          <div class="meta">October 03, 2018 at 2:21pm</div>
                          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                          <p><a href="#" class="reply">Reply</a></p>
                        </div>
                      </li>

                      <li class="comment">
                        <div class="vcard bio">
                          <img src="/web/pictures/person_1.jpg" alt="Image placeholder">
                        </div>
                        <div class="comment-body">
                          <h3>John Doe</h3>
                          <div class="meta">October 03, 2018 at 2:21pm</div>
                          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                          <p><a href="#" class="reply">Reply</a></p>
                        </div>
                      </li>

                      <li class="comment">
                        <div class="vcard bio">
                          <img src="/web/pictures/person_1.jpg" alt="Image placeholder">
                        </div>
                        <div class="comment-body">
                          <h3>John Doe</h3>
                          <div class="meta">October 03, 2018 at 2:21pm</div>
                          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                          <p><a href="#" class="reply">Reply</a></p>
                        </div>
                      </li>
                    </ul>
                    <!-- END comment-list -->

                    <div class="comment-form-wrap pt-5">
                      <h3 class="mb-5">Leave a comment</h3>
                      <form action="#" class="p-5 bg-light">
                        <div class="form-group">
                          <label for="name">Name *</label>
                          <input type="text" class="form-control" id="name">
                        </div>
                        <div class="form-group">
                          <label for="email">Email *</label>
                          <input type="email" class="form-control" id="email">
                        </div>
                        <div class="form-group">
                          <label for="website">Website</label>
                          <input type="url" class="form-control" id="website">
                        </div>

                        <div class="form-group">
                          <label for="message">Message</label>
                          <textarea name="" id="message" cols="30" rows="10" class="form-control"></textarea>
                        </div>
                        <div class="form-group">
                          <input type="submit" value="Post Comment" class="btn py-3 px-4 btn-primary">
                        </div>

                      </form>
                    </div>
                </div>
            </div>
        </div>
      </div>
    </section> <!-- .section -->

    <section class="ftco-section-parallax">
      <div class="parallax-img d-flex align-items-center">
        <div class="container">
          <div class="row d-flex justify-content-center">
            <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
              <h2>Subcribe to our Newsletter</h2>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in</p>
              <div class="row d-flex justify-content-center mt-4 mb-4">
                <div class="col-md-8">
                  <form action="#" class="subscribe-form">
                    <div class="form-group d-flex">
                      <input type="text" class="form-control" placeholder="Enter email address">
                      <input type="submit" value="Subscribe" class="submit px-3">
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

   {include file="./includes/footer.tpl"}
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
    {*component name="/sales_quotation/getquote"}
    {component name="/employees_messager/dialog"}
    {component name="/employees/shareLink"*}
  
  
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
  <script src="{url('js/jquery.custom.js','web')}"></script>
  

    <script src="{url('js/unitegallery/unitegallery.min.js','web','frontend')}"></script>  
    <script src="{url('js/unitegallery/ug-theme-default.js','web','frontend')}"></script>
    <script src="{url('js/unitegallery/ug-theme-compact.js','web','frontend')}"></script>
  <script type="text/javascript">
            
    $('.carousel-profile').owlCarousel({
            margin:10,
            responsiveClass:true,
            autoHeight:true,
            items:1,
           // autoplay:true,
            autoplayTimeout:10000,
            autoplayHoverPause:true,
            nav : true,
            dots: true, //Make this true
            navText : ["<img src='/web/pictures/previous1.png'>","<img src='/web/pictures/next1.png'>"],
            {*navigationText: ["<img src='myprevimage.png'>","<img src='mynextimage.png'>"],*}
        });
       {* $("#shareAdEmpl").click(function () {
            alert("rtrytr");
            $("#DialogContact").modal('show'); 
        });*}
</script>
  </body>
</html>
