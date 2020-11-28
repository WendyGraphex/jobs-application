<fieldset class="form-control h-auto">
    <legend class="setting-legend"><h4>{__('Quotations')}</h4></legend>
     <div class="form-group row no-gutters">
           <div class="col-5">
            <label class="col-sm-12 col-form-label">{__("Format reference")}{if $form->quotation_format_reference->getOption('required')}*{/if}</label>
          </div>
          <div class="col-7">
            <div class="error-form">{$form.quotation_format_reference->getError()}</div>
            <input type="text" class="Settings  Input form-control" name="quotation_format_reference" value="{$settings->get('quotation_format_reference')}"/>
          </div>    
       </div>
   <div class="form-group row no-gutters">
           <div class="col-5">
            <label class="col-sm-12 col-form-label">{__("Format number")}{if $form->quotation_format_number->getOption('required')}*{/if}</label>
          </div>
          <div class="col-7">
            <div class="error-form">{$form.quotation_format_number->getError()}</div>
            <input type="text" class="Settings  Input form-control" name="quotation_format_number" value="{$settings->get('quotation_format_number')}"/>
          </div>    
       </div> 
    <hr style="margin-bottom: 0px;"/>
    <div style="margin-bottom: 15px;text-align: center;line-height: 15px;">
        <label>{__("Title")}</label>
    </div>   
      <div class="form-group row no-gutters">
           <div class="col-7">
            <label class="col-sm-12 col-form-label">{__("Employer accepted email model")}{if $form->employer_quotation_accepted_email_model->getOption('required')}*{/if}</label>
          </div>
          <div class="col-5">
            <div class="error-form">{$form.employer_quotation_accepted_email_model->getError()}</div>
             {html_options class="Settings Select form-control" name="employer_quotation_accepted_email_model" options=$form->employer_quotation_accepted_email_model->getChoices()->toARray() selected=$settings->get('employer_quotation_accepted_email_model')}
          </div>    
    </div> 
     <div class="form-group row no-gutters">
           <div class="col-7">
            <label class="col-sm-12 col-form-label">{__("Employer refused email model")}{if $form->employer_quotation_refused_email_model->getOption('required')}*{/if}</label>
          </div>
          <div class="col-5">
            <div class="error-form">{$form.employer_quotation_refused_email_model->getError()}</div>
             {html_options class="Settings Select form-control" name="employer_quotation_refused_email_model" options=$form->employer_quotation_refused_email_model->getChoices()->toARray() selected=$settings->get('employer_quotation_refused_email_model')}
          </div>    
    </div> 
     <div class="form-group row no-gutters">
           <div class="col-7">
            <label class="col-sm-12 col-form-label">{__("Employer negociated email model")}{if $form->employer_quotation_negociated_email_model->getOption('required')}*{/if}</label>
          </div>
          <div class="col-5">
            <div class="error-form">{$form.employer_quotation_negociated_email_model->getError()}</div>
             {html_options class="Settings Select form-control" name="employer_quotation_negociated_email_model" options=$form->employer_quotation_negociated_email_model->getChoices()->toARray() selected=$settings->get('employer_quotation_negociated_email_model')}
          </div>    
    </div>       
     <div class="form-group row no-gutters">
           <div class="col-7">
            <label class="col-sm-12 col-form-label">{__("Employer revival email model")}{if $form->employer_quotation_revival_email_model->getOption('required')}*{/if}</label>
          </div>
          <div class="col-5">
            <div class="error-form">{$form.employer_quotation_revival_email_model->getError()}</div>
             {html_options class="Settings Select form-control" name="employer_quotation_revival_email_model" options=$form->employer_quotation_revival_email_model->getChoices()->toARray() selected=$settings->get('employer_quotation_revival_email_model')}
          </div>    
    </div>      
    <hr style="margin-bottom: 0px;"/>
    <div style="margin-bottom: 15px;text-align: center;line-height: 15px;">
        <label>{__("Title")}</label>
    </div> 
      <div class="form-group row no-gutters">
           <div class="col-7">
            <label class="col-sm-12 col-form-label">{__("Employee proposed email model")}{if $form->employee_quotation_proposed_email_model->getOption('required')}*{/if}</label>
          </div>
          <div class="col-5">
            <div class="error-form">{$form.employee_quotation_proposed_email_model->getError()}</div>
             {html_options class="Settings Select form-control" name="employee_quotation_proposed_email_model" options=$form->employee_quotation_proposed_email_model->getChoices()->toARray() selected=$settings->get('employee_quotation_proposed_email_model')}
          </div>    
    </div> 
     <div class="form-group row no-gutters">
           <div class="col-7">
            <label class="col-sm-12 col-form-label">{__("Employee accepted email model")}{if $form->employee_quotation_accepted_email_model->getOption('required')}*{/if}</label>
          </div>
          <div class="col-5">
            <div class="error-form">{$form.employee_quotation_accepted_email_model->getError()}</div>
             {html_options class="Settings Select form-control" name="employee_quotation_accepted_email_model" options=$form->employee_quotation_accepted_email_model->getChoices()->toARray() selected=$settings->get('employee_quotation_accepted_email_model')}
          </div>    
    </div>             
     <div class="form-group row no-gutters">
           <div class="col-7">
            <label class="col-sm-12 col-form-label">{__("Employee refused email model")}{if $form->employee_quotation_refused_email_model->getOption('required')}*{/if}</label>
          </div>
          <div class="col-5">
            <div class="error-form">{$form.employee_quotation_refused_email_model->getError()}</div>
             {html_options class="Settings Select form-control" name="employee_quotation_refused_email_model" options=$form->employee_quotation_refused_email_model->getChoices()->toARray() selected=$settings->get('employee_quotation_refused_email_model')}
          </div>    
    </div> 
     <div class="form-group row no-gutters">
           <div class="col-7">
            <label class="col-sm-12 col-form-label">{__("Employee negociated email model")}{if $form->employee_quotation_negociated_email_model->getOption('required')}*{/if}</label>
          </div>
          <div class="col-5">
            <div class="error-form">{$form.employee_quotation_negociated_email_model->getError()}</div>
             {html_options class="Settings Select form-control" name="employee_quotation_negociated_email_model" options=$form->employee_quotation_negociated_email_model->getChoices()->toARray() selected=$settings->get('employee_quotation_negociated_email_model')}
          </div>    
    </div>       
     <div class="form-group row no-gutters">
           <div class="col-7">
            <label class="col-sm-12 col-form-label">{__("Employee revival email model")}{if $form->employee_quotation_revival_email_model->getOption('required')}*{/if}</label>
          </div>
          <div class="col-5">
            <div class="error-form">{$form.employee_quotation_revival_email_model->getError()}</div>
             {html_options class="Settings Select form-control" name="employee_quotation_revival_email_model" options=$form->employee_quotation_revival_email_model->getChoices()->toARray() selected=$settings->get('employee_quotation_revival_email_model')}
          </div>    
    </div>      
    <hr style="margin-bottom: 0px;"/>
    <div style="margin-bottom: 15px;text-align: center;line-height: 15px;">
        <label>{__("Title")}</label>
    </div>          
    <div class="form-group row no-gutters">
           <div class="col-7">
            <label class="col-sm-12 col-form-label">{__("Accepted email model")}{if $form->quotation_accepted_email_model->getOption('required')}*{/if}</label>
          </div>
          <div class="col-5">
            <div class="error-form">{$form.quotation_accepted_email_model->getError()}</div>
             {html_options class="Settings Select form-control" name="quotation_accepted_email_model" options=$form->quotation_accepted_email_model->getChoices()->toARray() selected=$settings->get('quotation_accepted_email_model')}
          </div>    
    </div> 
          
     <div class="form-group row no-gutters">
           <div class="col-7">
            <label class="col-sm-12 col-form-label">{__("Administrator email model")}{if $form->quotation_admin_email_model->getOption('required')}*{/if}</label>
          </div>
          <div class="col-5">
            <div class="error-form">{$form.quotation_admin_email_model->getError()}</div>
             {html_options class="Settings Select form-control" name="quotation_admin_email_model" options=$form->quotation_admin_email_model->getChoices()->toARray() selected=$settings->get('quotation_admin_email_model')}
          </div>    
    </div> 
    <hr style="margin-bottom: 0px;"/>
    <div style="margin-bottom: 15px;text-align: center;line-height: 15px;">
        <label>{__("Title")}</label>
    </div>
    <div class="form-group row no-gutters">
           <div class="col-5">
            <label class="col-sm-12 col-form-label">{__("Recipients admin (separated by ,)")}{if $form->quotation_recipients->getOption('required')}*{/if}</label>
          </div>
          <div class="col-7">
            <div class="error-form">{$form.quotation_recipients->getError()}</div>
            <textarea cols="25" rows="2" class="Settings  Input form-control" name="quotation_recipients">{$settings->get('quotation_recipients')}</textarea>
          </div>    
       </div>
</fieldset>        
