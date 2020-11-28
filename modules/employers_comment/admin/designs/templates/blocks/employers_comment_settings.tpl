   <fieldset class="form-control h-auto">
       <legend class="setting-legend"><h4>{__('Employer Comments')}</h4></legend>              
        <div class="form-group row no-gutters">
           <div class="col-7">
            <label class="col-sm-12 col-form-label">{__("Registration Email model")}{if $form->employers_comment_email_model->getOption('required')}*{/if}</label>
          </div>
          <div class="col-5">
            <div class="error-form">{$form.employers_comment_email_model->getError()}</div>
             {html_options class="Settings Select form-control" name="employers_comment_email_model" options=$form->employers_comment_email_model->getChoices()->toARray() selected=$settings->get('employers_comment_email_model')}
          </div>    
       </div> 
                         
    </fieldset>        
