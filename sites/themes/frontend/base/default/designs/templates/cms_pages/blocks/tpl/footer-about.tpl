<div class="col-md">
        <div>                     
            <div class="ftco-footer-widget mb-3">
                <h2 class="FooterH2 ftco-heading-2">{$node->getI18n()->getFormatter()->getTitle()}</h2>
                <ul class="list-unstyled">
                    {foreach $node->getChildren() as $child}
                        <li>
                            <a href="{$child->getPage()->getI18n()->getUrl()}">{$child->getPage()->getI18n()->getFormatter()->getMetaTitle()}</a>
                        </li>
                    {/foreach}   
                </ul>
            </div>
        </div>
        {*<div style="margin-top: 50px;">
            <div class="ftco-footer-widget mb-3">
                <h2 class="FooterH2 ftco-heading-2">{__('Contact Us')}</h2>
                    <ul class="list-unstyled" style="font-size: 16px;">                    
                        <li>{component name="/site_company/Display" tpl="address1"}</li>
                        <li>{component name="/site_company/Display" tpl="phone"}</li>
                        <li>{component name="/site_company/Display" tpl="email"}</li>
                    </ul>
            </div>
        </div>*}
    </div>
