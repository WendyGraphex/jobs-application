{if $pager->hasItems()}
    <div class="appPortfolioSingle">
        <div class="row">
            <div class="col-md-12"><h2>{__('My Portfolio')}</h2></div>
                    {foreach $pager as $item} 
                <div class="col-lg-4 col-md-6">
                    <div class="blog-entry align-self-stretch">
                        <div class="">
                            <div class="item" style="height: 250px;">
                                {if $item->getFileManager()->isPicture()}
                                    <img class="img-dpzone img-product" src="{$item->getFileManager()->getImages()->getSmall()->getUrl()}" alt="{$item->get('file')}" style="width: auto;margin: 0 auto;display: block;height: auto;width: auto;max-width: 100%;max-height: 100%;">
                                {else}
                                    <img class="img-dpzone img-product" src="{$item->getFileManager()->getFlavicons()->getText()->getUrl()}" alt="{$item->get('file')}" style="width: auto;margin: 0 auto;display: block;height: auto;width: auto;max-width: 100%;max-height: 100%;">               
                                {/if}
                            </div>
                        </div>
                        <div class="user-text-onProfile" style="padding: 9px;">
                            <a href="{$item->getFileManager()->getUrl()}" style="display: block;color: #222;">
                                {if $item->hasI18n()}
                                    {*<a href="" style="height: 40px;display: block;color: #222;">{$item->getI18n()->getFormatter()->getTitle()->ucfirst()}</a>*}
                                    {$item->getI18n()->getTitle()}
                                {else}
                                    {$item->get('file')}
                                {/if}
                            </a>
                        </div>                           
                    </div>
                </div>
            {/foreach}
        </div>
    </div>
{/if}