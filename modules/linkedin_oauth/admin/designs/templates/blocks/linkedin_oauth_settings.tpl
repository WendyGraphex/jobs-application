<fieldset class="form-control col-12  h-auto" >
      <legend class="setting-legend"><h4>{__('Linkedin Oauth')}</h4></legend>       
       <div class="form-group row no-gutters mb-1">
           <div class="col-4">
            <label class="col-sm-12 col-form-label">{__("Client")}{if $form->linkedin_oauth_api_client->getOption('required')}*{/if}</label>
          </div>
          <div class="col-8 v-middel">
            <div class="error-form">{$form.linkedin_oauth_api_client->getError()}</div>
               <input type="text" class="Settings  Input form-control" name="linkedin_oauth_api_client" value="{$settings->get('linkedin_oauth_api_client')}"/>
          </div>    
       </div> 
        <div class="form-group row no-gutters mb-1">
           <div class="col-4">
            <label class="col-sm-12 col-form-label">{__("Secret")}{if $form->linkedin_oauth_api_secret->getOption('required')}*{/if}</label>
          </div>
          <div class="col-8 v-middel">
            <div class="error-form">{$form.linkedin_oauth_api_secret->getError()}</div>
               <input type="text" class="Settings  Input form-control" name="linkedin_oauth_api_secret" value="{$settings->get('linkedin_oauth_api_secret')}"/>
          </div>    
       </div>       
</fieldset>        
