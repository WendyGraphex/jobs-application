{if $order->isLoaded()}
<div class="row RowTop">
    <div class="col-md-12 grid-margin classConducteurTop">
      <div class="d-flex justify-content-between flex-wrap">
        <div class="d-flex align-items-end flex-wrap">
          <div class="mr-md-3 mr-xl-5 styleWidth">
            <h2>{__('My orders')}</h2>                   
          </div>
          <div class="d-flex">
            <i class="mdi mdi-home text-muted hover-cursor"></i>
            <a id="Dashboard"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('Dashboard')}</p></a>
            <p class="text-muted mb-0">&nbsp;/&nbsp;{__('My order n°[%s]' ,$order->getReference())}</p>
          </div>
        </div> 
          {component name="/site_help/help" help="employer-proceed-to-payment"}
      </div>
    </div>
</div>



{alerts}
{include file="./includes/proceed_to_payment.tpl"}

{else}
   {__('Order is invalid.') } 
{/if}



