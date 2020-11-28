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
            <div class="form-group col-md-6" style="display: flex;line-height: 36px;">                
                    {if $form->hasPage()}                
                         <h4 id="page-ctn" {if $form->hasDefaults()}data-state="page"{/if} style="margin-right: 10px;" class="CmsPage" name="page_id" id="{$item_i18n->getMenu()->get('page_id')}">{$item_i18n->getMenu()->getPage()->getI18n()->getFormatter()->getMetaTitle()}                       
                         </h4>                        
                    {else}
                         <h4 id="page-ctn" style="margin-right: 10px;">{__('No Page')} </h4>    
                    {/if}                             
                     <a href="#" id="List" title="{__('Select a page')}"><i class="fa fa-list-ul" aria-hidden="true"></i></a>            
                     <a href="#" id="New"  title="{__('New page')}"><i class="fa fa-plus" aria-hidden="true"></i></a>                                                          
                     <a href="#" id="DeletePage" {if !$form->hasPage()}class="hide"{/if}><i class="fa fa-times" aria-hidden="true"></i></a>                   
            </div>   
    </div> 
          
      <ul class="nav nav-tabs" id="myTab" role="tablist">    
            <li class="nav-item">
           <a class="nav-link active" id="t-menu-tab" data-toggle="tab" href="#t-menu" role="tab" aria-controls="t-menu" aria-selected="true">{__('Menu')}</a>
         </li>
           <li class="nav-item">
           <a class="nav-link {if $form->hasPage()}show{else}hide{/if} CmsPageTab" id="t-control-tab" data-toggle="tab" href="#t-control" role="tab" aria-controls="t-control" aria-selected="false">{__('Control')}</a>
         </li>
         <li class="nav-item">
           <a class="nav-link  {if $form->hasPage()}show{else}hide{/if} CmsPageTab" id="t-referencement-tab" data-toggle="tab" href="#t-referencement" role="tab" aria-controls="t-referencement" aria-selected="false">{__('Referencement')} </a>
         </li>                   
           <li class="nav-item">
           <a class="nav-link  {if $form->hasPage()}show{else}hide{/if} CmsPageTab" id="t-picture-tab" data-toggle="tab" href="#t-picture" role="tab" aria-controls="t-picture" aria-selected="false">{__('Picture')} </a>
         </li>
           <li class="nav-item">
           <a class="nav-link  {if $form->hasPage()}show{else}hide{/if} CmsPageTab" id="t-design-tab" data-toggle="tab" href="#t-design" role="tab" aria-controls="t-design" aria-selected="false">{__('Design')} </a>
         </li>
           <li class="nav-item">
           <a class="nav-link  {if $form->hasPage()}show{else}hide{/if} CmsPageTab" id="t-content-tab" data-toggle="tab" href="#t-content" role="tab" aria-controls="t-content" aria-selected="false">{__('Content')} </a>
         </li>       
      </ul>
      
      <div class="tab-content" id="tab-ctn" style="margin-top: 15px;">         
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
                    
        <div class="tab-pane fade CmsPagePanel  {if $form->hasPage()}show{/if}" id="t-control" role="tabpanel" aria-labelledby="t-control-tab">              
                  <div class="row">
                     <div class="form-group col-md-6">             
                        {if $form.page.name->hasError()}<div class="alert alert-{if $form.menu.name->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.menu.name->getError()}</div>{/if}
                      <label for="page_name">{__('Name')}{if $form->page.name->getOption('required')}*{/if}</label>           
                      <div class="field_with_errors">
                          <input class="CmsPage form-control Clear Fields Input" type="text" value="{$item_i18n->getMenu()->getPage()->get('name')}" name="name" id="page_name">
                      </div>
                    </div>                                                                        
                  </div>  
          </div>
                            
          <div class="tab-pane fade CmsPagePanel {if $form->hasPage()}show{/if}" id="t-referencement" role="tabpanel" aria-labelledby="t-referencement-tab">
                 <div class="row">                                                                              
                    <div class="form-group col-md-12">
                      {if $form.page_i18n.url->hasError()}<div class="alert alert-{if $form.page_i18n.url->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.page_i18n.url->getError()}</div>{/if}
                      <label for="url">{__('Url')}{if $form->page_i18n.url->getOption('required')}*{/if}</label>            
                      <div class="field_with_errors"><input class="CmsPageI18n Clear form-control Fields Input" type="text" value="{$item_i18n->getMenu()->getPage()->getI18n()->get('url')}" name="url" id="url"></div>
                    </div>
                </div>               
                <div class="row"> 
                    <div class="form-group col-md-12">
                      {if $form.page_i18n.meta_title->hasError()}<div class="alert alert-{if $form.page_i18n.meta_title->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.page_i18n.meta_title->getError()}</div>{/if}
                      <label for="meta_title">{__('Meta title')}{if $form->page_i18n.meta_title->getOption('required')}*{/if}</label>            
                      <div class="field_with_errors"><input class="CmsPageI18n Clear form-control Fields Input" type="text" value="{$item_i18n->getMenu()->getPage()->getI18n()->get('meta_title')}" name="meta_title" id="meta_title"></div>
                    </div>
                </div>
                <div class="row"> 
                    <div class="form-group col-md-12">
                      {if $form.page_i18n.meta_description->hasError()}<div class="alert alert-{if $form.page_i18n.meta_description->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.page_i18n.meta_description->getError()}</div>{/if}
                      <label for="meta_description">{__('Description')}{if $form->page_i18n.meta_description->getOption('required')}*{/if}</label>            
                      <div class="field_with_errors">
                          <textarea cols="80" rows="2" class="CmsPageI18n Clear form-control Fields Input" type="text" name="meta_description" id="meta_description">{$item_i18n->getMenu()->getPage()->getI18n()->get('meta_description')}</textarea></div>
                    </div>
                </div>
                <div class="row"> 
                    <div class="form-group col-md-12">
                      {if $form.page_i18n.meta_keywords->hasError()}<div class="alert alert-{if $form.page_i18n.meta_keywords->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.page_i18n.meta_keywords->getError()}</div>{/if}
                      <label for="meta_keywords">{__('Keywords')}{if $form->page_i18n.meta_keywords->getOption('required')}*{/if}</label>            
                      <div class="field_with_errors">
                          <textarea cols="80" rows="2" class="CmsPageI18n Clear form-control Fields Input" type="text" name="meta_keywords" id="meta_keywords">{$item_i18n->getMenu()->getPage()->getI18n()->get('meta_keywords')}</textarea></div>
                    </div>
                </div>
                <div class="row"> 
                    <div class="form-group col-md-12">
                      {if $form.page_i18n.meta_robots->hasError()}<div class="alert alert-{if $form.page_i18n.meta_robots->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.page_i18n.meta_robots->getError()}</div>{/if}
                      <label for="meta_robots">{__('Robots')}{if $form->page_i18n.meta_robots->getOption('required')}*{/if}</label>            
                      <div class="field_with_errors">
                          <textarea cols="80" rows="2" class="CmsPageI18n Clear form-control Fields Input" type="text" name="meta_robots" id="meta_robots">{$item_i18n->getMenu()->getPage()->getI18n()->get('meta_robots')}</textarea></div>
                    </div>
                </div>
          </div>  
         
        
                      
          <div class="tab-pane fade tab-pic CmsPagePanel {if $form->hasPage()}show{/if}" id="t-picture" role="tabpanel" aria-labelledby="t-picture-tab">  
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
                                              
         
      <div class="tab-pane fade CmsPagePanel {if $form->hasPage()}show{/if}" id="t-design" role="tabpanel" aria-labelledby="t-design-tab">
             <div class="row"> 
                    <div class="form-group col-md-12">
                      {if $form.page_i18n.layout->hasError()}<div class="alert alert-{if $form.page_i18n.layout->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.page_i18n.layout->getError()}</div>{/if}
                      <label for="layout">{__('Layout')}{if $form->page_i18n.layout->getOption('required')}*{/if}</label>            
                      <div class="field_with_errors">                          
                          <input class="CmsPageI18n form-control Fields Input" type="text" value="{$item_i18n->getMenu()->getPage()->getI18n()->get('layout')}" name="layout" id="meta_title">
                    </div>
                </div>
             </div>
            <div class="row"> 
                    <div class="form-group col-md-12">
                      {if $form.page_i18n.template->hasError()}<div class="alert alert-{if $form.page_i18n.template->hasError()}danger{else}light{/if}" role="alert">&nbsp;{$form.page_i18n.template->getError()}</div>{/if}
                      <label for="template">{__('Template')}{if $form->page_i18n.template->getOption('required')}*{/if}</label>            
                      <div class="field_with_errors">
                          <input class="CmsPageI18n form-control Fields Input" type="text" value="{$item_i18n->getMenu()->getPage()->getI18n()->get('template')}" name="template" id="template">
                    </div>
                </div>
            </div> 
      </div>
                    
                    
    <div class="tab-pane fade CmsPagePanel {if $form->hasPage()}show{/if}" id="t-content" role="tabpanel" aria-labelledby="t-content-tab">
        <div class="row"> 
            <div class="form-group col-md-12">
                <textarea id="Content" name="content" rows="15" class="form-control Clear CmsPageI18n Input" style="margin-top: 15px;" name="content">{$item_i18n->getMenu()->getPage()->getI18n()->get('content')}</textarea>
            </div>
        </div>
    </div> 
                           
    </div>    
         
         
         
      </div>               
  
<div class="modal fade" id="CmsPageListDialog" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header" style="border-bottom: none;">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div id="CmsPageListDialog-ctn" class="modal-body">
                
            </div>
            <div style="text-align: center;padding-bottom: 10px;">
                <button class="btn btn-success" id="dialog-Select" style="width: 120px;">{__('Select')}</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    
    $( '#Content' ).ckeditor({
            height: $(window).height(),
        });
    
     $(".CmsPageI18n.Input[name=meta_title]").keyup(function () {        
         $(".CmsPageI18n.Input[name=url]").val($(this).val().cleanup());
     });
     
     $("#Cancel").click(function () {                     
                return $.ajax2({ data : { CmsMenuNode : { node: '{$node->get('id')}', 
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
         var params = { CmsMenu : { node: '{$node->get('id')}', 
                                    lang : $("#SelectListLanguages option:selected").attr('id'), 
                                    token : '{mfForm::getToken('CmsMenuNodeForm')}' } ,
                        CmsMenuPageI18n : {  menu : { }, menu_i18n : { }, page : { }, page_i18n: { }, token:'{$form->getCSRFToken()}' }
                            };
          $(".CmsMenu.Input").each(function () { params.CmsMenuPageI18n.menu[$(this).attr('name')]=$(this).val(); });                            
          $(".CmsMenu.Select option:selected").each(function () { params.CmsMenuPageI18n.menu[$(this).parent().attr('name')]=$(this).val(); });      
          $(".CmsMenuI18n.Input").each(function () { params.CmsMenuPageI18n.menu_i18n[$(this).attr('name')]=$(this).val(); });   
          if ($("#page-ctn").attr('data-state')=='page')
          {    
            $(".CmsPage.Input").each(function () { params.CmsMenuPageI18n.page[$(this).attr('name')]=$(this).val(); });                            
            $(".CmsPageI18n.Input").each(function () { params.CmsMenuPageI18n.page_i18n[$(this).attr('name')]=$(this).val(); });                            
          }
          return $.ajax2({ data : params,
                                 url:"{url_to('cms_pages_ajax',['action'=>'SaveNewMenuI18n'])}",
                                 target: "#actions"
                });
        });
        
        $("#New").click(function () { 
            $(".CmsPageTab,.CmsPagePanel").addClass('show').removeClass('hide');         
            $(this).removeClass('show').addClass('hide');
            $(".nav-link,.tab-pane").removeClass("active");
            $("#t-control-tab").addClass('active');
            $("#t-control").addClass('active show');
            $(".Clear").val(""); 
            $("#page-ctn").html("{__('New page')}").attr('data-state','page'); 
            $("#DeletePage").removeClass('hide').addClass('show');
        });
        
        $("#DeletePage").click(function () { 
            $("#page-ctn").html("").attr('data-state',null);
            $("#page-ctn").append("{__('No Page')}");
            $(".Clear").val(""); 
            $(".CmsPageTab,.CmsPagePanel").addClass('hide').removeClass('show active');
            $("#New").removeClass('hide');
            $(this).addClass('hide');
            $(".nav-link,.tab-pane").addClass('hide');
            $("#t-menu-tab,#t-menu").addClass('show active').removeClass('hide');
        });
        
        
          $("#List").click(function () { 
             return $.ajax2({    data : { },
                                 url:"{url_to('cms_pages_ajax',['action'=>'DialogListPartialPage'])}",
                                 target: "#CmsPageListDialog-ctn",
                                 success : function () {  
                                        $("#CmsPageListDialog").modal('show');                                                                       
                                    }
                });
               
        });
        
        
          $("#dialog-Select").click(function () {            
            return $.ajax2({    data : { CmsPageI18n : { page_id: $("#DialogPage").data('selected'), lang : $("#SelectListLanguages option:selected").attr('id') }  },
                                 url:"{url_to('cms_pages_ajax',['action'=>'SelectPageI18n'])}",                               
                                 success : function (resp) {  
                                     $("#CmsPageListDialog").modal('hide');
                                     $(".CmsPagePanel").remove();
                                     $(".nav-link,.tab-pane").removeClass('active hide').addClass('show');
                                     $("#tab-ctn").append(resp);
                                     $("#DeletePage,#New").addClass('show').removeClass('hide');                                 
                                 }
                });
        });   
</script> 

{else}
    {__('Node is invalid.')}
{/if}    