{if $cart->isLoaded()}
<div class="row admin-header-container">
            <div class="col-sm">
                <h3 class="admin-header-big-text">{__('Academey')}</h3>
              <h3 class="admin-header-small-text">{__('Carts management')}</h3>
            </div>
            <div class="col-sm" style="padding: 0;">
                <div style="float: right;">                  
                  <a class="btn btn-warning admin-header-button" href="#"><i class="fa fa-file-excel"></i> {__('Export XLS')}</a>
                </div> 
            </div>
          </div>    
          <!-- End page heading -->
          
          <!-- Begin breadcrumb -->
        <div class="breadcrumb-title">
            <p>             
                <i class="fa fa-home" style="color: #37bc9b;"></i>             
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Sales')}            
                <a href="#" id="Carts"><i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Carts')}</a>
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Cart [%s]',$cart->get('reference'))}         
            </p>
        </div>
          <!-- End breadcrumb -->
{alerts}
  
<script type="text/javascript">

        $("#Carts").click(function() {                   
              return $.ajax2({ url:"{url_to('customers_academy_cart_ajax',['action'=>'ListPartial'])}",                                    
                         target: "#actions"}); 
           });  
</script>

{else}
    {__('Billing is invalid.')}
{/if}    

        
