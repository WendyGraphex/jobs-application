<li {if !$user->isAuthenticated() || !$user->isStudentUser()}style="display:none"{/if} class="nav-item"><a href="{link_i18n('customers_academy_student_account')}" class="nav-link">{__('My account')}</a></li>