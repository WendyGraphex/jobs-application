<h3>{__('pages')}</h3>
{if $collection}   
    <span>{format_number_choice('[1]one page found.|(1,Inf]%s pages found.',$collection->count(),$collection->count())}</span>
    {foreach $collection as $item}       
       <div>           
        <a href="{link_i18n_to('cms_pages',['url'=>$item->get('url'),'extension'=>'html'])}" target="_blank">            
            {$item->get('meta_title')}
        </a>
       </div>
    {/foreach}
{else}
    <span>{__('no page found.')}</span>
{/if}