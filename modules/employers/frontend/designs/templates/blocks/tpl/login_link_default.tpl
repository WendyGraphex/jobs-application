{if !$user->isAuthenticated() || !$user->isEmployerUser()}
    <li><a class="btn-Insription" href="{link_i18n_to("employers_login")}">{__('Employer')}</a></li>
{/if}
