<div class="col-md">
    <div class="ftco-footer-widget mb-3">
        <h2 class="FooterH2 ftco-heading-2">{$node->getI18n()->getFormatter()->getTitle()}</h2>
        <ul class="list-unstyled">
            <li>{component name="/customers_blog/activitiesLink"}</li>
            {foreach $node->getChildren() as $child}
                <li>
                    <a href="{$child->getPage()->getI18n()->getUrl()}">{$child->getPage()->getI18n()->getFormatter()->getMetaTitle()}</a>
                </li>
            {/foreach}   
            <li>{component name="/employees_invitation/inviteLink"}</li>
            <li>{component name="/employers_invitation/inviteLink"}</li>
        </ul>
    </div>
</div>