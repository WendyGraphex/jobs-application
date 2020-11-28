{if $user}
     <ul class="nav navbar-right top-nav">
                
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">  
                        {if $user->getGuardUser()->get('picture')}
    <img class="img-profile" height="32px" width="32px" src="{$user->getGuardUser()->getPicture()->getUrl()}" alt="{__('employee')}"/> 
{else} 
    <i class="fa fa-user"></i>
{/if}
 <span class="name-user">{$user->getGuardUser()|capitalize}</span> 
                        
                        <b class="caret"></b></a>
                   
          
   <ul class="dropdown-menu">
   {* <li class="last-connexion">
    <span style="font-weight: bold;text-transform: capitalize;">{__('last connexion')}:</span><span>&nbsp;{if $session->isLoaded()}{$session->getLastTime()}{else}{__('first connexion')}{/if}</span>    
</li> *}
<li>{component name="/users/myProfile"}</li>
<li>{component name="/users_guard/logout"}</li>

   </ul>

       </li>
            </ul>
{* <img class="sort_asc"  src='{url("/icons/info-btn.jpg","picture")}' alt="{__('order_asc')}"/> *}

<script type="text/javascript">
    $(document).ready(function()
    {
       $(".btn-user,.sort_asc").click(function() { 
           
            $('.content-profile').toggle();
        });
    });
</script>
{/if}