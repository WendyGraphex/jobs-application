 <li>
    <label class="containerRadio"><i class="mdi mdi-bank" style="font-size: 24px;color: #4f8ed0;"></i>{__('Bankwire')}
        <input type="radio" class="Payment" data-method="bankwire" name="radio" {if $default && $default->getMethod()->get('name')=='bankwire'}checked=""{/if}>
        <span class="checkmarkRadio"></span>
        <div class="smallText">{__('Check Payment method')}</div>
    </label>
</li>
