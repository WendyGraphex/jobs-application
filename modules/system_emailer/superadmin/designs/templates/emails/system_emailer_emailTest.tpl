<!DOCTYPE html>
<html>
    <header></header>
    <body>
        {if $form}
           {__('From')}:{$host} 
           <div>
               {$form.body}
           </div>
        {else}
            {__('Test email send from')}:{$host}
        {/if}
    </body>
</html>