<section clas="ftco-section" id="Gallery1">
    <div class="col-md-12 text-center">
        <h2 class="mb-4">{__('Employers')}</h2>
    </div>
    <div class="content col-md-12">
        <div id="owl-demo1" class="classOwl-dote-margin owl-demo-same-item owl-carousel owl-theme" style="opacity: 1; display: block;">   
            {foreach $employers as $employer}
            <div class="item">
                <div class="blog-entry"> {* [{$employer->get('id')}]*}
                    <div class="OwlPopularSecond classOwl-dote-margin owl-carousel owl-theme" style="opacity: 1; display: block;">
                        {if $employer->hasAvatar()}
                        <div class="item">
                           <img style="width: 500px;" src="{$employer->getAvatar()->getMedium()->getUrl()}" alt="{$employer->getFormatter()->getUsername()}">
                        </div>                     
                        {else}
                            <img src="/web/pictures/inconnu-profile.jpg"/>
                        {/if}    
                    </div>
                    <div class="TitleandDescription">
                        <h4><a href="{$employer->getUrl()}">{$employer->getFormatter()->getUsername()}</a></h4>
                        {if $employer->hasCompany()}<p><a href="{$employer->getCompany()->getUrl()}">{$employer->getCompany()->getFormatter()->getName()}</a></p>{/if}
                        <p>{if $employer->hasContent() && $employer->getContent()->hasI18n()}{$employer->getContent()->getI18n()->get('meta_description')|truncate:80}...{/if}</p>
                    </div>
                </div>
            </div>
            {/foreach}                      
        </div>
    </div>
</section>
