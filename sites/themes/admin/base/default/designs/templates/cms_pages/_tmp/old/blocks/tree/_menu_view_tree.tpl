<style type="text/css">
<!--      
    .tree_page.selected {
        border:solid 1px;
    }
-->
</style>
<ul id="tree" class="ui-sortable" > 
    <li class="" id="{$node->get('id')}"><img  src="{url('/icons/www.gif','picture')}" alt="{__('site')}"/>{$node->getSite()->get('site_host')}
        <ul id="tree_start">
            {if $children}
            {foreach $children as $child}
                {include file="./tree/_menu_view_node.tpl" node=$child}      
            {/foreach} 
            {/if}
        </ul>
    </li>
</ul>    


