{if $error}
 <div style="font-size: 25px;text-align: center;">
    <div class="alert alert-success" role="alert">
         <i class="fa fa-check-circle" aria-hidden="true" style="color: red;font-size: 31px;"></i> {__('Credit n°%s proceeded by paypal method has an error.',$payment->get('reference')) } 
    </div>
</div>   
    
{else}    
<div style="font-size: 25px;text-align: center;">
    <div class="alert alert-success" role="alert">
         <i class="fa fa-check-circle" aria-hidden="true" style="color: green;font-size: 31px;"></i> {__('Credit n°%s has been successfully proceeded by paypal method.',$payment->get('reference')) } 
    </div>
</div>
{/if}