<fieldset class="form-control h-auto">
    <legend class="setting-legend"><h4>{__('Orders')}</h4></legend>
     <div class="form-group row no-gutters">
           <div class="col-5">
            <label class="col-sm-12 col-form-label">{__("Format reference")}{if $form->order_format_reference->getOption('required')}*{/if}</label>
          </div>
          <div class="col-7">
            <div class="error-form">{$form.order_format_reference->getError()}</div>
            <input type="text" class="Settings  Input form-control" name="order_format_reference" value="{$settings->get('order_format_reference')}"/>
          </div>    
       </div>
   <div class="form-group row no-gutters">
           <div class="col-5">
            <label class="col-sm-12 col-form-label">{__("Format number")}{if $form->order_format_number->getOption('required')}*{/if}</label>
          </div>
          <div class="col-7">
            <div class="error-form">{$form.order_format_number->getError()}</div>
            <input type="text" class="Settings  Input form-control" name="order_format_number" value="{$settings->get('order_format_number')}"/>
          </div>    
       </div> 
    <div class="form-group row no-gutters">
           <div class="col-7">
            <label class="col-sm-12 col-form-label">{__("Model")}{if $form->order_model->getOption('required')}*{/if}</label>
          </div>
          <div class="col-5">
            <div class="error-form">{$form.order_model->getError()}</div>
             {html_options class="Settings Select form-control" name="order_model" options=$form->order_model->getChoices()->toARray() selected=$settings->get('order_model')}
          </div>    
       </div> 
</fieldset>        
