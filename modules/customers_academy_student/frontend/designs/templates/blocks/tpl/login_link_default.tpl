{if !$user->isAuthenticated() || !$user->isStudentUser()} 
      <li>      
             <a class="btn-Insription" href="{link_i18n_to("customers_academy_student_login")}">{__('Student')}</a>        
     </li> 
{/if}
