
<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__("New Customer Abuse Type")}</h3>
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
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('New Abuse Type')}
    </p>
</div>
{alerts}
<div class="tablewhiteback" style="padding: 20px;">    
     <div class="the-box bg-white p-3">    
         <div class="row">
          <div class="form-group col-md-12">          
            <div>{$form.abuse_i18n.lang->getError()}</div> 
            {component name="/site_languages/selectListLanguagesFrontend" selected=$form.abuse_i18n.lang}
          </div>          
        </div>
          
          
          
          
          <div class="row">
              <div class="col-md-2">
                <div>
                    <div class="form-group">
                        <label>{__('Icon')}</label>                  
                            <div id="pictureForm">                            
                                <div class="custom-FileInput">
                                    <img id="blah" alt="" style="display: none;" /><br/>
                                </div>
                                <a id="pictureAdd" href="#" class="btn btn-default"><i class="fa fa-plus" style="margin-right:10px;"></i>{__('Add Icon')}</a>
                                <input id="item_file" type='file' hidden="" type="file" class="form-control Files Fields" name="CustomerAbuseTypeI18n[abuse][icon]" /> {*name="SiteCityI18n[function][icon]"*}
                            </div>
                    </div>
                </div> 
              </div>
                                
               <div class="col-md-10">
                   <div class="row">
                        <div class="form-group col-md-6">             
                            {if $form->hasErrors()}<div class="alert alert-{if $form.abuse.name->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.abuse.name->getError()}</div>{/if}
                             <label for="name">{__('Name')}{if $form->abuse.name->getOption('required')}*{/if}</label>           
                             <div class="field_with_errors">
                                <input class="CustomerAbuseType form-control Fields Input" type="text" value="{$item_i18n->getAbuse()->get('name')}" name="name" id="name">
                             </div>
                        </div> 
                        <div class="form-group col-md-6">
                            {if $form->hasErrors()}<div class="alert alert-{if $form.abuse.color->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.abuse.color->getError()}</div>{/if}
                            <label for="color" class="d-block">{__('Color')}{if $form->abuse.color->getOption('required')}*{/if}</label>            
                            <input class="CustomerAbuseType form-control Fields Input Color General input-color" language="text" value="{$item_i18n->getAbuse()->get('color')}" name="color" id="color"/>
                        </div>
                   </div>
                    <div class="row">
                        <div class="form-group col-md-12">
                            {if $form->hasErrors()}<div class="alert alert-{if $form.abuse_i18n.title->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.abuse_i18n.title->getError()}</div>{/if}
                            <label for="title">{__('Title')}{if $form->abuse_i18n.title->getOption('required')}*{/if}</label>            
                            <div class="field_with_errors"><input class="CustomerAbuseTypeI18n form-control Fields Input" language="text" value="{$item_i18n->get('title')}" name="title" id="title"></div>
                        </div>
                    </div>
                </div>
        </div>       
    </div>          
</div>
<script language="text/javascript"> 
    
    
    
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
     $("#item_file_browse").click(function () { $("#item_file").click(); }); 
          $("#item_file").change(function (e) { $("#item_file_name").val(e.target.files[0].name);$("#item_file_name").addClass("active-file");  });

       
     {* =================== A C T I O N S ================================ *}
     $('#Cancel').click(function(){                
             return $.ajax2({ data: { filter: { lang:$("#SelectListLanguages option:selected").attr('id'), token: "{mfForm::getToken('CustomerAbuseTypeFormFilter')}" } },                              
                              url : "{url_to('customers_contact_ajax',['action'=>'ListPartialAbuseType'])}",                                                 
                              target: "#actions"}); 
      });
      
      $('#Save').click(function(){                             
            var  params= {      iFrame:true,             
                                CustomerAbuseTypeI18n: { 
                                   abuse_i18n : { lang: $("#SelectListLanguages option:selected").attr('id')  },
                                   abuse : { },
                                   token :'{$form->getCSRFToken()}'
                                } };
          $(".CustomerAbuseTypeI18n.Input").each(function() { params.CustomerAbuseTypeI18n.abuse_i18n[$(this).attr('name')]=$(this).val(); });
          $(".CustomerAbuseType.Input").each(function() {  params.CustomerAbuseTypeI18n.abuse[$(this).attr('name')]=$(this).val();  });  // Get foreign key  
        //      alert("Params="+params.toSource());   return ;      
          return $.ajax2({ data : params,  
                           files :'.Files',
                           url: "{url_to('customers_contact_ajax',['action'=>'SaveNewAbuseTypeI18n'])}",
                           target: "#actions"}); 
        });                          
     
</script>
