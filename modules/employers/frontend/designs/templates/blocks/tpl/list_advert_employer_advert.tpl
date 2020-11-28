<div class="sidebar-box ftco-animate block-last-adverts">
    <h3>{__('Last adverts')}</h3>
    {* PAGER *}
    {if $pager->getPreviousPage() != $pager->getPage() && $pager->getPages() > 2}            
        {*<li <a href="#" class="{if $class}{$class}-{/if}pager" data-page="{$pager->getPreviousPage()}">&lt;</a></li>*}
        <span class="previous-advert" style="display: none;">
            <img src="/web/pictures/previous1.png" style="display: none;"/>
        </span> 
    {/if}
       
    {foreach $pager as $item_i18n}
        {component name="/employers/advertDisplay" advert_i18n=$item_i18n tpl='advert'}       
    {/foreach}     

    {* PAGER *}
    <span class="next-advert" style="display: none;">
        <img src="/web/pictures/next1.png"/>
    </span>

    {include file="./_pagers/_employer_default_pager_advert.tpl" pager=$pager class="employer-advert"} 

</div>  
<script type="text/javascript">

    {JqueryScriptsReady}

    {/JqueryScriptsReady}
</script> 
