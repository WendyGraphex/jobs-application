{alerts}
<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__("View tax")}</h3>
        <h3 class="admin-header-small-text">{__("Sale Management")}</h3>
    </div>
    <div class="col-sm" style="padding: 0;">
        <div style="float: right;"> 
                <a href="#" id="Save" class="btn btn-success admin-header-button"><i class="fa fa-save"/>{__('Save')}</a>
                <a href="#" id="Cancel" class="btn btn-danger admin-header-button"><i class="fa fa-times"/>{__('Cancel')}</a>
        </div>
    </div>
</div>
<div class="breadcrumb-title">
    <p>
        <i class="fa fa-home" style="color: #37bc9b;"></i>
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Sales')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Tax')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('View tax')}
    </p>
</div>
{if $item->isLoaded()}    
<div class="tablewhiteback" style="padding: 20px;">    
     <div class="the-box bg-white p-3">          
         <div class="row">          
           <div class="form-group col-md-6">             
              {if $form->hasErrors()}<div class="alert alert-{if $form.rate->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.rate->getError()}</div>{/if}
            <label for="rate">{__('Rate')}{if $form->rate->getOption('required')}*{/if}</label>           
            <div class="field_with_errors">
                <input class="SaleTax form-control Fields Input" type="text" value="{if $form->hasErrors()}{$form.rate}{else}{$item->getRate()->getPourcentage()}{/if}" name="rate" id="rate">
            </div>
          </div>   
            <div class="form-group col-md-6">
            {if $form->hasErrors()}<div class="alert alert-{if $form.description->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.description->getError()}</div>{/if}
            <label for="description">{__('Description')}{if $form->description->getOption('required')}*{/if}</label>            
            <div class="field_with_errors">
                <textarea cols="80" rows="2" class="SaleTax form-control Fields Input" type="text" name="description" id="description">{$item->get('description')}</textarea>
            </div>
          </div>  
        </div>                 
    </div>          
</div>
<script type="text/javascript">              
   
     {* =================== A C T I O N S ================================ *}
     $('#Cancel').click(function(){                
             return $.ajax2({ url : "{url_to('sales_ajax',['action'=>'ListPartialTax'])}",                                                 
                              target: "#actions"}); 
      });
      
      $('#Save').click(function(){                             
            var  params= {      SaleTax: {    
                                   id : '{$item->get('id')}',
                                   token :'{$form->getCSRFToken()}'
                                } };
          $(".SaleTax.Input").each(function() { params.SaleTax[$(this).attr('name')]=$(this).val(); });          
        //      alert("Params="+params.toSource());   return ;      
          return $.ajax2({ data : params,                            
                           url: "{url_to('sales_ajax',['action'=>'SaveTax'])}",
                           target: "#actions"}); 
        });  
     
</script>
{else}
    {__('Tax is invalid.')}
{/if}    