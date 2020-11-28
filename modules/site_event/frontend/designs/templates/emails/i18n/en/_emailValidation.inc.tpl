<div>
      {$user.courtesy} {$user.gender.short} {$user.firstname} {$user.lastname}<br><br>
    We've sent you an email, please go to your email and click on the link to validate your account<br>
    <a href="{$token.url}" style="font-weight: bold;text-decoration: underline;">{__('Continue to validate your account')}</a>
    Event User validation
    {include file="./includes/footer-event-email.tpl"}
</div>
