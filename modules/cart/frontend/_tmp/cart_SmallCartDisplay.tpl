<div class="dorne-add-listings-btn d-inline-block">
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" id="SmartCartBtn" class="btn dorne-btn {*dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"*}">
             <span class='badge badge-warning' id='lblCartCount'>{if $cart}{$cart->getCartProducts()->count()}{/if}</span> <i id="panier" class="mdi mdi-cart mr-1 shoping-cart "></i>{__('Your Request')}
          </a>
              <ul id="SmallCartItems" class="dropdown-menu dropdown-cart rounded-0" role="menu">
              
             </ul>
              
</div>
      
<script type="text/javascript">
    $(document).ready(function() {            
      
       $("#currency-active").on('change',function () { 
          // alert("OK"+$(this).attr('data-currency'));
           // update 
       });
      
       $("#SmartCartBtn").click(function () { 
          // $("#SmallCartItems").removeClass('w-scroll'); 
           $("#SmallCartItems").toggleClass('show');
           if (!$("#SmallCartItems").hasClass('show')) return ;    
           return $.ajax2({ url :"{url_to('cart_ajax',['action'=>'SmallCartDisplay'])}", 
                            target : "#SmallCartItems",
                            success : function (resp)
                                   {
                                        $("#SmallCartItems").addClass('show'); 
                                        
                                       // if($(".list-items-scroll").height() === 359 ){ $("#SmallCartItems").addClass('w-scroll');  };
                                   }
                     });  
            
       });
    
        $('#SmartCartBtn').on('deletefromcart', function (event, data) {
            $('#lblCartCount').text(data);
         }); 
         
         $('#SmartCartBtn').on('addtocart', function (event, data) {
            $('#lblCartCount').text(data);
         });
        
         
       $("#SmallCartItems").hover(
        function() {
            $(this).addClass('show');
        }, function() {
            if(!$( this).hasClass('clicked') ){
                $( this ).removeClass('show');
            }
        }
       );

   }); 
</script>
