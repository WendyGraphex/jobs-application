   <fieldset class="form-control h-auto">
       <legend class="setting-legend"><h4>{__('Employers Project')}</h4></legend>       
        <div class="form-group row no-gutters">
           <div class="col-5">
            <label class="col-sm-12 col-form-label">{__("Project Reference format")}{if $form->employer_project_reference_format->getOption('required')}*{/if}</label>
          </div>
          <div class="col-7">
            <div class="error-form">{$form.employer_project_reference_format->getError()}</div>
            <input type="text" class="Settings  Input form-control" form-control name="employer_project_reference_format" value="{$settings->get('employer_project_reference_format')}"/>
          </div>    
       </div>   
       <div class="form-group row no-gutters">
           <div class="col-5">
            <label class="col-sm-12 col-form-label">{__("Project ID format")}{if $form->employer_project_id_format->getOption('required')}*{/if}</label>
          </div>
          <div class="col-7">
            <div class="error-form">{$form.employer_project_id_format->getError()}</div>
            <input type="text" class="Settings  Input form-control" name="employer_project_id_format" value="{$settings->get('employer_project_id_format')}"/>
          </div>    
       </div> 
           <div class="form-group row no-gutters">
           <div class="col-5">
            <label class="col-sm-12 col-form-label">{__("Document limit")}{if $form->employer_project_document_limit->getOption('required')}*{/if}</label>
          </div>
          <div class="col-7">
            <div class="error-form">{$form.employer_project_document_limit->getError()}</div>
            <input type="text" class="Settings  Input form-control" name="employer_project_document_limit" value="{format_number($settings->get('employer_project_document_limit'))}"/> ({__('Mo/Account')})
          </div>    
       </div>           
    </fieldset>        
