<fieldset class="form-control h-auto">
   <legend class="setting-legend"><h4>{__('Academy Cart')}</h4></legend>
   <div class="form-group row no-gutters">
           <div class="col-5">
            <label class="col-sm-12 col-form-label">{__("Currency by default")}{if $form->customers_academy_cart_default_currency->getOption('required')}*{/if}</label>
          </div>
          <div class="col-7">
            <div class="error-form">{$form.customers_academy_cart_default_currency->getError()}</div>
             {html_options class="Settings Select form-control" name="customers_academy_cart_default_currency" options=$form->customers_academy_cart_default_currency->getChoices()->toArray() selected=$settings->get('customers_academy_cart_default_currency')}
          </div>    
       </div>    
    <div class="form-group row no-gutters">
           <div class="col-5">
            <label class="col-sm-12 col-form-label">{__("Format reference")}{if $form->customers_academy_cart_format_reference->getOption('required')}*{/if}</label>
          </div>
          <div class="col-7">
            <div class="error-form">{$form.customers_academy_cart_format_reference->getError()}</div>
            <input type="text" class="Settings  Input form-control" name="customers_academy_cart_format_reference" value="{$settings->get('customers_academy_cart_format_reference')}"/>
          </div>    
       </div>
   <div class="form-group row no-gutters">
           <div class="col-5">
            <label class="col-sm-12 col-form-label">{__("Format number")}{if $form->customers_academy_cart_format_number->getOption('required')}*{/if}</label>
          </div>
          <div class="col-7">
            <div class="error-form">{$form.customers_academy_cart_format_number->getError()}</div>
            <input type="text" class="Settings  Input form-control" name="customers_academy_cart_format_number" value="{$settings->get('customers_academy_cart_format_number')}"/>
          </div>    
       </div>
</fieldset>        
