<fieldset class="form-control h-auto">
       <legend class="setting-legend"><h4>{__('Sales')}</h4></legend>
      <div class="form-group row no-gutters">
           <div class="col-5">
            <label class="col-sm-12 col-form-label">{__("Commission Tax rate")}{if $form->tax_rate->getOption('required')}*{/if}</label>
          </div>
          <div class="col-7">
            <div class="error-form">{$form.tax_rate->getError()}</div>
            {html_options class="Settings Select form-control"  name="tax_rate" options=$form->tax_rate->getChoices()->toArray() selected=$settings->get('tax_rate')}
            {*<input type="text" class="Settings  Input" name="tax_rate" value="{if $form->hasErrors()}{$form.tax_rate}{else}{format_pourcentage($settings->get('tax_rate'))}{/if}"/> *}
          </div>    
       </div>           
</fieldset>        
