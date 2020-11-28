<div class="SubActivitiesMarginTop">
    <div>
        <ul class="bread-activities">
            {if $node->isRoot()}
                <li><a href="#"><i class="fa fa-home"></i></a></li>
            {else}  
                 <li><a href="{link_i18n('customers_blog_activities')}"><i class="fa fa-home"></i> {__('Home')}</a></li>
                {foreach $node->getFathers() as $father_i18n}
                <li><i class="mdi mdi-chevron-right"></i>
                    <a href="{$father_i18n->getUrl()}">{$father_i18n->getFormatter()->getTitle()->ucfirst()}</a>
                </li>            
                {/foreach}
            {/if}                                  
        </ul>
        {if $node->getChildren()->count()}
            <div><label style="color: #7a7d85;font-weight: bold;">{format_number_choice('[0]no activity|[1]one activities|(1,Inf]%s sub activities',$node->getChildren()->count(),$node->getChildren()->count())}</label></div>
        {/if}
    </div>   
</div>
