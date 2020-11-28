<section class="ftco-section bg-light">
                <div class="container">
                    <div class="row justify-content-center mb-5 pb-3">
                        <div class="col-md-7 heading-section text-center ftco-animate">
                            <h2>{__('Popular Jobs')}</h2>
                        </div>
                    </div>
                    
                    <div id="PopularJobs" class="classOwl-dote-margin owl-carousel owl-theme" style="opacity: 1; display: block;">   
                    {foreach $populars as $item_i18n}
                         {component name="/employers/advertDisplay" advert=$item_i18n tpl="popular"}                 
                       {* <div class="item">
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
                        </div> *}
                    {/foreach}                                                               
                    </div>
                </div>
</section>
