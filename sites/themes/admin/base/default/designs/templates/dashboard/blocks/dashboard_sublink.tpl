<div class="sublinks_site">    
{messages class="sublinks-site-errors"}
{foreach $sublinks as $link}
    {if $link@last}       
        {if $link->get('icon')}<img src="{url($link->get('icon'),'web')}" alt="{__($link->get('title'))}"/>{/if}
        <span style="font-weight: bold">{__($link->get('title'))}</span> 
    {elseif $link@first}
    {else}                   
          {if $link->get('icon')}<img src="{url($link->get('icon'),'web')}" alt="{__($link->get('title'))}"/>{/if}
          <span>{__($link->get('title'))}</span>        
        <span style="font-weight: bold">{mfConfig::get('view_sublink_separator','>')}</span>
    {/if}
{/foreach}
</div>