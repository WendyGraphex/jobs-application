<div class="row RowTop">
    <div class="col-md-12 grid-margin classConducteurTop">
        <div class="d-flex justify-content-between flex-wrap">
            <div class="d-flex align-items-end flex-wrap">
                <div class="mr-md-3 mr-xl-5 styleWidth">
                    <h2>{__('My Courses')}</h2>                   
                </div>
                <div class="d-flex">
                    <i class="mdi mdi-home text-muted hover-cursor"></i>
                    <a id="Dashboard"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('Dashboard')}</p></a>
                    <a id="Courses"><p class="text-primary mb-0 hover-cursor">&nbsp;/&nbsp;{__('My Courses')}</p></a>
                    <p class="text-muted mb-0">&nbsp;/&nbsp;{__('New')}</p>
                </div>
            </div>      
        </div>
    </div>
</div>             
{alerts}
<div class="row admin-header-container btn-r">    
    <div class="col-sm" style="padding: 0;">
        <div class="buttonSave">
            <a href="#" id="Save" class="btn btn-primary admin-header-button"><i class="fa fa-save mr-2"></i>{__('Save')}</a>                
        </div>
    </div>
</div> 

<div class="col-lg-12 pt-2 stretch-card">
    <div class="card classMargin">
        <div class="card-body">             
            <ul class="nav nav-tabs" id="myTab" role="tablist">               
                <li class="nav-item">            
                    <a class="nav-link active"  id="content-tab" data-toggle="tab" href="#content" role="tab" aria-controls="content" aria-selected="true">
                        {__('Content')}
                    </a>
                </li>                       
                <li class="nav-item">            
                    <a class="nav-link"  id="categories-tab" data-toggle="tab" href="#categories" role="tab" aria-controls="categories" aria-selected="true">
                        {__('Categories')}
                    </a>
                </li>   
                <li class="nav-item">            
                    <a class="nav-link"  id="documents-tab" data-toggle="tab" href="#documents" role="tab" aria-controls="documents" aria-selected="true">
                        {__('Documents')}
                    </a>
                </li> 
                <li class="nav-item">            
                    <a class="nav-link"  id="details-tab" data-toggle="tab" href="#details" role="tab" aria-controls="details" aria-selected="true">
                        {__('Details')}                       
                    </a>
                </li>
            </ul>
            {* ==================================== CONTENT  ====================================*}
            <div class="tab-content" style="padding-top: 20px;">
                <div class="tab-pane fade show active" id="content" role="tabpanel" aria-labelledby="content-tab">    
                    <div class="row mt-3">                       
                        <div class="form col-md-12">                                   
                            <div class="form-group">                          
                                {component name="/site_languages/selectListLanguagesFrontend" selected=$form.lang}
                            </div>                    
                        </div>  
                    </div>                    
                    <div class="row mt-3">                       
                        <div class="form col-md-12">                                   
                            <div class="form-group">                          
                                <label>{__("Title")}{if $form->title->getOption('required')}*{/if}</label>
                                <div class="alert alert-danger" style="display:none;{if $form.title->hasError()}display:block;{/if}">{$form.title->getError()}</div>
                                <input type="text" class="CustomerAcademyCourseI18n Input form-control" name="title" value="{$form->getCourseI18n()->get('title')|escape}">
                            </div>                    
                        </div>  
                    </div>
                    <div class="row mt-3">                       
                        <div class="form col-md-12">                                   
                            <div class="form-group">                          
                                <label>{__("Short description")}{if $form->short_description->getOption('required')}*{/if}</label>
                                <div class="alert alert-danger" style="display:none;{if $form.short_description->hasError()}display:block;{/if}">{$form.short_description->getError()}</div>
                                <textarea cols="40" rows="5" class="CustomerAcademyCourseI18n Input form-control" name="short_description">{$form->getCourseI18n()->get('short_description')|escape}</textarea>
                            </div>                    
                        </div>  
                    </div>   <div class="row mt-3">                       
                        <div class="form col-md-12">                                   
                            <div class="form-group">                          
                                <label>{__("Content")}{if $form->content->getOption('required')}*{/if}</label>
                                <div class="alert alert-danger" style="display:none;{if $form.content->hasError()}display:block;{/if}">{$form.content->getError()}</div>
                                <textarea cols="40" rows="10" class="CustomerAcademyCourseI18n Textarea Input form-control" name="content">{$form->getCourseI18n()->get('content')|escape}</textarea>
                            </div>                    
                        </div>  
                    </div>  
                </div>         
                {* ==================================== CATEGORIES  ====================================*}
                <div class="tab-pane fade" id="categories" role="tabpanel" aria-labelledby="categories-tab">
                    <div class="row mt-3" style="height: 20px;">                       
                        <div class="form col-md-12">                                   
                            <div class="form-group">                                                    
                                <a href="javascript:void();" id="DialogCategories"><i class="fa fa-plus"></i></a>
                            </div>                    
                        </div>  
                    </div>  
                    <div id="categories-ctn">
                        <div id="CustomerAcademyCourseCategories">                               
                            {foreach $form->getCategories() as $category} 
                                <div class="CustomerAcademyCourseCategories-list" id="{$category->get('id')}" style="display: inline-block;">                                              
                                    <div class="btn btn-outline-primary CustomerAcademyCourseCategories" id="{$category->get('id')}">
                                {if $category->hasI18n()}{$category->getI18n()->get('title')}{else}{__('----')}{/if}                                                                               
                                <a href="javascript:void(0);" title="{__('Delete')}" class="CustomerAcademyCourseI18nCategory-Delete" id="{$category->get('id')}"  name="{if $category->hasI18n()}{$category->getI18n()->get('title')}{else}{$category->get('name')}{/if}">
                                    <i  class="fa fa-times icon-font delete-color"></i>
                                </a>                                                       
                            </div> 
                        </div>
                    {/foreach}   
                </div>  
            </div>
            <div id="Modal-Categories" class="modal " role="dialog">
                <div class="modal-dialog modal-lg model-cat-product">    
                    <div class="modal-content">
                        <div class="px-2"><span class="close" style="cursor: pointer;" id="Modal-Categories-Close">&times;</span></div>
                        <div id="Modal-Categories-ctn">            
                        </div>
                        <div class="col-md-12" style="padding: 0;">
                            <div class="Addbtn px-2"> 
                                <div style="width: 163px;margin: 0 auto;">
                                    <a href="#" id="AddCategories" class="btn btn-primary admin-header-button mb-2"><i class="fa fa-plus"></i>{__('Add categories')}</a>                
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>   
        </div>
        {* ==================================== DOCUMENTS  ====================================*}
        <div class="tab-pane fade" id="documents" role="tabpanel" aria-labelledby="documents-tab">
            <p>{__('Max size is')} {$form->getCourseI18n()->getFileMaxSize()}</p>
            <div class="row portfolio-grid">
                <div id="CustomerAcademyCourseI18nDocuments-list" class="CustomerAcademyCourseI18nDocuments-list col-xl-2 col-lg-3 col-md-3 col-sm-6 col-12">
                    <figure class="effect-text-in">
                        <div id="DropZone" class="dropzone dp-addFile"> 
                            <i class="fa fa-plus plus-icon"></i>
                            <div class="dz-message" data-dz-message><span>{__('Drop files here to upload')}</span></div>                                    
                        </div>
                        <figcaption>                             
                        </figcaption>                          
                    </figure>
                </div>  
                {foreach $form->getCourseI18n()->getDocuments() as $document}
                    <div class="CustomerAcademyCourseI18nDocuments-list col-xl-2 col-lg-3 col-md-3 col-sm-6 col-12" id="{$document->get('id')}">   
                        <figure class="effect-text-in classBorderSolid">
                            <div class="div-img h-100 dz-image">
                                {if  $document->getFile()->isPicture()}
                                    <img class="img-dpzone img-product" src="{$document->getFile()->getImages()->getSmall()->getUrl()}" alt="{$document->get('file')}">
                                {else}
                                    <img class="img-dpzone img-product" src="{$document->getFile()->getFlavicons()->getText()->getUrl()}" alt="{$document->get('file')}">               
                                {/if}
                            </div>
                            <figcaption class="text-left">
                                <div class="pr-1">
                                    <h6 class="PicturesCount">{$document@iteration}</h6>
                                </div>
                                <div class="pic-title text-left">
                                    <h6 class="picture-title w-100">                                                                          
                                        <span class="picture-title"><a href="{$document->getFile()->getUrl()}" target="_blank">{$document->getFile()} ({$document->getFormatter()->getSize()->getFilesize()})</a></span>                    
                                    </h6>
                                </div>
                                <div class="conf-icons">
                                    <a href="javascript:void(0);" name="{$document->getFile()}" class="list-action CustomerAcademyCourseI18nDocuments-Delete" id="{$document->get('id')}" title="{__('Delete')}"><i class="faColorSize fa fa-trash"></i></a>
                                </div>
                            </figcaption> 
                        </figure>        
                    </div> 
                {/foreach}                                                                                                                                  
            </div>          
        </div>   
        {* ==================================== DETAILS  ====================================*}
        <div class="tab-pane fade" id="details" role="tabpanel" aria-labelledby="details-tab">                                                                                    
            <div class="row mt-3">                       
                <div class="form col-md-3">                                   
                    <div class="form-group">                          
                        <label>{__("Price")}{if $form->price->getOption('required')}*{/if}</label>
                        <div>{$form.price->getError()}</div>
                        <input type="text" class="CustomerAcademyCourseI18n Input form-control" name="price" value="{if $form->hasErrors()}{$form.price}{else}{$form->getCourseI18n()->getFormatter()->getPrice()}{/if}">
                        <span style="position: absolute;top: 41px;right: 20px;">$</span>
                    </div>                    
                </div>  
            </div> 
                         <div class="row mt-3">                       
                <div class="form col-md-3">                                   
                    <div class="form-group">                          
                        <label>{__("Price")}{if $form->price->getOption('required')}*{/if}</label>
                        <div>{$form.price->getError()}</div>
                        <input type="text" class="CustomerAcademyCourseI18n Input form-control" name="duration" value="{if $form->hasErrors()}{$form.duration}{else}{$form->getCourseI18n()->getFormatter()->getDuration()}{/if}">
                        <span style="position: absolute;top: 41px;right: 20px;">mn</span>
                    </div>                    
                </div>  
            </div> 
           <div class="row mt-3">                       
                        <div class="form col-md-3">                                   
                            <div class="form-group">                          
                                <label>{__("Level")}{if $form->level_id->getOption('required')}*{/if}</label>
                                <div>{$form.level_id->getError()}</div>
                               {html_options class="CustomerAcademyCourseI18n Select form-control" name="level_id" options=$form->level_id->getChoices()->toArray() selected=$course_i18n->get('level_id')}
                                
                            </div>                    
                        </div>  
                    </div>  
        </div> 
    </div>
</div>                   
</div>
</div>
      
<script type="text/javascript">
    
        $('#Dashboard').click(function(){                                       
          return $.ajax2({ url: "{url_to('customers_academy_teacher_ajax',['action'=>'Dashboard'])}",                           
                           target: "#actions"}); 
        }); 
        
        
        $("#Courses").click(function() {                   
            return $.ajax2({ url:"{url_to('customers_academy_teacher_ajax',['action'=>'ListPartialCourse'])}",                                    
                      target: "#actions"}); 
        }); 
 
 
        $('.Textarea').ckeditor();
        
           if ($("#DropZone").find('.dz-default').length)
             $("#DropZone")[0].dropzone.off().destroy();
       

     $("#Save").click(function () { 
        var params = {  CustomerAcademyCourseI18n :  { lang:  $("#SelectListLanguages option:selected").attr('id'), id: {if $form->getCourseI18n()->isLoaded()}'{$form->getCourseI18n()->get('id')}'{else}$(".CustomerAcademyCourseDocuments-list[name=id]").attr('id'){/if}, categories :  [],token : '{$form->getCSRFToken()}' } };             
        $(".CustomerAcademyCourseI18nCategories").each(function () { params.CustomerAcademyCourseI18n.categories.push($(this).attr('id')); });
        $(".CustomerAcademyCourseI18n.Input").each(function () { params.CustomerAcademyCourseI18n[$(this).attr('name')]=$(this).val(); });
        $(".CustomerAcademyCourseI18n.Select option:selected").each(function () { params.CustomerAcademyCourseI18n[$(this).parent().attr('name')]=$(this).val(); });
        $(".CustomerAcademyCourseCategories-list").each(function () { params.CustomerAcademyCourseI18n.categories.push($(this).attr('id')); });
       // console.log(params); return ;
        return $.ajax2({
            data : params,
            url: "{url_to('customers_academy_teacher_ajax',['action'=>'NewCourseI18n'])}",           
            target: "#actions"
        });
    
      });
      
      
         $("#DropZone").dropzone({
            url: "{url_to("customers_academy_teacher_ajax",['action'=>'UploadCourseDocument'])}",
          //  clickable: false,
            dictDefaultMessage : '{__('Drop file to upload')}',
            params: {  
                      "UploadCourseDocument[token]" : '{mfForm::getToken('CustomerAcademyCourseDocumentUploadForm')}' 
                    },   
            paramName: "UploadCourseDocument[file]",
            createImageThumbnails : false,          
            parallelUploads : 1,
            maxFiles : 24,
            maxFilesize : 24,   
             sending : function (file, xhr, formData) {              
                if ($(".CustomerAcademyCourseDocuments-list[name=id]").attr('id'))
                    formData.append('UploadCourseDocument[id]',$(".CustomerAcademyCourseDocuments-list[name=id]").attr('id'));             
            },               
            success : function (file,response)
            {              
                // console.log("Status="+response.status);
                if (response.errors || response.status)
                {    
                    $("#alertErrors").css('display','block');
                    $("#alertErrors").html(response.errors.file);
                    return ;  
                }                                             
                 $("#DropZone").find('.dz-preview').remove();
                 $("#DropZone").find('.dz-default').show();
                 $(".dz-message").show();
                 $(".CustomerAcademyCourseI18nDocuments-list:last").after(response);  
            }                  
    });
    
    
     $("#Modal-Categories-Close").click(function () {  $("#Modal-Categories").hide(); });     
      
     $("#DialogCategories").click(function () { 
         
              return $.ajax2({      
                          data : { CustomerCourseCategoryNode : {  
                                            selection : {$form->getCategories()->getKeys()->toJson()}, 
                                            lang : '{$user->getLanguage()}',
                                            token : '{mfForm::getToken('CustomerCourseCategorySelectionForm')}' } },
                         url:"{url_to('customers_course_ajax',['action'=>'ListPartialDialogCategoryForCourse'])}",                                              
                         success : function () { $("#Modal-Categories").show(); },
                         target: "#Modal-Categories-ctn"
                       });     
     });  
     
     
   $("#AddCategories").click(function () { 
            var params = { CustomerCourseCategories : {  selection: $("#DialogCategoryList").data('selection'), token : '{mfForm::getToken('CustomerCourseCategoryAddForm')}' } };           
            return $.ajax2({
                  data : params,
                  url: "{url_to('customers_academy_teacher_ajax',['action'=>'AddCategoriesForCourse'])}",    
                  success : function () {   $("#Modal-Categories").hide(); },
                  target: "#categories-ctn"
              });
     });
      
     $(".CustomerAcademyCourseI18nCategory-Delete").click(function () {                  
            $(".CustomerAcademyCourseCategories-list[id="+$(this).attr('id')+"]").remove();
     }); 
     
       $(".CustomerAcademyCourseI18nDocuments-Delete").click(function () {            
          if (!confirm('{__("Document [#0#] will be deleted. Confirm ?")}'.format($(this).attr('name')))) return false;  
           return $.ajax2({      
                          data : { CustomerAcademyCourseDocument : $(this).attr('id') },
                         url:"{url_to('customers_academy_teacher_ajax',['action'=>'DeleteCourseDocument'])}",                                              
                         success : function (resp) { 
                            $(".CustomerAcademyCourseI18nDocuments-list[id="+resp.id+"]").remove();
                            }
                          
                       });                      
     }); 
</script> 
 
           