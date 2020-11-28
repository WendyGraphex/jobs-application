<div class="employer-login">
    {if $user->isAuthenticated() && $user->isEmployerUser()}
    <a class="btn-Insription" href="{link_i18n_to("customers_academy_teacher_user_account")}">        
        <span>{__('My account')}</span>
    </a>
    {else}
        <a class="btn-Insription" href="{link_i18n_to("customers_academy_teacher_user_login")}">        
        <span>{__('Login')}</span>
    </a>
    {/if}
</div>
