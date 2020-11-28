 <li> 
     <label class="containerRadio"><i class="mdi mdi-paypal" style="font-size: 24px;color: #4f8ed0;"></i>{__('Paypal')} 
          <input type="radio" class="Payment" data-name="paypal" data-method="paypal" name="radio" {if $form->getSettings()->getPaypal()->isDefault()}checked=""{/if}/>
           <span class="checkmarkRadio"></span>         
     </label>
    <div class="row mt-3">                       
        <div class="form col-md-12">                                   
          <div class="form-group">                          
                  <label>{__('Email account')}</label>
                  <div>{$form.paypal.email->getError()}</div>                 
                  <input type="text" class="form-control Settings Input" data-method="paypal" name="email" value="{if $form->hasErrors()}{$form.paypal.email}{else}{$form->getSettings()->getPaypal()->getOptions()->getEmail()}{/if}"/>
          </div>                    
        </div>  
      </div>
</li>
