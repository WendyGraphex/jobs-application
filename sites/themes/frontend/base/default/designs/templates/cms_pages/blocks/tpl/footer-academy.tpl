 {* <div class="col-md">
                    <div class="ftco-footer-widget mb-3">
                        <h2 class="FooterH2 ftco-heading-2">{('Graphex Academy')}</h2>
                        <div>Coming Soon</div>
                    </div>
                </div> *}
<div class="col-md">
    <div class="ftco-footer-widget mb-3">
        <h2 class="FooterH2 ftco-heading-2">{$node->getI18n()->getFormatter()->getTitle()}</h2>
        <ul class="list-unstyled">
        {foreach $node->getChildren() as $child}
            <li>
                {if $child->getPage()->getI18n()->hasUrl()}
                <a href="{$child->getPage()->getI18n()->getUrl()}">{$child->getPage()->getI18n()->getFormatter()->getMetaTitle()}</a>
                {else}
                    {$child->getPage()->getI18n()->getFormatter()->getMetaTitle()}
                {/if}
            </li>
        {/foreach}  
        </ul>
    </div>  
</div>