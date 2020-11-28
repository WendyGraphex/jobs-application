{* <div class="sublinks_dashboard">
    {foreach $sublinks as $link}
    {if $link@last}
        {if $link->get('icon')}<img src="{url($link->get('icon'),'web')}" alt="{$link->get('title')}"/>{/if}
        <span style="font-weight: bold">{$link->get('title')|capitalize}</span> 
    {else}
       <a href="{url($link->get('url'))}" id="{url($link->get('urlAjax'))}"  class="sublink_top">         
          {if $link->get('icon')}<img src="{url($link->get('icon'),'web')}" alt="{$link->get('title')}"/>{/if}
          <span>{$link->get('title')|capitalize}</span> 
        </a>
        <span style="font-weight: bold">{mfConfig::get('view_sublink_separator','>')}</span>
    {/if}
{/foreach}
</div> *}


<div class="sublinks_dashboard sublinks">    
    {foreach $sublinks as $link}
    {if $link@last}       
        {if $link->get('icon')}<img src="{url($link->get('icon'),'web')}" alt="{__($link->get('title'))}"/>{/if}
        <span  style="font-weight: bold">{__($link->get('title'))|capitalize}</span> 
    {else}       
       <a href="#" name="{$link->getRoute()}" class="sublink">         
          {if $link->get('icon')}<img src="{url($link->get('icon'),'web')}" alt="{__($link->get('title'))}"/>{/if}
          <span>{__($link->get('title'))|capitalize}</span> 
        </a>
        <span style="font-weight: bold">{mfConfig::get('view_sublink_separator','>')}</span>
    {/if}
{/foreach}
</div>

<script type="text/javascript">
     {JqueryScriptsReady}  
          $('.sublink').click(function() {  return $.ajax2({ 
                      loading: "#tab-dashboard-superadmin-loading",                   
                      errorTarget: ".errors-tab-dashboard-superadmin", 
                      url:$(this).attr('name'),target: "#tab-dashboard-superadmin-content"}); });
     {/JqueryScriptsReady}  
</script>    


