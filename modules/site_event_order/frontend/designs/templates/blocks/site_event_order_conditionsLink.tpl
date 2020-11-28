{if $tpl=='cart'}
  <div class="custom-control custom-checkbox  custom-checkboxFront" style="line-height: 25px;">
    <input type="checkbox" class="custom-control-input" id="defaultChecked2">
    <label class="custom-control-label" for="defaultChecked2">
        <a  href="{link_i18n('site_event_order_sale_conditions')}" target="_blank" class="lien-conditions" style="font-size: 18px;color: #222;">{__('I agree to all Terms & Conditions')}</a>
    </label>
</div>     
        {elseif $tpl=='signin'}
             <input type="checkbox" class="custom-control-input" id="defaultInline1">
                  <label class="custom-control-label" for="defaultInline1">
                      <a href="{link_i18n('site_event_order_sale_conditions')}" target="_blank">{__('I agree to all Terms & Conditions')}</a>
                  </label>
{/if}