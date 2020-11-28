   <fieldset class="form-control h-auto">
       <legend class="setting-legend"><h4>{__('Newsletters')}</h4></legend>              
        <div class="form-group row no-gutters">
           <div class="col-7">
            <label class="col-sm-12 col-form-label">{__("Registration Email model")}{if $form->customer_academy_newsletter_email_model->getOption('required')}*{/if}</label>
          </div>
          <div class="col-5">
            <div class="error-form">{$form.customer_academy_newsletter_email_model->getError()}</div>
             {html_options class="Settings Select form-control" name="customer_academy_newsletter_email_model" options=$form->customer_academy_newsletter_email_model->getChoices()->toARray() selected=$settings->get('customer_academy_newsletter_email_model')}
          </div>    
       </div> 
<div class="form-group row no-gutters">
    <div class="col-5">
     <label class="col-sm-12 col-form-label">{__("Newsletter Recipients (separated by ,)")}{if $form->customer_academy_newsletter_admin_recipients->getOption('required')}*{/if}</label>
   </div>
   <div class="col-7">
     <div class="error-form">{$form.customer_academy_newsletter_admin_recipients->getError()}</div>
     <textarea cols="25" rows="2" class="Settings  Input form-control" name="customer_academy_newsletter_admin_recipients">{$settings->get('customer_academy_newsletter_admin_recipients')}</textarea>
   </div>    
</div>
   
       
       
    </fieldset>        

