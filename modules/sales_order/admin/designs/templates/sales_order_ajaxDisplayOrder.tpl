{if $order->isLoaded()}
<div class="row admin-header-container">
  <div class="col-sm">
              <h3 class="admin-header-big-text">{__('Sales')}</h3>
              <h3 class="admin-header-small-text">{__('Sales Order management')}</h3>
            </div>
  <div class="col-sm" style="padding: 0;">
      <div style="float: right;"> 
        {* <a class="btn btn-success admin-header-button"  href="#" id="New"><i class="fa fa-plus"></i> {__('Add ')}</a>*}
        {* <a class="btn btn-warning admin-header-button" href="#"><i class="fa fa-file-excel"></i> {__('Export XLS')}</a> *}
      </div> 
  </div>
</div>


<div class="breadcrumb-title">
  <p>              
      <i class="fa fa-home" style="color: #37bc9b;"></i>               
      <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Sales')}
      <a href="#" id="Orders"><i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Orders')}</a>
      <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Order [%s]',$order->get('reference'))}
  </p>
</div>
 
{alerts}
  
<script type="text/javascript">

        $("#Orders").click(function() {                   
              return $.ajax2({ url:"{url_to('sales_order_ajax',['action'=>'ListPartialOrder'])}",                                    
                         target: "#actions"}); 
           });  
</script>

{else}
    {__('Order is invalid.')}
{/if}    
