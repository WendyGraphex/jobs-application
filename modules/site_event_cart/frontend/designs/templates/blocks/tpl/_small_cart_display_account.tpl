<li class="nav-item dropdown mr-1 btnCartShop">
    <a class="nav-link count-indicator dropdown-toggle d-flex justify-content-center align-items-center" id="SmartCartBtn" href="#" data-toggle="dropdown" style="color: #222;">
        <i class="mdi mdi-cart-outline mx-0"></i>        
        <span class="countCart" id="SmartCart-Number-ctn" {if !$cart}style="display:none"{/if}>
            <span class="numberOfItems"  id="SmartCart-Number-Text">{if $cart}{$cart->getFormatter()->getNumberOfItems()->getText()}{/if}</span>
        </span>      
    </a>
    <div id="SmallCartItems" class="dropSmallCart dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="SmartCartBtn" style="animation-name: none;">          
    </div>
</li>
  
  
<script type="text/javascript">
    {JqueryScriptsReady}     
            
        $("#SmallCartItems").mouseleave(function(){
            $("#SmallCartItems").hide();
        });
      
      
      
       $("#SmartCartBtn").click(function () { 
          // $("#SmallCartItems").removeClass('w-scroll'); 
        //   $("#SmallCartItems").toggleClass('show');
        //   if (!$("#SmallCartItems").hasClass('show')) return ;    
           return $.ajax2({ url :"{url_to('site_event_cart_ajax',['action'=>'SmallCartDisplayAccount'])}", 
                            target : "#SmallCartItems",
                            success : function (resp)
                                   {                                      
                                        $("#SmallCartItems").toggle();                                        
                                   }
                     });  
            
       });    
         $('#SmartCartBtn').on('deletefromcart', function (event, data) {
             $('#SmartCart-Number-Text').html(data);
             $("#SmartCart-Number-ctn").show();
         }); 
         
         $('#SmartCartBtn').on('addtocart', function (event, data) {            
             $('#SmartCart-Number-Text').html(data);
             $("#SmartCart-Number-ctn").show();           
         });
        
   {/JqueryScriptsReady}
</script>
