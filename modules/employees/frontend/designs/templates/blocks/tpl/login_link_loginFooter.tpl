<div class="employee-login">
    {if $user->isAuthenticated() && $user->isEmployee()}
    <a class="btn-Insription" href="{link_i18n_to("employees_account")}">        
        <span>{__('My account')}</span>
    </a>
    {else}
        <a class="btn-Insription" href="{link_i18n_to("employees_login")}">        
        <span>{__('Login')}</span>
    </a>
    {/if}
</div>
