<div class="form-group row no-gutters">
    <div class="col-5">
     <label class="col-sm-12 col-form-label">{__("Employer Abuse Recipients (separated by ,)")}{if $form->employers_contact_admin_recipients->getOption('required')}*{/if}</label>
   </div>
   <div class="col-7">
     <div class="error-form">{$form.employers_contact_admin_recipients->getError()}</div>
     <textarea cols="25" rows="2" class="Settings  Input form-control" name="employers_contact_admin_recipients">{$settings->get('employers_contact_admin_recipients')}</textarea>
   </div>    
</div>
   