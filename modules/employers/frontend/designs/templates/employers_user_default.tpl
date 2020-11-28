<!DOCTYPE html>
<html lang="{$_request->getLanguage()}">
    <head>
        <meta charset="UTF-8">
        <title>{component name="/site_company/Display" COMMENT=false} - {$employer_user->getContent()->getI18n()->getFormatter()->getMetaTitle()->ucfirst()}</title>
        <meta name="description" content="{$employer_user->getContent()->getI18n()->getFormatter()->getMetaDescription()}">       
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
      
    <section class="AdvertInfo ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="saveShare col-md-12">                   
                    {component name="/employers_alert/alertEmployerBtn" employer_user=$employer_user}                     
                    {component name="/employees_alert/alertEmployerBtn" employer_user=$employer_user}     
                    {component name="/employers/favoriteEmployerBtn" employer_user=$employer_user}                     
                    {component name="/employees/favoriteEmployerBtn" employer_user=$employer_user}     
                    {*<label class="countSaves">5484</label>*}
                    {component name="/employers/shareBtn" employer_user=$employer_user}     
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 ftco-animate">
                <div class="card-onProfile">
                    <div>
                        {if $employer_user->isOnline()}
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
                               {if $employer_user->hasAvatar()}
                                   <img src="{$employer_user->getAvatar()->getUrl()}" class="pict-img-onProfile" alt="{$employer_user->getFormatter()->getUsername()}">
                               {else}
                                    <img src="/web/pictures/inconnu-profile.jpg" class="pict-img-onProfile">
                               {/if}                                   
                            </label>
                        </div>
                        <div class="user-information-onProfile">
                            <div class="SellerUsername-onProfile">
                                <a href="{$employer_user->getUrl()}">{$employer_user->getFormatter()->getUsername()}</a>
                            </div>
                            <div class="info-onProfile">
                                <p class="TitleUserAds-onProfile">{$employer_user->getContent()->getI18n()->getFormatter()->getMetaTitle()}</p>
                                {component name="/employers_notation/notations" employer_user=$employer_user}
                            </div>
                            <label>
                                <a href="SendMessage" class="SendMessage btn btn-success classMarginTop">{__('Contact me')}</a>
                                {* <a href="#" class="EmployeeAdvertMakeOffer btn btn-primary classMarginTop">{__('Make an offer'}</a> *}
                            </label>
                        </div>
                    </div>
                    <div class="user-Card-info-onProfile">
                        <ul class="user-country">
                            <li class="location">
                                <label><i class="mdi mdi-map-marker"></i> {__('From')}</label>
                                <b>
                                    {if $employer_user->hasCompany()}
                                        {$employer_user->getCompany()->getFormatter()->getCity()->ucfirst()} - {$employer_user->getCompany()->getFormatter()->getCountry()->getFormatted()->ucfirst()}
                                    {else}
                                        {$employer_user->getFormatter()->getCity()->ucfirst()} - {$employer_user->getFormatter()->getCountry()->getFormatted()->ucfirst()}
                                    {/if}
                                </b>
                            </li>
                            <li class="member-since">
                                <label><i class="mdi mdi-account"></i> {__('Member since')}</label>
                                <b>{$employer_user->getFormatter()->getCreatedAt()->getFormatted('P')}</b>
                            </li>
                            <li class="response-time">
                                <label><i class="mdi mdi-timer"></i> {__('Avg. Response Time')}</label>
                                <b>{$employer_user->getFormatter()->getAverageResponseTime()->getHour()->getText()}                               
                                </b>
                            </li>
                             <li class="response-time">
                                <label><i class="mdi mdi-briefcase"></i> {__('Function')}</label>
                                <b>{if $employer_user->hasFunction()}                                   
                                      {$employer_user->getFunction()->getI18n()}    
                                   {else}
                                       {__('---')}
                                   {/if}
                                </b>
                            </li>
                            {if $employer_user->hasCompany()}
                              <li class="response-time">
                                <label><i class="mdi mdi-office-building"></i> {__('My company')}</label>
                                <b><a href="{$employer_user->getCompany()->getUrl()}">{$employer_user->getCompany()}</a>                            
                                </b>
                            </li>
                             <li class="response-time">
                                <label><i class="mdi mdi-gauge-empty"></i> {__('My activity')}</label>
                                <b>{if $employer_user->getCompany()->hasActivity()}{$employer_user->getCompany()->getActivity()->getI18n()}{else}{__('---')}{/if}                               
                                </b>
                            </li>
                            {else}
                                 <li class="response-time">
                                <label><i class="mdi mdi-timer"></i> {__('My activity')}</label>
                                <b>{if $employer_user->hasActivity()}{$employer_user->getActivity()->getI18n()}{else}{__('---')}{/if}                               
                                </b>
                            </li>
                            {/if}    
                        </ul>
                    </div>
                </div>
                <div class="description-onProfile">
                    <h4>{__('Description')}</h4>
                    <p>{$employer_user->getContent()->getI18n()->getFormatter()->getDescription()}</p> 
                </div>
                <div class="description-onProfile">
                    <h4>{__('Languages')}</h4>
                    {if $employer_user->getUserLanguages()->isEmpty()}
                        {__('No information')}
                    {else}    
                    <div class="languages-onProfile">
                        {foreach $employer_user->getUserLanguages() as $user_language}
                        <div><strong>{$user_language->getLanguage()->getText()}</strong> - 
                            <span>{$user_language->getLevel()->getI18n()->getTitle()->ucfirst()}</span>
                        </div>
                        {/foreach}
                    </div>
                    {/if}                 
                </div>
                <div class="description-onProfile">
                    {component name="/employers_notation/rankings" employer_user=$employer_user}
                </div>
            </div>
            {*============================================== List adverts =========================================*}
            <div class="col-md-8 sidebar ftco-animate">
                {component name="/employers/listAdvertEmployer" employer_user=$employer_user}
                {*================================ Ranking ===============================*}
                {*<div class="ranking-onProfile">
                    <h4 class="text-display-7">Reviews as Seller <span> 4.9 <i style="color: #ffb33e;" class="mdi mdi-star-half"></i></span> (4,287)</h4>
                </div>*}   
                {component name="/employers_comment/commentsEmployer" employer_user=$employer_user}
            </div>
        </div>
             
      </div>
    </section> 
            
        {component name="/employers/shareLink" employer_user=$employer_user}

        {component name="/employers_messager/dialog"}  
 
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
    </body>
</html>