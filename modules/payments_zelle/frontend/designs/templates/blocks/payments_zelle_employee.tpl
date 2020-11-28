 <li>
     <label class="containerRadio"><img height="24px" src="/web/pictures/icons/zelle_32x32.png"/> {__('Zelle')}
        <input type="radio" class="Payment" data-name="zelle" data-method="zelle" name="radio" {if $form->getSettings()->getZelle()->isDefault()}checked=""{/if}>
        <span class="checkmarkRadio"></span>        
    </label>
    <div class="row mt-3">                       
        <div class="form col-md-6">                                   
          <div class="form-group">                          
                  <label>{__('Email account')}</label>
                    <div>{$form.zelle.email->getError()}</div>
                  <input type="text" class="form-control Settings Input" data-method="zelle" name="email" value="{if $form->hasErrors()}{$form.zelle.email}{else}{$form->getSettings()->getZelle()->getOptions()->getEmail()}{/if}"/>
          </div>                    
        </div> 
        <div class="form col-md-6">                                   
          <div class="form-group">                          
                  <label>{__('Phone account')}</label>
                    <div>{$form.zelle.phone->getError()}</div>
                  <input type="text" class="form-control Settings Input" data-method="zelle" name="phone" value="{if $form->hasErrors()}{$form.zelle.phone}{else}{$form->getSettings()->getZelle()->getOptions()->getPhone()}{/if}"/>
          </div>                    
        </div> 
      </div>
     
      <div class="row mt-3">                       
        <div class="form col-md-6">                                   
          <div class="form-group">                          
                  <label>{__('First name')}</label>
                    <div>{$form.zelle.firstname->getError()}</div>
                  <input type="text" class="form-control Settings Input" data-method="zelle" name="firstname" value="{if $form->hasErrors()}{$form.zelle.firstname}{else}{$form->getSettings()->getZelle()->getOptions()->getFirstname()}{/if}"/>
          </div>                    
        </div> 
        <div class="form col-md-6">                                   
          <div class="form-group">                          
                  <label>{__('Last name')}</label>
                    <div>{$form.zelle.lastname->getError()}</div>
                  <input type="text" class="form-control Settings Input" data-method="zelle" name="lastname" value="{if $form->hasErrors()}{$form.zelle.lastname}{else}{$form->getSettings()->getZelle()->getOptions()->getLastname()}{/if}"/>
          </div>                    
        </div> 
      </div>
</li>
