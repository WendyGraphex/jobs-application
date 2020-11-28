<fieldset class="form-control col-12  h-auto" >
      <legend class="setting-legend"><h4>{__('Google Analytic')}</h4></legend>
   
      <div class="form-group row no-gutters">
         <div class="col-4">
               <label for="google_analytic_key" class="col-sm-12 col-form-label">{__("Key")}{if $form->google_analytic_key->getOption('required')}*{/if}</label>
         </div>
         <div class="col-8 v-middel">
             <div class="error-form">{$form.google_analytic_key->getError()}</div>
             <input class="Settings Input form-control " name="google_analytic_key" placeholder="{__('Key')}" value="{$settings->get('google_analytic_key')}">
         </div>  
      </div>
      <div class="form-group row no-gutters">
         <div class="col-4">
               <label for="google_analytic_code" class="col-sm-12 col-form-label">{__("Code")}{if $form->google_analytic_code->getOption('required')}*{/if}</label>
         </div>
         <div class="col-8 v-middel">
             <div class="error-form">{$form.google_analytic_code->getError()}</div>
             <textarea cols="40" rows="4" class="Settings Input form-control " name="google_analytic_code" placeholder="{__('Code')}">{$settings->get('google_analytic_code')}</textarea>
         </div>  
      </div>
    
</fieldset>        
