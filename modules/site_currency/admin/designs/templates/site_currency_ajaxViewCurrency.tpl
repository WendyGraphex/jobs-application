<div class="row admin-header-container">
    <div class="col-sm">
       <h3 class="admin-header-big-text">{__('Currencies')}</h3>
       <h3 class="admin-header-small-text">{__("Edit Currency")}</h3>
    </div>
  
  <div class="col-sm" style="padding: 0;">
       <div style="float: right;">
             <a href="#" id="Save" class="btn btn-success admin-header-button"><i class="fa fa-save"></i>{__('Save')}</a>
             <a href="#" id="Cancel" class="btn btn-danger admin-header-button"><i class="fa fa-times"></i>{__('Cancel')}</a>           
       </div>   
  </div>
</div>
<div class="breadcrumb-title">
    <p>
        <i class="fa fa-home" style="color: #37bc9b;"></i>
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Configurations')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Edit currency')}
    </p>
</div>
{alerts}
{if $item->isLoaded()}
<div class="tablewhiteback" style="padding: 20px;">    
     <div class="the-box bg-white p-3">          
         <div class="row">          
           <div class="form-group col-md-6">             
              {if $form->hasErrors()}<div class="alert alert-{if $form.rate->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.rate->getError()}</div>{/if}
            <label for="rate">{__('Rate')}{if $form->rate->getOption('required')}*{/if}</label>           
            <div class="field_with_errors">
                <input class="SiteCurrency form-control Fields Input" type="text" value="{if $form->hasErrors()}{$form.rate}{else}{$item->getRate()->getText()}{/if}" name="rate" id="rate">
            </div>
          </div>   
            <div class="form-group col-md-6">
            {if $form->hasErrors()}<div class="alert alert-{if $form.code->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.code->getError()}</div>{/if}
            <label for="code">{__('Code')}{if $form->code->getOption('required')}*{/if}</label>            
            <div class="field_with_errors">             
                {html_options class="SiteCurrency form-control Fields Select" name="code" options=$form->code->getCurrencies()->toArray() selected=$item->get('code')}
            </div>
          </div>  
        </div>                 
    </div>          
</div>
<script type="text/javascript">                        
         
         $('#Cancel').click(function(){                                
             return $.ajax2({ url:"{url_to('site_currency_ajax',['action'=>'ListPartialCurrency'])}",target: "#actions"}); 
         });
         
                  
         $('#Save').click(function(){ 
                  
          var params= { SiteCurrency: { 
                                id: "{$item->get('id')}", token :'{$form->getCSRFToken()}' 
                             } };
          $(".SiteCurrency.Input").each(function() {  params.SiteCurrency[$(this).attr('name')]=$(this).val();  }); 
          $(".SiteCurrency.Select option:selected").each(function() {  params.SiteCurrency[$(this).parent().attr('name')]=$(this).val();  });  
          // alert("Params="+params.toSource());                             
                  return $.ajax2({ data : params,
                                    url: "{url_to('site_currency_ajax',['action'=>'SaveCurrency'])}",target: "#actions"}); 
         });
                
</script>
{else}
    {__('Currency is invalid.')}
{/if}    