{if $cart}
<div class="row padd-r">
            <div class="col-md-12 mb-3 pt-3 pb-3 bg-color-white">
              <div class="d-flex justify-content-between flex-wrap">
                <div class=" align-items-end pb-2">
                    <div class="d-block mb-3">
                      <h2>{__('My cart')}</h2> 
                   </div>
                   <div class="d-flex">
                      <i class="fa fa-home" style="color: #4d83ff;"></i>
                      <p class="text-muted mb-0">&nbsp;/&nbsp;{__('Dashboard')}&nbsp;/&nbsp;</p>
                      <p class="text-primary mb-0">i{__('My cart n°[%s]' ,$cart->getReference())}</p>
                  </div>
                </div>
              </div>     
           </div>
</div>
{alerts}
<div class=""> 
 <ul class="nav nav-tabs  nav-tabs-Cart mt-4" id="myTab" role="tablist">
                <li class="nav-item text-center">
                  <a class="nav-link active" id="your-cart-tab" data-toggle="tab" href="#your-cart" role="tab" aria-controls="your-cart" aria-selected="true">{__('Your Cart')}</a>
                </li>
                <li class="nav-item text-center">
                  <a class="nav-link" id="event-tab" data-toggle="tab" href="#event" role="tab" aria-controls="event" aria-selected="false">{__('Event')}</a>
                </li>
                <li class="nav-item text-center">
                  <a class="nav-link" id="quotation-tab" data-toggle="tab" href="#quotation" role="tab" aria-controls="quotation" aria-selected="false">{__('Quotation')}</a>
                </li>
 </ul>
 <div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="your-cart" role="tabpanel" aria-labelledby="Cart">
<div class="col-lg-12 pt-2 stretch-card">
       
    <div class="card">
        <div class="card-body pr-2 pl-2">               
          <div class="table-responsive pt-3">
            <table class="table table-bordered table-striped">
              <thead class="">
                <tr role="row">
                    <th> #</th>    
                    <th></th>    
                    <th>{__('Ref/Desc.')}</th> 
                    <th>{__('In/Out')}</th> 
                    <th>{__('Qty')}</th> 
                    <th>{__('Tax')}</th> 
                    <th>{__('Unit Price')}</th>                                                      
                    <th>{__('Total Price')}</th>
                    <th>{__('Actions')}</th>
                </tr>
              </thead>
              <tbody>
                 {foreach $pager as $item} 
                    <tr class="list" id="{$item->get('id')}" role="row">
                        <td class="count">{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</td>                                                            
                        <td>
                             {if  $item->getProduct()->hasPicture()}
                           <img   src="{$item->getProduct()->getPicture()->getThumb()->getUrl()}" alt="" />
                           {/if}
                        </td>
                        <td>
                            <span>{$item->getProduct()->get('reference')}
                               {$item->getProduct()->getI18n()->get('title')}
                           </span>
                        </td>
                        <td>
                            <div>{$item->getFormatter()->getInAt()->getText()}</div>
                            <div>{$item->getFormatter()->getOutAt()->getText()}</div>
                        </td>
                        <td>                            
                            <a href="#" class="DecCartProduct" id="{$item->get('id')}" {if $item->getQuantity()==1}style="display:none"{/if}>-</a>
                              <span>{$item->getFormatter()->getQuantity()}</span>
                            <a href="#" class="IncCartProduct" id="{$item->get('id')}">+</a>
                        </td> 
                        <td>
                            {$item->getTax()->getRate()->getPourcentage()}
                        </td>
                          <td>{$item->getFormatter()->getSalePriceWithTax()}
                        </td> 
                        <td>{$item->getFormatter()->getTotalSalePriceWithTax()}
                        </td>                                                
                          <td class="font-i"> 
                             <a href="#" class="list-action text-info  View" id="{$item->get('id')}"><i class="fa fa-pencil Edit"></i></a>
                             <a href="#" class="list-action DeleteCartProductItem cart-trash " id="{$item->get('id')}" name="{$item->getProduct()->get('reference')} {$item->getProduct()->getI18n()->get('title')}" title="{__('Delete')}"><i class="fa fa-trash"></i></a>                                    
                          </td>
                    </tr>
                 {/foreach}
                 {if !$pager->hasItems()}
                     <tr role="row" >
                         <td  colspan="9">{__('No cart available')}</td>
                     </tr>
                 {/if} 
                   <tr class="list tab-globale" role="row">
                                                <td class="bg-white border-0 " colspan="6"></td>
                                                <td class="align-middle border bg-light">{__('Total HT')}</td>
                                                <td class="align-middle text-center border bg-light">
                                                 {$cart->getFormatter()->getTotalSalePriceWithoutTax()->getAmount()}
                                                </td>
                                            </tr>
                                            {foreach $cart->getEngine()->getTaxes() as $tax}
                                            <tr class="list" role="row">
                                                <td  class="bg-white border-0" colspan="6"></td>
                                                <td class="align-middle border bg-light">{__('TVA')} {$tax->getTax()->getRate()->getPourcentage(0)}</td>
                                                <td class="align-middle text-center border bg-light">{$tax->getTotal()->getAmount()}</td>
                                         
                                            </tr>
                                            {/foreach} 
                                            <tr class="list" role="row">
                                                <td class="bg-white border-0" colspan="6"></td>
                                                <td class="align-middle border bg-light">{__('Total TTC')}</td>
                                                <td class="align-middle text-center border bg-light">
                                                     {$cart->getFormatter()->getTotalSalePriceWithTax()->getAmount()}
                                                </td>
                                            </tr>
                                            

                                </tbody>         
                            </table>
                          </div>
                        <div class="row admin-header-container btn-r mt-4 mb-2">    
                           <div class="col-sm">
                              <div class="pull-right">
                                 <a id=""  href="#" class="btn btn-primary btn-next-prev btnNext">{__('Next')}</a>                
                              </div>
                           </div>
                        </div>
                    </div>
                    </div>     
                    </div> 
                    </div>

                              
<div class="tab-pane fade " id="quotation" role="tabpanel" aria-labelledby="Order" style="margin-right: 15px;margin-left:10px">
                     
                      <div class="pb-5">
                        <div class="container bg-white pb-2  col-lg-12">
                         
                                <div class="row py-5 bg-white shadow-sm">
                                    <div class="col-lg-12">
                                    <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Order summary </div>
                                    
                                        <p class="font-italic mb-4">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium,
                                            totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. 
                                            Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, 
                                            sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. 
                                            Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit,
                                            sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.
                                            Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, 
                                            nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate
                                            velit esse quam nihil molestiae consequatur, 
                                            vel illum qui dolorem eum fugiat quo voluptas nulla pariatur</p>           
                                    </div>
                                    <div class="mb-4">
                                        
                                                  <div class="checkbox col-form-label">
                                                       <label>
                                                        <input  type="checkbox" id="agree"  class="Checkboxs Fields Checkbox checksex" name="check" checked>
                                                        <span class="cr"><i class="cr-icon fa fa-check"></i></span>
                                                         {component name="/sales/conditionsLink" tpl="link"} 
                                                    </label>
                                                </div>
                                                                                               
                                         	 
                                    </div>                                  
                                </div>
                                <div class="row admin-header-container btn-r mt-4 mb-2">  
                                    <div class="col-sm">
                                        <div class="pull-left">
                                            <a id=""  href="#" class="btn btn-primary btn-next-prev btnPrevious">{__('Previous')}</a>                
                                        </div>
                                    </div>
                                    <div class="col-sm">
                                        <div class="pull-right">
                                            <a id="sendRequest"  href="#" class="btn btn-primary btn-next-prev btn-order " style="width:200px">{__('Send your request')}</a>                
                                        </div>
                                    </div>   
                                </div>
                        </div>
                      </div>
                      
     </div>     
     <div class="tab-pane fade" id="event" role="tabpanel" aria-labelledby="Event" style="margin-right: 15px;margin-left:10px">
                      
                        <div class="pb-5">
                            <div class="container bg-white pb-2 col-lg-12">
                                <div class="row py-5 bg-white shadow-sm">
                                     <div class="col-lg-12">
                                            <div class="form-group row">
                                                <label for="title" class="col-sm-2 col-form-label">{__('Title')}{if $form->title->getOption('required')}*{/if}</label>
                                               <input class="form-control  d-inline-block width-element col-8 CartEvent Input"  type="text" placeholder="{__('title')}" name="title" data-toggle="tooltip" data-html="true"/>

                                          </div> 
                 
                                         <div class="form-group">
                                            <div class="input-append date form_datetime row" >
                                              <label for="datepicker" class="col-sm-2 col-form-label">{__('Dates')}{if $form->in_at->getOption('required')}*{/if} </label>
                                              <input  class="form-control d-inline-block width-element col-2 CartEvent Input Date" style=" z-index: 999 !important;" type="text" placeholder="{__('Start date')}" id="in_at" name="in_at" data-toggle="tooltip" data-html="true" title="" value="{*$cart->getEvent()->getFormatter()->getInAt()->getText()*}"/>                                                                                      
                                              <div class="col-form-label">
                                                <span >{__('To')}</span>
                                              </div>
                                              <input class="form-control  d-inline-block width-element col-2 CartEvent Input Date"style=" z-index: 999 !important;" type="text" placeholder="{__('End date')}" id="out_at" name="out_at" data-toggle="tooltip" data-html="true" title="" value="{*$cart->getEvent()->getFormatter()->getOutAt()->getText()*}"/>
                                               <label  class=" col-form-label" style="width:40px; margin-left: 10px">{__('Flexible')} </label>
                                              <div class="checkbox col-form-label">
                                                       <label > 
                                                        <input type="checkbox" class="CartEvent"  name="is_flexible" value="" checked>
                                                        <span class="cr"><i class="cr-icon fa fa-check"></i></span>                                                       
                                                    </label>
                                               </div>
                                           
                                               <label for="city" class="col-sm-1 col-form-label">{__('City')}{if $form->city_id->getOption('required')}*{/if}</label>
                                              <div class="input-group qty-input-griv>oup p-0 col-2">
                                                
                                              {html_options class="CartEvent Select form-control d-inline-block width-element" name="city_id" options=$form->city_id->getChoices()->toArray()}                    
                                            </div>
                                        
                                           </div>
                                          </div>                                      
                                           <hr class="separator-hr">  
                                           <div class="form-group row">
                                               
                                            <label for="budget" class="col-sm-2 col-form-label">{__('Budget')}{if $form->budget_min->getOption('required')}*{/if}</label>
                                            <input class="form-control  d-inline-block width-element col-4 CartEvent Input"  type="text" placeholder="{__('Min')}" name="budget_min" data-toggle="tooltip" data-html="true"/>
                                            &nbsp;
                                            <input class="form-control  d-inline-block width-element col-4 CartEvent Input"  type="text" placeholder="{__('Max')}" name="budget_max" data-toggle="tooltip" data-html="true"/>
                                          </div>
                                            
                                          <div class="form-group row">
                                            <label for="type" class="col-sm-2 col-form-label">{__('Type')}{if $form->type_id->getOption('required')}*{/if}</label>
                                            <div class="input-group qty-input-group p-0 col-4">
                                               
                                            {html_options class="CartEvent Select form-control  " name="type_id" options=$form->type_id->getChoices()->toArray()}                    
                                          </div>
                                              <label for="type" class="col-sm-1 col-form-label">{__('Location')}{if $form->location_id->getOption('required')}*{/if}</label>
                                            <div class="input-group qty-input-group p-0 col-4">
                                                  
                                            {html_options class="CartEvent Select form-control d-inline-block width-element" name="location_id" options=$form->location_id->getChoices()->toArray()}                    
                                          </div>
                                       
                                          
                                          </div> 
                                            
                                            <hr class="separator-hr">  
                                        
                                           <div class="form-group row">
                                              <label for="number_of_people" class="col-sm-2 col-form-label">{__('Number of people')}{if $form->number_of_people->getOption('required')}*{/if}</label>
                                              <input class="form-control  d-inline-block width-element col-4 CartEvent Input"  type="text" placeholder="{__('Number of people')}" name="number_of_people" data-toggle="tooltip" data-html="true"/>
                                           
                                              
                                              <label for="number_of_children"class="col-sm-2 col-form-label">{__('Number of children')}{if $form->number_of_children->getOption('required')}*{/if}</label>
                                              <input class="form-control  d-inline-block width-element col-3 CartEvent Input"  type="text" placeholder="{__('Number of children')}" name="number_of_children" data-toggle="tooltip" data-html="true"/>
                                            </div>
                                            
                                      
                                              
                                           
                                            <div class="form-group row">
                                            <label for="capacity_standing" class="col-sm-2 col-form-label">{__('Standing')}{if $form->capacity_standing_max->getOption('required')}*{/if}</label>
                                            <input class="form-control  d-inline-block width-element col-2 CartEvent Input"  type="text" placeholder="{__('Min')}" name="capacity_standing_min" data-toggle="tooltip" data-html="true"/>
                                            &nbsp;
                                            <input class="form-control  d-inline-block width-element col-2 CartEvent Input"  type="text" placeholder="{__('Max')}" name="capacity_standing_max" data-toggle="tooltip" data-html="true"/>
                                       
                                            
                                             <label for="capacity_seat" class="col-sm-1 col-form-label">{__('Seat')}{if $form->capacity_seat_min->getOption('required')}*{/if}</label>
                                            <input class="form-control  d-inline-block width-element col-2 CartEvent Input"  type="text" placeholder="{__('Min')}" name="capacity_seat_min" data-toggle="tooltip" data-html="true"/>
                                            &nbsp;
                                            <input class="form-control  d-inline-block width-element col-2 CartEvent Input"  type="text" placeholder="{__('Max')}" name="capacity_seat_max" data-toggle="tooltip" data-html="true"/>
                                         
                                            </div>                                                  

                                    </div>
                                            
                                </div>
                                 <div class="row admin-header-container btn-r mt-4 mb-2">  
                                      <div class="col-sm">
                                         <div class="pull-left">
                                            <a id=""  href="#" class="btn btn-primary btn-next-prev  btnPrevious">{__('Previous')}</a>                
                                         </div>
                                      </div>
                                      <div class="col-sm">
                                         <div class="pull-right">
                                            <a id="sendRequest"  href="#" class="btn btn-primary btn-next-prev btnNext">{__('Next')}</a>                
                                         </div>
                                      </div>
                                   </div>
                            </div>
                        </div>
                 
                </div>
</div>
</div>
{else}
   {__('NO CART') } !
{/if}
<style>
 
</style>
<script type="text/javascript">
    $(document).ready(function(){
       $(".Delete").click(function () {    
           if (!confirm('{__("Item \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false; 
           return $.ajax2({ data : { CartProduct : { id:$(this).attr('id'), token:'{mfForm::getToken('DeleteProductToCartForm')}' }  },
                            url :"{url_to('cart_ajax',['action'=>'DeleteCartProduct'])}",                            
                            success : function (resp)
                            {
                                    
                            }
                     });  
            
       });
   
       
       $(".DecCartProduct").click(function () {            
                  return $.ajax2({ data : { CartProduct:  $(this).attr('id') },
                                   url :"{url_to('cart_ajax',['action'=>'DecQuantityCartProductToMyCart'])}",                               
                                   success : function (resp)
                                    {
                                        if (resp.quantity == 1)
                                            $(".DecCartProduct[id="+resp.id+"]").hide();
                                        $(".CartProductQuantity[id="+resp.id+"]").html(resp.quantity);
                                        
                                    }
                     }); 
       });
                     
       $(".IncCartProduct").click(function () {                            
                  return $.ajax2({  data : { CartProduct:  $(this).attr('id') },
                                    url :"{url_to('cart_ajax',['action'=>'IncQuantityCartProductToMyCart'])}",                               
                                    success : function (resp)
                                    {
                                        $(".DecCartProduct[id="+resp.id+"]").show();
                                        $(".CartProductQuantity[id="+resp.id+"]").html(resp.quantity);
                                       
                                    }
                     });              
       });
       
          $(".DeleteCartProductItem").click(function () {    
           if (!confirm('{__("Item \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false;            
           return $.ajax2({ data : { CartProduct : { id:$(this).attr('id'), token:'{mfForm::getToken('DeleteProductToCartForm')}' }  },
                            url :"{url_to('cart_ajax',['action'=>'DeleteCartProductToMyCart'])}",                            
                            success : function (resp)
                            {
                                 
                                 $(".list[id="+resp.id+"]").remove();  
                         
                             }
                     });             
       });
  
       
         $('.btnNext').click(function(){
            $('.nav-tabs .active').parent().next('li').find('a').trigger('click');
            $("html, body").animate({ scrollTop: 0 }, "slow");
          });

         $('.btnPrevious').click(function(){
            $('.nav-tabs .active').parent().prev('li').find('a').trigger('click');
            $("html, body").animate({ scrollTop: 0 }, "slow");
          });
           if ($('#agree').is(':checked')) {
                      
                     $("#sendRequest").removeClass('disabled');
                } else {
                     ;
                     $("#sendRequest").addClass('disabled');
                     
                }
                
         
            $('#agree').click(function() {
                
                if ($(this).is(':checked')) {
                      
                     $("#sendRequest").removeClass('disabled');
                } else {
                     ;
                     $("#sendRequest").addClass('disabled');
                }
            });
        
         $(".Date").datepicker({  minDate: +2 });
       
            $(".View").click(function () { 
                                 
                                   var rowId =$(this).attr('id');
                                   return $.ajax2({ data : { CartProduct:  $(this).attr('id') },
                                   url :"{url_to('cart_ajax',['action'=>'ViewCartProductToMyCart'])}",                               
                                   success: function(resp)
                                   {
                                       $('#'+rowId).replaceWith(resp);
                                      // $('#'+rowId).find("td:eq(4) input").val(); 
                                           
   
                                   }
                                   
                     }); 
            });
            
            $(document).on('click','.SaveProductItem',function(event){
               //console.log($(".Date").datepicker().val()); 
                console.log($(".Date[name=in_at]").val());
                 console.log($(".Date[name=out_at]").val());
                                          
               $("input.Date").each(function() {  console.log($(".Date").datepicker().val()); }); 
               var  params= {            
                                 CartProduct: {   
                                   id: $(this).attr('id')
                                  
                                }  ,
                                
                                CartEvent: { }};   
                                    
                                
                $("input.CartProduct").each(function() { params.CartProduct[this.name]=$(this).val();  });    
                $("input.Date").each(function() { params.CartEvent[this.name] =$(".Date[name="+this.name+"]").datepicker().val(); }); 
                                return $.ajax2({ 
                                   data :params,
                                   url :"{url_to('cart_ajax',['action'=>'SaveCartProductToMyCart'])}",                               
                                   target: "#page-wrapper" 
              
                     }); 
            
            
            });
            
            $(document).on("focus", ".Date", function () {
            
              
                 $(".Date").datepicker({  minDate: +2 });
            });

                
    });   
           
   
</script>

