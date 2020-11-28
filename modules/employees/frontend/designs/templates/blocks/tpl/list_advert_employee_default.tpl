
<div class="row">
{foreach $pager as $item_i18n}   
    {component name="/employees/advertDisplay" advert_i18n=$item_i18n tpl='single'}       
{/foreach}
</div>

{* 
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

*}

<script type="text/javascript">
    {JqueryScriptsReady}         
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
        });
    {/JqueryScriptsReady} 
</script>
