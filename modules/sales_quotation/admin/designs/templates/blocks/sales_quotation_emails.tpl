<div class="form-group row no-gutters">
    <div class="col-5">
     <label class="col-sm-12 col-form-label">{__("Quotation Recipients (separated by ,)")}{if $form->quotation_recipients->getOption('required')}*{/if}</label>
   </div>
   <div class="col-7">
     <div class="error-form">{$form.quotation_recipients->getError()}</div>
     <textarea cols="25" rows="2" class="Settings  Input form-control" name="quotation_recipients">{$settings->get('quotation_recipients')}</textarea>
   </div>    
</div>
   
