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
        <link rel="stylesheet" href="{url('/majestic/css/font-awesome/4.7.0/font-awesome.min.css','web')}">
        {*<link rel="stylesheet" media="all" href="{url('majestic/css/bootstrap/bootstrap.css','web','frontend')}">*}      
        <script src="{url('js/jquery/3.2.1/jquery-3.2.1.min.js','web','frontend')}"></script>      
        {header}
    </head>
    <body>

        {include file="./includes/header-nav.tpl"} 

        <section class="ftco-section bg-light sectionCategoriesTop sectionMarginTop">
            <div id="page-ctnr" class="container">               
                {component name="/employees/siblings" node=$node_i18n->getCategory()}   

                {component name="/employees/breadcrumb" node=$node_i18n->getCategory()}                           

                {if $node_i18n->getCategory()->hasPicture()}                 
                    <div class="categoriePicture">
                        <img src="{$node_i18n->getCategory()->getPicture()->getUrl()}"/>
                    </div>    
                {/if}
                {if $node_i18n->hasContent()}     
                    <div class="row categorieTextTop">
                        <div>{$node_i18n->get('content')}</div>
                    </div>
                {/if}

                {*if !$node_i18n->getCategory()->isRoot()}          
                <div class="advertHead">
                <span class="search-result">{$node_i18n->getFormatter()->getTitle()->ucfirst()}</span>
                <div class="explanation-video">
                <p style="font-family: Tahoma, Geneva, sans-serif;">Grahic Design 
                <i class="mdi mdi-chevron-right"></i> {$node_i18n->getFormatter()->getMetaDescription()->ucfirst()}</p>
                </div>
                </div>
                {/if*}

                {component name="/employees/subcategories" node=$node_i18n->getCategory()}
                <div id="page-wrapper">  
                    {component name="/employees/categories" node=$node_i18n->getCategory()}
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
 <script src="{url('js/jquery.custom.js','web')}"></script>      
 
 {component name="/utils_ckeditor/resources" version="4.14.1" tpl="simple"}
</body>

</html>
