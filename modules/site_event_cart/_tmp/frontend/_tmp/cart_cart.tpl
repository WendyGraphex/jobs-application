<!DOCTYPE html>
<html lang="{$_request->getLanguage()}">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>{component name="/site_company/Display" field='name' COMMENT=false} - {__('Your cart')}</title> 
    <link rel="short icon" type="image/png" href="/web/pictures/favicon-graphex.png"/>
    <link rel="icon" href="{url('/core-img/favicon.ico','picture')}">
    <link href="{url('/style.css','web','frontend')}" rel="stylesheet">
    <link href="{url('css/responsive/responsive.css','web','frontend')}" rel="stylesheet">
    <link rel="stylesheet" href="{url('/vendors/mdi/css/materialdesignicons.min.css','web')}">
     <script src="{url('js/jquery/jquery-2.2.4.min.js','web','frontend')}"></script>
     {header}
</head>

<body>
<!-- Preloader -->
<div id="actions" class="page-color">
    <div id="preloader">
        <div class="dorne-load"></div>
    </div>
   
    <!-- ***** Header Area Start ***** -->
         {include file="./includes/header.tpl"}
    <!-- ***** Header Area End ***** -->
    
    <div class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/hero-1.jpg);"></div>
    <div class="pt-4 container ">
        
            <div class="container bg-white mt-4 pb-4 pt-4 pl-2">    
                 <h4>{__('View Cart')}</h4>
            </div>
            <div class=""> 
              <ul class="nav nav-tabs  nav-tabs-Cart mt-4" id="myTab" role="tablist">
                <li class="nav-item text-center tab-link"  >
                  <a class="nav-link active"  id="your-cart-tab" data-toggle="tab" href="#your-cart" role="tab" aria-controls="your-cart" aria-selected="true">{__('Your Cart')}</a>
                </li>
                <li class="nav-item text-center tab-link"  >
                  <a class="nav-link " id="event-tab"   data-toggle="tab" href="#event" role="tab" aria-controls="event" aria-selected="false">{__('Event')}</a>
                </li>
                 
               {if !$user->isAuthenticated()} 
                 <li class="nav-item text-center tab-link"  >
                  <a class="nav-link " id="signin-tab"  data-toggle="tab" href="#signin" role="tab" aria-controls="signin" aria-selected="false">{__('Sign in')}</a>
                </li>
                {/if}
                <li class="nav-item text-center tab-link"  >
                  <a class="nav-link" id="quotation-tab"   data-toggle="tab" href="#quotation" role="tab" aria-controls="quotation" aria-selected="false">{__('Quotation')}</a>
                </li>
              </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="your-cart" role="tabpanel" aria-labelledby="Cart">
                         
                          <div class="pb-5">
                            <div class="container">
                              <div class="row">
                                <div class="col-lg-12 p-2 bg-white shadow-sm mb-5">

                                <!-- ***** listes Produits Start ***** -->

                                  <div class="table-responsive">
                                    <table class="table table-striped">
                                      <thead>
                                        <tr>
                                          <th scope="col" class="border-0 bg-light ">
                                            <div class="p-2 px-3 text-uppercase"></div>
                                          </th>
                                          <th scope="col" class="border-0 bg-light">
                                            <div class="p-2 px-3 text-uppercase"></div>
                                          </th>
                                          <th scope="col" class="border-0 bg-light">
                                            <div class="py-2 text-uppercase">{__('Ref/Desc.')}</div>
                                          </th>
                                          <th scope="col" class="border-0 bg-light text-center">
                                            <div class="py-2 text-uppercase">{__('In/Out')}</div>
                                          </th>
                                          <th scope="col" class="border-0 bg-light text-center">
                                            <div class="py-2 text-uppercase">{__('Qty')}</div>
                                          </th>
                                          <th scope="col" class="border-0 bg-light text-center">
                                              <div class="py-2 text-uppercase">{__('Tax')}</div>
                                          </th> 
                                          <th scope="col" class="border-0 bg-light text-center">
                                              <div class="py-2 text-uppercase">{__('Unit Price')}</div>
                                          </th> 
                                          <th scope="col" class="border-0 bg-light text-center">
                                              <div class="py-2 text-uppercase">{__('Total Price')}</div>
                                          </th>
                                          <th scope="col" class="border-0 bg-light text-center">
                                            <div class="py-2 text-uppercase">{__('Action')}</div>
                                          </th>
                                        </tr>
                                      </thead>
                                      <tbody>
                                        {foreach $pager as $item}  
                                            <tr class="list " id="{$item->get('id')}">
                                                <td class=" align-middle">
                                                    <div class="centent-center">
                                                     <span>{(($pager->getPage()-1)*$pager->getNbItemsByPage())+$item@iteration}</span>
                                                    </div>
                                                </td>
                                                <td scope="row" class=" align-middle">
                                                  <div class="centent-center-cart cart-img-cont">
                                                  {if  $item->getProduct()->hasPicture()}
                                                      <img class="product-img-cart" src="{$item->getProduct()->getPicture()->getThumb()->getUrl()}" alt=""/>
                                                  {else}
                                                     <img class="product-img-cart" src="/web/pictures/bg-img/PasImage.png" alt="" >
                                                   {/if}
                                                   </div>
                                                </td>
                                                <td class=" align-middle">
                                                   <div class="border-right centent-center-l">
                                                        <span>{$item->getProduct()->get('reference')}
                                                            {$item->getProduct()->getI18n()->get('title')}
                                                        </span>
                                                    </div>
                                                </td>
                                                <td class=" align-middle text-center">
                                                   {* <input class="form-control Date width-element Input ml-auto mr-auto mb-1 text-center"  type="text" placeholder="{__('Enter your start date')}" name="in_at" value="{$item->getFormatter()->getInAt()->getText()}">                          
                                                    <input class="form-control Date width-element Input ml-auto mr-auto text-center"  type="text" placeholder="{__('Enter your end date')}" name="out_at" value="{$item->getFormatter()->getOutAt()->getText()}">
                                                     *}
                                                     <span class="">{$item->getFormatter()->getInAt()->getText()}</span></br>
                                                      <span class="">{$item->getFormatter()->getOutAt()->getText()}</span>
                                                </td>
                                                <td class=" align-middle text-center">
                                                  <span class="qtte-minus d-inline-block"><a href="#" class="DecCartProduct" id="{$item->get('id')}" {if $item->getQuantity()==1}style="display:none"{/if}>
                                                      <span class="mdi mdi-minus cursor icon-size"></span>
                                                      </a>
                                                  </span>
                                                  <input type="text"  name="qty" class="Input form-control d-inline-block qtt-input text-center CartProductQuantity" id="{$item->get('id')}" value="{$item->getFormatter()->getQuantity()}" />
                                                  <span class="qtte-minus d-inline-block"><a href="#" class="IncCartProduct" id="{$item->get('id')}">
                                                      <span class="mdi mdi-plus cursor icon-size"></span>
                                                  </a></span>
                                                </td>
                                                <td class=" align-middle text-center">
                                                     {$item->getTax()->getRate()->getPourcentage()}
                                                </td>      
                                                 <td class="align-middle text-center">
                                                     {$item->getFormatter()->getSalePriceWithTax()}
                                                </td> 
                                                <td class="align-middle text-center">
                                                    {$item->getFormatter()->getTotalSalePriceWithTax()}
                                                </td>  
                                                <td class="align-middle text-center">
                                                  <a href="#" class="CartProductItem" name="{$item->getProduct()->get('reference')} {$item->getProduct()->getI18n()->get('title')}" id="{$item->get('id')}"><i class="fa fa-trash-o cart-trash"></i></a>
                                                 <a href="#" class="CartProductItem" name="{$item->getProduct()->get('reference')} {$item->getProduct()->getI18n()->get('title')}" id="{$item->get('id')}"><i class="fa fa-pencil"></i></a>
                                               
                                                
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
                                   
                                <!--listes Produits End -->
                                
                                {*include file="./_pagers/default/_default_pager_products_bottom.tpl" pager=$pager*}
                                 
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
                               
                </div>
                <div class="tab-pane fade" id="event" role="tabpanel" aria-labelledby="Event">
                      
                        <div class="pb-5">
                            <div class="container bg-white pb-2">
                                <div class="row py-5 bg-white shadow-sm">
                                    <div class="col-lg-12">
                                         <div class="form-group row">
                                                <label for="title" class="col-sm-2 col-form-label">{__('Title')}</label>
                                               <input class="form-control  d-inline-block width-element col-9 CartEvent Input"  type="text" placeholder="{__('title')}" name="number_of_children" data-toggle="tooltip" data-html="true"/>

                                          </div> 
                                            <div class="form-group">
                                            <div class="input-append date form_datetime row" >
                                              <label for="datepicker" class="col-sm-2 col-form-label">{__('Dates')}{if $form->in_at->getOption('required')}*{/if}</label>
                                              <input class="form-control d-inline-block width-element col-2 CartEvent Input Date" style=" z-index: 999 !important;" type="text" placeholder="{__('Start date')}" id="in_at" name="in_at" data-toggle="tooltip" data-html="true" title="" value="{*$cart->getEvent()->getFormatter()->getInAt()->getText()*}"/>                                        
                                              <div class="col-form-label text-center " style="width:40px;">
                                                   <span > {__('To')}</span>
                                              </div>
                                              <input class="form-control  d-inline-block width-element col-2 CartEvent Input Date"style=" z-index: 999 !important;" type="text" placeholder="{__('End date')}" id="out_at" name="out_at" data-toggle="tooltip" data-html="true" title="" value="{*$cart->getEvent()->getFormatter()->getOutAt()->getText()*}"/>
                                               <label class="  col-form-label text-center" style="margin-left:15px;margin-right:10px"> {__('Flexible')}</label>
                                               <div class="checkbox   col-form-label" >
                                                      <label>
                                                       <input type="checkbox" class="CartEvent"  name="is_flexible" value="" checked>
                                                       <span class="cr"><i class="cr-icon fa fa-check"></i></span>                                                       
                                                   </label>
                                              </div>
                                               <label for="city" class="col-sm-1 col-form-label">{__('City')}</label>
                                              <div class="input-group qty-input-griv oup p-0 col-2">
                                      
                                              {html_options class="CartEvent Select form-control d-inline-block width-element" name="city_id" options=$form->city_id->getChoices()->toArray()}                    
                                            </div>
                                           </div>
                                          </div>

                                          
                                           <hr class="separator-hr">  
                                           <div class="form-group row">
                                               
                                            <label for="budget" class="col-sm-2 col-form-label">{__('Budget')}</label>
                                            <input class="form-control  d-inline-block width-element col-4 CartEvent Input"  type="text" placeholder="{__('Min')}" name="budget_min" data-toggle="tooltip" data-html="true"/>
                                            <span class="col-1"></span>
                                            <input class="form-control  d-inline-block width-element col-4 CartEvent Input"  type="text" placeholder="{__('Max')}" name="budget_max" data-toggle="tooltip" data-html="true"/>
                                          </div>
                                            
                                          <div class="form-group row">
                                            <label for="type" class="col-sm-2 col-form-label">{__('Type')}</label>
                                            <div class="input-group qty-input-group p-0 col-4">
                                               
                                            {html_options class="CartEvent Select form-control  " name="type_id" options=$form->type_id->getChoices()->toArray()}                    
                                          </div>
                                              <label for="type" class="col-sm-1 col-form-label">{__('Location')}</label>
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
                                            <label for="capacity_standing" class="col-sm-2 col-form-label">{__('Standing')}{if $form->capacity_standing_min->getOption('required')}*{/if}</label>
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
                                            <a id=""  href="#" class="btn btn-primary btn-next-prev btnNext">{__('Next')}</a>                
                                         </div>
                                      </div>
                                   </div>
                            </div>
                        </div>
                 
   </div>
   {if !$user->isAuthenticated()} 
     <div class="tab-pane fade" id="signin" role="tabpanel" aria-labelledby="Signin">
      <div class="pb-5 ">
        <div class="container bg-white pb-2">
        <div class="d-flex justify-content-center ">
         <div class="col-md-7 ">
            
            <div id="actions ">
                <br>
                  <div class="form-group mt-4">
                  <div class="error" name="type"></div>
                  <div class="inner-addon center-block text-center customer-type" row >
                     {*  {foreach $SigninForm->type->getChoices() as $type=>$value}
                            <input type="radio" class="Signup Checkboxs Fields Checkbox checksex Radio" id="{$value}" name="type" value="{$type}" {if $SigninForm.type->getValue()==$type}checked=""{/if}> 
                          <div class="col-md-3">
                          <div class="checkbox ">
                                                       <label >
                                                        <input type="checkbox"   value="" checked>
                                                        <span class="cr"><i class="cr-icon fa fa-check"></i></span>
                                                          {$value}
                                                    </label>
                                                </div>
                           
                            
                       {/foreach} *}
                       
                   </div>
                        
                </div>
                 <div class="form-group row">
                     <div class="col-md-3">   
                         
                       {html_options name="gender" class="Signup Fields Select form-control form-control error" options=$SigninForm->gender->getOption("choices")}                
                      </div>
                    <div class=" col-md-9">     
                       <input type="text" data-name="firstname" name="firstname" class="Signup Fields Input form-control form-control  error" placeholder="{__('First name')}">
                    </div>
                  </div>  
                <div class="form-group error" name="lastname">    
                  <input type="text" name="lastname" class="Signup Fields Input form-control form-control " placeholder="{__('Last name')}">
                </div>
                <div class="form-group position-relative">
                    <div class="input-group error" name="email">
                     
                    <input type="email" name="email" class="Signup Fields Input form-control form-control"  placeholder="{__('Email')}">
                    <span id="validateEmailValid" class="validateEmail" style="color:#09ad7e;display:none;"><i class="fa fa-check"></i></span>
                    <span id="validateEmailNotValid" class="validateEmail" style="color:#ff0000;display:none;"><i class="fa fa-remove"></i></span>
                  </div>
                </div>                
                <div class="form-group">
                   <div class="input-group error" name="password">
                         
                     <input type="password" name="password" class="Signup Fields Input form-control form-control" id="inputPassword" placeholder="{__('Password')}">
                     
                   </div>
                </div>     
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
                      <a id=""  href="#" class="btn btn-primary btn-next-prev btnNext">{__('Next')}</a>                
                   </div>
                </div>
      </div>
   </div>
   </div>                       
   </div>
  {/if}
                <div class="tab-pane fade" id="quotation" role="tabpanel" aria-labelledby="Order">
                     
                      <div class="pb-5">
                        <div class="container bg-white pb-2">
                         
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
                                             <div class="mb-4">
                                                  <div class="checkbox ">
                                                       <label>
                                                        <input  type="checkbox" id="agree"  class="Checkboxs Fields Checkbox checksex" name="check" >
                                                        <span class="cr"><i class="cr-icon fa fa-check"></i></span>
                                                           {component name="/sales/conditionsLink" tpl="link"}     
                                                    </label>
                                                </div>
                                         	 
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
                                            <a    href="#" id="sendRequest" class="btn  btn-next-prev btn-order text-light" style="width:160px"    >{__('Send your request')}</a>                
                                        </div>
                                    </div>   
                                </div>
                        </div>
                      </div>
                      
                </div>  
                                
            </div>
                                
          </div>    
        
    </div>
</div>
                                        
      {include file="./includes/footer.tpl"}
      
   <script type="text/javascript">
    $(document).ready(function() {  
     
        $(".Date").datepicker({  minDate: +2 });
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
                                   url :"{url_to('cart_ajax',['action'=>'DecQuantityCartProduct'])}",                               
                                   success : function (resp)
                                    {
                                        if (resp.quantity == 1)
                                            $(".DecCartProduct[id="+resp.id+"]").hide();
                                            $(".CartProductQuantity[id="+resp.id+"]").val(resp.quantity);
                                        
                                    }
                     }); 
       });
                     
       $(".IncCartProduct").click(function () {                            
                  return $.ajax2({  data : { CartProduct:  $(this).attr('id') },
                                    url :"{url_to('cart_ajax',['action'=>'IncQuantityCartProduct'])}",                               
                                    success : function (resp)
                                    {
                                        $(".DecCartProduct[id="+resp.id+"]").show();
                                        $(".CartProductQuantity[id="+resp.id+"]").val(resp.quantity);
                                       
                                    }
                     });              
       });
   
   
 
       
         $('.btnNext').click(function(){    
            var budget_max = parseInt($(".Input[name=budget_max]").val());
            var budget_min = parseInt($(".Input[name=budget_min]").val());
            var seat_max = parseInt($(".Input[name=capacity_seat_max]").val());
            var seat_min = parseInt($(".Input[name=capacity_seat_min]").val());
            var standing_max = parseInt($(".Input[name=capacity_standing_max]").val());
            var standing_min = parseInt($(".Input[name=capacity_standing_min]").val());
         if(budget_max < budget_min)
          { 
              console.log($(".Input[name=budget_max]").val());
              $(".Input[name=budget_min]").attr('title','{__("Champ invalid , this should be inferior to the max ")}');
              $(".Input[name=budget_min]").tooltip('show');
              $(".Input[name=budget_max]").attr('title','{__("Champ invalid , this should  be superior to the min ")}');
              $(".Input[name=budget_max]").tooltip('show');
          }else if(seat_max < seat_min)
          {
              
              $(".Input[name=capacity_seat_min]").attr('title','{__("Champ invalid , this should be inferior to the max ")}');
              $(".Input[name=capacity_seat_min]").tooltip('show');
              $(".Input[name=capacity_seat_max]").attr('title','{__("Champ invalid , this should  be superior to the min ")}');
              $(".Input[name=capacity_seat_max]").tooltip('show');
              
          }
          else if(standing_max < standing_min)
          {
              
              $(".Input[name=capacity_standing_min]").attr('title','{__("Champ invalid , this should be inferior to the max ")}');
              $(".Input[name=capacity_standing_min]").tooltip('show');
              $(".Input[name=capacity_standing_max]").attr('title','{__("Champ invalid , this should  be superior to the min ")}');
              $(".Input[name=capacity_standing_max]").tooltip('show');
              
          }
          else{
            $('.nav-tabs .active').parent().next('li').find('a').trigger('click');
            $("html, body").animate({ scrollTop: 0 }, "slow");
        }  
        });

         $('.btnPrevious').click(function(){
            $('.nav-tabs .active').parent().prev('li').find('a').trigger('click');
            $("html, body").animate({ scrollTop: 0 }, "slow");
          });
          
          
    $(".CartProductItem").click(function () {    
           if (!confirm('{__("Item \"#0#\" will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false;  
           cartId=$(this).attr('id');
           return $.ajax2({ data : { CartProduct : { id:$(this).attr('id'), token:'{mfForm::getToken('DeleteProductToCartForm')}' }  },
                            url :"{url_to('cart_ajax',['action'=>'DeleteCartProductToCart'])}",                            
                            success : function (resp)
                            {
                                  console.log(cartId);
                                 $(".list[id="+cartId+"]").remove();  
                                 cnt="{$cart->getCartProducts()->count()-1}";
                                 $("#SmartCartBtn").trigger('deletefromcart',[cnt]);
                             }
                     });             
       });
    
     
        if ($('#agree').is(':checked')) {
                      
                       jQuery('#sendRequest').css('opacity', '1.0');
                     $("#sendRequest").removeClass('disabled');
                } else {
                     
                     $("#sendRequest").addClass('disabled');
                      jQuery('#sendRequest').css('opacity', '0.2');
                }
                
         
            $('#agree').click(function() {
                
                if ($(this).is(':checked')) {
                       jQuery('#sendRequest').css('opacity', '1.0');
                     $("#sendRequest").removeClass('disabled');
                } else {
                     jQuery('#sendRequest').css('opacity', '0.2');
                     $("#sendRequest").addClass('disabled');
                }
            });

 $(function(){
 
    $("#Signup").click(function () { 
                if ($(this).hasClass('isBusy')) return ;
                $(this).addClass('isBusy');
                var loadingText = "{__('SIGNING UP')}&nbsp;<i class='fa fa-spinner fa-spin'></i>";
                if ($(this).html() !== loadingText) {
                    $(this).data('original-text', $(this).html());
                    $(this).html(loadingText);
                 }
                var params = { Signup: { token : '{mfForm::getToken('CustomerSigninForm')}' } };
                $(".Signup.Input").each(function () { params.Signup[$(this).attr('name')]=$(this).val(); });
                $(".Signup.Radio:checked").each(function () { params.Signup[$(this).attr('name')]=$(this).val(); });
                $(".Signup.Select option:selected").each(function () { params.Signup[$(this).parent().attr('name')]=$(this).val(); });
                return $.ajax2({  data : params,                               
                                  url:"{url_to('customers_ajax',['action'=>'Signin'])}", 
                                  success : function (resp)
                                        {     
                                            $("#Signup").removeClass('isBusy');
                                            $("#Signup").html($("#Signup").data('original-text'));
                                            if (resp.errors && resp.action =='Signin')
                                            {
                                                $.each(resp.errors,function (name,error) {
                                                      $(".error[name="+name+"]").addClass('border-error');
                                                  });
                                            }else{
                                                $("#actions").html(resp);
                                            }    
                                        }
                });
            });
            
            $(".error").click(function () { 
                    $(".error").removeClass('border-error');
             });
             
             $(".Fields.Input[name=email]").keyup(function () { 
                      $(".validateEmail").hide();                    
                      var r = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{ldelim}1,3{rdelim}\.[0-9]{ldelim}1,3{rdelim}\.[0-9]{ldelim}1,3{rdelim}\.[0-9]{ldelim}1,3{rdelim}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{ldelim}2,{rdelim}))$/;
                      if (!r.test($(this).val()))
                         return ;
                      return  $.ajax2({ data : { EmailChecker: { email: $(this).val(), token : '{mfForm::getToken('CustomerCheckEmailForm')}' } },                              
                                url:"{url_to('customers_ajax',['action'=>'CheckEmail'])}",  
                                success : function (resp)
                                    {                                             
                                        if (resp.action!='CheckEmail') return ;
                                        if (resp.status=='OK'){ 
                                          $("#validateEmailValid").show();
                                        } else {
                                          $("#validateEmailValid").hide();
                                          $("#validateEmailNotValid").show();  
                                        }
                                    }
                        });
                });
                
             $("#SeePassword").click(function () { $("#inputPassword").attr('type',($("#inputPassword").attr('type')=='text'?'password':'text')); 
                                                         $("#eye").toggleClass("fa-eye-slash").toggleClass("fa-eye");
                                                         if($("#inputPassword").attr('type')=='text')
                                                         {
                                                            setTimeout(function() { 
                                                            $("#inputPassword").attr('type',($("#inputPassword").attr('type')=='text'?'password':'text'));
                                                            $("#eye").toggleClass("fa-eye-slash").toggleClass("fa-eye");
                                                            }, 10000); 
                                                         }
                                                 }); 
    });  
        
        if($(".tab-link" ).size()>3){ $(".tab-link").css('width','296px');}
        
       
});
</script>   
</body>

</html>



