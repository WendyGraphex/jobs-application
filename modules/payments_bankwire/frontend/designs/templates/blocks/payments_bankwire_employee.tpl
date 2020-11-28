 <li>
    <label class="containerRadio"><i class="mdi mdi-bank" style="font-size: 24px;color: #4f8ed0;"></i>{__('Bankwire')}
        <input type="radio" class="Payment" data-name="bankwire" data-method="bankwire" name="radio" {if $form->getSettings()->getBankwire()->isDefault()}checked=""{/if}>
        <span class="checkmarkRadio"></span>        
    </label>
    <div class="row mt-3">                       
        <div class="form col-md-12">                                   
          <div class="form-group">                          
                  <label>{__('IBAN')}</label>
                    <div>{$form.bankwire.iban->getError()}</div>
                  <input type="text" class="form-control Settings Input" data-method="bankwire" name="iban" value="{if $form->hasErrors()}{$form.bankwire.iban}{else}{$form->getSettings()->getBankwire()->getOptions()->getIban()}{/if}"/>
          </div>                    
        </div>  
      </div>
</li>
