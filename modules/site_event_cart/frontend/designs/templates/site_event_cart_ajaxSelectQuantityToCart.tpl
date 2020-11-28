{if $site_event->isLoaded()}
<label>{__('Quantity (%s)',$site_event->getFormatter()->getAvailableQuantity()->getChoices("[0]no place available|[1]one place available|(1,Inf]%s places available"))}</label>
<input type="text" class="form-control SiteEventCart" name="quantity" value="{if $site_event->isAvailable()}1{/if}" style="height: 40px !important;margin-bottom: 15px;"/>
<div style="text-align: center;">
    <button id="AddToCartBtn" class="btn btn-primary">{__('Add to cart')}</button>
</div>
<script type="text/javascript">
            
    $("#AddToCartBtn").click(function() {        
        return $.ajax2({    data : { AddEventToCart : { event: '{$site_event->get('id')}', quantity : $(".SiteEventCart[name=quantity]").val(), token : '{mfForm::getToken('AddEventToCartForm')}' } },                    
                            url: "{url_to('site_event_cart_ajax',['action'=>'AddEventToCart'])}",
                            success : function (resp)
                            {         
                                if (resp.action!='AddEventToCart') return ;
                                if (resp.errors)
                                {
                                    return ;
                                }    
                                $("#ModalBookEvent").modal('hide');
                                
                                
                                /*var cart = $('#SmartCartBtn');
                                var imgtodrag = $('.eventImageSrc').find("img").eq(0);
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
                                        'top': cart.offset().top + 10,
                                            'left': cart.offset().left + 10,
                                            'width': 75,
                                            'height': 75
                                    }, 1000, 'easeInOutExpo');

                                    setTimeout(function () {
                                        cart.effect("shake", {
                                            times: 2
                                        }, 200);
                                    }, 1500);

                                    imgclone.animate({
                                        'width': 0,
                                            'height': 0
                                    }, function () {
                                        $(this).detach()
                                    });
                                }*/
                                           
                                $("#SmartCartBtn").trigger('addtocart',resp.number_of_events);
        
        
                            }
                          //  target :'#ModalBookEvent-ctn'
                    });
    });
        
   
</script>
{else}
    {__('Event is invalid.')}
{/if}    

  