<div id="dashboard-home-tabs">
     <ul id="dashboard-home-tabs-ctn">
        {foreach $tabs->getTabs() as $name=>$tab} 
        <li>               
            <a class="tabs-sites items_view" href="{if $tab.route}{$tab->getRoute()}{else}#tab-{$name|capitalize}{/if}" title="{__($tab.title)}" name="tab{$name|capitalize}">
            {if $tab.picture}<img class="icon" height="32" width="32" src="{url($tab.picture,'web')}" alt="{__($tab.title)|capitalize}" style=" float: left; margin-right: 10px;"/>{/if}
                 <span class="name-tabs">{__($tab.title)|capitalize}</span>    
                 <img id="tab-{$name}-loading" class="loading" style="display:none;" style="z-index: 500" height="16px" width="16px" src="{url('/icons/loader.gif','picture')}" alt="loader"/>
            </a>              
            <span  style="display:none;" id="item_tab{$name|capitalize}">{__($tab.help)|default:'&nbsp;'}</span>    
        </li>
        {/foreach}
     </ul>
    {foreach $tabs->getComponents() as $name=>$tab}   
    <div id="tab-{$name|capitalize}">
       {component name=$tab.component}         
    </div>   
    {/foreach}
</div>         
<script type="text/javascript">
     {JqueryScriptsReady}  
         $("#dashboard-home-tabs").tabs();
     {/JqueryScriptsReady}  
</script>    