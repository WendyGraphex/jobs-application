{if $tpl=='default'}

<div style="text-align: right;">  
    <button class="btn btn-primary BookEvent" id="{$item_i18n->getEvent()->get('id')}">{__('Book Event')}</button>
</div>
{elseif $tpl=='single'}
   <button class="btn BookEvent" id="{$event_i18n->getEvent()->get('id')}" style="background-color: #0e2a8d;color: #fff;font-size: 18px;font-weight: bold;">{__('Book event')}</button>      
{/if}    
