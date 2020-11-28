<!DOCTYPE html>
<html lang="{$_request->getLanguage()}">
    <head>
        <meta charset="UTF-8">
        <title>{component name="/site_company/Display" COMMENT=false} - {$employee_user->getContent()->getI18n()->getFormatter()->getMetaTitle()->ucfirst()}</title>
        <link rel="short icon" type="image/png" href="/web/pictures/favicon-graphex.png"/>
        <meta name="description" content="{$employee_user->getContent()->getI18n()->getFormatter()->getMetaDescription()}">     
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
                       {component name="/employees_alert/alertEmployeeBtn" employee_user=$employee_user}                     
                      {component name="/employers_alert/alertEmployeeBtn" employee_user=$employee_user}       
                      {component name="/employees/favoriteEmployeeBtn" employee_user=$employee_user}                     
                      {component name="/employers/favoriteEmployeeBtn" employee_user=$employee_user}                  
                      {*<label class="countSaves">5484</label>*}
                      {component name="/employees/shareBtn"  employee_user=$employee_user}                        
                  </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 ftco-animate">
                <div class="card-onProfile">
                    <div>
                        {if $employee_user->isOnline()}
                        <div class="user-online-on-profile" data-user-id="">
                            <i class="mdi mdi-circle"></i>{__('online')}
                        </div>
                        {else}
                         <div class="" data-user-id="">
                            <i class="mdi mdi-circle"></i>{__('offline')}
                        </div>   
                        {/if}
                    </div>
                    <div class="profile-card-onProfile">
                        <div class="user-image-onProfile">
                            <label class="label-pict-onProfile">
                                {if $employee_user->hasAvatar()}
                                   <img src="{$employee_user->getAvatar()->getUrl()}" class="pict-img-onProfile" alt="indondesign">
                               {else}
                                    <img src="/web/pictures/inconnu-profile.jpg" class="pict-img-onProfile">
                               {/if}    
                            </label>
                        </div>
                        <div class="user-information-onProfile">
                            <div class="SellerUsername-onProfile">
                                   {$employee_user->getFormatter()->getUsername()} 
                            </div>
                            <div class="info-onProfile">
                                <p class="TitleUserAds-onProfile">{$employee_user->getContent()->getI18n()->getFormatter()->getMetaTitle()}</p>
                                 {component name="/employees_notation/notations" employee_user=$employee_user}                               
                            </div>
                            <label>
                                <a href="#" class="SendMessage btn btn-success classMarginTop">{__('Contact me')}</a>
                                {*<a href="#" class="EmployeeAdvertQuote btn btn-primary classMarginTop">{__('Get a quote')}</a>*}
                            </label>
                        </div>
                    </div>
                    <div class="user-Card-info-onProfile">
                        <ul class="user-country">
                            <li class="location">
                                <label><i class="mdi mdi-map-marker"></i> {__('From')}</label>
                                <b>{$employee_user->getFormatter()->getCountry()->getFormatted()->ucfirst()}</b>
                            </li>
                            <li class="member-since">
                                <label><i class="mdi mdi-account"></i> {__('Member since')}</label>
                                <b>{$employee_user->getFormatter()->getCreatedAt()->getFormatted('P')}</b>
                            </li>
                            <li class="response-time">
                                <label><i class="mdi mdi-timer"></i> {__('Avg. Response Time')}</label>
                                <b>{$employee_user->getFormatter()->getAverageResponseTime()->getHour()->getText()}</b>
                            </li>
                             <li class="response-time">
                                <label><i class="mdi mdi-briefcase"></i> {__('Function')}</label>
                                <b>{if $employee_user->hasFunction()}{$employee_user->getFunction()->getI18n()}{else}{__('---')}{/if}                                  
                                </b>
                            </li>
                             <li class="response-time">
                                <label><i class="mdi mdi-office-building"></i> {__('Experience')}</label>
                                <b>{if $employee_user->hasExperience()}{$employee_user->getExperience()->getI18n()}{else}{__('---')}{/if}                                            
                                </b>
                            </li>                                                                                    
                        </ul>
                    </div>
                </div>
                <div class="description-onProfile">
                    <h4>{__('Description')}</h4>
                    <p>{$employee_user->getContent()->getI18n()->getFormatter()->getDescription()}</p>
                </div> 
                
                <div class="description-onProfile">                         
                        <div class="languages-onProfile">
                            <h4>{__('Languages')}</h4>
                            {if $employee_user->getUserLanguages()->isEmpty()}
                                {__('No information')}
                            {else}  
                                {foreach $employee_user->getUserLanguages() as $user_language}
                                <div><strong>{$user_language->getLanguage()->getText()}</strong> - 
                                    <span>{$user_language->getLevel()->getI18n()->getTitle()->ucfirst()}</span>
                                </div>
                                {/foreach}
                            {/if}
                        </div>                  
                </div>
                    
                <div class="description-onProfile">
                    <div class="skills-onProfile">
                        <h4>{__('Skills')}</h4>
                        {if $employee_user->getUserSkills()->isEmpty()}
                            {__('No information')}
                        {else}    
                            {foreach $employee_user->getUserSkills() as $user_skill}
                                <div>
                                    <strong>{$user_skill->getSkill()->getI18n()->getTitle()->ucfirst()}</strong>
                                    <span> -- {$user_skill->getI18n()->getValue()->ucfirst()}</span>
                                </div>
                            {/foreach}
                        {/if}    
                    </div>
                </div>
                <div class="description-onProfile">    
                    <div class="diplomes-onProfile">
                        <h4>{__('Diplomas')}</h4>
                         {if $employee_user->getUserDiplomas()->isEmpty()}
                            {__('No information')} 
                         {else}    
                             {foreach $employee_user->getUserDiplomas() as $user_diploma}
                                <div>
                                    <strong>{$user_diploma->getYear()}</strong>
                                    <span>- {$user_diploma->getGraduate()->getI18n()->getTitle()->ucfirst()}</span>
                                    <span> - {$user_diploma->getI18n()->getFormatter()->getCity()->ucfirst()}</span>
                                    <span> - {$user_diploma->getI18n()->getFormatter()->getDiploma()->ucfirst()}</span>
                                </div>
                             {/foreach}
                         {/if}                           
                    </div>
                </div>
                <div class="description-onProfile">
                    {component name="/employees_notation/rankings" employee_user=$employee_user}
                </div>
            </div>
            {*============================================== List adverts =========================================*}
            <div class="col-md-8 Advert-onProfile sidebar ftco-animate">
               {component name="/employees/listAdvertEmployee" employee_user=$employee_user}
               {component name="/employees_portfolio/portfolio" employee_user=$employee_user}   
               {component name="/employees_comment/commentsEmployee" employee_user=$employee_user}     
            </div>
         
        </div>
      </div>
    </section> <!-- .section -->
    
    {component name="/employees/shareLink" employee_user=$employee_user}
    
    {component name="/employees_messager/dialog"}      
    {component name="/sales_quotation/getquote"} 
   
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
