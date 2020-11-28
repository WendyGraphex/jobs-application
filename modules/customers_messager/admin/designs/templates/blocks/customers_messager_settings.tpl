
   <fieldset class="form-control h-auto">
       <legend class="setting-legend"><h4>{__('Customer Messager')}</h4></legend>      
  
       <hr>  
        <div class="form-group row no-gutters">
           <div class="col-7">
            <label class="col-sm-12 col-form-label">{__("Freelancer first message model")}{if $form->employee_first_message_model->getOption('required')}*{/if}</label>
          </div>
          <div class="col-5">
            <div class="error-form">{$form.employee_first_message_model->getError()}</div>
             {html_options class="Settings Select form-control" name="employee_first_message_model" options=$form->employee_first_message_model->getChoices()->toArray() selected=$settings->get('employee_first_message_model')}
          </div>    
       </div> 
       <hr>  
        <div class="form-group row no-gutters">
           <div class="col-7">
            <label class="col-sm-12 col-form-label">{__("Employer first message model")}{if $form->employer_first_message_model->getOption('required')}*{/if}</label>
          </div>
          <div class="col-5">
            <div class="error-form">{$form.employer_first_message_model->getError()}</div>
             {html_options class="Settings Select form-control" name="employer_first_message_model" options=$form->employer_first_message_model->getChoices()->toArray() selected=$settings->get('employer_first_message_model')}
          </div>    
       </div>       
    </fieldset>        
