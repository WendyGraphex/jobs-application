<div class="modal fade" id="DialogShareAdvert" role="dialog">
    <div class="ModalContactUser modal-dialog modal-lg" style="width: 50%;">
        <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div style="text-align: center;">
                    <h2 class="sharing-title">{__('Share This Advert')}</h2>
                    <div class="sharing-description">
                        <p style="font-size: 18px;">{__('Spread the word about this Advert on Graphex')}</p>
                    </div>
                    <ul class="shareTo-social-network">
                        {component name="/facebook_share/link" tpl='share' text=$text url=$advert_i18n->getUrl()}  
                        {component name="/linkedin_share/link" tpl='share' text=$text url=$advert_i18n->getUrl()} 
                        {component name="/twitter_share/link" tpl='share' text=$text url=$advert_i18n->getUrl()} 
                        {component name="/whatsapp_share/link" tpl='share' text=$text url=$advert_i18n->getUrl()}
                        <li class="liLinkCopy" style="cursor: pointer;">
                            <p id="copyMe" style="display: none;">{$advert_i18n->getUrl()}</p>
                            <input class="copied" type="text" id="Link" aria-hidden="true" style="position: absolute;left: -999em;"/>
                            <i class="copyLink mdi mdi-link-variant" style="font-size: 36px;"></i>
                            <label class="textcopy">{__('Copy')}</label>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    
   {JqueryScriptsReady}  
          
    $(".shareAdEmpl").click(function () {
        $("#DialogShareAdvert").modal('show'); 
    });
    
    $(".copyLink").on("click", function() {
        var n = $("#copyMe").text();
        $(".copied").attr("value", n);
        $(".copied").attr("type", "text").select();
        document.execCommand("copy");
        $(".textcopy").text('Copied');
        $(".liLinkCopy").css('color','green');
    });
       
       
   {/JqueryScriptsReady}        
       
</script>   