 <li>
     <label class="containerRadio"><img height="32px" src="/web/module/payments_wu/pictures/wu-32x32.png"/> {__('Western union')}
        <input type="radio" class="Payment" data-name="wu" data-method="wu" name="radio" {if $form->getSettings()->getWu()->isDefault()}checked=""{/if}>
        <span class="checkmarkRadio"></span>        
    </label>   
      <div class="row mt-3">                       
        <div class="form col-md-6">                                   
          <div class="form-group">                          
                  <label>{__('First name')}</label>
                    <div>{$form.wu.firstname->getError()}</div>
                  <input type="text" class="form-control Settings Input" data-method="wu" name="firstname" value="{if $form->hasErrors()}{$form.wu.firstname}{else}{$form->getSettings()->getWu()->getOptions()->getFirstname()}{/if}"/>
          </div>                    
        </div> 
        <div class="form col-md-6">                                   
          <div class="form-group">                          
                  <label>{__('Last name')}</label>
                    <div>{$form.wu.lastname->getError()}</div>
                  <input type="text" class="form-control Settings Input" data-method="wu" name="lastname" value="{if $form->hasErrors()}{$form.wu.lastname}{else}{$form->getSettings()->getWu()->getOptions()->getLastname()}{/if}"/>
          </div>                    
        </div> 
      </div>
</li>
