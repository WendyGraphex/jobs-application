<style type="text/css">
<!--      
    .tree_page.selected {
        border:solid 1px;
    }
    
    
ul { min-height:10px; }
li { width: 150px; }

    
  -->
</style>
<div id="tree">
    <img  src="{url('/icons/www.gif','picture')}" alt="{__('Site')}"/>{$node->getSite()->get('site_host')}
    <ul> 
        <li id="{$node->get('id')}">            
            <ul id="tree_start">
                {if $children}
                {foreach $children as $child}
                    {include file="./tree/_menu_view_node.tpl" node=$child}      
                {/foreach} 
                {/if}           
            </ul>
        </li>
    </ul>    
</div>

{*
<div id="tree1">
    <ul>
         <li class="tree_node1" id="1"><span class="tree_page1">Item 1</span>
            <ul>
                <li class="tree_node1" id="2"><span class="tree_page1">Item 1 1</span><ul></ul></li>
                <li class="tree_node1" id="3"><span class="tree_page1">Item 1 2</span><ul></ul></li>
                <li class="tree_node1" id="4"><span class="tree_page1">Item 1 3</span><ul></ul></li>
             </ul>
         </li>
         <li class="tree_node1" id="5"><span class="tree_page1">Item 2</span><ul></ul></li>
         <li class="tree_node1" id="6"><span class="tree_page1">Item 3</span><ul></ul></li>
         <li class="tree_node1" id="7"><span class="tree_page1">Item 4</span><ul></ul></li>
    </ul>
</div>
<script>
$('#tree1 ul').sortable({
                            connectWith:'#tree1 ul',   
                            placeholder: "ui-state-highlight",
                            //placeholder:'placeholder-tree',                        
                           // cursor: 'all-scroll',
                          //  nested:'ul',  
                          //  handle: '.handle',
                          //  tolerance : 'intersect',
                           
                    });
                    
</script> *}