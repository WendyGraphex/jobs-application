<div class="col-md-12 Advert-onProfile sidebar ftco-animate">
    <h1>{__('Portfolio')}</h1>     
    <div class="row">
        {foreach $pager as $item}
            <div class="col-md-6 single-adverton-profile">
                <div class="blog-entry align-self-stretch classFileFont">                  
                    {if $item->getFileManager()->isPicture()}
                        <a href="{$item->getFileManager()->getUrl()}" class="block-20">
                            <img class="classFile-onFont" src="{$item->getFileManager()->getImages()->getSmall()->getUrl()}" alt="{$item->get('file')}">
                        </a>
                    {else}
                        <a href="{$item->getFileManager()->getUrl()}" class="block-20">
                            <img class="classFile-onFont" src="{$item->getFileManager()->getFlavicons()->getText()->getUrl()}" alt="{$item->get('file')}">               
                        </a>
                    {/if}
                    <div style="height: 45px;padding: 4px;">
                        {if $item->hasI18n()}
                            {$item->getI18n()->getTitle()}
                        {/if}
                    </div>
                </div>                
            </div>
        {/foreach}                            
    </div>
    <div style="text-align: right;padding: 5px;">
        <a href="{$employee_user->getPortofolioUrl()}" style="color: black;">{__('See all Portfolio')}</a>
    </div>
</div>
