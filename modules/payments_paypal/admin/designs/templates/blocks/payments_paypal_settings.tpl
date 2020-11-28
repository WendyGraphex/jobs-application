<div class="col-md-6" style="padding-right: 30px;">    
    <div class="form-group">                          
        <label>{__("Mode")}</label>  
        {if $form->paypal_settings_mode->getChoices()->count() > 1}
            {html_options class="form-control" options=$form->paypal_settings_mode->getChoices()->toArray() selected=$form.paypal_settings_mode}           
        {/if}       

        <label><a href="javascript:void(0);" class="PaymentAddLabel" id="PaypalSettings-Add"><i class="fa fa-plus"></i></a></label>  
    </div>
    {foreach $form->paypal_settings->getSchema() as $index=>$field}
        <div class="Settings Multiple" id="Paypal" name="paypal_settings">
            <div class="form-group">                          
                <label>{__("Name")}</label>      
                <div>
                    <input type="text" class="form-control Paypal Multiple" name="mode" value="{$form.paypal_settings[$index].mode}"/>                       
                    {if $form->paypal_settings_mode->getChoices()->count() > 1}
                        <input type="radio" class="form-control"  value=""/>
                    {/if}  
                </div>
            </div>
            <div class="form-group" >              
                <label>{__("Client ID")}</label>
                <div>{*if $form->hasErrors()}{$form['methods'][$index].amount_minimum->getError()}{/if*}</div>
                <div>
                    <input type="text" class="form-control Paypal Multiple" name="client" value="{$form.paypal_settings[$index].client}"/>      
                </div>           
            </div>
            <div class="form-group">                          
                <label>{__("Client secret")}</label>
                <div>{*if $form->hasErrors()}{$form['methods'][$index].amount_minimum->getError()}{/if*}</div>
                <div>
                    <input type="text" class="form-control Paypal Multiple" name="secret" value="{$form.paypal_settings[$index].secret}"/>          
                </div>
            </div>
            <div class="form-group">                          
                <label>{__("Payer")}</label>
                <div>{*if $form->hasErrors()}{$form['methods'][$index].amount_minimum->getError()}{/if*}</div>
                <div>
                    <input type="text" class="form-control Paypal Multiple" name="payer" value="{$form.paypal_settings[$index].payer}"/>       
                </div>
            </div>
        </div>
    {/foreach}
</div>

<script type="text/javascript">
    
    
     $("#PaypalSettings-Add").click(function () { 
     
     });
    
</script>        