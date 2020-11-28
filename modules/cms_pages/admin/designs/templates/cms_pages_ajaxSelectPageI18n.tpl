{if $item_i18n->isLoaded()}
    <div class="tab-pane fade CmsPagePanel" id="t-control" role="tabpanel" aria-labelledby="t-control-tab">              
                  <div class="row">
                     <div class="form-group col-md-6">                                   
                      <label for="page_name">{__('Name')}{if $form->page.name->getOption('required')}*{/if}</label>           
                      <div class="field_with_errors">
                          <input class="CmsPage form-control Fields Input" type="text" value="{$item_i18n->getPage()->get('name')}" name="name" id="page_name">
                      </div>
                    </div>                                                                        
                  </div>  
          </div>
                            
          <div class="tab-pane fade CmsPagePanel" id="t-referencement" role="tabpanel" aria-labelledby="t-referencement-tab">
                 <div class="row">                                                                              
                    <div class="form-group col-md-12">                     
                      <label for="url">{__('Url')}{if $form->page_i18n.url->getOption('required')}*{/if}</label>            
                      <div class="field_with_errors"><input class="CmsPageI18n form-control Fields Input" type="text" value="{$item_i18n->get('url')}" name="url" id="url"></div>
                    </div>
                </div>               
                <div class="row"> 
                    <div class="form-group col-md-12">                      
                      <label for="meta_title">{__('Meta title')}{if $form->page_i18n.meta_title->getOption('required')}*{/if}</label>            
                      <div class="field_with_errors"><input class="CmsPageI18n form-control Fields Input" type="text" value="{$item_i18n->get('meta_title')}" name="meta_title" id="meta_title"></div>
                    </div>
                </div>
                <div class="row"> 
                    <div class="form-group col-md-12">                      
                      <label for="meta_description">{__('Description')}{if $form->page_i18n.meta_description->getOption('required')}*{/if}</label>            
                      <div class="field_with_errors">
                          <textarea cols="80" rows="2" class="CmsPageI18n form-control Fields Input" type="text" name="meta_description" id="meta_description">{$item_i18n->get('meta_description')}</textarea></div>
                    </div>
                </div>
                <div class="row"> 
                    <div class="form-group col-md-12">                    
                      <label for="meta_keywords">{__('Keywords')}{if $form->page_i18n.meta_keywords->getOption('required')}*{/if}</label>            
                      <div class="field_with_errors">
                          <textarea cols="80" rows="2" class="CmsPageI18n form-control Fields Input" type="text" name="meta_keywords" id="meta_keywords">{$item_i18n->get('meta_keywords')}</textarea></div>
                    </div>
                </div>
                <div class="row"> 
                    <div class="form-group col-md-12">                     
                      <label for="meta_robots">{__('Robots')}{if $form->page_i18n.meta_robots->getOption('required')}*{/if}</label>            
                      <div class="field_with_errors">
                          <textarea cols="80" rows="2" class="CmsPageI18n form-control Fields Input" type="text" name="meta_robots" id="meta_robots">{$item_i18n->get('meta_robots')}</textarea></div>
                    </div>
                </div>
          </div>  
         
        
                      
          <div class="tab-pane fade tab-pic CmsPagePanel" id="t-picture" role="tabpanel" aria-labelledby="t-picture-tab">  
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
                                              
         
      <div class="tab-pane fade CmsPagePanel" id="t-design" role="tabpanel" aria-labelledby="t-design-tab">
        <div class="row"> 
            <div class="form-group col-md-12">             
                <label for="layout">{__('Layout')}{if $form->page_i18n.layout->getOption('required')}*{/if}</label>            
                <div class="field_with_errors">                          
                  <input class="CmsPageI18n form-control Fields Input" type="text" value="{$item_i18n->get('layout')}" name="layout" id="meta_title">
                </div>
            </div>
        </div>
        <div class="row"> 
            <div class="form-group col-md-12">             
              <label for="template">{__('Template')}{if $form->page_i18n.template->getOption('required')}*{/if}</label>            
              <div class="field_with_errors">
                  <input class="CmsPageI18n form-control Fields Input" type="text" value="{$item_i18n->get('template')}" name="template" id="template">
            </div>
            </div>
        </div> 
      </div> 
            
            
        <div class="tab-pane fade CmsPagePanel" id="t-content" role="tabpanel" aria-labelledby="t-content-tab">
          <div class="row"> 
            <div class="form-group col-md-12">
                <textarea rows="15" class="form-control CmsPageI18n Input" style="margin-top: 15px;" name="content">{$item_i18n->get('content')}</textarea>
            </div>
          </div>
      </div> 
{else}
    {__('Page is invalid')}
{/if}
<script type="text/javascript">      
        
    $("#page-ctn").html("");
    
    $("#page-ctn").append("{$item_i18n->getFormatter()->getMetaTitle()}");
    
    $("#t-control-tab,#t-control").addClass('show active').removeClass('hide');
    
    $(".CmsPageI18n.Input[name=meta_title]").keyup(function () {          
         $(".CmsPageI18n.Input[name=url]").val($(this).val().cleanup());
    });
    
    $(".CmsPage[name=page_id]").attr('data-id',{$item_i18n->get('page_id')});
</script>

