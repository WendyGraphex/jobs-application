<div class="col-md-10 text-left ">
       {if !$node->isRoot()}
           <a href="#" class="PartnerWorkCategoryMenu-item text-decoration-none" id="{$node->getRoot()->get('id')}"><i class="fa fa-globe"></i></a>
           <a href="#" class="PartnerWorkCategoryMenuPath-item text-decoration-none" id="{$node->getRoot()->get('id')}"><i class="fa fa-caret-down parent" data-toggle="dropdown"></i></a>                
            <ul class="dropdown-menu DropMenuShowFoldersInside" id="path-category-ctn-{$node->getRoot()->get('id')}">  
            </ul>
       {else}
            <span id="{$node->get('id')}" class="PartnerWorkCategoryMenuCurrent" name="current"><i class="fa fa-globe"></i></span>
       {/if}/
       {foreach $node->getFathers()->getCategories() as $category}
                {if $category->get('id')==$node->get('id')}
                     <span id="{$node->get('id')}" class="PartnerWorkCategoryMenuCurrent" name="current">
                        {if $category->hasI18n()}
                           {$category->getI18n()}
                       {elseif $category->get('name')}
                           {$category->get('name')}
                       {else}    
                           {__('---')}
                       {/if}   
                     </span>
                {else}
                    <a href="#" class="PartnerWorkCategoryMenu-item text-decoration-none" id="{$category->get('id')}">
                       {if $category->hasI18n()}
                           {$category->getI18n()}
                       {elseif $category->get('name')}
                           {$category->get('name')}
                       {else}    
                           {__('---')}
                       {/if}    
                    </a>
                        <a href="#" class="PartnerWorkCategoryMenuPath-item text-decoration-none" id="{$category->get('id')}"><i class="fa fa-caret-down parent" data-toggle="dropdown"></i>/ </a>                
                 <ul class="dropdown-menu DropMenuShowFoldersInside" id="path-category-ctn-{$category->get('id')}">  
                 </ul>
                {/if}
       {/foreach}     
       {if $node->hasChildren()}
        <a href="#" class="PartnerWorkCategoryMenuPath-item text-decoration-none" id="{$node->get('id')}"><i class="fa fa-caret-down parent" data-toggle="dropdown"></i></a>                
        <ul class="dropdown-menu DropMenuShowFoldersInside" id="path-category-ctn-{$node->get('id')}">                             
        </ul>     
        {/if}
       {* <input type="text" class="col-md-12 text-left PartnerWorkCategoryMenu" name="path" value="/{$node->getFathers()->getPath()->implode('/')}"/> *}
</div>

