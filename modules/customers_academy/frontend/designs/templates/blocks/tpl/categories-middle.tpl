{if !$node->getChildren()->isEmpty()}
    <div class="row icon-boxes">
            {foreach $node->getChildren() as $item}
                <div class="col-md-4 col-lg-3 col-sm-6 ">
                    <div class="icon-box">
                        <div class="icon"><i class="fa fa-cog icon"></i></div>
                        <span class="title">
                            <a class="nav-link" href="{$item->getI18n()->getUrl()}">{$item->getI18n()->getFormatter()->getTitle()->ucfirst()}</a>
                        </span>
                    </div>
                </div>
            {/foreach}    
    </div>
{else}

{/if}