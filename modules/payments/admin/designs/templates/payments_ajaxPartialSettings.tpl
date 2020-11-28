<div class="row admin-header-container">
  <div class="col-sm">
    <h3 class="admin-header-big-text">{__('Payments')}</h3>
    <h3 class="admin-header-small-text">{__('Settings')}</h3>
  </div>
  <div class="col-sm" style="padding: 0;">
       <div style="float: right;"> 
                <a href="#" id="Save" class="btn btn-success admin-header-button"><i class="fa fa-save"/>{__('Save')}</a>               
        </div> 
  </div>
</div>
<div class="breadcrumb-title">
  <p>      
          <i class="fa fa-home" style="color: #37bc9b;"></i>    
      <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Payments')}
      <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Settings')}
  </p>
</div>
      {*$form->getSettings()*}
{alerts}
         <div class="table-responsive bg-white px-1 py-2">
 <ul class="nav nav-tabs" id="myTab" role="tablist">
            {foreach $form->getPayments() as $payment}
            <li class="nav-item">            
              <a class="nav-link {if $payment@first}active{/if}"  id="method-{$payment->get('name')}-tab" data-toggle="tab" href="#{$payment->get('name')}" role="tab" aria-controls="{$payment->get('name')}" aria-selected="true">
                  {*$payment->getFormatter()->getI18n()->ucfirst()*}
                  {*if $form.adverts[$language@index]->hasError()}<span style="color:red">?</span>{/if*}
                  {component name=$payment->getComponents()->getTab()}
              </a>
            </li>        
            {/foreach}               
            </ul>
            {*<div class="" style="overflow: hidden;margin-right: 0px;margin-left: 0px;">*}
                <div class="tab-content" style="padding-left: 30px;overflow: hidden;width: 100%;">
                    {foreach $form->getPayments() as $index=>$payment}                     
                      <div class="tab-pane fade show {if $payment@first}active{/if} Payments" id="{$payment->get('name')}" role="tabpanel" aria-labelledby="method-{$payment->get('name')}-tab">                        
                            <div class="row" style="padding-top: 20px;">
                                <div class="col-md-6">                                                        
                                    <div class="form-group">                          
                                        <label>{__("Min Amount")}</label>
                                        <div>{if $form->hasErrors()}{$form['methods'][$index].amount_minimum->getError()}{/if}</div>
                                        <input type="text" data-method="{$payment->get('name')}" class="PaymentSettings Input form-control" name="amount_minimum" value="{if $form->hasErrors()}{$form['methods'][$index].amount_minimum}{else}{$form->getSettings()->getItemByKey($index)->getFormatter()->getMinimumAmount()->getText("#.00")}{/if}">
                                        </div>                                                                                               
                                    <div class="form-group">                          
                                        <label>{__("Max Amount")}</label>
                                        <div>{if $form->hasErrors()}{$form['methods'][$index].amount_maximum->getError()}{/if}</div>
                                        <input type="text" data-method="{$payment->get('name')}" class="PaymentSettings Input form-control" name="amount_maximum" value="{if $form->hasErrors()}{$form['methods'][$index].amount_maximum}{else}{$form->getSettings()->getItemByKey($index)->getFormatter()->getMaximumAmount()->getText("#.00")}{/if}">
                                    </div>                                                   
                                    <div class="form-group">                          
                                        <label>{__("Adder")}</label>
                                        <div>{if $form->hasErrors()}{$form['methods'][$index].adder->getError()}{/if}</div>
                                        <input type="text" data-method="{$payment->get('name')}" class="PaymentSettings Input form-control" name="adder" value="{if $form->hasErrors()}{$form['methods'][$index].adder}{else}{$form->getSettings()->getItemByKey($index)->getFormatter()->getAdder()->getText("#.00")}{/if}">
                                    </div>                                                   
                                    <div class="form-group">                          
                                        <label>{__("Adder rate")}</label>
                                        <div>{if $form->hasErrors()}{$form['methods'][$index].adder_rate->getError()}{/if}</div>
                                        <input type="text" data-method="{$payment->get('name')}" class="PaymentSettings Input form-control" name="adder_rate" value="{if $form->hasErrors()}{$form['methods'][$index].adder_rate}{else}{$form->getSettings()->getItemByKey($index)->getFormatter()->getAdderRate()->getPourcentage()}{/if}">                  
                                    </div>                                    
                                    <div class="form-group">                          
                                        <label>{__("Tax rate")}</label>
                                        <div>{if $form->hasErrors()}{$form['methods'][$index].tax_rate->getError()}{/if}</div>
                                        <input type="text" data-method="{$payment->get('name')}" class="PaymentSettings Input form-control" name="tax_rate" value="{if $form->hasErrors()}{$form['methods'][$index].tax_rate}{else}{$form->getSettings()->getItemByKey($index)->getFormatter()->getTaxRate()->getPourcentage()}{/if}">
                                    </div>                        
                                </div>
                               {component name=$payment->getComponents()->getSettings() method=$payment}       
                              {*  <div class="col-md-6">
                                    <div class="form-group">                          
                                        <label>{__("Prod")}</label>
                                        <div>{if $form->hasErrors()}{$form['methods'][$index].amount_minimum->getError()}{/if}</div>
                                        <select class="form-control">
                                            <option>Prod 1</option>
                                            <option>Prod 1</option>
                                            <option>Prod 1</option>
                                            <option>Prod 1</option>
                                        </select>
                                    </div>
                                    <div class="form-group Payment-ctn">                          
                                        <label>{__("Prod")}</label>
                                        <div>{if $form->hasErrors()}{$form['methods'][$index].amount_minimum->getError()}{/if}</div>
                                        <div class="PaymentsDiv">
                                            <label><input type="text" class="form-control"/></label>
                                            <label><a href="javascript:void(0);" class="PaymentAddLabel" data-index="{$index}"><i class="fa fa-plus"></i></a></label>  
                                        </div>
                                    </div>
                                </div>  *}
                            </div>
                       {*component name=$payment->getComponents()->getSettings() method=$payment*}              
                    </div>
                {/foreach}
             </div>
        {*</div>*}
</div>
<script function="text/javascript">    
      $('#Save').click(function(){                             
            var  params= {       Settings: { 
                                   methods : [ ],
                                   token :'{$form->getCSRFToken()}'
                                } };
          $(".Payments").each(function() { 
               var settings = { };
               $(".PaymentSettings.Input[data-method="+$(this).attr('id')+"]").each(function () { 
                   settings[$(this).attr('name')]=$(this).val();
               });
               params.Settings.methods.push(settings);
          }); 
           $(".Settings.Multiple").each(function () { 
              if (!params.Settings[$(this).attr('name')]) params.Settings[$(this).attr('name')]= [ ]; 
              var item = { };
              $(".Multiple."+$(this).attr('id')).each(function () { item[$(this).attr('name')]=$(this).val(); });
              params.Settings[$(this).attr('name')].push(item);
          }); 
      //   console.log(params);  // return ;      
          return $.ajax2({ data : params,                          
                           url: "{url_to('payments_ajax',['action'=>'PartialSettings'])}",
                           target: "#actions"}); 
        });      
                      
</script>
             