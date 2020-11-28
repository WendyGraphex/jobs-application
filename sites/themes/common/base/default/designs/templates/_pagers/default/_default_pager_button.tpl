<ul class="pager {$class}">
    {if $pager->haveToPaginate()}
        {if $pager->getFirstPage() != $pager->getPage() && $pager->getPages()>4}
            <li><a class="{if $class}{$class}-{/if}pager" href="?page={$pager->getFirstPage()}">First</a></li>
        {/if}
        {if $pager->getPreviousPage()!=$pager->getPage() && $pager->getPages()>2}
            <li><a class="{if $class}{$class}-{/if}pager" href="?page={$pager->getPreviousPage()}">Previous</a></li>
        {/if}
        {if $pager->getNextPage()!=$pager->getPage() && $pager->getPages()>2}
            <li><a class="{if $class}{$class}-{/if}pager" href="?page={$pager->getNextPage()}">Next</a></li>
        {/if}
        {if $pager->getLastPage()!=$pager->getPage() && $pager->getPages()>4}
            <li><a class="{if $class}{$class}-{/if}pager" href="?page={$pager->getLastPage()}">Last</a></li>
        {/if}
    {/if}
</ul>
