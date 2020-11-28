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


<div class="{$site->getSiteID()}-sublinks_site">    
    {foreach $sublinks as $link}
    {if $link@last}       
        {if $link->get('icon')}<img src="{url($link->get('icon'),'web')}" alt="{__($link->get('title'))}"/>{/if}
        <span style="font-weight: bold">{__($link->get('title'))|capitalize}</span> 
    {elseif $link@first}
    {else}    
       <a href="#" name="{$link->getRoute()}" class="{$site->getSiteID()}-sublink">         
          {if $link->get('icon')}<img src="{url($link->get('icon'),'web')}" alt="{__($link->get('title'))}"/>{/if}
          <span>{__($link->get('title'))|capitalize}</span> 
        </a>
        <span style="font-weight: bold">{mfConfig::get('view_sublink_separator','>')}</span>
    {/if}
{/foreach}
</div>
<script type="text/javascript">
      
          $('.{$site->getSiteID()}-sublink').click(function() {  return $.ajax2({                   
                      loading: "#tab-site-{$site->getSiteID()}-dashboard-site-x-settings-loading",                   
                  //    errorTarget: ".errors-tab-dashboard-superadmin", 
                      url:$(this).attr('name'),target: "#tab-{$site->getSiteID()}-dashboard-site-x-settings"}); });
    
</script>    


