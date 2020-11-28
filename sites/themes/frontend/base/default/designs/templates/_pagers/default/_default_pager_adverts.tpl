{if $pager->haveToPaginate()}    
<div class="col text-center">
    <div class="block-27">
      <ul>
       {if $pager->getPreviousPage()!=$pager->getPage() && $pager->getPages() > 2}            
              <li><a href="?page={$pager->getPreviousPage()}" class="pager" data-page="{$pager->getPreviousPage()}">&lt;</a></li>
        {/if}        
       
         {section name=page start=1 loop=$pager->getPages()+1}
            {if $smarty.section.page.index==$pager->getPage()}
                 <li class="active"><span>{$smarty.section.page.index}</span></li>                
            {else}
                 <li><a href="?page={$smarty.section.page.index}" class="pager" data-page="{$smarty.section.page.index}">{$smarty.section.page.index}</a></li>               
            {/if}                
         {/section}          
        
        {if $pager->getNextPage()!=$pager->getPage() && $pager->getPages()>2}            
        <li><a href="?page={$pager->getNextPage()}" class="pager" data-page="{$pager->getNextPage()}">&gt;</a></li>
        {/if}
      </ul>
    </div>   
</div>
{/if}    