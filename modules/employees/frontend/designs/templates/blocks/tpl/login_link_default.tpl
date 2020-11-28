{if !$user->isAuthenticated() || !$user->isEmployee()}    
    <li>       
        <a class="btn-Insription" href="{link_i18n_to("employees_login")}">{__('Freelancer')}</a>        
    </li>    
{/if}
