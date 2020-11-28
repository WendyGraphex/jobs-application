 <div class="col-xlg-3 col-lg-3 col-md-4">
    <div class="blog-entry align-self-stretch">
        <div class="item">
            {if $item_i18n->getContent()->getCompany()->hasPicture()}
                   <a href="{$item_i18n->getContent()->getCompany()->getUrl()}" class="block-20" style="background-image: url('{$item_i18n->getContent()->getCompany()->getPicture()->getSmall()->getUrl()}');"></a>
            {else}
            <a href="{$item_i18n->getContent()->getCompany()->getUrl()}" class="block-20" style="background-image: url('/web/pictures/111.jpg');"></a>
            {/if}
        </div>
        {*<div class="seller-info">
            <div class="ImageTitle">
                    <span class="seller-image">
                        <span class="is-online"></span>
                        <span class="spanImage"></span>
                    </span>
                <span class="AdDate">December 5 2018</span>
                <div class="nameAndDate" style="padding-left: 42px;">
                    <div class="UserNameAndSecond">
                        <a href="#" class="UserName">Name</a>
                        <span class="SecondName">second name</span>
                    </div>
                </div>
            </div>
        </div>*}
        <div class="UserInfo">
            <a href="{$item_i18n->getContent()->getCompany()->getUrl()}" style="display: inline;">
                <p>
                    <h4 style="margin-bottom: 0rem;">{$item_i18n->getContent()->getCompany()->getFormatter()->getName()}</h4>
                    <p class="Description">{$item_i18n->getFormatter()->getMetaTitle()->ucfirst()}</p>
                </p>
            </a>
            <div class="UserVotes">
                <span class="votes"><i class="mdi mdi-star-half" aria-hidden="true"></i>4.5 (1.5k)</span>
            </div>
            <div class="social-network-sharing">
                <label class="social-network">
                    {component name="/facebook_share/link" text=$item_i18n->getFormatter()->getTitle() url=$item_i18n->getUrl()}
                    {component name="/twitter_share/link" text=$item_i18n->getFormatter()->getTitle() url=$item_i18n->getUrl()}                              
                    {component name="/linkedin_share/link" text=$item_i18n->getFormatter()->getTitle() url=$item_i18n->getUrl() summary=$item_i18n->getFormatter()->getShortDescription()}  
                    {component name="/whatsapp_share/link" text=$item_i18n->getFormatter()->getTitle() url=$item_i18n->getUrl()}                  
                    {component name="/employers_contact/shareBtn" item_i18n=$item_i18n} 
                    <i id="" class="copyLink mdi mdi-content-copy my-tool-tip" style="cursor:pointer;" data-toggle="tooltip"
                       data-placement="right" data-original-title="copy link"></i>                                   
                </label>
                {*<button class="BtnOfferQuote btn btn-primary">{__('Make a offer')}</button>*}
            </div>
        </div>
    </div>
</div>