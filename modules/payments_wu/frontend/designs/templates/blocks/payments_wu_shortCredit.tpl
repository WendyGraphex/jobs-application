 <li {if !$setting->isValidated()}style="opacity:0.5"{/if}>
    <label class="containerRadio"><i class="mdi mdi-cash" style="font-size: 24px;color: #4f8ed0;"></i>{__('Western Union')}
      {if $setting->isValidated()}
        <input type="radio" class="Payment" data-method="wu" name="radio" {if $default && $default->getMethod()->get('name')=='wu'}checked=""{/if}>
        {/if}
        <span class="checkmarkRadio"></span>
        <div class="smallText">    
            {if !$setting->isValidated()} <a href="#" class="Configure">{__('Click here to configure this method')}</a>{/if}  
            <div>{__('Western Union Payment method')}</div>
     </div>
     </label>   
</li>
  