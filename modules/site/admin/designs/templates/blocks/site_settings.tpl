<fieldset class="form-control h-auto">
       <legend class="setting-legend"><h4>{__('Site')}</h4></legend>
      <div class="form-group row no-gutters">
           <div class="col-5">
            <label class="col-sm-12 col-form-label">{__("Currency")}{if $form->default_currency->getOption('required')}*{/if}</label>
          </div>
          <div class="col-7">
            <div class="error-form">{$form.default_currency->getError()}</div>
            {html_options class="Settings Select form-control"  name="default_currency" options=$form->default_currency->getChoices()->toArray() selected=$settings->get('default_currency')}          
          </div>    
       </div>           
</fieldset>        

