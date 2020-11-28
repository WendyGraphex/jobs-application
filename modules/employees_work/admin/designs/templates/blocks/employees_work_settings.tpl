
   <fieldset class="form-control h-auto">
       <legend class="setting-legend"><h4>{__('Works')}</h4></legend>
         <div class="form-group row no-gutters">
           <div class="col-5">
            <label class="col-sm-12 col-form-label">{__("Format reference")}{if $form->work_format_reference->getOption('required')}*{/if}</label>
          </div>
          <div class="col-7">
            <div class="error-form">{$form.work_format_reference->getError()}</div>
            <input type="text" class="Settings  Input form-control" name="work_format_reference" value="{$settings->get('work_format_reference')}"/>
          </div>    
       </div>
        <div class="form-group row no-gutters">
           <div class="col-5">
            <label class="col-sm-12 col-form-label">{__("Format number")}{if $form->work_format_number->getOption('required')}*{/if}</label>
          </div>
          <div class="col-7">
            <div class="error-form">{$form.work_format_number->getError()}</div>
            <input type="text" class="Settings  Input form-control" name="work_format_number" value="{$settings->get('work_format_number')}"/>
          </div>    
       </div>      
   </fieldset>
       
      <fieldset class="form-control h-auto">
        <legend class="setting-legend"><h4>{__('Work payment requests')}</h4></legend>
        <div class="form-group row no-gutters">
           <div class="col-5">
            <label class="col-sm-12 col-form-label">{__("Format reference")}{if $form->work_payment_request_format_reference->getOption('required')}*{/if}</label>
          </div>
          <div class="col-7">
            <div class="error-form">{$form.work_payment_request_format_reference->getError()}</div>
            <input type="text" class="Settings  Input form-control" name="work_payment_request_format_reference" value="{$settings->get('work_payment_request_format_reference')}"/>
          </div>    
       </div>
        <div class="form-group row no-gutters">
           <div class="col-5">
            <label class="col-sm-12 col-form-label">{__("Format number")}{if $form->work_payment_request_format_number->getOption('required')}*{/if}</label>
          </div>
          <div class="col-7">
            <div class="error-form">{$form.work_payment_request_format_number->getError()}</div>
            <input type="text" class="Settings  Input form-control" name="work_payment_request_format_number" value="{$settings->get('work_payment_request_format_number')}"/>
          </div>    
       </div> 
         <div class="form-group row no-gutters">
           <div class="col-5">
            <label class="col-sm-12 col-form-label">{__("Payment day")}{if $form->work_payment_day->getOption('required')}*{/if}</label>
          </div>
          <div class="col-7">
            <div class="error-form">{$form.work_payment_day->getError()}</div>
            {html_options class="Settings  Select form-control" options=$form->work_payment_day->getChoices() name="work_payment_day" selected=$settings->get('work_payment_day')}
          </div>    
       </div>
        <div class="form-group row no-gutters">
           <div class="col-5">
            <label class="col-sm-12 col-form-label">{__("Payment hour")}{if $form->work_payment_hour->getOption('required')}*{/if}</label>
          </div>
          <div class="col-7">
            <div class="error-form">{$form.work_payment_hour->getError()}</div>
            {html_options class="Settings  Select form-control" options=$form->work_payment_hour->getChoices() name="work_payment_hour" selected=$settings->get('work_payment_hour')}
          </div>    
       </div>
         <div class="form-group row no-gutters">
           <div class="col-5">
            <label class="col-sm-12 col-form-label">{__("Payment shift")}{if $form->work_payment_shift->getOption('required')}*{/if}</label>
          </div>
          <div class="col-7">
            <div class="error-form">{$form.work_payment_shift->getError()}</div>
            {html_options class="Settings  Select form-control" options=$form->work_payment_shift->getChoices() name="work_payment_shift" selected=$settings->get('work_payment_shift')}
          </div>    
       </div>
    </fieldset>        

