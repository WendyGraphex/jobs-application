<div class="row admin-header-container">
    <div class="col-sm">
      <h3>{__('Configurations')}</h3>
      <h3 class="admin-header-small-text">{__('Event seller commissions')}</h3>
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
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Configurations')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Event seller Commissions')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('New')}
    </p>
</div>
{alerts}
{if $item->isLoaded()}
<div class="tablewhiteback" style="padding: 20px;">    
     <div class="the-box bg-white p-3">    
         <div class="row">                      
            <div class="form-group col-md-12">
            {if $form->hasErrors()}<div class="alert alert-{if $form.name->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.name->getError()}</div>{/if}
            <label for="name">{__('Name')}{if $form->name->getOption('required')}*{/if}</label>            
            <div class="field_with_errors"><input class="SiteEventSellerCommission form-control Fields Input" type="text" value="{$item->get('name')}" name="name" id="name"></div>
          </div>  
        </div>  
           <div class="row">                      
            <div class="form-group col-md-6">
            {if $form->hasErrors()}<div class="alert alert-{if $form.started_at->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.started_at->getError()}</div>{/if}
            <label for="started_at">{__('Started at')}{if $form->started_at->getOption('required')}*{/if}</label>            
            <div class="field_with_errors"><input class="SiteEventSellerCommission form-control Fields Input Date" type="text" value="{$item->get('started_at')}" name="started_at" id="started_at"></div>
          </div> 
            <div class="form-group col-md-6">
            {if $form->hasErrors()}<div class="alert alert-{if $form.expired_at->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.expired_at->getError()}</div>{/if}
            <label for="expired_at">{__('Started at')}{if $form->expired_at->getOption('required')}*{/if}</label>            
            <div class="field_with_errors"><input class="SiteEventSellerCommission form-control Fields Input Date" type="text" value="{$item->get('expired_at')}" name="expired_at" id="expired_at"></div>
          </div> 
        </div>  
    </div>          
</div>
<script type="text/javascript">              
                                                                      
     $(".SiteEventSellerCommission").click(function() {  $('#Save').show(); });  
             
     $('#Cancel').click(function(){                
             return $.ajax2({  url : "{url_to('site_event_ajax',['action'=>'ListPartialSellerCommission'])}",                                                 
                              target: "#actions"}); 
     });
     
        
     $('#Save').click(function(){                             
            var  params= {     SiteEventSellerCommission: {    
                                   id : '{$item->get('id')}',
                                   token :'{$form->getCSRFToken()}'
                                } };
          $(".SiteEventSellerCommission.Input").each(function() { params.SiteEventSellerCommission[$(this).attr('name')]=$(this).val(); });        
        //      alert("Params="+params.toSource());   return ;      
          return $.ajax2({ data : params,                             
                           url: "{url_to('site_event_ajax',['action'=>'SaveSellerCommission'])}",
                           target: "#actions"}); 
     });                          
</script>
{else}
    {__('Commission is invalid.')}
{/if} 


