<div class="col-xlg-3 col-lg-3 col-md-4">
    <div class="blog-entry align-self-stretch">
        <div>
            {if $item->hasContent()}
              <a href="#" class="block-20">
                 {if $item->getCOntent()->hasPicture()}
                <img src="{$item->getContent()->getPicture()->getMedium()->getUrl()}"/>
                {else}
                     <img src="/web/pictures/555.jpg"/>
                {/if}    
            </a>    
            {else}    
            <a href="#" class="block-20">
                <img src="/web/pictures/555.jpg"/>
            </a>
            {/if}
        </div>
        <p class="copyMe copyMe-{$item->get('id')}" style="display: none;">{$item->getUrl()}</p>
        <input class="copied" type="text" id="Link" aria-hidden="true" style="position: absolute;left: -999em;"/>
        <div class="seller-info row">
            <div class="col-md-6">
                <div class="ImageTitle">
                    <span class="seller-image">
                        <span class="is-online" {if $item->isOnline()}style="background: #1dbf73;"{/if} style="background: #62646a;"></span>
                        <a href="{$item->getUrl()}" class="spanImage">
                            {if $item->hasAvatar()}
                                <img height="32px" src="{$item->getAvatar()->getThumb()->getUrl()}"/>
                            {else}
                                <img height="32px" src="/web/pictures/inconnu-profile.jpg"/>
                            {/if}
                        </a>
                    </span>
                    <div class="nameAndDate" style="padding-left: 42px;">
                        <div class="UserNameAndSecond">
                            <a href="{$item->getUrl()}" class="UserName" style="display: inline;">
                                {$item->getFormatter()->getUsername()->ucfirst()}
                            </a><label class="sendEmail" data-toggle="modal" data-target="#myModal"><i class="mdi mdi-email"></i></label>
                            <div class="modal fade" id="myModal" role="dialog">
                                <div class="ModalContactUser modal-dialog modal-lg" style="width: 50%;">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        </div>
                                        <div class="modal-body">
                                            <input type="text" class="form-control" placeholder="Object"/><br/>
                                            <textarea class="form-control"></textarea><br/>
                                            <div style="text-align: center;">
                                                <button type="button" class="btn btn-success">{__('Send')}</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>                                 
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <span class="AdDate">{__('Member since')} {$item->getFormatter()->getCreatedAt()->getDateFormatter()->getText()}</span>
            </div>
        </div>
        <div class="UserInfo">
            {if $item->hasContent()}
                <div class="UserContent">                           
                    {if $item->getContent()->getI18n()->get('meta_title')}
                        <h4 style="margin-bottom: 0rem;">                              
                            {$item->getContent()->getI18n()->getFormatter()->getMetaTitle()->ucfirst()}                                
                        </h4>
                        <p class="Description">{$item->getContent()->getI18n()->getFormatter()->getMetaDescription()->ucfirst()|truncate:80}</p> 
                    {else}
                        <p class="Description"></p>    
                    {/if}                                                                         
                </div>
            {else}
                <div style="height: 110px;">
                    <p class="Description"></p>
                </div>
            {/if}    
            <div class="UserVotes">
                <span class="votes"><i class="mdi mdi-star-half" aria-hidden="true"></i>4.5 (1.5k)</span>
            </div>
            <div class="social-network-sharing">
                <label class="social-network">
                    {component name="/facebook_share/link" text=$item->getFormatter()->getTitle() url=$item->getUrl()}
                    {component name="/twitter_share/link" text=$item->getFormatter()->getTitle() url=$item->getUrl()}                              
                    {component name="/linkedin_share/link" text=$item->getFormatter()->getTitle() url=$item->getUrl() summary=$item->getFormatter()->getShortDescription()}  
                    {component name="/whatsapp_share/link" text=$item->getFormatter()->getTitle() url=$item->getUrl()}                  
                    {*component name="/employees_contact/shareBtn" item_i18n=$item*} 
                    <i id="{$item->get('id')}" class="copyLink-{$item->get('id')} copyLink mdi mdi-content-copy my-tool-tip" style="cursor:pointer;" data-toggle="tooltip"
                       data-placement="right" data-original-title="copy link">
                    </i>                                   
                </label>
                <button class="BtnOfferQuote btn btn-primary" data-toggle="modal" data-target="#OfferQuote">{__('Get a quote')}</button>
                <div class="modal fade" id="OfferQuote" role="dialog">
                    <div class="ModalOfferQuote modal-dialog modal-lg" style="width: 50%;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="row row-imageText-modal">
                                    <div class="">
                                        <div class="ImageAtModal">
                                            <span class="is-online-on-modal"></span>
                                            <span class="spanImage-on-modal">
                                                <img src="/web/pictures/person_4.jpg"/>
                                                {*<img src="{$item_i18n->getAdvert()->getEmployerUser()->getAvatar()->getThumb()->getUrl()}"/>*}
                                            </span>
                                        </div>
                                    </div>
                                    <div class="name-salut">
                                        <h4>Flan Ben Flan</h4>
                                        <p class="parag-1-modal">{__('Hi! please provide you details under below. Wait for feed-back')}</p>
                                    </div>
                                </div>
                                <p class="parag-2-modal" style="margin-top: 14px;color: #4a4747;font-weight: 600;">{__('Decsribe the service you re looking to purchase - please be as detailled as possible')}</p>
                                <textarea class="form-control" placeholder="describe your service" style="height: 150px !important;"></textarea><br/>
                                <div id="DropZone" class="dropzone dp-addFile"> 
                                    {*<i class="mdi mdi-plus plus-icon"></i>*}
                                    <div class="dz-message" data-dz-message><span>{__('Drop files here to upload')}</span></div>                                
                                </div>
                                <div class="row" style="padding-top: 10px;">
                                    <div class="col-md-3">
                                        <label class="labelFile">
                                            <img src="/web/pictures/txt-file.png"/><label>File Name</label>
                                        </label>
                                    </div>
                                    <div class="col-md-3">
                                        <label class="labelFile">
                                            <img src="/web/pictures/txt-file.png"/><label>File Name</label>
                                        </label>
                                    </div>

                                </div>
                                <div style="text-align: center;">
                                    <button type="button" class="btn btn-success">{__('Send')}</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>