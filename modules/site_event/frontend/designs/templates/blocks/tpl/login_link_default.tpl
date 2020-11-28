{if !$user->isAuthenticated() || !$user->isEventUser()}
      <li>      
             <a class="btn-Insription" href="{link_i18n_to("site_event_user_login")}">{__('Event user')}</a>     
     </li> 
{/if}
