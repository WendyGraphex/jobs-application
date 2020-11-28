
<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__("View Claim Type")}</h3>
        <h3 class="admin-header-small-text">{__("Configuration Management")}</h3>
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
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('View Claim Type')}
    </p>
</div>
{alerts}
<div class="tablewhiteback" style="padding: 20px;">    
     <div class="the-box bg-white p-3">    
          <div class="row">
           <div class="form-group col-md-12">          
            <img id="{$item_i18n->get('lang')}" name="lang" src="{url("/flags/`$item_i18n->get('lang')`.png","picture")}" title="{format_country($item_i18n->get('lang'))}" />       
          </div>          
         </div>
        
          
           <div class="row">
              <div class="col-md-2">
                    <div class="form-group">
                        <label>{__('Icon')}</label>                  
                            <div id="pictureForm">                            
                                <div class="custom-FileInput">
                                    {if $item_i18n->getType()->hasIcon()}
                                        <img id="blah" alt="" src="{$item_i18n->getType()->getIcon()->getURL('superadmin')}"{*/if*} /><br/>
                                        {else}
                                            <img id="blah" alt="" style="display: none;" /><br/>
                                    {/if}
                                </div>
                                <a id="pictureAdd" href="#" class="btn btn-default"><i class="fa fa-plus" style="margin-right:10px;"></i>{__('Change Icon')}</a>
                                <input id="item_file" type='file' hidden="" type="file" class="form-control Files Fields" name="CustomerClaimTypeI18n[type][icon]" />
                            </div>
                    </div>
                </div> 
                                
               <div class="col-md-10">
                   <div class="row">
                        <div class="form-group col-md-6">             
                            {if $form->hasErrors()}<div class="alert alert-{if $form.type.name->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.type.name->getError()}</div>{/if}
                             <label for="name">{__('Name')}{if $form->type.name->getOption('required')}*{/if}</label>           
                             <div class="field_with_errors">
                                <input class="CustomerClaimType form-control Fields Input" type="text" value="{$item_i18n->getType()->get('name')}" name="name" id="name">
                             </div>
                        </div> 
                        <div class="form-group col-md-6">
                            {if $form->hasErrors()}<div class="alert alert-{if $form.type.color->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.type.color->getError()}</div>{/if}
                            <label for="color" class="d-block">{__('Color')}{if $form->type.color->getOption('required')}*{/if}</label>            
                            <input class="CustomerClaimType form-control Fields Input Color General input-color" type="text" value="{$item_i18n->getType()->get('color')}" name="color" id="color"/>
                        </div>
                   </div>
                    <div class="row">
                        <div class="form-group col-md-12">
                            {if $form->hasErrors()}<div class="alert alert-{if $form.type_i18n.title->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.type_i18n.title->getError()}</div>{/if}
                            <label for="title">{__('Title')}{if $form->type_i18n.title->getOption('required')}*{/if}</label>            
                            <div class="field_with_errors"><input class="CustomerClaimTypeI18n form-control Fields Input" type="text" value="{$item_i18n->get('title')}" name="title" id="title"></div>
                        </div>
                    </div>
                </div>
        </div>
          
                       
    </div>          
</div>
<script type="text/javascript">  
    
    
    
     $('#pictureAdd').click(function() {
        $('#item_file').click();
     });
      
    $("#item_file").change(function() {   
        if (this.files && this.files[0]) {
          var reader = new FileReader();
          reader.onload = function(e) {  $('#blah').css('display','block').attr('src', e.target.result); };
          reader.readAsDataURL(this.files[0]);
        }        
    });
    
    
   $(".Color").minicolors({
      // position: relative,
       position: 'bottom right',
       control: 'hue', 
       inline: false
   });  
    
       $("#CustomerClaimType-ChangeIcon").click(function() {
           $("#CustomerClaimType-icon").show();
           $(this).hide();
           $("#Save").show();  
        });           
      
       $('#CustomerClaimType-DeleteIcon').click(function(){ 
            if (!confirm("{__("Icon will be deleted. Confirm ?")}")) return false; 
            return $.ajax2({ 
                              data : { QuotationType: "{$item_i18n->getType()->get('id')}" }, 
                              url: "{url_to('customers_ajax',['action'=>'DeleteIconType'])}",                              
                              success :function(response) {
                                          if (response.action=='DeleteIconType' && response.id=="{$item_i18n->getType()->get('id')}")
                                          {                                                     
                                                $("#CustomerClaimType-icon-container").hide(); 
                                                $("span#CustomerClaimType-text-icon").html("{__('Add icon')}");
                                          }
                              }
            });  
      }); 
      
    $(".CustomerClaimType,.CustomerClaimTypeI18n").click(function() {  $('#Save').show(); });  
         
     {* =================== L A N G U A G E ================================ *}
        
     {* =================== A C T I O N S ================================ *}
     $('#Cancel').click(function(){                
             return $.ajax2({ data: { filter: { lang:  '{$item_i18n->get('lang')}', token: "{mfForm::getToken('CustomerClaimTypeFormFilter')}" } },                              
                              url : "{url_to('customers_ajax',['action'=>'ListPartialType'])}",                                                 
                              target: "#actions"}); 
      });
     
        
      $('#Save').click(function(){                             
            var  params= {      iFrame:true,             
                                CustomerClaimTypeI18n: { 
                                   type_i18n : { lang: '{$item_i18n->get('lang')}', type_id : '{$item_i18n->get('type_id')}' },
                                   type : { },
                                   token :'{$form->getCSRFToken()}'
                                } };
          $(".CustomerClaimTypeI18n.Input").each(function() { params.CustomerClaimTypeI18n.type_i18n[$(this).attr('name')]=$(this).val(); });
          $(".CustomerClaimType.Input").each(function() {  params.CustomerClaimTypeI18n.type[$(this).attr('name')]=$(this).val();  });  // Get foreign key  
        //      alert("Params="+params.toSource());   return ;      
          return $.ajax2({ data : params,  
                           files :'.Files',
                           url: "{url_to('customers_ajax',['action'=>'SaveTypeI18n'])}",
                           target: "#actions"}); 
        });                          
</script>
