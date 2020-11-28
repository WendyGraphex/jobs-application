<div class="col-md">
    <div class="ftco-footer-widget mb-3">
        <h2 class="FooterH2 ftco-heading-2">{$node->getI18n()->getFormatter()->getTitle()}</h2>
        <ul class="list-unstyled">
            {foreach $node->getChildren() as $child}<li><a href="{$child->getPage()->getI18n()->getUrl()}">{$child->getPage()->getI18n()->getFormatter()->getMetaTitle()}</a></li>
            {/foreach}   
        </ul>
    </div>
</div>
