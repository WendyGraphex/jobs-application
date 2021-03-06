
<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__("View Activity")}</h3>
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
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('View Activity')}
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
          
          
{*=================================================================================================================================================================*}
<div class="row">
              <div class="col-md-2">
                    <div class="form-group">
                        <label>{__('Icon')}</label>                  
                            <div id="pictureForm">                            
                                <div class="custom-FileInput">
                                    {if $item_i18n->getActivity()->hasIcon()}
                                        <img id="blah" alt="" src="{$item_i18n->getActivity()->getIcon()->getURL('superadmin')}"{*/if*} /><br/>
                                        {else}
                                            <img id="blah" alt="" style="display: none;" /><br/>
                                    {/if}
                                </div>
                                <a id="pictureAdd" href="#" class="btn btn-default"><i class="fa fa-plus" style="margin-right:10px;"></i>{__('Change Icon')}</a>
                                <input id="item_file" type='file' hidden="" class="form-control Files Fields" name="PartnerActivityI18n[activity][icon]" />
                            </div>
                    </div>
                </div> 
                                
               <div class="col-md-10">
                   <div class="row">
                        <div class="form-group col-md-6">             
                            {if $form->hasErrors()}<div class="alert alert-{if $form.activity.name->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.activity.name->getError()}</div>{/if}
                             <label for="name">{__('Name')}{if $form->activity.name->getOption('required')}*{/if}</label>           
                             <div class="field_with_errors">
                                <input class="PartnerActivity form-control Fields Input" type="text" value="{$item_i18n->getActivity()->get('name')}" name="name" id="name">
                             </div>
                        </div> 
                        <div class="form-group col-md-6">
                            {if $form->hasErrors()}<div class="alert alert-{if $form.activity.color->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.activity.color->getError()}</div>{/if}
                            <label for="color" class="d-block">{__('Color')}{if $form->activity.color->getOption('required')}*{/if}</label>            
                            <input class="PartnerActivity form-control Fields Input Color General input-color" type="text" value="{$item_i18n->getActivity()->get('color')}" name="color" id="color"/>
                        </div>
                   </div>
                    <div class="row">
                        <div class="form-group col-md-12">
                            {if $form->hasErrors()}<div class="alert alert-{if $form.activity_i18n.title->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.activity_i18n.title->getError()}</div>{/if}
                            <label for="title">{__('Title')}{if $form->activity_i18n.title->getOption('required')}*{/if}</label>            
                            <div class="field_with_errors"><input class="PartnerActivityI18n form-control Fields Input" type="text" value="{$item_i18n->get('title')}" name="title" id="title"></div>
                        </div>
                    </div>
                </div>
    </div>
        </div>    
                  
    </div>          
<script activity="text/javascript"> 
    
    
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
    
       $("#PartnerActivity-ChangeIcon").click(function() {
           $("#PartnerActivity-icon").show();
           $(this).hide();
           $("#Save").show();  
        });           
      
       $('#PartnerActivity-DeleteIcon').click(function(){ 
            if (!confirm("{__("Icon will be deleted. Confirm ?")}")) return false; 
            return $.ajax2({ 
                              data : { PartnerActivity: "{$item_i18n->getActivity()->get('id')}" }, 
                              url: "{url_to('partners_ajax',['action'=>'DeleteIconActivity'])}",                              
                              success :function(response) {
                                          if (response.action=='DeleteIconActivity' && response.id=="{$item_i18n->getActivity()->get('id')}")
                                          {                                                     
                                                $("#PartnerActivity-icon-container").hide(); 
                                                $("span#PartnerActivity-text-icon").html("{__('Add icon')}");
                                          }
                              }
            });  
      }); 
      
    $(".PartnerActivity,.PartnerActivityI18n").click(function() {  $('#Save').show(); });  
         
     {* =================== L A N G U A G E ================================ *}
        
     {* =================== A C T I O N S ================================ *}
     $('#Cancel').click(function(){                
             return $.ajax2({ data: { filter: { lang:  '{$item_i18n->get('lang')}', token: "{mfForm::getToken('PartnerActivityFormFilter')}" } },                              
                              url : "{url_to('partners_ajax',['action'=>'ListPartialActivity'])}",                                                 
                              target: "#actions"}); 
      });
     
        
      $('#Save').click(function(){                             
            var  params= {      iFrame:true,             
                                PartnerActivityI18n: { 
                                   activity_i18n : { lang: '{$item_i18n->get('lang')}', activity_id : '{$item_i18n->get('activity_id')}' },
                                   activity : { },
                                   token :'{$form->getCSRFToken()}'
                                } };
          $(".PartnerActivityI18n.Input").each(function() { params.PartnerActivityI18n.activity_i18n[$(this).attr('name')]=$(this).val(); });
          $(".PartnerActivity.Input").each(function() {  params.PartnerActivityI18n.activity[$(this).attr('name')]=$(this).val();  });  // Get foreign key  
        //      alert("Params="+params.toSource());   return ;      
          return $.ajax2({ data : params,  
                           files :'.Files',
                           url: "{url_to('partners_ajax',['action'=>'SaveActivityI18n'])}",
                           target: "#actions"}); 
        });     
        
    
</script>
