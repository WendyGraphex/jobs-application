<form name="f_authent" id="f_change_user" action="" method="post">
    {html_options name="ConnectedAsUser[user_id]" options=$form->user_id->getOption('choices') selected=$user->getGuardUser()->get('id')}  
    <input type="hidden" name="ConnectedAsUser[token]" value="{$form->getCSRFToken()}"/>
    <a class="logout-btn" id="Send" title="{__('Change user')}" href="#">
         <i class="fa fa-sign-in fa-1x"></i>
    </a>
</form>
  <script type="text/javascript">            
        $(document).ready(function()
        {
               $("#Send").click(function() {   
                   $('#f_change_user').submit(); 
               });
            
        }); 
</script>