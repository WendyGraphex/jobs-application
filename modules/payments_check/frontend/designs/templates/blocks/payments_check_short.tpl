 <li>
    <label class="containerRadio"><i class="mdi mdi-cash" style="font-size: 24px;color: #4f8ed0;"></i>{__('Check')}
        <input type="radio" class="Payment" data-method="check" name="radio" {if $default && $default->getMethod()->get('name')=='check'}checked=""{/if}>
        <span class="checkmarkRadio"></span>
        <div class="smallText">{__('Check Payment method')}</div>
    </label>
</li>
