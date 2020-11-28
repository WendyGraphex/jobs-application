 <li>
     <label class="containerRadio"><i class="mdi mdi-paypal" style="font-size: 24px;color: #4f8ed0;"></i>{__('Paypal')}
        <input type="radio" class="Payment" data-method="paypal" name="radio" {if $default && $default->getMethod()->get('name')=='paypal'}checked=""{/if}>
        <span class="checkmarkRadio"></span>
        <div class="smallText">{__('Check Payment method')}</div>
    </label>
</li>
