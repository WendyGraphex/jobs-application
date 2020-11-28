<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>{__('Project')} - {$project->getEmployerUser()->getFormatter()->getUsername()} - {if $project->hasI18n()}{$project->getI18n()->getFormatter()->getTitle()->ucfirst()}{else}{$project->getFormatter()->getName()->ucfirst()}{/if}</title>
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="short icon" type="image/png" href="/web/pictures/favicon-graphex.png"/>
        <title>{component name="/site_company/Display" field='name' COMMENT=false} - {__('Our services')}</title>   
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
          {*<div class="row">
              <div class="col-md-12">
                    <div class="saveShare col-md-12">
                        <label class="saveAdEmpl"><i class="mdi mdi-heart"></i><i class="mdi mdi-heart-outline"></i>Save</label>
                        <label class="countSaves">5484</label>
                        <label id="shareAdEmpl" class="shareAdEmpl"><i class="mdi mdi-share-variant"></i>Share</label>
                    </div>
              </div>
          </div> *}
        <div class="row">
            <div class="col-md-4 ftco-animate">
                <div class="card-onProfile">
                    <div>
                        {if $project->getEmployerUser()->isOnline()}
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
                                {if $project->getEmployerUser()->hasAvatar()}
                                   <img src="{$project->getEmployerUser()->getAvatar()->getUrl()}" class="pict-img-onProfile" alt="{$project->getEmployerUser()->getFormatter()->getUsername()}">
                               {else}
                                    {*<img src="/web/pictures/person_4.jpg" class="pict-img-onProfile" alt="indondesign"> *}
                               {/if}  
                            </label>
                        </div>
                        <div class="user-information-onProfile">
                            <div class="SellerUsername-onProfile">
                                <a href="{$project->getEmployerUser()->getUrl()}">{$project->getEmployerUser()->getFormatter()->getUsername()}</a>
                            </div>
                            <div class="info-onProfile">
                                <p class="TitleUserAds-onProfile">{$project->getEmployerUser()->getContent()->getI18n()->getFormatter()->getMetaTitle()}</p>
                                {component name="/employers_notation/notations" employer_user=$project->getEmployerUser()}
                            </div>
                            <label>
                                <a href="#" id="SendMessage" class="SendMessage btn btn-success classMarginTop">{__('Contact me')}</a>                               
                            </label>
                            <label>
                                <a href="#" id="SendMessage" class="btn btn-primary classMarginTop">{__('Get a quote')}</a>                               
                            </label>
                        </div>
                    </div>
                    <div class="user-Card-info-onProfile">
                        <ul class="user-country">
                            <li class="location">
                                <label><i class="mdi mdi-map-marker"></i> {__('From')}</label>
                                <b>{if $project->getEmployerUser()->hasCompany()}
                                        {$project->getEmployerUser()->getCompany()->getFormatter()->getCity()->ucfirst()} - {$project->getEmployerUser()->getCompany()->getFormatter()->getCountry()->getFormatted()->ucfirst()}
                                   {else}
                                        {$project->getEmployerUser()->getFormatter()->getCity()->ucfirst()} - {$project->getEmployerUser()->getFormatter()->getCountry()->getFormatted()->ucfirst()}
                                   {/if}
                                </b>
                            </li>
                            <li class="member-since">
                                  <label><i class="mdi mdi-account"></i> {__('Member since')}</label>
                                <b>{$project->getEmployerUser()->getFormatter()->getCreatedAt()->getFormatted('P')}</b>
                            </li>
                            <li class="response-time">
                                 <label><i class="mdi mdi-timer"></i> {__('Avg. Response Time')}</label>
                                <b>{$project->getEmployerUser()->getFormatter()->getAverageResponseTime()->getHour()->getText()}                               
                                </b>
                            </li>
                             <li class="response-time">
                                <label><i class="mdi mdi-briefcase"></i> {__('Function')}</label>
                                <b>{if $project->getEmployerUser()->hasFunction()}                                   
                                      {$project->getEmployerUser()->getFunction()->getI18n()}      
                                   {/if}
                                </b>
                            </li>
                            {if $project->getEmployerUser()->hasCompany()}
                              <li class="response-time">
                                <label><i class="mdi mdi-office-building"></i> {__('My company')}</label>
                                <b><a href="{$project->getEmployerUser()->getCompany()->getUrl()}">{$project->getEmployerUser()->getCompany()}</a>                            
                                </b>
                            </li>
                             <li class="response-time">
                                <label><i class="mdi mdi-gauge-empty"></i> {__('My activity')}</label>
                                <b>{if $project->getEmployerUser()->getCompany()->hasActivity()}{$project->getEmployerUser()->getCompany()->getActivity()->getI18n()}{else}{__('---')}{/if}                               
                                </b>
                            </li>
                            {else}
                                 <li class="response-time">
                                <label><i class="mdi mdi-timer"></i> {__('My activity')}</label>
                                 <b>{if $project->getEmployerUser()->hasActivity()}{$project->getEmployerUser()->getActivity()->getI18n()}{else}{__('---')}{/if}                               
                                </b>
                            </li>
                            {/if}  
                        </ul>
                    </div>
                </div>
                        <div class="description-onProfile">
                            <h4>{__('Budget')}</h4>
                           {if $project->hasBudget()}
                              {$project->getFormatter()->getBudget()->getAmount()}
                           {else}    
                               {__('Unkown')}
                           {/if}    
                        </div>
                <div class="description-onProfile">                    
                    {if $project->hasI18n()}
                      <h4>{$project->getI18n()->getFormatter()->getTitle()->ucfirst()|escape}</h4> 
                      <p>{$project->getI18n()->getFormatter()->getContent()|escape}</p>
                    {else}
                      <h4>{$project->getFormatter()->getName()->ucfirst()}</h4> 
                    {/if}    
                    
                </div>
            </div>
            {*============================================== List Projects =========================================*}
            <div class="col-md-8 Advert-onProfile sidebar ftco-animate">
                <h1>{__('Documents')}</h1>
                <input type="text" class="form-control" placeholder="{__('Search')}" style="height: 42px !important;font-size: 17px;"/><br/>
                {*<div class="saveShare">
                    <label class="saveAdEmpl"><i class="mdi mdi-heart"></i><i class="mdi mdi-heart-outline"></i>Save</label>
                    <label class="countSaves">5484</label>
                    <label id="shareAdEmpl" class="shareAdEmpl"><i class="mdi mdi-share-variant"></i>Share</label>
                </div>*}
                <div class="row">
                    {foreach $project->getDocuments() as $document}
                    <div class="col-lg-3 col-md-6 single-adverton-profile">
                        <div class="blog-entry align-self-stretch classFileFont">
                            <div class="classImage-on-projects">
                                <a href="{$document->getFile()->getUrl()}" target="_blank" class="block-20">
                                   {if  $document->getFile()->isPicture()}
                                    <img class="" src="{$document->getFile()->getImages()->getSmall()->getUrl()}" alt="{$document->get('file')}">
                                    {else}
                                        <img class="" src="{$document->getFile()->getFlavicons()->getText()->getUrl()}" alt="{$document->get('file')}">               
                                    {/if}               
                                </a>
                            </div> 
                            <div class="picture-title picture-titleon-project">{$document->getFile()} ({$document->getFormatter()->getSize()->getFilesize()})</div> 
                        </div>
                    </div>
                    {/foreach}                    
                </div>
            </div>
        </div>
      </div>
    </section> <!-- .section -->

    
    {component name="/employers_messager/dialog"} 
    
    {component name="/customers_newsletter/signin"}	    

    {include file="./includes/footer.tpl"}
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
    {*component name="/sales_quotation/getquote"}
    {component name="/employees_messager/dialog"}
    {component name="/employees/shareLink"*}
  
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
