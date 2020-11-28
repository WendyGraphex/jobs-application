{if $pager->haveToPaginate()}
<div class="row mt-5">
    <div class="col text-center">
        <div class="block-27">
            <ul>              
                {if $pager->getPreviousPage() != $pager->getPage() && $pager->getPages() > 2}            
                    <li> <a href="#" class="{if $class}{$class}-{/if}pager" data-page="{$pager->getPreviousPage()}" >&lt;</a></li>
                {/if}  
                {section name=page start=1 loop=$pager->getPages()+1}
                    {if $smarty.section.page.index==$pager->getPage()}
                        <li class="active"><a href="javascript:void(0);" data-index="{$smarty.section.page.index}">{$smarty.section.page.index}</a></li>                
                    {else}
                        <li class=""><a href="javascript:void(0);" class="{if $class}{$class}-{/if}pager" data-page="{$smarty.section.page.index}" >{$smarty.section.page.index}</a></li>               
                    {/if}
                {/section}             
                 {if $pager->getNextPage()!=$pager->getPage()}            
                    <li><a href="#" class="{if $class}{$class}-{/if}pager" data-page="{$pager->getNextPage()}" >&gt;</a></li>
                {/if}
            </ul>
        </div>
    </div>
</div>
{/if}