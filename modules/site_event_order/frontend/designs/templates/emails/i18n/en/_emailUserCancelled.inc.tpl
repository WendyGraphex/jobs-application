{if $model_i18n && $model_i18n->isLoaded()}
    {eval $model_i18n->get('body')}
{else}                   
    {$order.event_user.courtesy} {$order.event_user.gender.short} {$order.event_user.firstname} {$order.event_user.lastname},<br><br>
    {__('Event Order cancelled')}<br>

    {include file="./includes/footer-event-email.tpl"}
{/if}
