<li class="nav-item {if $item_0.active}active{/if}" id="{$name}">
      <a class="nav-link items" id="{$name}" data-url="{$item_0->getRouteAjax()}" href="#">
        <i class="{if $item_0->get('mdi')}mdi {$item_0->get('mdi')}{/if} menu-icon"></i>
        <span class="menu-title">{__($item_0.title)}</span>
      </a>
    </li> 
