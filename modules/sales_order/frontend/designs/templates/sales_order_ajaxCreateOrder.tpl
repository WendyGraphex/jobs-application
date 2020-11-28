{if $cart}
<div class="row padd-r">
    <div class="col-md-12 mb-3 pt-3 pb-3 bg-color-white">
      <div class="d-flex justify-content-between flex-wrap">
        <div class=" align-items-end pb-2">
            <div class="d-block mb-3">
              <h2>{__('My order')}</h2> 
           </div>
           <div class="d-flex">
              <i class="fa fa-home" style="color: #4d83ff;"></i>                    
              <a id="Dashboard"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('Dashboard')}</p></a>
              <p class="text-muted mb-0">&nbsp;/&nbsp;{__('My order n°[%s]' ,$order->get('reference'))}</p>
          </div>
        </div>
      </div>     
   </div>
</div>
{alerts}
{include file="./includes/proceed_to_payment.tpl"}

{else}
   {__('No cart') } 
{/if}

