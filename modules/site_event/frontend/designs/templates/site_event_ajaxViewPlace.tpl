<div class="row RowTop">
    <div class="col-md-12 grid-margin classConducteurTop">
      <div class="d-flex justify-content-between flex-wrap">
        <div class="d-flex align-items-end flex-wrap">
          <div class="mr-md-3 mr-xl-5 styleWidth">
            <h2>{__('My Events')}</h2>                   
          </div>
          <div class="d-flex">
            <i class="mdi mdi-home text-muted hover-cursor"></i>
            <a id="Dashboard"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('Dashboard')}</p></a>
            <a id="Places"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('My Places')}</p></a>
             <p class="text-muted mb-0">&nbsp;/&nbsp;{__('View')}</p>
          </div>
        </div>      
      </div>
        {component name="/site_help/help" help="event-view-place"}
    </div>
</div>
{alerts}
<div class="row admin-header-container btn-r">    
    <div class="col-sm" style="padding: 0;">
        <div class="buttonSave">
                <a href="#" id="Save" class="btn btn-primary admin-header-button"><i class="fa fa-save mr-2"></i>{__('Save')}</a>                
        </div>
    </div>
</div>
{if $item->isLoaded()}
<div class="tablewhiteback" style="padding: 20px;">    
     <div class="tablewhiteback" style="padding: 20px;">    
     <div class="the-box bg-white p-3">          
         <div class="row">     
             <div class="form-group col-md-6">             
              {if $form->hasErrors()}<div class="alert alert-{if $form.name->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.name->getError()}</div>{/if}
            <label for="name">{__('Name')}{if $form->name->getOption('required')}*{/if}</label>           
            <div class="field_with_errors">
                <input class="SiteEventPlace form-control Fields Input" type="text" value="{$item->get('name')}" name="name" id="name">
            </div>
          </div>     
           <div class="form-group col-md-6">             
              {if $form->hasErrors()}<div class="alert alert-{if $form.email->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.email->getError()}</div>{/if}
            <label for="email">{__('Email')}{if $form->email->getOption('required')}*{/if}</label>           
            <div class="field_with_errors">
                <input class="SiteEventPlace form-control Fields Input" type="text" value="{$item->get('email')}" name="email" id="email">
            </div>
          </div>               
        </div> 
        <div class="row">     
           <div class="form-group col-md-6">             
              {if $form->hasErrors()}<div class="alert alert-{if $form.phone->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.phone->getError()}</div>{/if}
            <label for="phone">{__('Phone')}{if $form->phone->getOption('required')}*{/if}</label>           
            <div class="field_with_errors">
                <input class="SiteEventPlace form-control Fields Input" type="text" value="{$item->get('phone')}" name="phone" id="phone">
            </div>
          </div>       
           <div class="form-group col-md-6">             
              {if $form->hasErrors()}<div class="alert alert-{if $form.mobile->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.mobile->getError()}</div>{/if}
            <label for="mobile">{__('Mobile')}{if $form->mobile->getOption('required')}*{/if}</label>           
            <div class="field_with_errors">
                <input class="SiteEventPlace form-control Fields Input" type="text" value="{$item->get('mobile')}" name="mobile" id="mobile">
            </div>
          </div>               
        </div> 
         <div class="row">     
           <div class="form-group col-md-6">             
              {if $form->hasErrors()}<div class="alert alert-{if $form.fax->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.fax->getError()}</div>{/if}
            <label for="fax">{__('Fax')}{if $form->fax->getOption('required')}*{/if}</label>           
            <div class="field_with_errors">
                <input class="SiteEventPlace form-control Fields Input" type="text" value="{$item->get('fax')}" name="fax" id="fax">
            </div>
          </div>       
           <div class="form-group col-md-6">             
              {if $form->hasErrors()}<div class="alert alert-{if $form.web->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.web->getError()}</div>{/if}
            <label for="web">{__('Web')}{if $form->web->getOption('required')}*{/if}</label>           
            <div class="field_with_errors">
                <input class="SiteEventPlace form-control Fields Input" type="text" value="{$item->get('web')}" name="web" id="web">
            </div>
          </div>               
        </div> 
        <div class="row">     
           <div class="form-group col-md-12">             
              {if $form->hasErrors()}<div class="alert alert-{if $form.address1->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.address1->getError()}</div>{/if}
            <label for="address1">{__('Address')}{if $form->address1->getOption('required')}*{/if}</label>           
            <div class="field_with_errors">
                <input class="SiteEventPlace form-control Fields Input" type="text" value="{$item->get('address1')}" name="address1" id="address1">
            </div>
          </div>                              
        </div>
            <div class="row">     
           <div class="form-group col-md-12">             
              {if $form->hasErrors()}<div class="alert alert-{if $form.address2->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.address2->getError()}</div>{/if}
            <label for="address2">{__("Address cont'd")}{if $form->address2->getOption('required')}*{/if}</label>           
            <div class="field_with_errors">
                <input class="SiteEventPlace form-control Fields Input" type="text" value="{$item->get('address2')}" name="address2" id="address2">
            </div>
          </div>                              
        </div>
              <div class="row">     
           <div class="form-group col-md-4">             
              {if $form->hasErrors()}<div class="alert alert-{if $form.postcode->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.postcode->getError()}</div>{/if}
            <label for="postcode">{__('Postcode')}{if $form->postcode->getOption('required')}*{/if}</label>           
            <div class="field_with_errors">
                <input class="SiteEventPlace form-control Fields Input" type="text" value="{$item->get('postcode')}" name="postcode" id="postcode">
            </div>
          </div>  
             <div class="form-group col-md-4">             
              {if $form->hasErrors()}<div class="alert alert-{if $form.city->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.city->getError()}</div>{/if}
            <label for="city">{__('City')}{if $form->city->getOption('required')}*{/if}</label>           
            <div class="field_with_errors">
                <input class="SiteEventPlace form-control Fields Input" type="text" value="{$item->get('city')}" name="city" id="city">
            </div>
          </div>
          <div class="form-group col-md-4">             
              {if $form->hasErrors()}<div class="alert alert-{if $form.country->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.country->getError()}</div>{/if}
            <label for="country">{__('Country')}{if $form->country->getOption('required')}*{/if}</label>           
            <div class="field_with_errors">
                    {select_country name="country" class="SiteEventPlace form-control Fields Select {if $form.country->hasError()}intro{/if}"  options=$form->country->getOption('choices') selected=$item->get('country')}
            </div>
          </div>          
        </div>
    </div>          
</div>         
</div>
<script type="text/javascript">                        
         
         $('#Cancel').click(function(){                                
             return $.ajax2({ url:"{url_to('site_event_ajax',['action'=>'ListPartialPlace'])}",target: "#actions"}); 
         });
         
                  
         $('#Save').click(function(){ 
                  
          var params= { SiteEventPlace: { 
                                id: "{$item->get('id')}", token :'{$form->getCSRFToken()}' 
                             } };
          $(".SiteEventPlace.Input").each(function() {  params.SiteEventPlace[$(this).attr('name')]=$(this).val();  }); 
          $(".SiteEventPlace.Select option:selected").each(function() {  params.SiteEventPlace[$(this).parent().attr('name')]=$(this).val();  });  
          // alert("Params="+params.toSource());                             
                  return $.ajax2({ data : params,
                                    url: "{url_to('site_event_ajax',['action'=>'SavePlace'])}",target: "#actions"}); 
         });
                
</script>
{else}
    {__('Event place is invalid.')}
{/if}    