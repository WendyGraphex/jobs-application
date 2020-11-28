<fieldset class="form-control col-12  h-auto" >
      <legend class="setting-legend"><h4>{__('Facebook Oauth')}</h4></legend>
   
      <div class="form-group row no-gutters">
         <div class="col-4">
               <label for="facebook_app_id" class="col-sm-12 col-form-label">{__("App  Id")}{if $form->facebook_app_id->getOption('required')}*{/if}</label>
         </div>
         <div class="col-8 v-middel">
             <div class="error-form">{$form.facebook_app_id->getError()}</div>
             <input class="Settings Input form-control " name="facebook_app_id" placeholder="{__('facebook app id')}" value="{$settings->get('facebook_app_id')}">
         </div>  
      </div>
      <div class="form-group row no-gutters">
         <div class="col-4">
               <label for="facebook_app_secret" class="col-sm-12 col-form-label">{__("App Secret")}{if $form->facebook_app_secret->getOption('required')}*{/if}</label>
         </div>
         <div class="col-8 v-middel">
             <div class="error-form">{$form.facebook_app_secret->getError()}</div>
             <input class="Settings Input form-control " name="facebook_app_secret" placeholder="{__('facebook app secret')}" value="{$settings->get('facebook_app_secret')}">
         </div>  
      </div>
    
</fieldset>        
