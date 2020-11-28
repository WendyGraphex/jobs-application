<!DOCTYPE html>
<html lang="{$_request->getLanguage()}">
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>{component name="/site_company/Display" field='name' COMMENT=false} - {$article_i18n->getFormatter()->getMetaTitle()->ucfirst()}</title> 
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
        <link rel="stylesheet" media="all" href="{url('css/blog.css','web','frontend')}">
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
        <nav  class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">    
            <div class="divAllInside divAllInsideBlog">
                <div class="container">
                    {component name="/site_company/Display" tpl="logoCompany"}
                    <button class="navbar-toggler btnMenuResponsive" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="oi oi-menu"></span>{__('Menu')}
                    </button>
                    <button class="navbar-toggler btnCategoriesResponsive" type="button" data-toggle="collapse" data-target="#navCategories" aria-controls="navCategories" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="oi oi-menu"></span> {__('activities')}
                    </button>
                    <div class="languagesAndCurrency second-languagesAndCurrency" style="display:none;">
                        <div class="languages-new-class">
                            {component name="/site_languages/list"}
                        </div>
                        <div class="devises-new-class">
                            {component name="/site_currency/list"}              
                        </div>
                    </div>
                    {include file="./includes/header.tpl"}
                </div>
                <div>
                    {component name="/customers_blog/menu" node="top" tpl="default"} 
                </div>
            </div>
        </nav>
        <section class="ftco-section   bg-white sectionCategoriesTop sectionMarginTop">
            <div id="page-wrapper" class="container"> 
                <section class="td-container td-post-template-default">
                    <div class=" td-main-content" role="main">
                        <div class="td-ss-main-content">
                            <div class="clearfix"></div>
                            <div class="td-post-header">
                                <header class="td-post-title">
                                    <h1 class="entry-title">{$article_i18n->getFormatter()->getMetaTitle()->ucfirst()}</h1>
                                    <div class="td-module-meta-info">
                                        <div class="td-post-author-name">
                                            <div class="td-author-by">{__('By')}</div> 
                                            <a href="#">{$article_i18n->getArticle()->getFormatter()->getAuthor()->ucfirst()}</a>
                                            <div class="td-author-line"> : </div></div>                    
                                        <span class="td-post-date">{$article_i18n->getFormatter()->getCreatedAt()->getFormatted()}</span>                    
                                        <div style="float:right;font-size: 15px;"><i class="mdi mdi-eye">{$article_i18n->getFormatter()->getNumberOfViews()}</i></div>
                                    </div>
                                </header>
                            </div>
                            <div class="td-post-content">
                                <div class="td-post-featured-image">
                                    {if $article_i18n->getArticle()->hasPicture()}
                                        <div>
                                            <img class="entry-thumb td-animation-stack-type0-2" src="{$article_i18n->getArticle()->getPicture()->getURL()}" sizes="(max-width: 696px) 100vw, 696px" alt="" title="{$article_i18n->getFormatter()->getMetaTitle()->ucfirst()}" height="445">
                                        </div>
                                    {/if}
                                </div>
                                <h5>{$article_i18n->getFormatter()->getDescription()}</h5>
                                <p>{$article_i18n->getFormatter()->getContent()}</p>
                            </div>
                            <footer>
                                <div class="td-post-sharing td-post-sharing-bottom td-with-like">
                                    <label id="shareArticle" class="shareAdEmpl"><i class="mdi mdi-share-variant"></i>{__('Share')}</label>
                                    <div class="td-classic-sharing" style="m">
                                        <div {*style="text-align: center;"*}>
                                            <ul class="shareTo-social-network">
                                                {component name="/facebook_share/link" tpl='share' text=$article_i18n->getFormatter()->getMetaTitle()->ucfirst() url=$article_i18n->getUrl()}                      
                                                {component name="/linkedin_share/link" tpl='share' text=$article_i18n->getFormatter()->getMetaTitle()->ucfirst() url=$article_i18n->getUrl()} 
                                                {component name="/twitter_share/link" tpl='share' text=$article_i18n->getFormatter()->getMetaTitle()->ucfirst() url=$article_i18n->getUrl()} 
                                                {component name="/whatsapp_share/link" tpl='share' text=$article_i18n->getFormatter()->getMetaTitle()->ucfirst() url=$article_i18n->getUrl()} 
                                                <li class="liLinkCopy" style="cursor: pointer;">
                                                    <a href="#">
                                                        <p id="copyMe" style="display: none;">{$article_i18n->getUrl()}</p>
                                                        <input class="copied" type="text" id="Link" aria-hidden="true" style="position: absolute;left: -999em;"/>
                                                        <i class="copyLink mdi mdi-link-variant" style="font-size: 26px;"></i>
                                                        <label class="textcopy" style="display: block;">{__('Copy')}</label>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>                        
                            </footer>
                        </div>
                    </div>
                </section> 
            </div>
        </section> 

        <div class="modal fade" id="DialogShareArticle" role="dialog">
            <div class="ModalContactUser modal-dialog modal-lg" style="width: 50%;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div style="text-align: center;">
                            <h2 class="sharing-title">{__('Share this Advert')}</h2>
                            <div class="sharing-description">
                                <p style="font-size: 18px;">{__('Spread the word about this Advert on Graphex')}</p>
                            </div>
                            <ul class="shareTo-social-network">
                                {component name="/facebook_share/link" tpl='share' text=$article_i18n->getFormatter()->getMetaTitle()->ucfirst() url=$article_i18n->getUrl()}                      
                                {component name="/linkedin_share/link" tpl='share' text=$article_i18n->getFormatter()->getMetaTitle()->ucfirst() url=$article_i18n->getUrl()} 
                                {component name="/twitter_share/link" tpl='share' text=$article_i18n->getFormatter()->getMetaTitle()->ucfirst() url=$article_i18n->getUrl()} 
                                {component name="/whatsapp_share/link" tpl='share' text=$article_i18n->getFormatter()->getMetaTitle()->ucfirst() url=$article_i18n->getUrl()} 
                                <li class="liLinkCopy" style="cursor: pointer;">
                                    <p id="copyMe" style="display: none;">{$advert_i18n->getUrl()}</p>
                                    <input class="copied" type="text" id="Link" aria-hidden="true" style="position: absolute;left: -999em;"/>
                                    <i class="copyLink mdi mdi-link-variant" style="font-size: 36px;"></i>
                                    <label class="textcopy">{__('Copy')}</label>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        {*component name="/customers_newsletter/signin"}	                                          
        {include file="./includes/footer.tpl"*}
        
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
        <script src="{url('js/jquery.custom.js','web')}"></script>  

 <script type="text/javascript">
     
    $("#showTextEvent").click( function () { 
        $("#TextEvent").toggle();
    }); 
    
    $("#shareArticle").click( function () { 
        alert("eeeee");
        $("#DialogShareArticle").modal('show');
    });
    
 </script>
 
</body>

</html>





