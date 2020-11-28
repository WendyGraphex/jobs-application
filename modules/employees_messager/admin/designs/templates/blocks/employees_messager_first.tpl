{if $model_i18n && $model_i18n->isLoaded()}
        {eval $model_i18n->get('body')}
     {else}                   
 <div>
    {$employee.courtesy} {$employee.gender.short} {$employee.firstname} {$employee.lastname}<br><br>
   {__('First message')}<br>

       {__('Cordialement')}<br><br>{__('L’équipe')} {$company.commercial}<br><br>
    
 </div>
 {/if}
         