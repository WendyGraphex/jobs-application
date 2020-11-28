{foreach $node->getChildren() as $child}
    <li class="nav-item {if $child->getPage()->getI18n()->getUrl()->isCurrent()}active{/if}"><a class="nav-link" href="{$child->getPage()->getI18n()->getUrl()}">{$child->getPage()->getI18n()->getFormatter()->getMetaTitle()}</a></li>
{/foreach}  

 
{*
<li class="nav-item"><a href="index.html" class="nav-link">Home</a></li>
        <li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
        <li class="nav-item active"><a href="blog.html" class="nav-link">Blog</a></li>     
        <li class="nav-item"><a href="about.html" class="nav-link">Academy</a></li>
        <li class="nav-item"><a href="about.html" class="nav-link">Events</a></li>
        <li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li> *}
