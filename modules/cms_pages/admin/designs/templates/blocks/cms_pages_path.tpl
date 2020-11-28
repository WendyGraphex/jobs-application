<div class="col-md-10 text-left ">
       {if !$node->isRoot()}
           <a href="#" class="CmsMenu-item text-decoration-none" id="{$node->getRoot()->get('id')}"><i class="fa fa-globe"></i></a>
           <a href="#" class="CmsMenuPath-item text-decoration-none" id="{$node->getRoot()->get('id')}"><i class="fa fa-caret-down parent" data-toggle="dropdown"></i></a>                
            <ul class="dropdown-menu DropMenuShowFoldersInside" id="path-menu-ctn-{$node->getRoot()->get('id')}">  
            </ul>
       {else}
            <span id="{$node->get('id')}" class="CmsMenuCurrent" name="current"><i class="fa fa-globe"></i></span>
       {/if}/
       {foreach $node->getFathers()->getMenus() as $menu}           
                {if $menu->get('id')==$node->get('id')}
                     <span id="{$node->get('id')}" class="CmsMenuCurrent" name="current">
                        {if $menu->hasI18n()}
                           {if $menu->getI18n()->get('title')}{$menu->getI18n()}{else}{$menu->get('name')}{/if}
                       {elseif $menu->get('name')}
                           {$menu->get('name')} 
                       {else}    
                           {__('---')} 
                       {/if}   
                     </span> 
                {else}
                    <a href="#" class="CmsMenu-item text-decoration-none" id="{$menu->get('id')}">
                       {if $menu->hasI18n()}
                           {if $menu->getI18n()->get('title')}{$menu->getI18n()}{else}{$menu->get('name')}{/if}
                       {elseif $menu->get('name')}
                           {$menu->get('name')}
                       {else}    
                           {__('---')}
                       {/if}    
                    </a> 
                        <a href="#" class="CmsMenuPath-item text-decoration-none" id="{$menu->get('id')}"><i class="fa fa-caret-down parent" data-toggle="dropdown"></i>/ </a>                
                 <ul class="dropdown-menu DropMenuShowFoldersInside" id="path-menu-ctn-{$menu->get('id')}">  
                 </ul>
                {/if}
       {/foreach}     
       {if $node->hasChildren()}
        <a href="#" class="CmsMenuPath-item text-decoration-none" id="{$node->get('id')}"><i class="fa fa-caret-down parent" data-toggle="dropdown"></i></a>                
        <ul class="dropdown-menu DropMenuShowFoldersInside" id="path-menu-ctn-{$node->get('id')}">                             
        </ul>     
        {/if}
       {* <input type="text" class="col-md-12 text-left CmsMenu" name="path" value="/{$node->getFathers()->getPath()->implode('/')}"/> *}
</div>

