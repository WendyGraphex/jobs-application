<div class="modal" id="CreateEventModal" tabindex="-1" role="dialog" style="">
        <div class="modal-dialog mod_dialog modal-lg" role="document">
          <div class="modal-content div_model">
           <div class="modal-header ">
              <h5 class="modal-title">{__('Your event information')}</h5>
              <button id="close-CreateEvent-dialog" class="close my-btn-dialog">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body text-left">
               <div class="form-group row">
                     <label for="title" class="col-sm-2 col-form-label">{__('Title')}{if $form->title->getOption('required')}*{/if} </label>
                    <input class="form-control  d-inline-block width-element col-8 CartEvent Input"  type="text" placeholder="{__('title')}" name="title" data-toggle="tooltip" data-html="true"/>
             
               </div> 
                 
                <div class="form-group">
                  <div class="input-append date form_datetime row" >
                    <label for="datepicker" class="col-sm-2 col-form-label">{__('Dates')}{if $form->in_at->getOption('required')}*{/if} </label>
                    <input class="form-control d-inline-block width-element col-3 CartEvent Input Date" type="text" placeholder="{__('Start date')}" id="in_at" name="in_at" data-toggle="tooltip" data-html="true" title="" value="{$cart->getEvent()->getFormatter()->getInAt()->getText()}"/>                                        
                      <div class=" col-form-label">
                         <span > {__('To')}</span>
                      </div>
                    <input class="form-control  d-inline-block width-element col-3 CartEvent Input Date"  type="text" placeholder="{__('End date')}" id="out_at" name="out_at" data-toggle="tooltip" data-html="true" title="" value="{$cart->getEvent()->getFormatter()->getOutAt()->getText()}"/>
                    {* <input class="form-control  d-inline-block width-element col-1 CartEvent Checkbox styled styled-primary" name="is_flexible" type="checkbox"/>{__('Flexible')} *}
                      &nbsp; 
                    {*    
                         <label class="custom-control custom-checkbox">
                                 <input type="checkbox" class="custom-control-input CartEvent">
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description  text-muted font-weight-bold">{__('Flexible')} </span>
                               
                         </label>        *}
                         <label class="  col-form-label text-center" style="margin-right: 10px"> {__('Flexible')}</label>
                              <div class="checkbox">
                                    <label class="  col-form-label">
                                     <input type="checkbox" class="CartEvent"  name="is_flexible" value="" checked>
                                     <span class="cr"><i class="cr-icon fa fa-check"></i></span>                                                       
                                 </label>
                            </div>
                 </div>
                </div>
               
                <div class="form-group row">
                    <label for="city" class="col-sm-2 col-form-label">{__('City')}</label>
                    <div class="input-group qty-input-group p-0 col-8">
                    {html_options class="CartEvent Select form-control d-inline-block width-element" name="city_id" options=$form->city_id->getChoices()->toArray()}                    
                  </div>
                </div> 
                   
              
                   <hr class="separator-hr">  
                    <div class="form-group row">
                   <label for="budget" class="col-sm-2 col-form-label">{__('Budget')}</label>
                    <input class="form-control  d-inline-block width-element col-3 CartEvent Input"  type="text" placeholder="{__('Min')}" name="budget_min" data-toggle="tooltip" data-html="true"/>
                    &nbsp;
                    <input class="form-control  d-inline-block width-element col-3 CartEvent Input"  type="text" placeholder="{__('Max')}" name="budget_max" data-toggle="tooltip" data-html="true"/>
                
                    </div>
              
                  <div class="form-group row">
                    <label for="type" class="col-sm-2 col-form-label">{__('Type')}</label>
                    <div class="input-group qty-input-group p-0 col-8">
                    {html_options class="CartEvent Select form-control d-inline-block width-element" name="type_id" options=$form->type_id->getChoices()->toArray()}                    
                  </div>
                </div> 
                   <div class="form-group row">
                    <label for="type"class="col-sm-2 col-form-label">{__('Location')}</label>
                    <div class="input-group qty-input-group p-0 col-8">
                    {html_options class="CartEvent Select form-control d-inline-block width-element" name="location_id" options=$form->location_id->getChoices()->toArray()}                    
                  </div>
                   </div>
                   <div class="form-group row">
                    <label for="number_of_people" class="col-sm-2 col-form-label">{__('People')}{if $form->number_of_people->getOption('required')}*{/if}</label>
                    <input class="form-control  d-inline-block width-element col-3 CartEvent Input"  type="text" placeholder="{__('Number of people')}" name="number_of_people" data-toggle="tooltip" data-html="true"/>
                  
                    <label for="number_of_children" class="col-sm-2 col-form-label">{__('Children')}{if $form->number_of_children->getOption('required')}*{/if}</label>
                    <input class="form-control  d-inline-block width-element col-3 CartEvent Input"  type="text" placeholder="{__('Number of children')}" name="number_of_children" data-toggle="tooltip" data-html="true"/>
                  </div>
                  
                </div> 
            
            <div class="modal-footer">                  
                <button type="button" id="CreateEventBtn" class="btn btn-primary">{__('Create')}</button>               
            </div>
          </div>
        </div>
</div>       
 
<script type="text/javascript">
   
   $(document).ready(function() {                 
       
       $("#close-CreateEvent-dialog").click(function(){ 
           $("#CreateEventModal").hide();         
           $('[data-toggle="tooltip"]').tooltip("hide");
     });
       $(".Date").datepicker({  minDate: +2 });
       var dates = $( ".CartEvent#in_at, .CartEvent#out_at" ).datepicker({
                        minDate : new Date("{$cart->getEvent()->getFormatter()->getInAt()->getDate()}"),
			onSelect: function( selectedDate ) {
				var option = this.id == "in_at" ? "minDate" : "maxDate",
					instance = $( this ).data( "datepicker" ),
					date = $.datepicker.parseDate(
						instance.settings.dateFormat ||
						$.datepicker._defaults.dateFormat,
						selectedDate, instance.settings );
				dates.not( this ).datepicker( "option", option, date );
    } } );

    $("#CreateEventBtn").click(function () {           
           var params = { CartEventCreateToCart : { token :'{mfForm::getToken('CartEventCreateForm')}' } };
           $(".CartEvent.Input").each(function () { params.CartEventCreateToCart[$(this).attr('name')]=$(this).val(); });
           $(".CartEvent.Select option:selected").each(function () { params.CartEventCreateToCart[$(this).parent().attr('name')]=$(this).val(); });
           $(".CartEvent.Checkbox:checked").each(function () { params.CartEventCreateToCart[$(this).attr('name')]=true; });
           return $.ajax2({ data : params,
                            url :"{url_to('cart_ajax',['action'=>'CreateEventToCart'])}",                            
                            success : function (resp)
                                   {                                      
                                      if (resp.errors)
                                      {    
                                        $.each(resp.errors , function(key, val){
                                                  $(".Input[name="+key+"]").attr('title',val);
                                                  $(".Input[name="+key+"]").tooltip('show');
                                             });
                                        return ;
                                      }
                                      if (resp.event)
                                      {
                                           $(".Date.CartProduct[name=in_at]").val(resp.in_at);
                                           $(".Date.CartProduct[name=out_at]").val(resp.out_at);
                                           $(".Date.CartProduct").datepicker({  min: resp.b_in_at, max: resp.b_out_at });
                                           $("#CreateEventModal").hide();
                                           $("#AddToCartProductModal").show();    
                                           $("#AddToCartBtn").addClass('EventOk');
                                      }    
                                          
                                   }
                     });   
       });
       
   });   
</script>  
    
