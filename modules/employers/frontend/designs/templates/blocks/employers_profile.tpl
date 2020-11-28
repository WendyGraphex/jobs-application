<li class="nav-item nav-profile dropdown">
    <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
        {if $user->hasAvatar()}  
            <img id="EmployerAvatar" src="{$user->getAvatar()->getThumb()->getUrl()}" alt="{__('My profile')}"/>
        {else}
            <img id="EmployerAvatar" src="{url('icons/user_84308.png','picture')}" alt="{__('My profile')}"/>
        {/if}    
        <span class="nav-profile-name">{$user->getFormatter()->getFirstname()->ucfirst()} {$user->getFormatter()->getLastname()->ucfirst()}</span>
    </a>
    <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
        {*<a class="dropdown-item" id="Profile-Settings" href="#">
            <i class="mdi mdi-settings text-primary"></i>
            {__('Settings')}
        </a>*}
        <a class="dropdown-item" id="Profile-MyProfile" href="#">
            <i class="mdi mdi-account-card-details text-primary"></i>
            {__('My profile')}
        </a>
        {component name="/employers/logout"}
    </div>
</li>
