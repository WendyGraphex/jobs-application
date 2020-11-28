<div class="row admin-header-container">
   <div class="col-sm">
        <h3 class="admin-header-big-text">{__('Site')}</h3>
        <h3 class="admin-header-small-text">{__('Menu management')}</h3>
   </div>
   <div class="col-sm" style="padding: 0;">
       <div style="float: right;"> 
           <a href="#" id="Save" class="btn btn-success admin-header-button"><i class="fa fa-save"/>{__('Save')}</a>
                <a href="#" id="Cancel" class="btn btn-danger admin-header-button"><i class="fa fa-times"/>{__('Cancel')}</a>
       </div> 
   </div>
</div>
          
          <!-- End page heading -->
          
          <!-- Begin breadcrumb -->
          <div class="breadcrumb-title">
            <p>                
                <i class="fa fa-home" style="color: #37bc9b;"></i>         
                 <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Site')}
                 <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('CMS pages')}          
                <a href="#" id="Pages"><i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Pages')}</a>
                <a href="#" id="Menus"><i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('Menus')}</a>
                <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__('New menu')} 
            </p>
          </div>
          <!-- End breadcrumb -->
{alerts}


{if $node->isLoaded()}    
<div class="tablewhiteback" style="padding: 20px;">
      <div class="row">
            <div class="form-group col-md-6">                                                   
             {component name="/site_languages/selectListLanguagesFrontend" selected=$item_i18n->get('lang')}
            </div>  
      </div>
      <ul class="nav nav-tabs" id="myTab" role="tablist">    
            <li class="nav-item">
           <a class="nav-link active" id="t-menu-tab" data-toggle="tab" href="#t-menu" role="tab" aria-controls="t-menu" aria-selected="true">{__('Menu')}</a>
         </li>
         
      </ul>
      
      <div class="tab-content" id="myTabContent" style="margin-top: 15px;">         
        <div class="tab-pane fade show active" id="t-menu" role="tabpanel" aria-labelledby="t-menu-tab">  
            
                    <div class="row">
                     <div class="form-group col-md-6">             
                        {if $form.menu.name->hasError()}<div class="alert alert-{if $form.menu.name->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.menu.name->getError()}</div>{/if}
                      <label for="menu_name">{__('Name')}{if $form->menu.name->getOption('required')}*{/if}</label>           
                      <div class="field_with_errors">
                          <input class="CmsMenu form-control Fields Input" type="text" value="{$item_i18n->getMenu()->get('name')}" name="name" id="menu_name">
                      </div>
                    </div>   
                      <div class="form-group col-md-3">             
                        {if $form.menu.target->hasError()}<div class="alert alert-{if $form.menu.target->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.menu.target->getError()}</div>{/if}
                      <label for="menu_name">{__('Target')}{if $form->menu.name->getOption('required')}*{/if}</label>           
                      <div class="field_with_errors">
                          {html_options class="CmsMenu form-control Fields Select"  options=$form->menu.target->getCHoices() selected=$item_i18n->getMenu()->get('target')  name="target"}
                      </div>
                      </div>   
                       <div class="form-group col-md-3">             
                        {if $form.menu.awe->hasError()}<div class="alert alert-{if $form.menu.awe->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.menu.awe->getError()}</div>{/if}
                      <label for="menu_awe">{__('AWE')}{if $form->menu.awe->getOption('required')}*{/if}</label>           
                      <div class="field_with_errors">
                          <input class="CmsMenu form-control Fields Input" type="text" value="{$item_i18n->getMenu()->get('awe')}" name="awe" id="menu_awe">
                      </div>
                    </div>                     
                  </div>  
                      <div class="row"> 
                    <div class="form-group col-md-12">
                      {if $form.menu_i18n.title->hasError()}<div class="alert alert-{if $form.menu_i18n.title->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.menu_i18n.title->getError()}</div>{/if}
                      <label for="title">{__('Title')}{if $form->menu_i18n.title->getOption('required')}*{/if}</label>            
                      <div class="field_with_errors"><input class="CmsMenuI18n form-control Fields Input" type="text" value="{$item_i18n->get('title')}" name="title" id="title"></div>
                    </div>
                </div>
          </div>
       
                                      
          <div class="tab-pane fade tab-pic" id="t-picture" role="tabpanel" aria-labelledby="t-picture-tab">  
              <div class="row portfolio-grid">
                <div class="col-xl-2 col-lg-3 col-md-3 col-sm-6 col-12">
                     <figure class="effect-text-in ModeDisplay">
                        <div id="DropZonePicture" class="dropzone dp-addFile pt-0 ModeDisplay" style="padding-top: 50px !important;"> 
                            <i class="fa fa-plus plus-icon"></i>                                                              
                            <div class="dz-message" data-dz-message><span>{__('Drop file here to upload')}</span></div>
                        </div>
                       <figcaption>                             
                       </figcaption>                          
                     </figure>
                </div>
                <div class="col-xl-2 col-lg-3 col-md-3 col-sm-6 col-12">
                     <figure class="effect-text-in ModeDisplay" style="border: 1px solid gray !important;">
                        <div id="DropZonePicture" class="dropzone dp-addFile pt-0 ModeDisplay" style="height: 100%;"> 
                            <img id="Picture-img" class="img-dpzone img-product" alt="image" src="/admin/web/pictures/Logo-MediConnect-2.png" style="height: 100%;">         
                        </div>
                       <figcaption>                             
                       </figcaption>                          
                     </figure>
                </div>
                {*<div class="col-2">  
                    <a href="#" class="list-action Mode" name="NORMAL"><i class="ModeIcon Normal far fa-square"></i></a>
                </div>*}           
              </div> 
          </div>  
                                              
         
       
    
                           
    </div>    
         
         
         
      </div>               

</div>      
 
<script type="text/javascript">
    
    
    $(".ShowModalList").click(function () { 
       $("#ModalList").modal('show');
    });
    
    
     $("#Cancel").click(function () {                     
                return $.ajax2({ data : { CmsMenu : { node: '{$node->get('id')}', 
                                             lang : $("#SelectListLanguages option:selected").attr('id'), 
                                             token : '{mfForm::getToken('CmsMenuNodeForm')}' } },
                                 url:"{url_to('cms_pages_ajax',['action'=>'ListPartialMenu'])}",
                                 target: "#actions"
                });
        });
        
     $("#Pages").click(function () {                     
                return $.ajax2({  url:"{url_to('cms_pages_ajax',['action'=>'ListPartialPage'])}",
                                 target: "#actions"
                });
        });
        
     $("#Menus").click(function () {                     
                return $.ajax2({ data : { CmsMenu : { node: '{$node->get('id')}', 
                                             lang : $("#SelectListLanguages option:selected").attr('id'), 
                                             token : '{mfForm::getToken('CmsMenuForm')}' } },  
                                url:"{url_to('cms_pages_ajax',['action'=>'ListPartialMenu'])}",
                                 target: "#actions"
                });
        });
        
     $("#Save").click(function () {          
         var params = { CmsMenuNode : { node: '{$node->get('id')}', 
                                    lang : $("#SelectListLanguages option:selected").attr('id'), 
                                    token : '{mfForm::getToken('CmsMenuNodeForm')}' } ,
                        CmsMenuI18n : {  menu : { }, menu_i18n : { }, token:'{$form->getCSRFToken()}' }
                            };
          $(".CmsMenu.Input").each(function () { params.CmsMenuI18n.menu[$(this).attr('name')]=$(this).val(); });                            
          $(".CmsMenu.Select option:selected").each(function () { params.CmsMenuI18n.menu[$(this).parent().attr('name')]=$(this).val(); });      
          $(".CmsMenuI18n.Input").each(function () { params.CmsMenuI18n.menu_i18n[$(this).attr('name')]=$(this).val(); });                                                       
          return $.ajax2({ data : params,
                                 url:"{url_to('cms_pages_ajax',['action'=>'SaveNewNodeI18n'])}",
                                 target: "#actions"
                });
        });
</script> 

{else}
    {__('Node is invalid.')}
{/if}    
