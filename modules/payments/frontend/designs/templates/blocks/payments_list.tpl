 <ul class="list-paiements PaymentUl">
   {foreach $methods as $method}
       {component name=$method->getComponents()->getShortContent()}       
   {/foreach}                                 
</ul>

<script type="text/javascript">
   
    $('#PaymentUl li').click(function(e) {      
        $('#PaymentUl li').removeClass('LiBackground');
        $(this).addClass('LiBackground');
    });
</script>    