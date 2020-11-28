<a class="navbar-brand" href="/">
    {if $company->hasPicture()}
        {*<img title="{$company->get('name')}" class="logo-company" src="{$company->getPicture()->getUrl()}"/>*}
        <img src="/web/pictures/Graphex22.png" class="logo-company"/>
    {else}    
    <img title="{$company->get('name')}" class="logo-company" src="/admin/web/pictures/blanc.png" alt="{$company->get('name')}" height="66px">
    {/if}
</a>
