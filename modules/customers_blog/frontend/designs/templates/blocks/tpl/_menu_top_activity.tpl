<section class="ftco-section">
    <div class="container">
        <div class="row">
        {foreach $node->getChildren() as $child}
            <div class="col-lg-3 col-md-4 ftco-animate fadeInUp ftco-animated col-activities-homePage">
                <a href="{$child->getActivity()->getI18n()->getUrl()}">
                    <div>
                        <div class="divActivities-homePage">
                            <div class="divImage-homePage">
                                {if $child->getActivity()->hasIcon()}
                                    <img src="{$child->getActivity()->getIcon()->getOriginal()->getUrl()}"/>
                                {else}
                                <img src="/web/pictures/translation11.png"/>
                                {/if}
                            </div>
                            <div class="descrCatgory-homePage">
                                <span>{$child->getI18n()}</span>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        {/foreach}   
        </div>
    </div>
</section>
    
{*    
<section class="ftco-section">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3 col-md-4 ftco-animate fadeInUp ftco-animated col-activities-homePage">
                            <div>
                                <div class="divActivities-homePage">
                                    <div class="divImage-homePage">
                                        <img src="/web/pictures/translation11.png">
                                    </div>
                                    <div class="descrCatgory-homePage">
                                        <span>Flyers Logo</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 ftco-animate fadeInUp ftco-animated col-activities-homePage">
                            <div>
                                <div class="divActivities-homePage">
                                    <div class="divImage-homePage">
                                        <img src="/web/pictures/translation11.png">
                                    </div>
                                    <div class="descrCatgory-homePage">
                                        <span>Flyers Logo</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 ftco-animate fadeInUp ftco-animated col-activities-homePage">
                            <div>
                                <div class="divActivities-homePage">
                                    <div class="divImage-homePage">
                                        <img src="/web/pictures/translation11.png">
                                    </div>
                                    <div class="descrCatgory-homePage">
                                        <span>Flyers Logo</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 ftco-animate fadeInUp ftco-animated col-activities-homePage">
                            <div>
                                <div class="divActivities-homePage">
                                    <div class="divImage-homePage">
                                        <img src="/web/pictures/translation11.png">
                                    </div>
                                    <div class="descrCatgory-homePage">
                                        <span>Flyers Logo</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 ftco-animate fadeInUp ftco-animated col-activities-homePage">
                            <div>
                                <div class="divActivities-homePage">
                                    <div class="divImage-homePage">
                                        <img src="/web/pictures/translation11.png">
                                    </div>
                                    <div class="descrCatgory-homePage">
                                        <span>Flyers Logo</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                         <div class="col-lg-3 col-md-4 ftco-animate fadeInUp ftco-animated col-activities-homePage">
                            <div>
                                <div class="divActivities-homePage">
                                    <div class="divImage-homePage">
                                        <img src="/web/pictures/translation11.png">
                                    </div>
                                    <div class="descrCatgory-homePage">
                                        <span>Flyers Logo</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                         <div class="col-lg-3 col-md-4 ftco-animate fadeInUp ftco-animated col-activities-homePage">
                            <div>
                                <div class="divActivities-homePage">
                                    <div class="divImage-homePage">
                                        <img src="/web/pictures/translation11.png">
                                    </div>
                                    <div class="descrCatgory-homePage">
                                        <span>Flyers Logo</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                         <div class="col-lg-3 col-md-4 ftco-animate fadeInUp ftco-animated col-activities-homePage">
                            <div>
                                <div class="divActivities-homePage">
                                    <div class="divImage-homePage">
                                        <img src="/web/pictures/translation11.png">
                                    </div>
                                    <div class="descrCatgory-homePage">
                                        <span>Flyers Logo</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

*}