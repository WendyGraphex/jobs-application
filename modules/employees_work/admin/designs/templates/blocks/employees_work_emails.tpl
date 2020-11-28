 <div class="form-group row no-gutters">
           <div class="col-5">
            <label class="col-sm-12 col-form-label">{__("Freelancer Work/Request Recipients (separated by ,)")}{if $form->work_admin_recipients->getOption('required')}*{/if}</label>
          </div>
          <div class="col-7">
            <div class="error-form">{$form.work_admin_recipients->getError()}</div>
            <textarea cols="25" rows="2" class="Settings  Input form-control" name="work_admin_recipients">{$settings->get('work_admin_recipients')}</textarea>
          </div>    
       </div>
