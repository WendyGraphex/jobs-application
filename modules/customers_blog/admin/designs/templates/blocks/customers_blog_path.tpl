<div class="col-md-10 text-left ">
       {if !$node->isRoot()}
           <a href="#" class="{if $class}{$class}-{/if}CustomerBlogActivity-item text-decoration-none" id="{$node->getRoot()->get('id')}"><i class="fa fa-globe"></i></a>
           <a href="#" class="{if $class}{$class}-{/if}CustomerBlogActivityPath-item text-decoration-none" id="{$node->getRoot()->get('id')}"><i class="fa fa-caret-down parent" data-toggle="dropdown"></i></a>                
            <ul class="dropdown-menu DropMenuShowFoldersInside" id="path-activity-ctn-{$node->getRoot()->get('id')}">  
            </ul>
       {else}
            <span id="{$node->get('id')}" class="CustomerBlogActivityCurrent" name="current"><i class="fa fa-globe"></i></span>
       {/if}/
       {foreach $node->getFathers()->getActivities() as $activity}
                {if $activity->get('id')==$node->get('id')}
                     <span id="{$node->get('id')}" class="CustomerBlogActivityCurrent" name="current">
                        {if $activity->hasI18n()}
                           {$activity->getI18n()}
                       {elseif $activity->get('name')}
                           {$activity->get('name')}
                       {else}    
                           {__('---')}
                       {/if}   
                     </span>
                {else}
                    <a href="#" class="{if $class}{$class}-{/if}CustomerBlogActivity-item text-decoration-none" id="{$activity->get('id')}">
                       {if $activity->hasI18n()}
                           {$activity->getI18n()}
                       {elseif $activity->get('name')}
                           {$activity->get('name')}
                       {else}    
                           {__('---')}
                       {/if}    
                    </a>
                        <a href="#" class="{if $class}{$class}-{/if}CustomerBlogActivityPath-item text-decoration-none" id="{$activity->get('id')}"><i class="fa fa-caret-down parent" data-toggle="dropdown"></i>/ </a>                
                 <ul class="dropdown-menu DropMenuShowFoldersInside" id="path-activity-ctn-{$activity->get('id')}">  
                 </ul>
                {/if}
       {/foreach}     
       {if $node->hasChildren()}
        <a href="#" class="{if $class}{$class}-{/if}CustomerBlogActivityPath-item text-decoration-none" id="{$node->get('id')}"><i class="fa fa-caret-down parent" data-toggle="dropdown"></i></a>                
        <ul class="dropdown-menu DropMenuShowFoldersInside" id="path-activity-ctn-{$node->get('id')}">                             
        </ul>     
        {/if}
       {* <input type="text" class="col-md-12 text-left CustomerBlogActivity" name="path" value="/{$node->getFathers()->getPath()->implode('/')}"/> *}
</div>

