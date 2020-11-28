<section clas="ftco-section" id="Gallery1">
    <div class="col-md-12 text-center">
        <h2 class="mb-4">{__('Freelancers')}</h2>
    </div>
    <div class="content col-md-12">
        <div id="owl-demo2" class="classOwl-dote-margin owl-demo-same-item owl-carousel owl-theme" style="opacity: 1; display: block;">   
            {foreach $employees as $employee}
            <div class="item">
                <div class="blog-entry">  
                    <div class="OwlPopularSecond classOwl-dote-margin owl-carousel owl-theme" style="opacity: 1; display: block;">
                        {if $employee->hasAvatar()}
                        <div class="item">
                            <img style="width: 500px;" src="{$employee->getAvatar()->getMedium()->getUrl()}" alt="{$employee->getFormatter()->getUsername()}">
                        </div>
                        {else}
                            <img src="/web/pictures/inconnu-profile.jpg"/>
                        {/if}
                    </div>
                    <div class="TitleandDescription">
                        <h4><a href="{$employee->getUrl()}">{$employee->getFormatter()->getUsername()}</a></h4>                      
                        <p>{if $employee->hasContent() && $employee->getContent()->hasI18n()}{$employee->getContent()->getI18n()->get('meta_description')|truncate:80}...{/if}</p>
                    </div>
                </div>
            </div>
            {/foreach}                      
        </div>
    </div>
</section> 

{*
<section clas="ftco-section" id="Gallery1">
                <div class="col-md-12 text-center">
                    <h2>-- Employees --</h2>
                </div>
                <div class="content col-md-12">
                    <div id="owl-demo2" class="classOwl-dote-margin owl-demo-same-item owl-carousel owl-theme" style="opacity: 1; display: block;">   
                        <div class="item">
                            <div class="blog-entry">
                                <img style="width: 500px;" src="{url('pictures/bg_2.jpg','web','frontend')}" alt="Owl Image">
                                <div class="TitleandDescription">
                                    <h4>Recruiter 1</h4>
                                    <p>zaeze erzzzzzzzzz rere rerererererere rerererererere errrrrr eeeeee er err re</p>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="blog-entry">
                                <img style="width: 500px;" src="{url('pictures/image_2.jpg','web','frontend')}" alt="Owl Image">
                                <div class="TitleandDescription">
                                    <h4>Recruiter 1</h4>
                                    <p>zaeze erzzzzzzzzz rere rerererererere rerererererere errrrrr eeeeee er err re</p>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="blog-entry">
                                <img style="width: 500px;" src="{url('pictures/image_3.jpg','web','frontend')}" alt="Owl Image">
                                <div class="TitleandDescription">
                                    <h4>Recruiter 1</h4>
                                    <p>zaeze erzzzzzzzzz rere rerererererere rerererererere errrrrr eeeeee er err re</p>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="blog-entry">
                                <img style="width: 500px;" src="{url('pictures/bg_1.jpg','web','frontend')}" alt="Owl Image">
                               <div class="TitleandDescription">
                                    <h4>Recruiter 1</h4>
                                    <p>zaeze erzzzzzzzzz rere rerererererere rerererererere errrrrr eeeeee er err re</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
 *}
