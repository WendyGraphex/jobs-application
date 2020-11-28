 <div class="col-xlg-3 col-lg-3 col-md-4 col-sm-6">        
     {* ==={$item_i18n->get('id')}==={$item_i18n->getAdvert()->get('id')}===  *}
            <div class="blog-entry align-self-stretch">
                <div class="ViewsQuotes">
                    <label class="AdViews"><i class="mdi mdi-cart"></i>{$item_i18n->getFormatter()->getNumberOfQuotations()->getChoicesText('[0]no offer|[1]one offer|(1,Inf]%s offers')}</label>
                    <label class="AdQuote"><i class="mdi mdi-eye"></i>{$item_i18n->getFormatter()->getNumberOfViews()->getChoicesText('[0]no view|[1]one view|(1,Inf]%s views')}</label>
                </div>
                {*---------aaaaaaaaaaaaaaaaaaaa--------------------------------------*}
            <div class="borderCategory">
                <div class="Myadvert-carousel owl-carousel owl-theme">                 
                    {if $item_i18n->getAdvert()->getDocuments()->isEmpty()}   
                        <div class="item">
                            <a href="{$item_i18n->getUrl()}">
                                <img src="/web/pictures/555.jpg"/>
                            </a>  
                        </div>                                
                    {else}                      
                        {foreach $item_i18n->getAdvert()->getDocuments() as $document}
                            <div class="item">
                              {* <a href="#" class="block-20" style="background-image: url('{$document->getFile()->getImages()->getSmall()->getUrl()}');"></a> *}
                                <a href="{$item_i18n->getUrl()}">
                                    <img src="{$document->getFile()->getImages()->getSmall()->getUrl()}"/>
                                </a>
                                {*<p id="copyMe" style="display: none;">{$item_i18n->getUrl()}</p>
                                <input class="copied" type="text" id="Link" aria-hidden="true" style="position: absolute;left: -999em;"/>*}
                            </div>
                        {/foreach} 
                    {/if}    
                </div>
                     <p class="copyMe copyMe-{$item_i18n->get('id')}" style="display: none;">{$item_i18n->getUrl()}</p>
                    <input class="copied" type="text" id="Link" aria-hidden="true" style="position: absolute;left: -999em;"/>
                <div class="seller-info row">
                    <div class="col-md-6 AdvertDate">
                         <span class="AdDate">{$item_i18n->getAdvert()->getFormatter()->getPublishedAt()->getDateFormatter()->getText('P')}</span>
                    </div>
                    <div class="col-md-6 nameAndContact">
                        <div class="ImageTitle">
                            <span class="seller-image">
                                <span class="is-online" {if $item_i18n->getAdvert()->getEmployerUser()->isOnline()}style="background: #1dbf73;"{/if} style="background: #62646a;"></span>
                                <a href="{$item_i18n->getAdvert()->getEmployerUser()->getUrl()}" class="spanImage">
                                    {if $item_i18n->getAdvert()->getEmployerUser()->hasAvatar()}
                                        <img height="32px" src="{$item_i18n->getAdvert()->getEmployerUser()->getAvatar()->getThumb()->getUrl()}"/>
                                    {else}
                                        <img height="32px" src="/web/pictures/inconnu-profile.jpg"/>
                                    {/if}
                                </a>
                            </span>
                            <div class="nameAndDate" style="padding-left: 42px;">
                                <div class="UserNameAndSecond">
                                    <a href="{$item_i18n->getAdvert()->getEmployerUser()->getUrl()}" class="UserName" style="display: inline;">
                                        {$item_i18n->getAdvert()->getEmployerUser()->getFormatter()->getUsername()->ucfirst()}
                                    </a>
                                    {component name="/employers_messager/sendBtn" item_i18n=$item_i18n}             
                                    {*<label class="SendMessage" ><i class="mdi mdi-email"></i></label>  *}
                                    {if $item_i18n->getAdvert()->getEmployerUser()->hasCompany()}
                                    <a href="{$item_i18n->getAdvert()->getEmployerUser()->getCompany()->getUrl()}" class="UserName">
                                        <span class="SecondName">{$item_i18n->getAdvert()->getEmployerUser()->getCompany()->getFormatter()->getName()->ucfirst()}</span>
                                    </a>
                                    {/if}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                            
                <div class="UserInfo">         
                    <p>
                        <h5 style="margin-bottom: 0rem;">
                            <a href="{$item_i18n->getUrl()}" style="color: #222;">{$item_i18n->getFormatter()->getTitle()->ucfirst()|truncate:40}</a>
                        </h5>
                        <a href="{$item_i18n->getUrl()}" style="color: #6f6c6c;">
                            <p class="Description">{$item_i18n->getFormatter()->getShortDescription()->ucfirst()|truncate:80}</p>
                        </a>
                    </p>
                    <div class="UserVotes">
                        {*<span class="votes"><i class="mdi mdi-star-half" aria-hidden="true"></i>4.5 (1.5k)</span>*}
                        <span class="bell-icon"><i class="mdi mdi-bell-ring" aria-hidden="true"></i></span>
                        <span class="ref">{__('Ref:')}  <a href="{$item_i18n->getUrl()}">{$item_i18n->get('reference')}</a></span>
                        {* <span class="abuse-user UserAbuseModal">{__('Abuse')}</span> *}
                        {component name="/employers_contact/abuseBtn" item_i18n=$item_i18n class='abuse-user'}    
                    </div>
                    <div class="wsihAndStarting row">
                        <div class="col-md-2 divWish">
                            <span class="wish" style="display: none;"><i class="mdi mdi-heart" aria-hidden="true"></i></span>
                            <span class="wish" style="display: none;"><i class="mdi mdi-heart-outline" aria-hidden="true"></i></span>
                        </div>
                        <div class="col-md-10 divStarting">
                            {*<button class="btn btn-primary">{__('Get a quote')}</button> *}
                        <span class="starting" style="float:right;">{__('Budget')} <label class="workPrice">{$item_i18n->getAdvert()->getFormatter()->getBudget()->getAmount()}</label></span>
                        </div>
                    </div>
                </div>
            </div>            
            <div class="social-network-sharing">
                <label class="share-to-social-network">
                    <label><i class="mdi mdi-share"></i>Share to</label>
                    <label class="social-network">
                        {component name="/facebook_share/link" text=$item_i18n->getFormatter()->getTitle() url=$item_i18n->getUrl()}
                        {component name="/twitter_share/link" text=$item_i18n->getFormatter()->getTitle() url=$item_i18n->getUrl()}                              
                        {component name="/linkedin_share/link" text=$item_i18n->getFormatter()->getTitle() url=$item_i18n->getUrl() summary=$item_i18n->getFormatter()->getShortDescription()}  
                        {component name="/whatsapp_share/link" text=$item_i18n->getFormatter()->getTitle() url=$item_i18n->getUrl()}                  
                        {component name="/employers_contact/shareBtn" item_i18n=$item_i18n} 
                        <i id="{$item_i18n->get('id')}" class="copyLink-{$item_i18n->get('id')} copyLink mdi mdi-content-copy my-tool-tip" style="cursor:pointer;" data-toggle="tooltip"
                         data-placement="right" data-original-title="copy link"></i>                                   
                    </label>
                </label>
                        
                <button class="BtnOfferQuote btn btn-primary EmployeeAdvertMakeOffer" id="{$item_i18n->get('id')}">{__('Make an offer')}</button> 
                {*<div id="myModalMO" class="modal fade" role="dialog">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                          <div class="modal-body" style="text-align:center;color: #109310;">
                              <i class="mdi mdi-check-circle" style="font-size: 45px;"></i><p style="font-size: 19px;">{__('Your request has been sent to')} <span style="font-weight: 700;color: #187d28;"> {$item_i18n->getAdvert()->getEmployerUser()->getFormatter()->getUsername()->ucfirst()}</span></p>
                        </div>
                      </div>
                    </div>
                </div>*}
                {component name="/employers_contact/abuseBtn" item_i18n=$item_i18n class='abuse-user-second'}
            </div>
        {* <span class="abuse-user-second UserAbuseModal">{__('Abuse')}</span>  *}          
        </div>             
</div>
<script type="text/javascript">
    
   {JqueryScriptsReady}  
       
    $('#MessageModalEmail').keyup(function () {                         
        $('#charNumEmail').text($(this).val().length >= {$max_characters}?"{__('you have reached the limit')}": {$max_characters} - $(this).val().length + "{__(' characters left')}");        
    });
    
   {/JqueryScriptsReady}        
       
</script>   