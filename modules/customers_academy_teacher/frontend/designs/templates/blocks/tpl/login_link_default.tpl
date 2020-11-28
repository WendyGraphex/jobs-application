{if !$user->isAuthenticated() || !$user->isTeacherUser()}
      <li>    
             <a class="btn-Insription" href="{link_i18n_to("customers_academy_teacher_login")}">{__('Teacher')}</a>       
     </li> 
{/if}
