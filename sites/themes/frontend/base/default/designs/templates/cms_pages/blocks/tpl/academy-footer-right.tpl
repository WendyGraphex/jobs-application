<div class="col-lg-9 col-sm-12">
    <ul>
        {foreach $node->getChildren() as $child}
            <li>             
                <a href="{$child->getPage()->getI18n()->getUrl()}" style="color: #fff;">{$child->getI18n()->getTitle()}</a>
            </li>
        {/foreach}
    </ul>
</div>