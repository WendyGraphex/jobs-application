<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__("Employers")}</h3>
        <h3 class="admin-header-small-text">{__("Employers Company Management")}</h3>
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
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('New company')}
    </p>
</div>
{alerts}    
<div class="tablewhiteback" style="padding: 20px;">     
     <div class="the-box bg-white p-3">    
        <div class="row">          
           <div class="form-group col-md-4">             
              {if $form->hasErrors()}<div class="alert alert-{if $form.name->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.name->getError()}</div>{/if}
            <label for="name">{__('Name')}{if $form->name->getOption('required')}*{/if}</label>           
            <div class="field_with_errors">
                <input class="EmployerCompany form-control Fields Input" type="text" value="{$item->get('name')}" name="name" id="name">
            </div>
          </div>            
             <div class="form-group col-md-4">
            {if $form->hasErrors()}<div class="alert alert-{if $form.commercial->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.commercial->getError()}</div>{/if}
            <label for="commercial">{__('Commercial')}{if $form->commercial->getOption('required')}*{/if}</label>            
            <div class="field_with_errors"><input class="EmployerCompany form-control Fields Input " type="text" value="{$item->get('commercial')}" name="commercial" id="commercial"></div>
          </div>           
           <div class="form-group col-md-4">
            {if $form->hasErrors()}<div class="alert alert-{if $form.web->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.web->getError()}</div>{/if}
            <label for="web">{__('Web')}{if $form->web->getOption('required')}*{/if}</label>            
            <div class="field_with_errors"><input class="EmployerCompany form-control Fields Input " type="text" value="{$item->get('web')}" name="web" id="web"></div>
          </div>           
        </div>           
       <div class="row">          
           <div class="form-group col-md-12">             
              {if $form->hasErrors()}<div class="alert alert-{if $form.address1->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.address1->getError()}</div>{/if}
            <label for="address1">{__('Address1')}{if $form->address1->getOption('required')}*{/if}</label>           
            <div class="field_with_errors">
                <input class="EmployerCompany form-control Fields Input" type="text" value="{$item->get('address1')}" name="address1" id="address1">
            </div>
          </div> 
       </div>
       <div class="row"> 
             <div class="form-group col-md-8">             
              {if $form->hasErrors()}<div class="alert alert-{if $form.address2->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.address2->getError()}</div>{/if}
            <label for="address2">{__('Address2')}{if $form->address2->getOption('required')}*{/if}</label>           
            <div class="field_with_errors">
                <input class="EmployerCompany form-control Fields Input" type="text" value="{$item->get('address2')}" name="address2" id="address2">
            </div>
          </div>        
             <div class="form-group col-md-4">             
              {if $form->hasErrors()}<div class="alert alert-{if $form.coordinates->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.coordinates->getError()}</div>{/if}
            <label for="coordinates">{__('Coordinates')}{if $form->coordinates->getOption('required')}*{/if}</label>           
            <div class="field_with_errors">
                <input class="EmployerCompany form-control Fields Input" type="text" value="{$item->get('coordinates')}" name="coordinates" id="coordinates">
            </div>
          </div> 
       </div>   
        <div class="row"> 
           <div class="form-group col-md-4">
            {if $form->hasErrors()}<div class="alert alert-{if $form.postcode->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.postcode->getError()}</div>{/if}
            <label for="postcode">{__('Postcode')}{if $form->postcode->getOption('required')}*{/if}</label>            
            <div class="field_with_errors"><input class="EmployerCompany form-control Fields Input " type="text" value="{$item->get('postcode')}" name="postcode" id="postcode"></div>
          </div> 
           <div class="form-group col-md-4">
            {if $form->hasErrors()}<div class="alert alert-{if $form.city->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.city->getError()}</div>{/if}
            <label for="city">{__('City')}{if $form->city->getOption('required')}*{/if}</label>            
            <div class="field_with_errors"><input class="EmployerCompany form-control Fields Input " type="text" value="{$item->get('city')}" name="city" id="city"></div>
          </div> 
          <div class="form-group col-md-4">
            {if $form->hasErrors()}<div class="alert alert-{if $form.country->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.country->getError()}</div>{/if}
            <label for="city">{__('Country')}{if $form->country->getOption('required')}*{/if}</label>            
             {select_country name="country" class="EmployerCompany form-control Fields Select" options=$form->country->getOption('choices') selected=$item->get('country')}
          </div> 
        </div>  
          <div class="row"> 
             <div class="form-group col-md-3">
            {if $form->hasErrors()}<div class="alert alert-{if $form.email->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.email->getError()}</div>{/if}
            <label for="email">{__('Email')}{if $form->email->getOption('required')}*{/if}</label>            
            <div class="field_with_errors"><input class="EmployerCompany form-control Fields Input " type="text" value="{$item->get('email')}" name="email" id="email"></div>
          </div>   
           <div class="form-group col-md-3">
            {if $form->hasErrors()}<div class="alert alert-{if $form.phone->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.phone->getError()}</div>{/if}
            <label for="phone">{__('Phone')}{if $form->phone->getOption('required')}*{/if}</label>            
            <div class="field_with_errors"><input class="EmployerCompany form-control Fields Input " type="text" value="{$item->get('phone')}" name="phone" id="phone"></div>
          </div> 
           <div class="form-group col-md-3">
            {if $form->hasErrors()}<div class="alert alert-{if $form.mobile->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.mobile->getError()}</div>{/if}
            <label for="mobile">{__('Mobile')}{if $form->mobile->getOption('required')}*{/if}</label>            
            <div class="field_with_errors"><input class="EmployerCompany form-control Fields Input " type="text" value="{$item->get('mobile')}" name="mobile" id="mobile"></div>
          </div> 
           <div class="form-group col-md-3">
            {if $form->hasErrors()}<div class="alert alert-{if $form.fax->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.fax->getError()}</div>{/if}
            <label for="fax">{__('Fax')}{if $form->fax->getOption('required')}*{/if}</label>            
            <div class="field_with_errors"><input class="EmployerCompany form-control Fields Input " type="text" value="{$item->get('fax')}" name="fax" id="fax"></div>
          </div> 
          </div>
          <div class="row">
            <div class="col-md-2">         
                  <div>
                      <div class="form-group">
                          <label>{__('Logo')}</label>                  
                              <div id="pictureForm">                            
                                  <div class="custom-FileInput">
                                      <img id="logo" alt="" style="display: none;" /><br/>
                                  </div>
                                  <a id="LogoAdd" href="#" class="btn btn-default"><i class="fa fa-plus" style="margin-right:10px;"></i>{__('Add Logo')}</a>
                                  <input type='file' id="logoInp" hidden="" class="EmployerCompany Files" name="EmployerCompany[logo]"/>
                              </div>
                      </div>
                  </div>         
            </div>
           <div class="col-md-2">         
                  <div>
                      <div class="form-group">
                          <label>{__('Picture')}</label>                  
                              <div id="pictureForm">                            
                                  <div class="custom-FileInput">
                                      <img id="picture" alt="" style="display: none;" /><br/>
                                  </div>
                                  <a id="pictureAdd" href="#" class="btn btn-default"><i class="fa fa-plus" style="margin-right:10px;"></i>{__('Add Picture')}</a>
                                  <input type='file' id="imgInp" hidden="" class="EmployerCompany Files" name="EmployerCompany[picture]"/>
                              </div>
                      </div>
                  </div>         
            </div>
        </div>
    </div>     
</div>
<script type="text/javascript">       
    
    
    $('#pictureAdd').click(function() {
        $('#imgInp').click();
     });
      
    $("#imgInp").change(function() {   
        if (this.files && this.files[0]) {
          var reader = new FileReader();
          reader.onload = function(e) {  $('#picture').css('display','block').attr('src', e.target.result); };
          reader.readAsDataURL(this.files[0]);
        }        
    });
    
    
    $('#LogoAdd').click(function() {
        $('#logoInp').click();
     });
      
    $("#logoInp").change(function() {   
        if (this.files && this.files[0]) {
          var reader = new FileReader();
          reader.onload = function(e) {  $('#logo').css('display','block').attr('src', e.target.result); };
          reader.readAsDataURL(this.files[0]);
        }        
    });
 
     {* =================== A C T I O N S ================================ *}
     $('#Cancel').click(function(){                
             return $.ajax2({ url : "{url_to('employers_ajax',['action'=>'ListPartialCompany'])}",                                                 
                              target: "#actions"}); 
      });
      
     $('#Save').click(function(){                             
            var  params= {           
                                EmployerCompany: {                                                                    
                                   token :'{$form->getCSRFToken()}'
                                } };
          $(".EmployerCompany.Input").each(function() { params.EmployerCompany[$(this).attr('name')]=$(this).val(); });         
          $(".EmployerCompany.Select option:selected").each(function () { params.EmployerCompany[$(this).parent().attr('name')]=$(this).val(); });  
          return $.ajax2({ data : params,
                           files : ".Files",
                           url: "{url_to('employers_ajax',['action'=>'NewCompany'])}",
                           target: "#actions"}); 
        });  
     
</script>


