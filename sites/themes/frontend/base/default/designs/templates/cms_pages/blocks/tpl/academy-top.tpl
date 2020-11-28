{foreach $node->getChildren() as $child}
    <li>             
        <a href="{$child->getPage()->getI18n()->getUrl()}" style="color: #222;">{$child->getI18n()->getTitle()}</a>
    </li>
{/foreach}
