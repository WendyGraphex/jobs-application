<div class="row admin-header-container btn-r mt-4 mb-2">                                      
                                    <div class="col-sm">
                                        <div class="pull-right">
                                            <a id="CreateOrder"  href="#" class="btn btn-primary btn-next-prev btn-order disabledButton" style="width:200px">{__('Order')}</a>                
                                        </div>
                                    </div>   
 </div>

<script type="text/javascript">
         
                      
       $("#CreateOrder").click(function () {        
            return $.ajax2({ 
                            url :"{url_to('sales_order_ajax',['action'=>'CreateOrder'])}",                            
                            target : "#actions"
                     }); 
       });
    
</script>
