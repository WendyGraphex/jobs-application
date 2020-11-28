<div class="pager {$class}">
    {if $pager->haveToPaginate()}
        {if $pager->getFirstPage() != $pager->getPage() && $pager->getPages()>4}
            <a class="{if $class}{$class}-{/if}pager" href="?page={$pager->getFirstPage()}"><<</a>
        {/if}
        {if $pager->getPreviousPage()!=$pager->getPage() && $pager->getPages()>2}
            <a class="{if $class}{$class}-{/if}pager" href="?page={$pager->getPreviousPage()}"><</a>
        {/if}
        {section name=page start=1 loop=$pager->getPages()+1}
            {if $smarty.section.page.index==$pager->getPage()}
                <span class="{if $class}{$class}-{/if}pager active">{$smarty.section.page.index}</span>
            {else}
                <a class="{if $class}{$class}-{/if}pager"
                   href="?page={$smarty.section.page.index}">{$smarty.section.page.index}</a>
            {/if}
        {/section}
        {if $pager->getNextPage()!=$pager->getPage() && $pager->getPages()>2}
            <a class="{if $class}{$class}-{/if}pager" href="?page={$pager->getNextPage()}">></a>
        {/if}
        {if $pager->getLastPage()!=$pager->getPage() && $pager->getPages()>4}
            <a class="{if $class}{$class}-{/if}pager" href="?page={$pager->getLastPage()}">>></a>
        {/if}
    {/if}
</div>
