{if $tpl=='link'}
  <a  href="{link_i18n('sales_sale_conditions')}" target="_blank" class="lien-conditions" style="font-size: 18px;color: #005952;">{__('I agree to all Terms & Conditions')}</a>
{elseif $tpl=='employee'}
<div class="custom-control custom-checkbox  custom-checkboxFront" style="line-height: 25px;">
    <input type="checkbox" class="custom-control-input" id="employee-defaultChecked2">
    <label class="custom-control-label" for="employee-defaultChecked2">
        <a  href="{link_i18n('sales_sale_conditions')}" target="_blank" class="lien-conditions" style="font-size: 18px;color: #222;">{__('I agree to all Terms & Conditions')}</a>
    </label>
</div>
{elseif $tpl=='employer'}
<div class="custom-control custom-checkbox  custom-checkboxFront" style="line-height: 25px;">
    <input type="checkbox" class="custom-control-input" id="employer-defaultChecked2">
    <label class="custom-control-label" for="employer-defaultChecked2">
        <a  href="{link_i18n('sales_sale_conditions')}" target="_blank" class="lien-conditions" style="font-size: 18px;color: #222;">{__('I agree to all Terms & Conditions')}</a>
    </label>
</div>
{elseif $tpl=='cart'}
  <div class="custom-control custom-checkbox  custom-checkboxFront" style="line-height: 25px;">
    <input type="checkbox" class="custom-control-input" id="defaultChecked2">
    <label class="custom-control-label" for="defaultChecked2">
        <a  href="{link_i18n('sales_sale_conditions')}" target="_blank" class="lien-conditions" style="font-size: 18px;color: #222;">{__('I agree to all Terms & Conditions')}</a>
    </label>
</div>           
{else}    
<div class="custom-control custom-checkbox  custom-checkboxFront" style="line-height: 25px;">
    <input type="checkbox" class="custom-control-input" id="defaultChecked2">
    <label class="custom-control-label" for="defaultChecked2">
        <a  href="{link_i18n('sales_sale_conditions')}" target="_blank" class="lien-conditions" style="font-size: 18px;color: #222;">{__('I agree to all Terms & Conditions')}</a>
    </label>
</div>   
{/if}