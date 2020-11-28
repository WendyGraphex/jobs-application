 <ul class="list-paiements PaymentUl">
   {foreach $settings as $setting}      
       {component name=$setting->getMethod()->getComponents()->getShortContentCredit()}       
   {/foreach}                                 
</ul>

<script type="text/javascript">
   
    $('#PaymentUl li').click(function(e) {      
        $('#PaymentUl li').removeClass('LiBackground');
        $(this).addClass('LiBackground');
    });
</script>    