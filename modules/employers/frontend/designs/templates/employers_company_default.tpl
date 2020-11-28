<!DOCTYPE html>
<html lang="{$_request->getLanguage()}">
    <head>
        <meta charset="UTF-8">
        <title>{component name="/site_company/Display" COMMENT=false} - {$company->getContent()->getI18n()->getFormatter()->getMetaTitle()->ucfirst()}</title>
        <meta name="description" content="{$company->getContent()->getI18n()->getFormatter()->getMetaDescription()}">  
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
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
                      {*<label class="countSaves">5484</label>*}
                      <label id="shareAdEmpl" class="shareAdEmpl"><i class="mdi mdi-share-variant"></i>Share</label>
                  </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 ftco-animate">
                <div class="card-onProfile">
                    <div>
                        {if $company->isOnline()}
                        <div class="user-online-on-profile" data-user-id="">
                            <i class="mdi mdi-circle"></i>{__('Online')}
                        </div>
                        {else}
                         <div class="" data-user-id="">
                            <i class="mdi mdi-circle"></i>{__('Offline')}
                        </div>   
                        {/if}
                    </div>
                    <div class="profile-card-onProfile">
                        <div class="user-image-onProfile">
                            <label class="label-pict-onProfile">
                                <img src="{$company->getLogo()->getUrl()}" class="pict-img-onProfile" alt="indondesign">
                            </label>
                        </div>
                        <div class="user-information-onProfile">
                            <div class="SellerUsername-onProfile">
                                <a href="#">{$company->getFormatter()->getName()}</a>
                            </div>
                            <div class="info-onProfile">
                                <p class="TitleUserAds-onProfile">{$company->getContent()->getI18n()->getFormatter()->getMetaTitle()}</p>
                                <div style="display: inline-block;">
                                    <span class="UserVotestars-onProfile"><i class="mdi mdi-star"></i><i class="mdi mdi-star"></i><i class="mdi mdi-star"></i><i class="mdi mdi-star-half"></i></span>
                                    <p class="para-onProfile">4.9 (1k+ reviews)</p>
                                </div>
                            </div>
                            <label>
                                <a href="#" class="SendMessage btn btn-success">{__('Contact me')}</a>                               
                            </label>
                        </div>
                    </div>
                    <div class="user-Card-info-onProfile">
                        <ul class="user-country">
                            <li class="location">
                                <label><i class="mdi mdi-map-marker"></i> {__('From')}</label>                                
                                <b>{$company->getFormatter()->getCity()->ucfirst()} - {$company->getFormatter()->getCountry()->getFormatted()->ucfirst()}</b>
                            </li>
                            <li class="member-since">
                                <label><i class="mdi mdi-account"></i>{__('Number of users')}</label>
                                <b>{$company->getFormatter()->getNumberOfUsers()->getText()}</b>
                            </li>
                            <li class="response-time">
                                <label><i class="mdi mdi-timer"></i> {__('Avg. Response Time')}</label>
                                <b>{$company->getFormatter()->getAverageResponseTime()->getHour()->getText()}</b>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="description-onProfile">
                    <h4>{__('Users')}</h4>
                    <div class="listUsers-company">
                        {foreach $company->getUsers() as $employer_user}
                        <div class="users-InCompany">
                            <label class="imgUsersAtCompany">     
                             <span class="seller-image">
                                <span class="is-online" {if $employer_user->isOnline()}style="background: #1dbf73;"{/if} style="background: #62646a;"></span>
                                <span class="spanImage">                                 
                                     {if $employer_user->hasAvatar()}
                                        <img src="{$employer_user->getAvatar()->getThumb()->getUrl()}" style="height: 100%;">
                                    {else}
                                         {*<img src="/web/pictures/person_4.jpg" class="pict-img-onProfile" alt="indondesign"> *}
                                    {/if} 
                                </span>
                            </span>                                  
                            </label>
                            <div style="padding-left: 42px;">
                                <label><a href="{$employer_user->getUrl()}">{$employer_user->getFormatter()->getUsername()}</a></label> -
                                <label>{$employer_user->getFormatter()->getNumberOfAdverts()->getChoices()}</label>
                                <label>{if $employer_user->hasFunction()} - {$employer_user->getFunction()->getI18n()}{/if}</label>
                            </div>
                        </div>
                        {/foreach}                       
                    </div>
                </div>
                <div class="description-onProfile">
                    <h4>{__('Description')}</h4>
                    <p>{$company->getContent()->getI18n()->getFormatter()->getDescription()}</p>
                </div>
            </div>
             
            <div class="col-md-8 sidebar ftco-animate">
                {component name="/employers/listAdvertCompany" company=$company}
                
                
                {*================================ Ranking ===============================*}
                <div class="ranking-onProfile">
                    <h4 class="text-display-7">Reviews as Seller <span> 4.9 <i style="color: #ffb33e;" class="mdi mdi-star-half"></i></span> (4,287)</h4>
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
{*component name="/employers_messager/dialog"}
{component name="/employers/shareLink"*}
  
{component name="/customers_newsletter/signin"}	                                          
{include file="./includes/footer.tpl"}
    
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
  <script src="{url('js/jquery.custom.js','web')}"></script>
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