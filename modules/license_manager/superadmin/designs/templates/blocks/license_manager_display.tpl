<div>
{__('Version:')}{if $license_version}{$license_version}{else}{__('XX')}{/if} 
{if $license_date}
    {__('License : Expired at ')}{$license_date}
{else}
    {__('License : Unlimited')}
{/if}  
  {__('Date:')}{$license_version_date}
</div>