{foreach $pages as $page}
    <div id="cms-page-content-{$page->getPage()->get('name')}" class="page-content">
        {eval $page->get('content')}
    </div>
{/foreach}