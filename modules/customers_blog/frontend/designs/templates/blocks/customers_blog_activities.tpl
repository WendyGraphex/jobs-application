<h1>{__('All blog activities')}</h1>
{foreach $pager as $item_i18n}
    <h2>{$item_i18n->getFormatter()->getMetaTitle()->ucfirst()}</h2>
    <div class="row">  
        {foreach $item_i18n->getChildren() as $sub_item_i18n}
            <div class="col-md-3" style="padding-left: 5px;padding-right: 5px;">
                <div class="redblack">
                    <a href="{$sub_item_i18n->getUrl()}">
                        {if $sub_item_i18n->getActivity()->hasIcon()}
                            <div class="divImage-homePage-skills">
                                <img src="{$sub_item_i18n->getActivity()->getIcon()->getUrl()}">
                            </div>
                            <div class="descrSkills-homePage">
                                <span>{$sub_item_i18n->getFormatter()->getMetaTitle()->ucfirst()}</span>
                            </div>
                        {else}
                            <div class="descrSkills-homePage" style="width: 100%;height: 50px;padding: 6px;line-height: 36px;">
                                <span>{$sub_item_i18n->getFormatter()->getMetaTitle()->ucfirst()}</span>
                            </div>
                        {/if}                        
                    </a>
                </div> 
            </div>
        {/foreach}
    </div> 
{/foreach}
