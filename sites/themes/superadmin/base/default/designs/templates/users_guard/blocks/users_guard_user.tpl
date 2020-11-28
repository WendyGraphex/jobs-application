{if $user}
    <li class="last-connexion">
    <span style="font-weight: bold;text-transform: capitalize;">{__('last connexion')}:</span><span>&nbsp;{if $session->isLoaded()}{$session->getLastTime()}{else}{__('first connexion')}{/if}</span>    
</li>
<li class="btn-user"> 
    
     {*<img src="{url('/icons/employee.gif','picture')}" alt=""/>*}
{if $user->getGuardUser()->get('picture')}
    <img class="img-profile" height="32px" width="32px" src="{$user->getGuardUser()->getPicture()->getUrl()}" alt="{__('employee')}"/> 
{else} 
    <img class="img-profile" height="32px" width="32px"  src='{url("/icons/avatar.png","picture")}' alt="{__('order_asc')}"/>
{/if}
<span class="name-user">{$user->getGuardUser()|capitalize}</span>
   
     <div class="content-profile" style="display: none">
         <ul class="menu-profile">     
           {component name="/users/myProfile"}
           {component name="/users_guard/logout"}
         </ul>
     </div>
    
</li>
<img class="sort_asc"  src='{url("/icons/info-btn.jpg","picture")}' alt="{__('order_asc')}"/>

<script type="text/javascript">
    $(document).ready(function()
    {
       $(".btn-user,.sort_asc").click(function() { 
           
            $('.content-profile').toggle();
        });
    });
</script>
{/if}