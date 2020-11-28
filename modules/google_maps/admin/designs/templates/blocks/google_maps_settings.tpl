<fieldset class="form-control col-12  h-auto" >
      <legend class="setting-legend"><h4>{__('Google maps')}</h4></legend>   
      <div class="form-group row no-gutters">
         <div class="col-4">
               <label for="google_map_key" class="col-sm-12 col-form-label">{__("Key")}{if $form->google_map_key->getOption('required')}*{/if}</label>
         </div>
         <div class="col-8 v-middel">
             <div class="error-form">{$form.google_map_key->getError()}</div>
             <input class="Settings Input form-control " name="google_map_key" placeholder="{__('Key')}" value="{$settings->get('google_map_key')}">
         </div>  
      </div>      
</fieldset>        
