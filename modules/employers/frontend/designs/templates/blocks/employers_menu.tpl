{messages class="employers-account-errors"}
 <nav class="sidebar sidebar-offcanvas" id="sidebar">
     
{if $menu}
   <ul class="nav">
  {foreach $menu as $name=>$item_0}    
     {* ={if $item_0->get('is_admin',false)}Y{else}N{/if} {$name}=*}
      {if $item_0->get('component')}
          {component name= $item_0->get('component')}
      {elseif $item_0->get('is_admin',false) && $user->getGuardUser()->isAdmin()}             
    <li class="nav-item {if $item_0.active}active{/if}" id="{$name}">
      <a class="nav-link items" id="{$name}" data-url="{$item_0->getRouteAjax()}" href="#">
        <i class="{if $item_0->get('mdi')}mdi {$item_0->get('mdi')}{/if} menu-icon"></i>
        <span class="menu-title">{__($item_0.title)}</span>
      </a>
    </li> 
     {elseif !$item_0->get('is_admin',false)}             
    <li class="nav-item {if $item_0.active}active{/if}" id="{$name}">
      <a class="nav-link items" id="{$name}" data-url="{$item_0->getRouteAjax()}" href="#">
        <i class="{if $item_0->get('mdi')}mdi {$item_0->get('mdi')}{/if} menu-icon"></i>
        <span class="menu-title">{__($item_0.title)}</span>
      </a>
    </li>      
    {/if}
  {/foreach}  
  </ul>
 {/if} 
</nav>

<script type="text/javascript">
    
    $(function()
    {       
        $(".items").click(function () { 
            $(".nav-item").removeClass('active');
            $(this).parent().addClass('active');
            return $.ajax2({                                
                                  url: $(this).attr('data-url'), 
                                  target: "#page-wrapper"
            });
        });
    });
</script>  