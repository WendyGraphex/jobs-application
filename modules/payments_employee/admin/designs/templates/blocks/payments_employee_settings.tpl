
   <fieldset class="form-control h-auto">
       <legend class="setting-legend"><h4>{__('Freelancer Payments')}</h4></legend>
         <div class="form-group row no-gutters">
           <div class="col-5">
            <label class="col-sm-12 col-form-label">{__("Format reference")}{if $form->payment_employee_format_reference->getOption('required')}*{/if}</label>
          </div>
          <div class="col-7">
            <div class="error-form">{$form.payment_employee_format_reference->getError()}</div>
            <input type="text" class="Settings  Input" name="payment_employee_format_reference" value="{$settings->get('payment_employee_format_reference')}"/>
          </div>    
       </div>
   <div class="form-group row no-gutters">
           <div class="col-5">
            <label class="col-sm-12 col-form-label">{__("Format number")}{if $form->payment_employee_format_number->getOption('required')}*{/if}</label>
          </div>
          <div class="col-7">
            <div class="error-form">{$form.payment_employee_format_number->getError()}</div>
            <input type="text" class="Settings  Input" name="payment_employee_format_number" value="{$settings->get('payment_employee_format_number')}"/>
          </div>    
       </div> 
        
    </fieldset>        

