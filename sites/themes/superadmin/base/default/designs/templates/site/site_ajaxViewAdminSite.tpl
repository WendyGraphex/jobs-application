{messages class="errors"}
<h3>{__("edit site")|capitalize}</h3>
<div>
    <a href="#" class="btn" id="Save" style="display:none">
        <i class="fa fa-floppy-o" style=" margin-right: 10x"></i>
        {*<img  src="{url('/icons/save.gif','picture')}" alt="{__('save')}"/>*}{__('save')}</a>
    {if $site->isSubDomain()}
        <a id="CreateRemoteSubDomain" class="btn" href="#">
            <img  src="{url('/icons/subdomain16x16.png','picture')}" alt="{__('sub domain')}"/>{__('sub domain')|capitalize}</a>
    {/if}
    <a href="#" class="btn" id="List">
        <i class="fa fa-times" style=" margin-right: 10px;"></i>
        {*<img  src="{url('/icons/cancel.gif','picture')}" alt="{__('cancel')}"/>*}{__('cancel')}</a>
</div>
{if $site->isLoaded()}
    <div class="tab-form">
    <div><label>{__("domain")}:</label><input style="background-color: #CCCCCC;" size="48" type="text" name="site_host" value="{$site->get('site_host')|escape}" readonly="readonly"/></div>
    <div><label>{__("database")}:</label><input style="background-color: #CCCCCC;" size="48" type="text" name="site_db_name" value="{$site->get('site_db_name')|escape}" readonly="readonly"/></div>
    <fieldset>
        
        <legend> <h4>{__("database server")|capitalize}</h4></legend>
    <div>&nbsp;{$form.site_db_host->getError()}</div> 
    <label>{__("host")}:</label><input type="text" class="site" size="48" name="site_db_host" value="{$site->get('site_db_host')|escape}"/>{if $form->getValidator('site_db_host')->getOption('required')}*{/if}<div></div>   
    <div class="error-form">&nbsp;{$form.site_db_login->getError()}</div> 
    <label>{__("login")}:</label><input type="text" class="site" size="48" name="site_db_login" value="{$site->get('site_db_login')|escape}"/>{if $form->getValidator('site_db_login')->getOption('required')}*{/if}<div></div>   
    <div class="error-form">&nbsp;{$form.site_db_password->getError()}</div> 
    <label>{__("password")}:</label><input type="text" class="site" size="48" name="site_db_password" value="{$site->get('site_db_password')|escape}"/>{if $form->getValidator('site_db_password')->getOption('required')}*{/if}<div></div>    
     </fieldset>
     <fieldset>
         <legend> <h4>{__("Themes")}</h4></legend>
    <div class="error-form">&nbsp;{$form.site_admin_theme->getError()}</div> 
    <label>{__("admin theme")}:</label>{html_options class="site" name="site_admin_theme" options=$form->site_admin_theme->getOption('choices') selected=$site->get('site_admin_theme')}<br/>
    <div class="error-form">&nbsp;{$form.site_frontend_theme->getError()}</div> 
    <label>{__("frontend theme")}:</label>{html_options class="site" name="site_frontend_theme" options=$form->site_frontend_theme->getOption('choices') selected=$site->get('site_frontend_theme')}<br/>        
    </fieldset>
     <fieldset>        
        <legend> <h4>{__("Others")}</h4></legend>
        <label>{__("type")}:</label>{html_options_format class="site" name="site_type" options=$form->site_type->getOption('choices') selected=$site->get('site_type') format='__'}<br/>  
    <div class="form-group">
                <div id="error-picture" class="alert alert-danger" style="display:none"></div>
                    <label>{__('Picture')}<span class="obligation"></span></label>                                                            
                    <div id="picture-ctn" {if !$site->hasPicture()}style="display:none"{/if}>
                        <img id="picture-picture" {if $site->hasPicture()}src="{$site->getPicture()->getURL('admin')}"{/if} height="128" width="128" alt="{__('Picture')}"/>                       
                        <a href="#" title="{__('Delete')}" id="DeletePicture" name="{$site->get('id')}">
                           <i class="fa fa-trash"></i>
                        </a>
                    </div>
                    <a id="ChangeFilePicture" href="#"><i class="fa fa-plus"></i>
                         <span id="picture-text">
                             {if $site->hasPicture()} {__('Change picture')}{else}{__('Add picture')} {/if}
                         </span>
                    </a>
                    <div id="picture-input-ctn" style="display:none">
                         <div>{__('Max size for picture %s.',format_size($form->picture->getOption('max_size')))}</div>
                         <input class="form-ctr Fields" id="picture-file" type="file" name="Site[picture]"/> 
                         <a href="#" id="picture-upload" title="{__('Upload')}">
                             <i class="fa fa-upload"></i>{__('Upload')}
                         </a>
                         <img id="picture-loading" height="16" width="16" src="{url('/icons/loading.gif','picture')}" alt="" style="display:none;"> 
                    </div>                                          
         </div>
         <div class="form-group">
                <div id="error-logo" class="alert alert-danger" style="display:none"></div>
                    <label>{__('Logo')}<span class="obligation"></span></label>                                                            
                    <div id="logo-ctn" {if !$site->hasLogo()}style="display:none"{/if}>
                        <img id="logo-picture" {if $site->hasLogo()}src="{$site->getLogo()->getURL('admin')}"{/if} height="128" width="128" alt="{__('Logo')}"/>                       
                        <a href="#" title="{__('Delete')}" id="DeleteLogo" name="{$site->get('id')}">
                           <i class="fa fa-trash"></i>
                        </a>
                    </div>
                    <a id="ChangeFileLogo" href="#"><i class="fa fa-plus"></i>
                         <span id="logo-text">
                             {if $site->hasLogo()} {__('Change logo')}{else}{__('Add logo')} {/if}
                         </span>
                    </a>
                    <div id="logo-input-ctn" style="display:none">
                         <div>{__('Max size for logo %s.',format_size($form->logo->getOption('max_size')))}</div>
                         <input class="form-ctr Fields" id="logo-file" type="file" name="Site[logo]"/> 
                         <a href="#" id="logo-upload" title="{__('Upload')}">
                             <i class="fa fa-upload"></i>
                         </a>
                         <img id="logo-loading" height="16" width="16" src="{url('/icons/loading.gif','picture')}" alt="" style="display:none;"> 
                    </div>                                          
         </div>
     </fieldset>                   
</div>                         
{else}
    {__('Site is invalid.')}
{/if}    
<script type="text/javascript">
        
        $(".site").click(function () { $("#Save").show(); });
        
        $('#List').click(function(){
           return $.ajax2({ url: '{url_to("site_ajax",["action"=>"ListPartial"])}', 
                            target: "#tab-Dashboard-Site" });  
        });
        
        $('#Save').click(function(){
            var params={ 
                          Site : { 
                                     site_id: '{$site->get("site_id")}',
                                     token :'{$form->getCSRFToken()}'
                                 }
                       };
            $("input.site, select.site").each(function(id) { params.Site[this.name]=this.value; });
            return $.ajax2({ data : params, 
                             url:'{url_to("site_ajax",["action"=>"SaveAdminSite"])}', 
                             target: "#tab-Dashboard-Site" }); 
        });
        
        $('#CreateRemoteSubDomain').click(function(){
            var params={  Site : '{$site->get("site_id")}' };
            $("input.site, select.site").each(function() { params.Site[this.name]=this.value; });
            return $.ajax2({ data : params, 
                             url:'{url_to("site_ajax",['action'=>'CreateFreeSubDomain'])}'                            
                         }); 
        });
        
        
        {* ========================PICTURES =================================== *}
          
    $("#ChangeFilePicture").click(function() {
      $("#picture-input-ctn").show();
      $(this).hide();
     });
    
    $('#picture-upload').click(function(){ 
     return $.ajax2({ 
         loading:"#picture-loading",
         data : { Site: { 
                            id: "{$site->get('site_id')}",                                    
                            token :"{mfForm::getToken('SitePictureForm')}"
                         } },
         url: "{url_to('site_ajax',['action'=>'SavePicture'])}",
         files: "#picture-file",
         complete: function()
                   {
                       $("#picture-file").val('');       
                   },
         success: function(response)
                  {
                       if (response.picture)
                       {    
                            $("#picture-picture").attr('src',"{$site->getPicture()->getURLPath()}"+response.picture+"?"+$.now());                          
                            $("#picture-ctn").show();
                            $("#picture-file").val('');   
                            $("#picture-input-ctn").hide(); 
                            $("span#picture-text").html("{__('Change picture')}");
                            $("#ChangeFilePicture").show();
                       }  
                  }
        }); 
   }); 
   
    $('#DeletePicture').click(function(){ 
      if (!confirm('{__("Picture will be deleted. Confirm ?")}')) return false; 
      return $.ajax2({ 
                        data : { Site: "{$site->get('site_id')}" }, 
                        url: "{url_to('site_ajax',['action'=>'DeletePicture'])}",
                        success :function(response) {
                                    if (response.action=='DeletePicture' && response.id=="{$site->get('site_id')}")
                                    {                                                     
                                         $("#picture-ctn").hide(); 
                                         $("span#picture-text").html("{__('Add picture')}"); 
                                    }
                        }
      });  
   }); 
   
   
    $("#ChangeFileLogo").click(function() {
      $("#logo-input-ctn").show();
      $(this).hide();
     });
    
    $('#logo-upload').click(function(){ 
     return $.ajax2({ 
         loading:"#logo-loading",
         data : { Site: { 
                            id: "{$site->get('site_id')}",                                    
                            token :"{mfForm::getToken('SiteLogoForm')}"
                         } },
         url: "{url_to('site_ajax',['action'=>'SaveLogo'])}",
         files: "#logo-file",
         complete: function()
                   {
                       $("#logo-file").val('');       
                   },
         success: function(response)
                  {
                       if (response.logo)
                       {    
                            $("#logo-picture").attr('src',"{$site->getLogo()->getURLPath()}"+response.logo+"?"+$.now());                          
                            $("#logo-ctn").show();
                            $("#logo-file").val('');   
                            $("#logo-input-ctn").hide(); 
                            $("span#logo-text").html("{__('Change logo')}");
                            $("#ChangeFileLogo").show();
                       }  
                  }
        }); 
   }); 
   
    $('#DeleteLogo').click(function(){ 
      if (!confirm('{__("Logo will be deleted. Confirm ?")}')) return false; 
      return $.ajax2({ 
                        data : { Site: "{$site->get('site_id')}" }, 
                        url: "{url_to('site_ajax',['action'=>'DeleteLogo'])}",
                        success :function(response) {
                                    if (response.action=='DeleteLogo' && response.id=="{$site->get('site_id')}")
                                    {                                                     
                                         $("#logo-ctn").hide(); 
                                         $("span#logo-text").html("{__('Add logo')}"); 
                                    }
                        }
      });  
   }); 
</script>



