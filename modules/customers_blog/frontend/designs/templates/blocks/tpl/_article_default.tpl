<div class="vc_column-inner ">
    <div class="wpb_wrapper">
        <div class="clearfix"></div>
        <div> 
            <div class="td_block_inner" id=" ">
                <div class="td_module_16 td_module_wrap td-animation-stack">
                    <div class="td-module-thumb"><a href="" rel="bookmark" title="{$item_i18n->getFormatter()->getMetaTitle()->ucfirst()}">
                            <img class="entry-thumb td-animation-stack-type0-2" src="{*$item_i18n->getPicture()->getURL()*}" alt="" width="150" height="150"></a></div>
                    <div class="item-details">
                        <h3 class="entry-title td-module-title"><a href="{$item_i18n->getUrl()}" rel="bookmark" title="{$item_i18n->getFormatter()->getMetaTitle()->ucfirst()}">{$item_i18n->getFormatter()->getMetaTitle()->ucfirst()}</a></h3>
                        <div class="td-module-meta-info">
                            <span class="td-post-author-name"><a href="">{$item_i18n->getArticle()->getFormatter()->getAuthor()->ucfirst()}</a> <span>-</span> </span>                    
                            <span class="td-post-date"><time class="entry-date updated td-module-date">{$item_i18n->getFormatter()->getCreatedAt()->getText('P')}</time></span>
                            <div class="td-module-comments">
                                <a href="">{$item_i18n->getFormatter()->getNumberOfViews()}</a>
                            </div>                
                        </div>
                        <div class="td-excerpt">
                            {$item_i18n->getFormatter()->getMetaDescription()}               
                        </div>
                    </div>
                </div>
            </div>
        </div> 
    </div>
</div>

