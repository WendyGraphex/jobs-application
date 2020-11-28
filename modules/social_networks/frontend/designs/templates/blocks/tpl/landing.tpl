<div style="text-align: center;">
    <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-3" style="float: none !important;">
        {foreach $networks as $network}
            <li id="{$network->get('name')}">
                    <a href="{$network->get('link')}" target="_blank"><span class="mdi mdi-{$network->get('awe')}"></span></a>
            </li>
        {/foreach} 
    </ul>
</div>