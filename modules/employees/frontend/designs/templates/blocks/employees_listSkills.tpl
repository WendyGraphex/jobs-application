<section class="ftco-section">
            <div class="container" style="max-width: 97% !important;">
                <div class="row justify-content-center mb-5 pb-3">
                    <div class="col-md-7 heading-section text-center ftco-animate fadeInUp ftco-animated">
                        <h2 class="mb-4">{__('Best Skills')}</h2>
                    </div>
                </div>
                <div class="row {*divSkillsColumn-count*}">
                     {foreach $skills as $skill}
                        {*if $skill@index % 4 == 0} 
                            <div class="">  
                        {/if*}    
                            <div class="col-lg-2 col-md-3" style="padding-left: 5px;padding-right: 5px;">
                                <div class="redblack">
                                    <div class="">  
                                        <a href="{$skill->getI18n()->getUrl()}">
                                            <div class="divImage-homePage-skills">
                                                {if $skill->hasIcon()}
                                                    <img src="{$skill->getIcon()->getUrl()}">
                                                {else}<img src="/web/pictures/translation11.png">{/if}</div>                                        
                                            <div class="descrSkills-homePage">
                                                <span>{$skill->getI18n()->getTitle()->ucfirst()}</span>
                                            </div>
                                        </a>
                                    </div>
                                </div> 
                            </div>                                     
                        {*if $skill@index % 4 == 3}        
                            </div>
                        {/if*}
                    {/foreach}                   
                </div>
            </div>
        </section>