{*<div class="social-links text-center">
    <a href="#" class="facebook"><i class="fa fa-facebook" aria-hidden="true"></i></a>
    <a href="#" class="twitter"><i class="fa fa-twitter" aria-hidden="true"></i></a>
    <a href="#" class="instagram"><i class="fa fa-instagram" aria-hidden="true"></i></a>
    <a href="#" class="linkedin"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
    <a href="#" class="youtube"><i class="fa fa-youtube" aria-hidden="true"></i></a>
</div>*}

<div class="social-links text-center">
    {foreach $networks as $network}
        <a href="{$network->get('link')}" id="{$network->get('name')}" class="{$network->get('name')}" target="_blank"><i class="fa fa-{$network->get('awe')}"></i></a>
    {/foreach} 
</div>