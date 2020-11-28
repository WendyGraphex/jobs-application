 <!-- Begin user session nav -->
<ul id="top-menu" class="nav-user navbar-right float-right p-0 m-0">
  <li class="dropdown">
    <a href="#" class="dropdown-toggle p-3 d-block mydropdown" data-id="dropdown1"  id="drop1">
      <img title="Avatar" class="avatar rounded-circle position-relative" src="/admin/web/pictures/icons/avatar.jpg" alt="Avatar">
      <strong>{$user->getGuardUser()->get('email')}</strong>
    </a>
    <ul class="dropdown-menu square margin-list with-triangle primary ml-0" id="dropdown1">    
      <li><a href="#" data-url="{url_to('users_ajax',['action'=>'MyProfile'])}" class="top-items m-1 p-1 h-100">{__('Profile')}</a></li>
      <li><a rel="nofollow" href="{url_to('users_guard_logout')}" class="m-1 p-1 h-100">Log out</a></li>
    </ul>
  </li>
</ul>
<!-- End user session nav -->


<script type="text/javascript">
    
    {JqueryScriptsReady}
     $(".top-items").click(function() {         
         if (!$(this).attr('data-url'))
             return ;
           $("#dropdown1").hide();
           return  $.ajax2({ url: $(this).attr('data-url'),                             
                             errorTarget: ".dashboard-errors",                           
                             target: "#page-wrapper"
                           });                            
    });    
     {/JqueryScriptsReady}      
</script>  
