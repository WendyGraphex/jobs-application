<fieldset class="form-control h-auto">
    <legend class="setting-legend"><h4>{__('Billings')}</h4></legend>
     <div class="form-group row no-gutters">
           <div class="col-5">
            <label class="col-sm-12 col-form-label">{__("Format reference")}{if $form->billing_format_reference->getOption('required')}*{/if}</label>
          </div>
          <div class="col-7">
            <div class="error-form">{$form.billing_format_reference->getError()}</div>
            <input type="text" class="Settings  Input form-control" name="billing_format_reference" value="{$settings->get('billing_format_reference')}"/>
          </div>    
       </div>
   <div class="form-group row no-gutters">
           <div class="col-5">
            <label class="col-sm-12 col-form-label">{__("Format number")}{if $form->billing_format_number->getOption('required')}*{/if}</label>
          </div>
          <div class="col-7">
            <div class="error-form">{$form.billing_format_number->getError()}</div>
            <input type="text" class="Settings  Input form-control" name="billing_format_number" value="{$settings->get('billing_format_number')}"/>
          </div>    
       </div> 
    <div class="form-group row no-gutters">
           <div class="col-7">
            <label class="col-sm-12 col-form-label">{__("Model")}{if $form->billing_model->getOption('required')}*{/if}</label>
          </div>
          <div class="col-5">
            <div class="error-form">{$form.billing_model->getError()}</div>
             {html_options class="Settings Select form-control" name="billing_model" options=$form->billing_model->getChoices()->toARray() selected=$settings->get('billing_model')}
          </div>    
       </div> 
</fieldset>        
