{if $model_i18n->isLoaded()}
   {$model_i18n->get('body')}
{else}          
     <div>{$message.message}</div>
     <div>{$message.sender}</div>
{/if}    