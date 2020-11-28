   <fieldset class="form-control h-auto">
       <legend class="setting-legend"><h4>{__('Employer Invitation')}</h4></legend>              
        <div class="form-group row no-gutters">
           <div class="col-7">
            <label class="col-sm-12 col-form-label">{__("Invitation Email model")}{if $form->employers_invitation_email_model->getOption('required')}*{/if}</label>
          </div>
          <div class="col-5">
            <div class="error-form">{$form.employers_invitation_email_model->getError()}</div>
             {html_options class="Settings Select form-control" name="employers_invitation_email_model" options=$form->employers_invitation_email_model->getChoices()->toARray() selected=$settings->get('employers_invitation_email_model')}
          </div>    
       </div> 
                         
    </fieldset>        
