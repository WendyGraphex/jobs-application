
          <div class="row admin-header-container">
            <div class="col-sm">
              <h3 class="admin-header-big-text">{__('Payments')}</h3>
              <h3 class="admin-header-small-text">{__('Payment management')}</h3>
            </div>
            <div class="col-sm" style="padding: 0;">
                <div style="float: right;"> 
                   <a class="btn btn-success admin-header-button" id="Save" href="#"><i class="fa fa-save"></i> {__('Save')}</a>  
                </div> 
            </div>
          </div>
         
          <div class="breadcrumb-title">
            <p>               
                <i class="fa fa-home" style="color: #37bc9b;"></i>             
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Payments')}
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Employers')}
                <a href="#" id="Methods"><i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Methods')}</a>
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Add Methods')}
            </p>
          </div>       
{alerts}
<div class="table-responsive bg-white px-1 py-2">
    
   {foreach $form->methods->getChoices() as $method}  
       <div>
           <input type="checkbox" value="{$method->get('id')}" class="PaymentMethod" {if $form->getMethods()->in($method->get('id'))}checked=""{/if}/>{$method->getFormatter()->getI18n()->ucfirst()}
       </div>    
   {/foreach} 
    
</div>           

<script type="text/javascript">
           
        $("#Methods").click(function() {                   
            return $.ajax2({ url:"{url_to('payments_event_user_ajax',['action'=>'ListPartialCreditMethod'])}",                                    
                      target: "#actions"}); 
        }); 
     
         $("#Save").click(function() {                   
            var params = { AddPaymentCreditMethod : {  methods: [], token : '{$form->getCSRFToken()}' }  };
            $(".PaymentMethod:checked").each(function () { params.AddPaymentCreditMethod.methods.push($(this).val()); });
            return $.ajax2({   data :params,
                                url:"{url_to('payments_event_user_ajax',['action'=>'AddCreditMethod'])}",                                    
                                target: "#actions"}); 
        });
</script>

