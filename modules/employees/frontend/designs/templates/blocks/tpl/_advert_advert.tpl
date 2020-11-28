<div class="block-21 mb-4 d-flex">
    <a class="blog-img mr-4" style="background-image: url(/web/pictures/image_1.jpg);"></a>
    <div class="text">
        <h4 class="heading" style="margin-bottom: 0px;"><a href="#">{$item_i18n->getFormatter()->getTitle()->ucfirst()|truncate:40}</a></h4>
        <p class="ParagraphAds">{$item_i18n->getFormatter()->getShortDescription()->ucfirst()|truncate:80}</p>
        <div class="meta">
            <div>
                <a href="#">
                    <span class="icon-calendar"></span>
                    {$item_i18n->getFormatter()->getPublishedAt()->getDateFormatter()->getText('P')}
                </a>
            </div>                       
        </div>
    </div>
</div>