<fieldset class="form-control col-12  h-auto" >
      <legend class="setting-legend"><h4>{__('Instagram Oauth')}</h4></legend>       
        <div class="form-group row no-gutters mb-1">
           <div class="col-4">
            <label class="col-sm-12 col-form-label">{__("Key")}{if $form->instagram_ouath_api_key->getOption('required')}*{/if}</label>
          </div>
          <div class="col-8 v-middel">
            <div class="error-form">{$form.instagram_ouath_api_key->getError()}</div>
               <input type="text" class="Settings  Input form-control" name="instagram_ouath_api_key" value="{$settings->get('instagram_ouath_api_key')}"/>
          </div>    
       </div> 
        <div class="form-group row no-gutters mb-1">
           <div class="col-4">
            <label class="col-sm-12 col-form-label">{__("Secret")}{if $form->instagram_ouath_api_secret->getOption('required')}*{/if}</label>
          </div>
          <div class="col-8 v-middel">
            <div class="error-form">{$form.instagram_ouath_api_secret->getError()}</div>
               <input type="text" class="Settings  Input form-control" name="instagram_ouath_api_secret" value="{$settings->get('instagram_ouath_api_secret')}"/>
          </div>    
       </div> 
</fieldset>        
