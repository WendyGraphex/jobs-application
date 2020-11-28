 <div class="form-group row no-gutters">
           <div class="col-5">
            <label class="col-sm-12 col-form-label">{__("Employers Contact/Advert/Account Recipients (separated by ,)")}{if $form->employer_admin_recipients->getOption('required')}*{/if}</label>
          </div>
          <div class="col-7">
            <div class="error-form">{$form.employer_admin_recipients->getError()}</div>
            <textarea cols="25" rows="2" class="Settings  Input form-control" name="employer_admin_recipients">{$settings->get('employer_admin_recipients')}</textarea>
          </div>    
       </div>
