<div class="row" style="margin: 0;padding-bottom: 10px;">
                <div class="col-sm-6 site-applications-header" style="padding: 0;">
                    <h3 class="admin-header-big-text" style="padding-top: 12px;">{__("View  Shop")}</h3>
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
                    <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('view Shop')}
                </p>
            </div>
{alerts}
<div class="tablewhiteback" style="padding: 20px;">    
     <div class="the-box bg-white p-3">    
          <div class="row">
           <div class="form-group col-md-12">          
            <img id="{$item_i18n->get('lang')}" name="lang" src="{url("/flags/`$item_i18n->get('lang')`.png","picture")}" meta_title="{format_country($item_i18n->get('lang'))}" />       
          </div>          
         </div>       
        <div class="row">                      
            <div class="form-group col-md-12">
            {if $form->hasErrors()}<div class="alert alert-{if $form.shop_i18n.meta_title->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.shop_i18n.meta_title->getError()}</div>{/if}
            <label for="meta_title">{__('Title')}{if $form->shop_i18n.meta_title->getOption('required')}*{/if}</label>            
            <div class="field_with_errors"><input class="SiteShopI18n form-control Fields Input" type="text" value="{$item_i18n->get('meta_title')}" name="meta_title" id="meta_title"></div>
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
               {*<div class="form-group col-md-4"> 
                  <span>{__("Icon")}</span>
                  {if $item_i18n->isLoaded()}
                   <div id="SiteShop-error-icon"></div>                  
                   <div id="SiteShop-icon-container" {if !$item_i18n->getShop()->hasIcon()}style="display:none"{/if}>
                       <img id="SiteShop-icon-img" {if $item_i18n->getShop()->hasIcon()}src="{$item_i18n->getShop()->getIcon()->getURL('superadmin')}"{/if} height="32" width="32" alt="{__('icon')}"/>
                       <span id="SiteShop-icon-filename">{$item_i18n->getShop()->hasIcon()}</span>
                       <a href="#" meta_title="{__('Delete')}" id="SiteShop-DeleteIcon" name="{$item_i18n->getShop()->get('id')}">
                           <i class="fa fa-remove"></i>
                       </a>
                   </div>
                        <a id="SiteShop-ChangeIcon" href="#"><i class="fa fa-plus" style=" margin-right: 10px;"></i>
                           <span id="SiteShop-text-icon">
                                {if $item_i18n->getShop()->hasIcon()}{__('Change icon')}{else}{__('Add icon')}{/if}
                           </span>
                        </a>
                   <div id="SiteShop-icon" style="display:none">
                       {* <input class="Files" type="file" name="SiteShopI18n[shop][icon]"/>*} 
                       {*<div class="input-group">
                      <span class="input-group-btn">
                        <span class="btn btn-default btn-file bg-primary">
                            <a href="#" id="item_file_browse" class="file-btn">{__('Browse…')}</a><input type="file" class="Files Fields" style="display:none" name="SiteShopI18n[shop][icon]" id="item_file">
                        </span>
                              </span>
                              <input type="text" id="item_file_name" class="form-control" readonly="" value="">
                      </div>
                   </div>
                  {else}
                     <div id="SiteShop-error-icon" class="error-form">{$form.shop.icon->getError()}</div>     
                     {*<input class="files" type="file" name="SiteShopI18n[shop][icon]"/>*} 
                      {*if $form->shop.icon->getOption('required')}*{/if} 
                      <div class="input-group">
                      <span class="input-group-btn">
                        <span class="btn btn-default btn-file bg-primary">
                            <a href="#" id="item_file_browse" class="file-btn">{__('Browse…')}</a><input type="file" class="Files Fields" style="display:none" name="SiteShopI18n[shop][icon]" id="item_file">
                        </span>
                              </span>
                              <input type="text" id="item_file_name" class="form-control" readonly="" value="">
                      </div>
                  {/if}         

               </div> *}
               
               
    {*====================================================Icon==================================================*} 
                <div class="col-md-2">         
                    <div class="form-group">
                        {if $form->hasErrors()}<div class="alert alert-{if $form.shop.icon->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.shop.icon->getError()}</div>{/if}
                        <label for="icon">{__('Icon')}{if $form->shop.icon->getOption('required')}*{/if}</label>                  
                            <div id="iconForm">                            
                                <div class="custom-FileInput" id="DivIcon">
                                     {if $item_i18n->getShop()->hasIcon()}
                                        {*<img id="SiteShop-icon-img" {if $item_i18n->getShop()->hasIcon()}src="{$item_i18n->getShop()->getIcon()->getURL('superadmin')}"{/if} alt="{__('icon')}"/>*}
                                        <img id="icon" {if $item_i18n->getShop()->hasIcon()}src="{$item_i18n->getShop()->getIcon()->getURL('superadmin')}"{/if} /><br/>
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
    
    
    
    
   $(".Color").minicolors({
      // position: relative,
       position: 'bottom right',
       control: 'hue', 
       inline: false
   });  
    
       $("#SiteShop-ChangeIcon").click(function() {
           $("#SiteShop-icon").show();
           $(this).hide();
           $("#Save").show();  
        });           
      
       $('#SiteShop-DeleteIcon').click(function(){ 
            if (!confirm("{__("Icon will be deleted. Confirm ?")}")) return false; 
            return $.ajax2({ 
                              data : { QuotationShop: "{$item_i18n->getShop()->get('id')}" }, 
                              url: "{url_to('site_shop_ajax',['action'=>'DeleteIconShop'])}",                              
                              success :function(response) {
                                          if (response.action=='DeleteIconShop' && response.id=="{$item_i18n->getShop()->get('id')}")
                                          {                                                     
                                                $("#SiteShop-icon-container").hide(); 
                                                $("span#SiteShop-text-icon").html("{__('Add icon')}");
                                          }
                              }
            });  
      }); 
      
    $(".SiteShop,.SiteShopI18n").click(function() {  $('#Save').show(); });  
         
     {* =================== L A N G U A G E ================================ *}
        
     {* =================== A C T I O N S ================================ *}
     $('#Cancel').click(function(){                
             return $.ajax2({ data: { filter: { lang:  '{$item_i18n->get('lang')}', token: "{mfForm::getToken('SiteShopFormFilter')}" } },                              
                              url : "{url_to('site_shop_ajax',['action'=>'ListPartialShop'])}",                                                 
                              target: "#actions"}); 
      });
     
        
      $('#Save').click(function(){                             
            var  params= {      iFrame:true,             
                                SiteShopI18n: { 
                                   shop_i18n : { lang: '{$item_i18n->get('lang')}', shop_id : '{$item_i18n->get('shop_id')}' },
                                   shop : { },
                                   token :'{$form->getCSRFToken()}'
                                } };
          $(".SiteShopI18n.Input").each(function() { params.SiteShopI18n.shop_i18n[$(this).attr('name')]=$(this).val(); });
          $(".SiteShop.Input").each(function() {  params.SiteShopI18n.shop[$(this).attr('name')]=$(this).val();  });  // Get foreign key  
        //      alert("Params="+params.toSource());   return ;      
          return $.ajax2({ data : params,  
                           files :'.Files',
                           url: "{url_to('site_shop_ajax',['action'=>'SaveShopI18n'])}",
                           target: "#actions"}); 
        });                          
</script>
