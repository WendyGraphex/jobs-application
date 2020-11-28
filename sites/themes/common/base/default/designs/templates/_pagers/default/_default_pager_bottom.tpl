{if $pager->haveToPaginate()}
<div class="row col-md-12 float-left text-black p-0" style="margin-top: 25px;">
    <div class="col-sm-5">
        <div class="dataTables-info" id="Myliste_info" >{__('Showing')} {$pager->getBeginNumberResult()} {__('to')} {$pager->getEndNumberResult()} {__('of')} 
            {format_number_choice('[0]no entry|[1]one entry|(1,Inf]%s entries',$pager->getResults(),$pager->getResults())}
        </div>    
    </div>
    <div class="col-sm-7 p-0">
        <div class="dataTables_paginate paging_simple_numbers" id="Myliste_paginate">
            <ul class="pagination float-right">
                {if $pager->getPreviousPage()!=$pager->getPage() && $pager->getPages()>2}            
            <li class="paginate_button previous disabled" id="Myliste_previous"><a href="#" class="{if $class}{$class}-{/if}pager" data-page="{$pager->getPreviousPage()}" aria-controls="Myliste" data-dt-idx="0" tabindex="0">{__('Previous')}</a></li>
        {/if}               
                {section name=page start=1 loop=$pager->getPages()+1}
            {if $smarty.section.page.index==$pager->getPage()}
                 <li class="paginate_button active"><a href="#" aria-controls="Myliste" data-index="{$smarty.section.page.index}" tabindex="0">{$smarty.section.page.index}</a></li>                
            {else}
                 <li class="paginate_button "><a href="#" class="{if $class}{$class}-{/if}pager" data-page="{$smarty.section.page.index}" aria-controls="Myliste" data-index="{$smarty.section.page.index}" tabindex="0">{$smarty.section.page.index}</a></li>               
            {/if}
        {/section}             
                 {if $pager->getNextPage()!=$pager->getPage() && $pager->getPages()>2}            
                    <li class="paginate_button next" id="Myliste_next"><a href="#" class="{if $class}{$class}-{/if}pager" data-page="{$pager->getNextPage()}" aria-controls="Myliste" data-dt-idx="8" tabindex="0">{__('Next')}</a></li>
                {/if}              
            </ul>
        </div>
    </div>
</div>
{/if}