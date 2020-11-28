<div class="SubCategoriesMarginTop">
    <div>
        <ul class="bread-categories">
            {if $node->isRoot()}
                <li><a href="#"><i class="fa fa-home"></i></a></li>
            {else}  
                 <li><a href="{link_i18n('partners_categories')}"><i class="fa fa-home"></i> {__('Home')}</a></li>
                {foreach $node->getFathers() as $father_i18n}
                <li><i class="mdi mdi-chevron-right"></i>
                    <a href="{$father_i18n->getUrl()}">{$father_i18n->getFormatter()->getTitle()->ucfirst()}</a>
                </li>            
                {/foreach}
            {/if}                                  
        </ul>
        {if $node->getChildren()->count()}
            {if $node->isRoot()}
                <div><label style="color: #7a7d85;font-weight: bold;">{format_number_choice('[0]no category|[1]one categories|(1,Inf]%s categories',$node->getChildren()->count(),$node->getChildren()->count())}</label></div>
            {else}
            <div><label style="color: #7a7d85;font-weight: bold;">{format_number_choice('[0]no sub category|[1]one sub categories|(1,Inf]%s sub categories',$node->getChildren()->count(),$node->getChildren()->count())}</label></div>
            {/if}
        {/if}
    </div>   
</div>
