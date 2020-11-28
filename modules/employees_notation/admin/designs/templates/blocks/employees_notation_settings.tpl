   <fieldset class="form-control h-auto">
       <legend class="setting-legend"><h4>{__('Freelancer Notation')}</h4></legend>              
        <div class="form-group row no-gutters">
           <div class="col-7">
            <label class="col-sm-12 col-form-label">{__("Registration Email model")}{if $form->employees_notation_email_model->getOption('required')}*{/if}</label>
          </div>
          <div class="col-5">
            <div class="error-form">{$form.employees_notation_email_model->getError()}</div>
             {html_options class="Settings Select form-control" name="employees_notation_email_model" options=$form->employees_notation_email_model->getChoices()->toARray() selected=$settings->get('employees_notation_email_model')}
          </div>    
       </div> 
                         
    </fieldset>        
