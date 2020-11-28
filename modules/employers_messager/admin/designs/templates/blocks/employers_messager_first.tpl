{if $model_i18n && $model_i18n->isLoaded()}
        {eval $model_i18n->get('body')}
     {else}                   
 <div>
    {$employer.courtesy} {$employer.gender.short} {$employer.firstname} {$employer.lastname}<br><br>
   {__('First message')}<br>

       {__('Cordialement')}<br><br>{__('L’équipe')} {$company.commercial}<br><br>
    
 </div>
 {/if}
         