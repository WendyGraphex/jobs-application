
   <fieldset class="form-control h-auto">
       <legend class="setting-legend"><h4>{__('Employees')}</h4></legend>
       <div class="form-group row no-gutters">
           <div class="col-5">
            <label for="QuotationState" class="col-sm-12 col-form-label">{__("Preferred countries")}{*if $form->prefered_countries->getOption('required')}*{/if*}</label>
          </div>
          <div class="col-7">
           {* <div class="error-form">{$form.prefered_countries->getError()}</div>
            <select class="Settings Select form-control" name="prefered_countries" multiple=true >
                {foreach $form->prefered_countries->getChoices() as $key=>$value}
                <option value="{$key}">{format_country($value)}</option>
                {/foreach}
            </select> *}
            {*select_country name="prefered_countries" multiple=true class="Settings Select form-control" options=$form->prefered_countries->getOption('choices') selected=$settings->get('prefered_countries')*}            
          </div>    
       </div> 
        <div class="form-group row no-gutters">
           <div class="col-7">
            <label class="col-sm-12 col-form-label">{__("'Forgot email' email model")}{if $form->employee_forgotemail_email_model->getOption('required')}*{/if}</label>
          </div>
          <div class="col-5">
            <div class="error-form">{$form.employee_forgotemail_email_model->getError()}</div>
             {html_options class="Settings Select form-control" name="employee_forgotemail_email_model" options=$form->employee_forgotemail_email_model->getChoices()->toARray() selected=$settings->get('employee_forgotemail_email_model')}
          </div>    
       </div> 
       <div class="form-group row no-gutters">
           <div class="col-7">
            <label class="col-sm-12 col-form-label">{__("Congratulations email model")}{if $form->employee_congratulation_email_model->getOption('required')}*{/if}</label>
          </div>
          <div class="col-5">
            <div class="error-form">{$form.employee_congratulation_email_model->getError()}</div>
             {html_options class="Settings Select form-control" name="employee_congratulation_email_model" options=$form->employee_congratulation_email_model->getChoices()->toARray() selected=$settings->get('employee_congratulation_email_model')}
          </div>    
       </div> 
         <div class="form-group row no-gutters">
           <div class="col-7">
            <label class="col-sm-12 col-form-label">{__("Contact email model")}{if $form->employee_contact_email_model->getOption('required')}*{/if}</label>
          </div>
          <div class="col-5">
            <div class="error-form">{$form.employee_contact_email_model->getError()}</div>
             {html_options class="Settings Select form-control" name="employee_contact_email_model" options=$form->employee_contact_email_model->getChoices()->toARray() selected=$settings->get('employee_contact_email_model')}
          </div>    
       </div> 
      {* <div class="form-group row no-gutters">
           <div class="col-5">
            <label class="col-sm-12 col-form-label">{__("Recipients admin (separated by ,)")}{if $form->employee_admin_recipients->getOption('required')}*{/if}</label>
          </div>
          <div class="col-7">
            <div class="error-form">{$form.employee_admin_recipients->getError()}</div>
            <textarea cols="25" rows="2" class="Settings  Input form-control" name="employee_admin_recipients">{$settings->get('employee_admin_recipients')}</textarea>
          </div>    
       </div>  *}   
        <hr style="margin-bottom: 0px;"/>
        <div style="margin-bottom: 15px;text-align: center;line-height: 15px;">
            <label>{__("Advert")}</label>
        </div>
        <div class="form-group row no-gutters">
           <div class="col-5">
            <label class="col-sm-12 col-form-label">{__("Advert Reference format")}{if $form->employee_reference_format->getOption('required')}*{/if}</label>
          </div>
          <div class="col-7">
            <div class="error-form">{$form.employee_reference_format->getError()}</div>
            <input type="text" class="Settings  Input form-control" name="employee_reference_format" value="{$settings->get('employee_reference_format')}"/>
          </div>    
       </div>   
         <div class="form-group row no-gutters">
           <div class="col-5">
            <label class="col-sm-12 col-form-label">{__("Advert ID format")}{if $form->employee_id_format->getOption('required')}*{/if}</label>
          </div>
          <div class="col-7">
            <div class="error-form">{$form.employee_id_format->getError()}</div>
            <input type="text" class="Settings  Input form-control" name="employee_id_format" value="{$settings->get('employee_id_format')}"/>
          </div>    
       </div>          
           <div class="form-group row no-gutters">
           <div class="col-5">
            <label class="col-sm-12 col-form-label">{__("Max category per advert")}{if $form->employee_max_advert_category->getOption('required')}*{/if}</label>
          </div>
          <div class="col-7">
            <div class="error-form">{$form.employee_max_advert_category->getError()}</div>
            <input type="text" class="Settings  Input form-control" name="employee_max_advert_category" value="{format_number($settings->get('employee_max_advert_category'))}"/>
          </div>    
       </div>
          <div class="form-group row no-gutters">
           <div class="col-5">
            <label class="col-sm-12 col-form-label">{__("Min age")}{if $form->employee_min_age->getOption('required')}*{/if}</label>
          </div>
          <div class="col-7">
            <div class="error-form">{$form.employee_min_age->getError()}</div>
            <input type="text" class="Settings  Input form-control" name="employee_min_age" value="{format_number($settings->get('employee_min_age'))}"/>
          </div>    
       </div>
           <div class="form-group row no-gutters">
           <div class="col-5">
            <label class="col-sm-12 col-form-label">{__("Max languages")}{if $form->employee_max_languages->getOption('required')}*{/if}</label>
          </div>
          <div class="col-7">
            <div class="error-form">{$form.employee_max_languages->getError()}</div>
            <input type="text" class="Settings  Input form-control" name="employee_max_languages" value="{format_number($settings->get('employee_max_languages'))}"/>
          </div>    
       </div>
            <div class="form-group row no-gutters">
           <div class="col-5">
            <label class="col-sm-12 col-form-label">{__("Max skills")}{if $form->employee_max_skills->getOption('required')}*{/if}</label>
          </div>
          <div class="col-7">
            <div class="error-form">{$form.employee_max_skills->getError()}</div>
            <input type="text" class="Settings  Input form-control" name="employee_max_skills" value="{format_number($settings->get('employee_max_skills'))}"/>
          </div>    
       </div>
            <div class="form-group row no-gutters">
           <div class="col-5">
            <label class="col-sm-12 col-form-label">{__("Max diplomas")}{if $form->employee_max_diplomas->getOption('required')}*{/if}</label>
          </div>
          <div class="col-7">
            <div class="error-form">{$form.employee_max_diplomas->getError()}</div>
            <input type="text" class="Settings  Input form-control" name="employee_max_diplomas" value="{format_number($settings->get('employee_max_diplomas'))}"/>
          </div>    
       </div>
      <div class="form-group row no-gutters">
           <div class="col-5">
            <label class="col-sm-12 col-form-label">{__("Max advert")}{if $form->employee_max_adverts->getOption('required')}*{/if}</label>
          </div>
          <div class="col-7">
            <div class="error-form">{$form.employee_max_adverts->getError()}</div>
            <input type="text" class="Settings  Input form-control" name="employee_max_adverts" value="{format_number($settings->get('employee_max_adverts'))}"/>
          </div>    
       </div>
      
        <hr style="margin-bottom: 0px;"/>
        <div style="margin-bottom: 15px;text-align: center;line-height: 15px;">
            <label>{__("Email models")}</label>
        </div> 
        <div class="form-group row no-gutters">
           <div class="col-7">
            <label class="col-sm-12 col-form-label">{__("Advert revival email model")}{if $form->employee_advert_revival_email_model->getOption('required')}*{/if}</label>
          </div>
          <div class="col-5">
            <div class="error-form">{$form.employee_advert_revival_email_model->getError()}</div>
             {html_options class="Settings Select form-control" name="employee_advert_revival_email_model" options=$form->employee_advert_revival_email_model->getChoices()->toARray() selected=$settings->get('employee_advert_revival_email_model')}
          </div>    
       </div> 
       <div class="form-group row no-gutters">
           <div class="col-7">
            <label class="col-sm-12 col-form-label">{__("Advert created email model")}{if $form->employee_advert_created_email_model->getOption('required')}*{/if}</label>
          </div>
          <div class="col-5">
            <div class="error-form">{$form.employee_advert_created_email_model->getError()}</div>
             {html_options class="Settings Select form-control" name="employee_advert_created_email_model" options=$form->employee_advert_created_email_model->getChoices()->toARray() selected=$settings->get('employee_advert_created_email_model')}
          </div>    
       </div> 
       <div class="form-group row no-gutters">
           <div class="col-7">
            <label class="col-sm-12 col-form-label">{__("Advert published email model")}{if $form->employee_advert_published_email_model->getOption('required')}*{/if}</label>
          </div>
          <div class="col-5">
            <div class="error-form">{$form.employee_advert_published_email_model->getError()}</div>
             {html_options class="Settings Select form-control" name="employee_advert_published_email_model" options=$form->employee_advert_published_email_model->getChoices()->toARray() selected=$settings->get('employee_advert_published_email_model')}
          </div>    
       </div>                      
       <div class="form-group row no-gutters">
           <div class="col-7">
            <label class="col-sm-12 col-form-label">{__("Advert refused email model")}{if $form->employee_advert_refused_email_model->getOption('required')}*{/if}</label>
          </div>
          <div class="col-5">
            <div class="error-form">{$form.employee_advert_refused_email_model->getError()}</div>
             {html_options class="Settings Select form-control" name="employee_advert_refused_email_model" options=$form->employee_advert_refused_email_model->getChoices()->toARray() selected=$settings->get('employee_advert_refused_email_model')}
          </div>    
       </div> 
        <hr style="margin-bottom: 0px;"/>
        <div style="margin-bottom: 15px;text-align: center;line-height: 15px;">
            <label>{__("Limits")}</label>
        </div>    
       <div class="form-group row no-gutters">
           <div class="col-5">
            <label class="col-sm-12 col-form-label">{__("Document limit")} ({__('Mo/Account')}){if $form->employee_limit_document->getOption('required')}*{/if}</label>
          </div>
          <div class="col-7">
            <div class="error-form">{$form.employee_limit_document->getError()}</div>
            <input type="text" class="Settings  Input form-control" name="employee_limit_document" value="{format_number($settings->get('employee_limit_document'))}"/> 
          </div>    
       </div>
          <div class="form-group row no-gutters">
           <div class="col-5">
            <label class="col-sm-12 col-form-label">{__("Number of documents")}{if $form->employee_max_document->getOption('required')}*{/if}</label>
          </div>
          <div class="col-7">
            <div class="error-form">{$form.employee_max_document->getError()}</div>
            <input type="text" class="Settings  Input form-control" name="employee_max_document" value="{format_number($settings->get('employee_max_document'))}"/> 
          </div>    
       </div>
        <div class="form-group row no-gutters">
           <div class="col-5">
            <label class="col-sm-12 col-form-label">{__("Document size")} ({__('Mo')}){if $form->employee_size_document->getOption('required')}*{/if}</label>
          </div>
          <div class="col-7">
            <div class="error-form">{$form.employee_size_document->getError()}</div>
            <input type="text" class="Settings  Input form-control" name="employee_size_document" value="{format_number($settings->get('employee_size_document'))}"/> 
          </div>    
       </div>
         <div class="form-group row no-gutters">
           <div class="col-5">
            <label class="col-sm-12 col-form-label">{__("Time before lock")} {if $form->employee_lock_time->getOption('required')}*{/if}</label>
          </div>
          <div class="col-7">
            <div class="error-form">{$form.employee_lock_time->getError()}</div>
            <input type="text" class="Settings  Input form-control" name="employee_lock_time" value="{$settings->get('employee_lock_time')}"/> 
          </div>    
       </div>
    </fieldset>        
