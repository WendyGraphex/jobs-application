<div class="row" style="margin: 0;padding-bottom: 10px;">
                <div class="col-sm-6 site-applications-header" style="padding: 0;">
                    <h3 class="admin-header-big-text" style="padding-top: 12px;">{__("New  Shop")}</h3>
                </div>

                <div class="col-sm" style="padding: 0;">
                    <div style="float: right;">
                        <a href="#" id="Save" class="btn btn-success admin-header-button"><i class="fa fa-save"/>{__('Save')}</a>
                        <a href="#" id="Cancel" class="btn btn-danger admin-header-button"><i class="fa fa-times"/>{__('Cancel')}</a>
                    </div>
                </div>
   
            </div>
  
            <div class="page-ticket" style="background-color: white; height: 40px; padding-left: 20px; display: table;
                width: 100%; text-align: left; margin-bottom: 15px;">
                <p style="display: table-cell; vertical-align: middle; font-size: 0.7em; color: #a9b2bd;">
                    <i class="fa fa-home" style="color: #37bc9b;"></i>
                    <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Configurations')}
                    <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('New Shop')}
                </p>
            </div>
{alerts}
<div class="tablewhiteback" style="padding: 20px;">    
     <div class="the-box bg-white p-3">    
         <div class="row">
          <div class="form-group col-md-12">          
            <div>{$form.shop_i18n.lang->getError()}</div> 
            {component name="/site_languages/selectListLanguagesFrontend" selected=$form.shop_i18n.lang}
          </div>          
        </div>
        <div class="row">                      
            <div class="form-group col-md-12">
            {if $form->hasErrors()}<div class="alert alert-{if $form.shop_i18n.meta_title->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.shop_i18n.meta_title->getError()}</div>{/if}
            <label for="meta_title">{__('Title')}{if $form->shop_i18n.meta_title->getOption('required')}*{/if}</label>            
            <div class="field_with_errors"><input class="SiteShopI18n form-control Fields Input" type="text" value="{*$item_i18n->get('meta_title')*}" name="meta_title" id="meta_title"></div>
          </div>  
        </div>
          <div class="row">                      
            <div class="form-group col-md-12">
            {if $form->hasErrors()}<div class="alert alert-{if $form.shop_i18n.meta_description->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.shop_i18n.meta_description->getError()}</div>{/if}
            <label for="meta_description">{__('Description')}{if $form->shop_i18n.meta_description->getOption('required')}*{/if}</label>            
            <div class="field_with_errors">
                <textarea class="SiteShopI18n form-control Fields Input" name="meta_description" id="meta_description">{$item_i18n->get('meta_description')}</textarea>
          </div>  
        </div>
          </div>
           <div class="row">                      
            <div class="form-group col-md-12">
            {if $form->hasErrors()}<div class="alert alert-{if $form.shop_i18n.meta_keywords->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.shop_i18n.meta_keywords->getError()}</div>{/if}
            <label for="meta_keywords">{__('Keywords')}{if $form->shop_i18n.meta_keywords->getOption('required')}*{/if}</label>            
            <div class="field_with_errors">
                <textarea class="SiteShopI18n form-control Fields Input" name="meta_keywords" id="meta_keywords">{$item_i18n->get('meta_keywords')}</textarea>
          </div>  
        </div>
          </div>
            <div class="row">                      
            <div class="form-group col-md-12">
            {if $form->hasErrors()}<div class="alert alert-{if $form.shop_i18n.meta_author->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.shop_i18n.meta_author->getError()}</div>{/if}
            <label for="meta_author">{__('Author')}{if $form->shop_i18n.meta_author->getOption('required')}*{/if}</label>            
            <div class="field_with_errors"><input class="SiteShopI18n form-control Fields Input" type="text" value="{$item_i18n->get('meta_author')}" name="meta_author" id="meta_author"></div>
          </div>  
        </div>
             <div class="row">                 
          {* <div class="form-group col-md-4">             
              {if $form->hasErrors()}<div class="alert alert-{if $form.shop.icon->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.shop.icon->getError()}</div>{/if}
            <label for="icon">{__('Icon')}{if $form->shop.icon->getOption('required')}*{/if}</label> 
                <div class="input-group">
                  <span class="input-group-btn">
                  <span class="btn btn-default btn-file bg-primary">
                     <a href="#" id="icon_file_browse" class="file-btn">{__('Browse…')}</a><input type="file" class="Files Fields" style="display:none" name="SiteShopI18n[shop][icon]" id="item_file">
                  </span>
                          </span>
                          <input type="text" id="icon_file_name" class="form-control" readonly="" value="">
                </div>
          </div>*} 
    {*====================================================Icon==================================================*} 
        <div class="col-md-2">         
            <div class="form-group">
                {if $form->hasErrors()}<div class="alert alert-{if $form.shop.icon->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.shop.icon->getError()}</div>{/if}
                <label for="icon">{__('Icon')}{if $form->shop.icon->getOption('required')}*{/if}</label>                  
                    <div id="iconForm">                            
                        <div class="custom-FileInput" id="DivIcon">
                            {if $item_i18n->getShop()->hasIcon()}
                                <img id="icon" alt="" src="{$item_i18n->getShop()->getIcon()->getURL('superadmin')}"{*/if*} /><br/>
                                {else}
                                    <img id="icon" alt="" style="display: none;" /><br/>
                            {/if}
                        </div>
                        <div class="row">
                            <div class="col-md-7">
                                <a id="iconAdd" href="javascript:void();" class="btn btn-default"><i class="fa fa-plus" style="margin-right:10px;"></i>{__('Add a profile picture')}</a>
                                <input type='file' id="iconInp" hidden="" class="Files Fields" name="SiteShopI18n[shop][icon]" id="item_file"/>
                            </div>
                            <div class="col-md-2" style="padding-top: 8px;padding-left: 0px;">
                                <div class="thumbnail media-lib-item parent">
                                    <a href="javascript:void();" class="list-action ModeIcon" name="NORMAL" id="BtnInverse" style=""><i class="ModeIconForIcon Normal far fa-square"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>      
        </div>
    {*====================================================Favicon==================================================*}
        <div class="col-md-2">         
            <div class="form-group">
                {if $form->hasErrors()}<div class="alert alert-{if $form.shop.favicon->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.shop.favicon->getError()}</div>{/if}
                <label for="favicon">{__('Favicon')}{if $form->shop.favicon->getOption('required')}*{/if}</label>               
                    <div id="favIconForm">                            
                        <div class="custom-FileInput" id="DivFavIcon">
                            {if $item_i18n->getShop()->hasFavicon()}
                                <img id="favicon" alt="" src="{$item_i18n->getShop()->getFavicon()->getURL('superadmin')}"/><br/>
                                {else}
                                    <img id="favicon" alt="" style="display: none;" /><br/>
                            {/if}
                        </div>
                        <div class="row">
                            <div class="col-md-7">
                                <a id="faviconAdd" href="javascript:void();" class="btn btn-default"><i class="fa fa-plus" style="margin-right:10px;"></i>{__('Add Favicon')}</a>
                                <input type='file' id="faviconInp" hidden="" class="Files Fields" name="SiteShopI18n[shop][favicon]" id="favicon_file"/>
                            </div>
                            <div class="col-md-2" style="padding-top: 8px;padding-left: 0px;">
                                <div class="thumbnail media-lib-item parent">
                                    <a href="javascript:void();" class="list-action ModeFavIcon" name="NORMAL" id="BtnInverse" style=""><i class="ModeIconForFavIcon Normal far fa-square"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>      
        </div>  
        
        
           {*<div class="form-group col-md-4">             
              {if $form->hasErrors()}<div class="alert alert-{if $form.shop.favicon->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.shop.favicon->getError()}</div>{/if}
            <label for="favicon">{__('Favicon')}{if $form->shop.favicon->getOption('required')}*{/if}</label> 
                <div class="input-group">
                  <span class="input-group-btn">
                  <span class="btn btn-default btn-file bg-primary">
                     <a href="#" id="favicon_file_browse" class="file-btn">{__('Browse…')}</a><input type="file" class="Files Fields" style="display:none" name="SiteShopI18n[shop][favicon]" id="favicon_file">
                  </span>
                          </span>
                          <input type="text" id="favicon_file_name" class="form-control" readonly="" value="">
                </div>
          </div> *}
        
    {*====================================================Logo==================================================*}
        <div class="col-md-2">         
            <div class="form-group">
                {if $form->hasErrors()}<div class="alert alert-{if $form.shop.logo->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.shop.logo->getError()}</div>{/if}
                <label for="logo">{__('Logo')}{if $form->shop.logo->getOption('required')}*{/if}</label>               
                    <div id="logoForm">                            
                        <div class="custom-FileInput" id="DivLogo">
                            {if $item_i18n->getShop()->hasLogo()}
                                <img id="logo" alt="" src="{$item_i18n->getShop()->getLogo()->getURL('superadmin')}"/><br/>
                                {else}
                                    <img id="logo" alt="" style="display: none;" /><br/>
                            {/if}
                        </div>
                        <div class="row">
                            <div class="col-md-7">
                                <a id="logoAdd" href="javascript:void();" class="btn btn-default"><i class="fa fa-plus" style="margin-right:10px;"></i>{__('Add Logo')}</a>
                                <input type='file' id="logoInp" hidden="" class="Files Fields" name="SiteShopI18n[shop][logo]" id="logo_file"/>
                            </div>
                            <div class="col-md-2" style="padding-top: 8px;padding-left: 0px;">
                                <div class="thumbnail media-lib-item parent">
                                    <a href="javascript:void();" class="list-action ModeLogo" name="NORMAL" id="BtnInverse" style=""><i class="ModeIconForLogo Normal far fa-square"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>      
        </div>  
          
          
                 {* <div class="form-group col-md-4">             
              {if $form->hasErrors()}<div class="alert alert-{if $form.shop.logo->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.shop.logo->getError()}</div>{/if}
            <label for="logo">{__('Favicon')}{if $form->shop.logo->getOption('required')}*{/if}</label> 
                <div class="input-group">
                  <span class="input-group-btn">
                  <span class="btn btn-default btn-file bg-primary">
                     <a href="#" id="logo_file_browse" class="file-btn">{__('Browse…')}</a><input type="file" class="Files Fields" style="display:none" name="SiteShopI18n[shop][logo]" id="logo_file">
                  </span>
                          </span>
                          <input type="text" id="logo_file_name" class="form-control" readonly="" value="">
                </div>
          </div> *}
        </div>           
    </div>          
</div>
<script type="text/javascript">              
    {*=================================================== ICON ======================================================================*}
        $('#iconAdd').click(function() {
            $('#iconInp').click();
        });
      
        $("#iconInp").change(function() {   
            if (this.files && this.files[0]) {
              var reader = new FileReader();
              reader.onload = function(e) {  $('#icon').css('display','block').attr('src', e.target.result); };
              reader.readAsDataURL(this.files[0]);
            }        
        });



        $(".ModeIcon").click(function(){
            if ($(this).attr('name')=='NORMAL'){
                $(this).attr('name','INVERSE');
                    $(".ModeIconForIcon").removeClass('Normal far fa-square').addClass('Inverse fa fa-square-full');
                    $("#DivIcon").css('background-color','#37BC9B');
                }
                else
                {
                    $(this).attr('name','NORMAL');
                    $(".ModeIconForIcon").removeClass('Inverse fa fa-square-full').addClass('Normal far fa-square');
                    $("#DivIcon").css('background-color','');
                }
       });
    {*=================================================== END ICON ==================================================================*}    
        
        
     {*=================================================== FAVICON ======================================================================*}
        $('#faviconAdd').click(function() {
            $('#faviconInp').click();
        });
      
        $("#faviconInp").change(function() {   
            if (this.files && this.files[0]) {
              var reader = new FileReader();
              reader.onload = function(e) {  $('#favicon').css('display','block').attr('src', e.target.result); };
              reader.readAsDataURL(this.files[0]);
            }        
        });



        $(".ModeFavIcon").click(function(){
            if ($(this).attr('name')=='NORMAL'){
                $(this).attr('name','INVERSE');
                    $(".ModeIconForFavIcon").removeClass('Normal far fa-square').addClass('Inverse fa fa-square-full');
                    $("#DivFavIcon").css('background-color','#37BC9B');
                }
                else
                {
                    $(this).attr('name','NORMAL');
                    $(".ModeIconForFavIcon").removeClass('Inverse fa fa-square-full').addClass('Normal far fa-square');
                    $("#DivFavIcon").css('background-color','');
                }
       });
    {*=================================================== END ICON ==================================================================*}  
        
        
    {*=================================================== LOGO ======================================================================*}
        $('#logoAdd').click(function() {
            $('#logoInp').click();
        });
      
        $("#logoInp").change(function() {   
            if (this.files && this.files[0]) {
              var reader = new FileReader();
              reader.onload = function(e) {  $('#logo').css('display','block').attr('src', e.target.result); };
              reader.readAsDataURL(this.files[0]);
            }        
        });



        $(".ModeLogo").click(function(){
            if ($(this).attr('name')=='NORMAL'){
                $(this).attr('name','INVERSE');
                    $(".ModeIconForLogo").removeClass('Normal far fa-square').addClass('Inverse fa fa-square-full');
                    $("#DivLogo").css('background-color','#37BC9B');
                }
                else
                {
                    $(this).attr('name','NORMAL');
                    $(".ModeIconForLogo").removeClass('Inverse fa fa-square-full').addClass('Normal far fa-square');
                    $("#DivLogo").css('background-color','');
                }
       });
    {*=================================================== END LOGO ==================================================================*}  
        
        
     $("#icon_file_browse").click(function () { $("#icon_file").click(); }); 
     $("#icon_file").change(function (e) { $("#icon_file_name").val(e.target.files[0].name);$("#icon_file_name").addClass("active-file");  });

     $("#logo_file_browse").click(function () { $("#logo_file").click(); }); 
     $("#logo_file").change(function (e) { $("#logo_file_name").val(e.target.files[0].name);$("#logo_file_name").addClass("active-file");  });

     $("#favicon_file_browse").click(function () { $("#favicon_file").click(); }); 
     $("#favicon_file").change(function (e) { $("#favicon_file_name").val(e.target.files[0].name);$("#favicon_file_name").addClass("active-file");  });

         
     {* =================== L A N G U A G E ================================ *}
        
     {* =================== A C T I O N S ================================ *}
     $('#Cancel').click(function(){                
             return $.ajax2({ data: { filter: { lang:$("#SelectListLanguages option:selected").attr('id'), token: "{mfForm::getToken('SiteShopFormFilter')}" } },                              
                              url : "{url_to('site_shop_ajax',['action'=>'ListPartialShop'])}",                                                 
                              target: "#actions"}); 
      });
      
      $('#Save').click(function(){                             
            var  params= {      iFrame:true,             
                                SiteShopI18n: { 
                                   shop_i18n : { lang: $("#SelectListLanguages option:selected").attr('id')  },
                                   shop : { },
                                   token :'{$form->getCSRFToken()}'
                                } };
          $(".SiteShopI18n.Input").each(function() { params.SiteShopI18n.shop_i18n[$(this).attr('name')]=$(this).val(); });
          $(".SiteShop.Input").each(function() {  params.SiteShopI18n.shop[$(this).attr('name')]=$(this).val();  });  // Get foreign key  
        //      alert("Params="+params.toSource());   return ;      
          return $.ajax2({ data : params,  
                           files :'.Files',
                           url: "{url_to('site_shop_ajax',['action'=>'SaveNewShopI18n'])}",
                           target: "#actions"}); 
        });                          
     
</script>
