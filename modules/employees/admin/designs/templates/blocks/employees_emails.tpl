 <div class="form-group row no-gutters">
           <div class="col-5">
            <label class="col-sm-12 col-form-label">{__("Freelancers Contact/Advert/Account Recipients (separated by ,)")}{if $form->employee_admin_recipients->getOption('required')}*{/if}</label>
          </div>
          <div class="col-7">
            <div class="error-form">{$form.employee_admin_recipients->getError()}</div>
            <textarea cols="25" rows="2" class="Settings  Input form-control" name="employee_admin_recipients">{$settings->get('employee_admin_recipients')}</textarea>
          </div>    
       </div>
