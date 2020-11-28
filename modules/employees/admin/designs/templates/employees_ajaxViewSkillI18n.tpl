<div class="row admin-header-container">
    <div class="col-sm">
        <h3 class="admin-header-big-text">{__("View Freelancer Skill")}</h3>
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
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('View Skill')}
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
                <div>
                    <div class="form-group">
                        <label>{__('Icon')}</label>                  
                            <div id="iconForm">                            
                                <div class="custom-FileInput divIcon">
                                    {if $item_i18n->getSkill()->hasIcon()}
                                        <img id="blah" alt="" src="{$item_i18n->getSkill()->getIcon()->getURL('superadmin')}"{*/if*} /><br/>
                                        {else}
                                            <img id="blah" alt="" style="display: none;" /><br/>
                                    {/if}
                                </div>
                                <div class="row">
                                    <div class="col-md-7">
                                        <a id="iconAdd" href="#" class="btn btn-default"><i class="fa fa-plus" style="margin-right:10px;"></i>{__('Add Icon')}</a>
                                        <input id="item_file" type='file' hidden="" class="form-control Files Fields" name="EmployeeSkillI18n[skill][icon]" /> {*name="SiteCityI18n[function][icon]"*}
                                    </div>
                                    <div class="col-md-2" style="padding-top: 8px;padding-left: 0px;">
                                        <div class="thumbnail media-lib-item parent">
                                            <a href="#" class="list-action Mode-Icon" name="NORMAL" id="BtnInverse"><i class="ModeIcon Normal far fa-square"></i></a>
                                        </div>
                                    </div>
                                </div> 
                            </div>
                    </div>
                </div> 
            </div> 
                <div class="col-md-2">
                    <div class="form-group">
                        <label>{__('Picture')}</label>                  
                            <div id="pictureForm">                            
                                <div class="custom-FileInput divPicture">
                                    {if $item_i18n->getSkill()->hasPicture()}
                                        <img id="PictureImg" alt="" src="{$item_i18n->getSkill()->getPicture()->getURL('superadmin')}"{*/if*} /><br/>
                                        {else}
                                            <img id="PictureImg" alt="" style="display: none;" /><br/>
                                    {/if}
                                </div>
                                <div class="row">
                                    <div class="col-md-7">
                                        <a id="pictureAdd" href="#" class="btn btn-default"><i class="fa fa-plus" style="margin-right:10px;"></i>{__('Add Picture')}</a>
                                        <input id="item_file_picture" type='file' hidden="" class="form-control Files Fields" name="EmployeeSkillI18n[skill][picture]" /> {*name="SiteCityI18n[function][icon]"*}
                                    </div>
                                    <div class="col-md-2" style="padding-top: 8px;padding-left: 0px;">
                                        <div class="thumbnail media-lib-item parent">
                                            <a href="#" class="list-action Mode-Picture" name="NORMAL" id="BtnInverse"><i class="ModePicture Normal far fa-square"></i></a>
                                        </div>
                                    </div>
                                </div> 
                            </div>
                    </div>
                </div> 
              {*</div>*}
                                
               <div class="col-md-10">
                   <div class="row">
                        <div class="form-group col-md-6">             
                            {if $form->hasErrors()}<div class="alert alert-{if $form.skill.name->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.skill.name->getError()}</div>{/if}
                             <label for="name">{__('Name')}{if $form->skill.name->getOption('required')}*{/if}</label>           
                             <div class="field_with_errors">
                                <input class="EmployeeSkill form-control Fields Input" type="text" value="{$item_i18n->getSkill()->get('name')}" name="name" id="name">
                             </div>
                        </div> 
                        <div class="form-group col-md-6">
                            {if $form->hasErrors()}<div class="alert alert-{if $form.skill.color->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.skill.color->getError()}</div>{/if}
                            <label for="color" class="d-block">{__('Color')}{if $form->skill.color->getOption('required')}*{/if}</label>            
                            <input class="EmployeeSkill form-control Fields Input Color General input-color" type="text" value="{$item_i18n->getSkill()->get('color')}" name="color" id="color"/>
                        </div>
                   </div>
                    <div class="row">
                        <div class="form-group col-md-12">
                            {if $form->hasErrors()}<div class="alert alert-{if $form.skill_i18n.title->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.skill_i18n.title->getError()}</div>{/if}
                            <label for="title">{__('Title')}{if $form->skill_i18n.title->getOption('required')}*{/if}</label>            
                            <div class="field_with_errors"><input class="EmployeeSkillI18n form-control Fields Input" type="text" value="{$item_i18n->get('title')}" name="title" id="title"></div>
                        </div>
                    </div>
                </div>
                        
           <div class="col-md-12">
                   <div class="row">                        
                        <div class="form-group col-md-12">
                             {if $form->hasErrors()}<div class="alert alert-{if $form.skill_i18n.meta_description->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.skill_i18n.meta_description->getError()}</div>{/if}
                            <label for="meta_description">{__('Description')}{if $form->skill_i18n.meta_description->getOption('required')}*{/if}</label>            
                            <div class="field_with_errors">
                              <textarea cols="80" rows="2" class="EmployeeSkillI18n form-control Fields Input" type="text" name="meta_description" id="meta_description">{$item_i18n->get('meta_description')}</textarea></div>
                            </div> 
                        </div>
                   </div>  
                  <div class="col-md-12">
                   <div class="row">                        
                        <div class="form-group col-md-12">
                             {if $form->hasErrors()}<div class="alert alert-{if $form.skill_i18n.meta_keyword->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.skill_i18n.meta_keyword->getError()}</div>{/if}
                            <label for="meta_keyword">{__('Keywords')}{if $form->skill_i18n.meta_keyword->getOption('required')}*{/if}</label>            
                            <div class="field_with_errors">
                              <textarea cols="80" rows="2" class="EmployeeSkillI18n form-control Fields Input" type="text" name="meta_keyword" id="meta_keyword">{$item_i18n->get('meta_keyword')}</textarea></div>
                            </div> 
                        </div>
                   </div>  
                  <div class="col-md-12">
                   <div class="row">                        
                        <div class="form-group col-md-12">
                             {if $form->hasErrors()}<div class="alert alert-{if $form.skill_i18n.content->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.skill_i18n.content->getError()}</div>{/if}
                            <label for="title">{__('Content')}{if $form->skill_i18n.content->getOption('required')}*{/if}</label>            
                            <div class="field_with_errors">
                              <textarea cols="80" rows="2" class="EmployeeSkillI18n form-control Fields Input" type="text" name="content" id="content">{$item_i18n->get('content')}</textarea></div>
                            </div> 
                        </div>
                   </div>  
        </div> 
    </div>          
</div>
<script language="text/javascript">
    
      $( '#content' ).ckeditor({
            height: $(window).height()
        });
    
    
    $("#pictureAdd").click(function() {
        $('#item_file_picture').click();
     });
    
    
    $('#iconAdd').click(function() {
        $('#item_file').click();
     });
      
    $("#item_file").change(function() {   
        if (this.files && this.files[0]) {
          var reader = new FileReader();
          reader.onload = function(e) {  $('#blah').css('display','block').attr('src', e.target.result); };
          reader.readAsDataURL(this.files[0]);
        }        
    });
    
    $("#item_file_picture").change(function() {   
        if (this.files && this.files[0]) {
          var reader = new FileReader();
          reader.onload = function(e) {  $('#PictureImg').css('display','block').attr('src', e.target.result); };
          reader.readAsDataURL(this.files[0]);
        }        
    });
    
    
   $(".Color").minicolors({
      // position: relative,
       position: 'bottom right',
       control: 'hue', 
       inline: false
   });  
    
       $("#EmployeeSkill-ChangeIcon").click(function() {
           $("#EmployeeSkill-icon").show();
           $(this).hide();
           $("#Save").show();  
        });           
      
       $('#EmployeeSkill-DeleteIcon').click(function(){ 
            if (!confirm("{__("Icon will be deleted. Confirm ?")}")) return false; 
            return $.ajax2({ 
                              data : { EmployeeSkill: "{$item_i18n->getSkill()->get('id')}" }, 
                              url: "{url_to('employees_ajax',['action'=>'DeleteIconContractSkill'])}",                              
                              success :function(response) {
                                          if (response.action=='DeleteIconContractSkill' && response.id=="{$item_i18n->getSkill()->get('id')}")
                                          {                                                     
                                                $("#EmployeeSkill-icon-container").hide(); 
                                                $("span#EmployeeSkill-text-icon").html("{__('Add icon')}");
                                          }
                              }
            });  
      }); 
      
    $(".EmployeeSkill,.EmployeeSkillI18n").click(function() {  $('#Save').show(); });  
         
     {* =================== L A N G U A G E ================================ *}
        
     {* =================== A C T I O N S ================================ *}
     $('#Cancel').click(function(){                
             return $.ajax2({ data: { filter: { lang:  '{$item_i18n->get('lang')}', token: "{mfForm::getToken('EmployeeSkillFormFilter')}" } },                              
                              url : "{url_to('employees_ajax',['action'=>'ListPartialSkill'])}",                                                 
                              target: "#actions"}); 
      });
     
        
      $('#Save').click(function(){                             
            var  params= {      iFrame:true,             
                                EmployeeSkillI18n: { 
                                   skill_i18n : { lang: '{$item_i18n->get('lang')}', skill_id : '{$item_i18n->get('skill_id')}' },
                                   skill : { },
                                   token :'{$form->getCSRFToken()}'
                                } };
          $(".EmployeeSkillI18n.Input").each(function() { params.EmployeeSkillI18n.skill_i18n[$(this).attr('name')]=$(this).val(); });
          $(".EmployeeSkill.Input").each(function() {  params.EmployeeSkillI18n.skill[$(this).attr('name')]=$(this).val();  });  // Get foreign key  
        //      alert("Params="+params.toSource());   return ;      
          return $.ajax2({ data : params,  
                           files :'.Files',
                           url: "{url_to('employees_ajax',['action'=>'SaveSkillI18n'])}",
                           target: "#actions"}); 
        });  
        
        
    $(".Mode-Icon").click(function(){
        if ($(this).attr('name')=='NORMAL'){
            $(this).attr('name','INVERSE');
                $(".ModeIcon").removeClass('Normal far fa-square').addClass('Inverse fa fa-square-full');
                $(".divIcon").css('background-color','rgb(147, 138, 138)');
            }
            else
            {
                $(this).attr('name','NORMAL');
                $(".ModeIcon").removeClass('Inverse fa fa-square-full').addClass('Normal far fa-square');
                $(".divIcon").css('background-color','');
            }
   });
   $(".Mode-Picture").click(function(){
        if ($(this).attr('name')=='NORMAL'){
            $(this).attr('name','INVERSE');
                $(".ModePicture").removeClass('Normal far fa-square').addClass('Inverse fa fa-square-full');
                $(".divPicture").css('background-color','rgb(147, 138, 138)');
            }
            else
            {
                $(this).attr('name','NORMAL');
                $(".ModePicture").removeClass('Inverse fa fa-square-full').addClass('Normal far fa-square');
                $(".divPicture").css('background-color','');
            }
   });
        
</script>
