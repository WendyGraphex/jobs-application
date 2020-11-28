<div class="col-lg-3 col-md-6">
    <p><span>{__('Address')}:</span>{$company->get('address1')} {$company->get('address2')} {$company->get('state')} {$company->get('postcode')} {$company->get('city')} {$company->getCountry()->ucfirst()}</p>
</div>
<div class="col-lg-3 col-md-6">
    <p><span>{__('Phone')}:</span> <a href="tel://{$company->get('phone')}">{$company->get('phone')}</a></p>
</div>
<div class="col-lg-3 col-md-6">
    <p><span>{__('Email')}:</span> <a href="mailto:{$company->get('email')}">{$company->get('email')}</a></p>
</div>
<div class="col-lg-3 col-md-6">
    <p><span>{__('Website')}</span> <a href="{$company->get('web')}">{$company->get('web')}</a></p>
</div>
<script type="text/javascript">
    {JqueryScriptsReady}
      
    {/JqueryScriptsReady}
</script>