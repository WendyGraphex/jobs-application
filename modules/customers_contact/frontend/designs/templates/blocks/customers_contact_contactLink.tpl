{if $tpl=='bottom'}   
<span class="mdi mdi-keyboard"></span>
    <a class="nav-item" href="{link_i18n('customers_contact')}">{__('Contact us')}</a>
{elseif $tpl=='top'}    
<li class="nav-item">   
   <a class="nav-link" href="{link_i18n('customers_contact')}">{__('Contact us')}</a>   
</li>
{else}
    <a class="nav-item" href="{link_i18n('customers_contact')}">{__('Contact us')}</a>  
{/if}    

  