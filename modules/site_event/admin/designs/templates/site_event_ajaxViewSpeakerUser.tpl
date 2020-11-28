<div class="row admin-header-container">
  <div class="col-sm">
       <h3 class="admin-header-big-text">{__('Events')}</h3>
       <h3 class="admin-header-small-text">{__('View speaker')}</h3>
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
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Events')}
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('View speaker')}
    </p>
</div>
{alerts}
{if $item->isLoaded()} 
 <div class="tablewhiteback" style="padding: 20px;">    
     <div class="the-box bg-white p-3">   
          <div class="row"> 
               <div class="form-group" col-md-4>
                                    <label>{__("Gender")}{if $form->getValidator('gender')->getOption('required')}*{/if}</label>
                                    <div {if $form.gender->hasError()}class="ClassError"{/if}>{$form.gender->getError()}</div> 
                                    {foreach $form->getValidator('gender')->getOption('choices') as $name=>$gender}                                     
                                       <input type="radio"  class="SiteEventSpeakerUser  form-control Fields Radio" name="gender" value="{$name}" checked="checked"> {$gender}
                                   {/foreach}
                                </div>
             <div class="form-group col-md-4">             
              {if $form->hasErrors()}<div class="alert alert-{if $form.firstname->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.firstname->getError()}</div>{/if}
            <label for="firstname">{__('First name')}{if $form->firstname->getOption('required')}*{/if}</label>           
            <div class="field_with_errors">
                <input class="SiteEventSpeakerUser  form-control Fields Input" type="text" value="{$item->get('firstname')}" name="firstname" id="firstname">
            </div>
          </div>     
          <div class="form-group col-md-4">             
              {if $form->hasErrors()}<div class="alert alert-{if $form.lastname->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.lastname->getError()}</div>{/if}
            <label for="lastname">{__('Last name')}{if $form->lastname->getOption('required')}*{/if}</label>           
            <div class="field_with_errors">
                <input class="SiteEventSpeakerUser  form-control Fields Input" type="text" value="{$item->get('lastname')}" name="lastname" id="lastname">
            </div>
          </div>                 
        </div> 
         <div class="row">                    
           <div class="form-group col-md-4">             
              {if $form->hasErrors()}<div class="alert alert-{if $form.email->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.email->getError()}</div>{/if}
            <label for="email">{__('Email')}{if $form->email->getOption('required')}*{/if}</label>           
            <div class="field_with_errors">
                <input class="SiteEventSpeakerUser  form-control Fields Input" type="text" value="{$item->get('email')}" name="email" id="email">
            </div>
          </div>                        
           <div class="form-group col-md-4">             
              {if $form->hasErrors()}<div class="alert alert-{if $form.phone->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.phone->getError()}</div>{/if}
            <label for="phone">{__('Phone')}{if $form->phone->getOption('required')}*{/if}</label>           
            <div class="field_with_errors">
                <input class="SiteEventSpeakerUser  form-control Fields Input" type="text" value="{$item->get('phone')}" name="phone" id="phone">
            </div>
          </div>       
           <div class="form-group col-md-4">             
              {if $form->hasErrors()}<div class="alert alert-{if $form.mobile->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.mobile->getError()}</div>{/if}
            <label for="mobile">{__('Mobile')}{if $form->mobile->getOption('required')}*{/if}</label>           
            <div class="field_with_errors">
                <input class="SiteEventSpeakerUser  form-control Fields Input" type="text" value="{$item->get('mobile')}" name="mobile" id="mobile">
            </div>
          </div>               
        </div> 
     
        <div class="row">     
           <div class="form-group col-md-12">             
              {if $form->hasErrors()}<div class="alert alert-{if $form.address1->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.address1->getError()}</div>{/if}
            <label for="address1">{__('Address')}{if $form->address1->getOption('required')}*{/if}</label>           
            <div class="field_with_errors">
                <input class="SiteEventSpeakerUser  form-control Fields Input" type="text" value="{$item->get('address1')}" name="address1" id="address1">
            </div>
          </div>                              
        </div>
            <div class="row">     
           <div class="form-group col-md-12">             
              {if $form->hasErrors()}<div class="alert alert-{if $form.address2->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.address2->getError()}</div>{/if}
            <label for="address2">{__("Address cont'd")}{if $form->address2->getOption('required')}*{/if}</label>           
            <div class="field_with_errors">
                <input class="SiteEventSpeakerUser  form-control Fields Input" type="text" value="{$item->get('address2')}" name="address2" id="address2">
            </div>
          </div>                              
        </div>
              <div class="row">     
           <div class="form-group col-md-3">             
              {if $form->hasErrors()}<div class="alert alert-{if $form.postcode->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.postcode->getError()}</div>{/if}
            <label for="postcode">{__('Postcode')}{if $form->postcode->getOption('required')}*{/if}</label>           
            <div class="field_with_errors">
                <input class="SiteEventSpeakerUser  form-control Fields Input" type="text" value="{$item->get('postcode')}" name="postcode" id="postcode">
            </div>
          </div> 
             <div class="form-group col-md-3">             
              {if $form->hasErrors()}<div class="alert alert-{if $form.state->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.state->getError()}</div>{/if}
            <label for="state">{__('State')}{if $form->state->getOption('required')}*{/if}</label>           
            <div class="field_with_errors">
                <input class="SiteEventSpeakerUser  form-control Fields Input" type="text" value="{$item->get('state')}" name="state" id="state">
            </div>
          </div>
             <div class="form-group col-md-3">             
              {if $form->hasErrors()}<div class="alert alert-{if $form.city->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.city->getError()}</div>{/if}
            <label for="city">{__('City')}{if $form->city->getOption('required')}*{/if}</label>           
            <div class="field_with_errors">
                <input class="SiteEventSpeakerUser  form-control Fields Input" type="text" value="{$item->get('city')}" name="city" id="city">
            </div>
          </div>            
          <div class="form-group col-md-3">             
              {if $form->hasErrors()}<div class="alert alert-{if $form.country->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.country->getError()}</div>{/if}
            <label for="country">{__('Country')}{if $form->country->getOption('required')}*{/if}</label>           
            <div class="field_with_errors">
                    {select_country name="country" class="SiteEventSpeakerUser  form-control Fields Select {if $form.country->hasError()}intro{/if}"  options=$form->country->getOption('choices') selected=$item->get('country')}
            </div>
          </div>          
        </div>
            
    </div>          
</div>  
{else}
    <span>{__("This user is invalid.")}</span>
{/if}

<script type="text/javascript">

         $('#Cancel').click(function(){ return $.ajax2({ 
                    url: "{url_to('site_event_ajax',['action'=>'ListPartialSpeakerUser'])}",                   
                    target: "#actions" });
         });
         
         $(".SiteSpeakerUser").click(function() { $("#Save").show(); });
            
         $('#Save').click(function(){ 
                  var params= { SiteSpeakerUser: { 
                                        id: "{$item->get('id')}",                                       
                                        token :'{$form->getCSRFToken()}' 
                                     } };
                  $(".SiteSpeakerUser.Input").each(function() { params.SiteSpeakerUser[this.name]=this.value; });                  
                  $(".SiteSpeakerUser.Checkbox:checked").each(function() { params.SiteSpeakerUser[this.name]=$(this).val(); }); 
                  return $.ajax2({  data: params, 
                                    url: "{url_to('site_event_ajax',['action'=>'SaveSpeakerUser'])}",                                   
                                    target: "#actions"}); 
         });
             
          
          
</script>
