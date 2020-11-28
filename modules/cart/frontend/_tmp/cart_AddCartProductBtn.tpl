<div class="modal" id="AddToCartProductModal" tabindex="-1" role="dialog" style="">
        <div class="modal-dialog mod_dialog" role="document">
          <div class="modal-content div_model">
           <div class="modal-header">
              <h5 class="modal-title">{__('Add to Cart')}</h5>
              <button id="close-AddToCart-dialog" class="close my-btn-dialog">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body text-left">
                <div class="form-group">
                  <div class="input-append date form_datetime row" >
                    <label for="datepicker" class="col-form-lab col-3">{__('From')} :</label>
                    <input class="form-control Date CartProduct d-inline-block width-element col-8 Input " type="text" placeholder="{__('Enter your start date')}"  name="in_at" data-toggle="tooltip" data-html="true" title="" value="{if $cart && $cart->hasEvent()}{$cart->getEvent()->getFormatter()->getInAt()->getText()}{/if}">
                  </div>
                </div>
                <div class="form-group">
                    <div class="input-append date form_datetime row">
                     <label for="datepicker" class="col-form-lab col-3">{__('To')} :</label>
                     <input class="form-control Date CartProduct d-inline-block width-element col-8 Input"  type="text" placeholder="{__('Enter your end date')}" name="out_at" data-toggle="tooltip" data-html="true" title="" value="{if $cart && $cart->hasEvent()}{$cart->getEvent()->getFormatter()->getOutAt()->getText()}{/if}">
                    </div>
                </div>
               
                <div class="form-group row">
                    <label for="qty-name" class="col-form-lab col-3">{__('Qty')}:</label>
                <div class="input-group qty-input-group p-0 col-8">
                    <input type="text" name="quantity" class="form-control form-control-lg border-right-0 qty-input CartProduct Input " name="quantity" placeholder="{__('Enter your quantity')}" id="qty-name" data-toggle="tooltip" data-html="true" title="" value="">
                    <div class="input-group-prepend bg-transparent">
                      <span class="input-group-text qty-jrs bg-transparent border-left-0">/ jour</span>
                    </div>
                  </div>
                </div> 
                
                 <div class="form-group row">
                    <label for="comments" class="col-form-lab col-3">{__('Comments')}:</label>
                    <textarea class="form-control d-inline-block col-8 CartProduct Input" name="comments" rows="5" id="comments" style="height: 70px;"></textarea>
                  </div> 
                  <hr class="separator-hr">  
                  <div class="row">
                      <div class="addToCart-price m-auto">
                          <span id="addToCart-price"></span>
                        
                      </div>
                        
                  </div>
                  <small>{__('Prix unitaire')} :<span class="font-weight-bold" id="addToCart-price-unit"></span></small>
            </div>
            <div class="modal-footer AddToCart-footer">  
                <button type="button" d="iContinueCartBtn" class="btn btn-primary pl-4 pr-4 close-AddToCart-dialog">{__('Continue')}</button>
                <button type="button" id="EventBtn" class="btn btn-primary ">{__('Event')}</button>
                <button type="button" id="AddToCartBtn" class="AddToCart btn btn-primary AddToCart-padd">{__('Add')}</button>
           
            </div>
          </div>
        </div>
</div>       
      
      
<script type="text/javascript">
   
   $(document).ready(function() {
         $(".Date").datepicker({  minDate: +2 });
        {if $cart->hasEvent()}
          $(".AddToCart-product").click(function (){               
           $("#AddToCartProductModal").show();             
           $("#AddToCartBtn").removeData('json'); 
           $("#AddToCartBtn").attr('data-json',$(this).attr('data-json'));           
           $("#addToCart-price-unit").html($(this).data('json').sale_price_with_tax_currency);
        });    
        
         var dates = $( ".Date.CartProduct[name=in_at], .Date.CartProduct[name=out_at]" ).datepicker({
                        minDate : new Date("{$cart->getEvent()->getFormatter()->getInAt()->getDate()}"),
                      //  maxDate : new Date("{$cart->getEvent()->getFormatter()->getOutAt()->getDate()}"),
			onSelect: function( selectedDate ) {
				var option = this.name == "in_at" ? "minDate" : "maxDate",
					instance = $( this ).data( "datepicker" ),
					date = $.datepicker.parseDate(
						instance.settings.dateFormat ||
						$.datepicker._defaults.dateFormat,
						selectedDate, instance.settings );
				dates.not( this ).datepicker( "option", option, date );
         } } );
        {else}        
        $(".AddToCart-product").click(function (){ 
                
          
           if ($("#AddToCartBtn").hasClass('EventOk'))
                $("#AddToCartProductModal").show();  
           else
                $("#CreateEventModal").show();             
           $("#AddToCartBtn").removeData('json'); 
           $("#AddToCartBtn").attr('data-json',$(this).attr('data-json')); 
           $("#addToCart-price-unit").html($(this).data('json').sale_price_with_tax_currency);
       });   
       {/if}
                
        $("#close-AddToCart-dialog,#ContinueCartBtn").click(function(){  $("#AddToCartProductModal").hide(); $(".Input").tooltip('dispose'); });              
       
        $(".Input").click(function(){ $(".Input").tooltip('dispose'); });
       
        $("#AddToCartBtn").click(function () {
            
         
           //alert("OK "+$(this).data('json').toSource());
           var params = { AddProductToCart : { id : $("#AddToCartBtn").data('json').id, token :'{mfForm::getToken('AddProductToCartForm')}' } };
           $(".CartProduct.Input").each(function () { params.AddProductToCart[$(this).attr('name')]=$(this).val(); });
           return $.ajax2({ data : params,
                            url :"{url_to('cart_ajax',['action'=>'AddProductToCart'])}",                            
                            success : function (resp)
                                   {
                                      // console.log(resp);
                                      if (resp.errors)
                                      {    
                                        $.each(resp.errors , function(key, val){
                                                  $(".Input[name="+key+"]").attr('title',val);
                                                  $(".Input[name="+key+"]").tooltip('show');
                                             });
                                        return ;
                                      }
                                      
                                    
                                      $('#AddToCartProductModal').hide();
                                       var panier = $('#panier');
                                        var imgtodrag = $("#"+$("#AddToCartBtn").data('json').id);
                                        
                                        if (imgtodrag) {
                                            var imgclone = imgtodrag.clone()
                                                .offset({
                                                top: imgtodrag.offset().top,
                                                left: imgtodrag.offset().left
                                            })
                                                .css({
                                                'opacity': '0.5',
                                                    'position': 'absolute',
                                                    'height': '150px',
                                                    'width': '150px',
                                                    'z-index': '100'
                                            })
                                                .appendTo($('body'))
                                                .animate({
                                                'top': panier.offset().top + 10,
                                                    'left': panier.offset().left + 10,
                                                    'width': 75,
                                                    'height': 75
                                            }, 1000, 'easeInOutExpo');

                                            setTimeout(function () {
                                                panier.effect("shake", {
                                                    times: 2
                                                }, 200);
                                            }, 1500);

                                            imgclone.animate({
                                                'width': 0,
                                                'height': 0
                                            }, function () {
                                                $(this).detach();
                                            });
                                        }
                                    $("#SmartCartBtn").trigger('addtocart',[resp.number_of_items]);
                                   }
                     });   
       });
        
        
          $('input[name=quantity]').keyup(function() {
        
               var str = $(".AddToCart-product").data('json').sale_price_with_tax_currency;
               var total=(parseFloat(str)*$('input[name=quantity]').val()).toFixed(2).toString().replace(".", ",");
               $("#addToCart-price").html(total+"{$cart->getCurrency()->getCode()->getSymbol()}");
               if(!$(this).val()|| (isNaN($(this).val())))
               {              
                $("#addToCart-price").html('-,-- '+"{$cart->getCurrency()->getCode()->getSymbol()}");
                }
                  
          });
          
           if(!$('input[name=quantity]').val())
           {
              $("#addToCart-price").html('-,-- '+"{$cart->getCurrency()->getCode()->getSymbol()}");
           }
            
            $("#EventBtn").click(function (){ 
               
           if ($("#AddToCartBtn").hasClass('EventOk'))
                console.log('kkkk');
                $("#AddToCartProductModal").hide();             
                $("#AddToCartBtn").removeClass('EventOk');
                $("#CreateEventModal").show();   
       
    });
        
      
   });    
</script>  
    
